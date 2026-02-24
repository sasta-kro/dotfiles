#!/usr/bin/env bash
###############################################################################
# SYNC-FORK DOCUMENTATION
#
# -- What This Script Does --
#
# This script synchronizes a forked GitHub repository with the original
# (upstream) repository that the fork was created from. It replicates the
# "Sync fork" button found on the GitHub web UI, but runs entirely from the
# command line using the GitHub CLI (gh) and git.
#
# Basically, if the original project has received new commits on a
# given branch (like main), this script pulls those commits into the fork so
# the fork stays up to date.
# (SHOULD NOT be used if the differences will cause merge conflicts)
#
# -- Arguments / Flags --
#
# FLAG              TYPE          DEFAULT   REQUIRED
# -f, --fork        OWNER/REPO   (none)    no - auto-detected from origin remote if omitted
# -u, --upstream    OWNER/REPO   (none)    no - auto-detected via GitHub API if omitted
# -b, --branch      string       main      no
# -d, --dry-run     (none)       off       no
# -h, --help        (none)       (none)    no
#
# -f, --fork
#   The forked repository in OWNER/REPO format (e.g. Sai-Aike-STA/project).
#   This is the repo that receives the updates. If omitted, the script reads
#   the origin remote URL from the current git checkout and extracts the
#   OWNER/REPO from it. Only needs to be provided when running the script
#   from outside a clone of the fork.
#
# -u, --upstream
#   The original repository in OWNER/REPO format (e.g. original-org/project).
#   This is the source of truth that the fork syncs from. If omitted, the
#   script queries the GitHub API to look up the parent repository of the
#   fork. Only needs to be provided if the fork's parent cannot be resolved
#   automatically (rare) or if syncing from a repo other than the direct
#   parent.
#
# -b, --branch
#   The branch name to sync. Defaults to "main". Only this single branch is
#   affected; all other branches remain untouched.
#
# -d, --dry-run
#   Prints every command that would be executed without actually running it.
#   Useful for verifying what the script will do before committing to it.
#   Safe to run repeatedly.
#
# -h, --help
#   Prints a short help message pointing to this documentation block.
#
#
# -- Quick Examples --
#
#   # from inside a clone of the fork, sync main (zero args needed):
#   ./sync-fork.sh
#
#   # sync a different branch:
#   ./sync-fork.sh -b develop
#
#   # explicit repos, useful from CI or a different directory:
#   ./sync-fork.sh -f Sai-Aike-STA/project -u original-org/project
#
#   # dry run to preview actions:
#   ./sync-fork.sh --dry-run
#
#   # all flags combined:
#   ./sync-fork.sh -f Sai-Aike-STA/project -u original-org/project -b main -d
#
#
#
# -- Why This Script Exists --
#
# When a repository is forked on GitHub, the fork does not automatically
# receive new commits from the original. Over time the fork falls behind.
# GitHub provides a "Sync fork" button in the web UI, but that requires
# opening a browser, navigating to the fork, and clicking through (too lazy).
# This script automates that entire process so it can be run from a terminal,
# a cron job, or a CI pipeline.
#
#
# -- How It Works (Step by Step) --
#
# 1. Argument resolution
#    The script accepts three optional flags: --fork (OWNER/REPO of the
#    fork), --upstream (OWNER/REPO of the original), and --branch (the
#    branch to sync, defaults to "main"). If --fork is omitted, the script
#    reads the origin remote URL from the current git checkout. If --upstream
#    is omitted, the script queries the GitHub API to look up the fork's
#    parent repository. This means if the script is run from inside a clone
#    of the fork, zero arguments are needed.
#
# 2. Operating mode selection
#    If the current working directory is already a clone of the fork, the
#    script operates in place ("local mode"). Otherwise it clones the fork
#    into a temporary directory, performs the sync there, pushes, and
#    discards the temp directory ("clone mode").
#
# 3. Upstream remote setup
#    The script ensures a git remote named "upstream" exists and points at
#    the original repository. If it already exists with the correct URL,
#    nothing changes.
#
# 4. Fetch and merge
#    The script fetches the target branch from upstream, then merges it into
#    the local branch using --ff-only (fast-forward only). This means the
#    merge will only succeed if the fork's branch has not diverged from
#    upstream. No merge commits are created. If the branches have diverged
#    in a conflicting way, the script exits with an error instead of
#    producing an unexpected merge.
#
# 5. Push
#    The merged result is pushed back to the fork on GitHub.
#
#
# -- What It Does NOT Do --
#
# - It does not rebase, squash, or force-push. The fork's own commits (if
#   any) are never rewritten.
# - It does not touch any branch other than the one specified with --branch.
# - It does not modify, delete, or overwrite uncommitted local changes. If
#   the working tree is dirty, the script refuses to run.
# - It does not create pull requests, issues, or releases.
# - It does not sync tags, only the specified branch.
#
#
# -- How Safe is it? --
#
# Mutation risk:
#   The only changes the script makes to a local repository are:
#     a) Adding or updating a remote named "upstream" (harmless metadata).
#     b) Fast-forwarding the branch pointer (only moves forward, never
#        rewrites history, never deletes commits).
#     c) Pushing the result to origin.
#   None of these operations are destructive. No data is lost or rewritten
#   in any scenario.
#
# Dirty working tree:
#   If there are uncommitted changes in the local checkout, the script
#   prints an error and exits before doing anything. Uncommitted work is
#   never touched.
#
# Diverged branches:
#   If the fork and upstream have genuinely diverged (conflicting commits on
#   both sides), the --ff-only merge will fail and the script will exit with
#   a clear error message. Nothing is merged, nothing is pushed. Manual
#   intervention (merge or rebase) is required in that case.
#
# Crash safety:
#   A trap on EXIT/INT/TERM/HUP ensures that any temporary directory created
#   during clone mode is removed regardless of how the script terminates
#   (success, error, Ctrl+C, kill signal). In local mode, git merge --ff-only
#   is atomic -- the branch ref either moves or it does not -- so a crash
#   mid-merge cannot leave the repository in a half-merged state.
#
#
# -- Is It Idempotent? --
#
# Yes. Running the script multiple times in a row is completely safe:
#   - Remote setup is skipped if already correct.
#   - git fetch always succeeds whether or not there is anything new.
#   - git merge --ff-only prints "Already up to date." and exits 0 when
#     there is nothing to merge.
#   - git push prints "Everything up-to-date" and exits 0 when there is
#     nothing to push.
# No duplicate commits, no redundant merge commits, no state drift.
#
#
# -- Requirements --
#
# - bash (available by default on macOS and Linux)
# - git (available by default on macOS and Linux)
# - gh (GitHub CLI, must be installed separately: https://cli.github.com)
# - gh must be authenticated (run "gh auth login" if not already done)
# - mktemp (available by default on macOS and Linux)
#
#
# -- Usage --
#
# Simplest form (run from inside a clone of the fork):
#   ./sync-fork.sh
#
# Explicit arguments:
#   ./sync-fork.sh -f OWNER/REPO -u ORIGINAL_OWNER/REPO -b main
#
# Dry run (prints commands without executing them):
#   ./sync-fork.sh --dry-run
#
# All flags:
#   -f, --fork        OWNER/REPO of the fork (auto-detected from origin if omitted)
#   -u, --upstream    OWNER/REPO of the original (auto-detected via GitHub API if omitted)
#   -b, --branch      branch to sync (default: main)
#   -d, --dry-run     print commands instead of running them
#   -h, --help        show short help text
#
#
# -- Worst Case Scenarios --
#
# Q: What if the script is run and the fork has unique commits not in upstream?
# A: The --ff-only merge will fail. Nothing is changed. The script exits
#    with an error message suggesting manual merge or rebase.
#
# Q: What if the script is interrupted mid-push?
# A: The local branch is ahead of origin. The next run will simply push
#    the remaining commits. No corruption.
#
# Q: What if the script is run on the wrong repo by accident?
# A: The upstream remote would be added/updated, a fetch would occur, and
#    the merge would almost certainly fail because the histories are
#    unrelated. Nothing gets pushed. No damage.
#
# Q: What if the upstream repo has been deleted?
# A: The fetch will fail with a "not found" error. The script exits. No
#    local changes are made.
#
# Q: What if there is no internet connection?
# A: The gh auth check or git fetch will fail. The script exits before
#    making any local changes.
#
###############################################################################

# Sync Fork
# pulls changes from an original (upstream) repository into a fork,
# replicating the "sync fork" button on github without a browser

set -euo pipefail

# -- defaults --

FORK_REPO=""
UPSTREAM_REPO=""
BRANCH="main"
DRY_RUN=false

# -- cleanup / crash safety --

# temp directory tracker, cleaned up on any exit (success, error, or signal)
# This ensures no leftover directories accumulate from interrupted runs
_TMPDIR=""
cleanup() {
    if [[ -n "$_TMPDIR" && -d "$_TMPDIR" ]]; then
        rm -rf "$_TMPDIR"
    fi
}
trap cleanup EXIT INT TERM HUP

# -- usage --

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

(Open the script and read the documentation block at the top
for detailed info on behavior, safety, and edge cases)

Options:
    -f, --fork        OWNER/REPO    the fork to update (optional if inside a clone of the fork)
    -u, --upstream    OWNER/REPO    the original repo to sync from (optional if fork has a parent on github)
    -b, --branch      BRANCH        branch to sync (default: main)
    -d, --dry-run                   print actions without executing them
    -h, --help                      show this help message

All flags are optional when run inside a git checkout of the fork,
because the script can detect the fork repo from the origin remote
and resolve the upstream parent via the github api.

Examples:
    $(basename "$0")
    $(basename "$0") -b develop
    $(basename "$0") -f sasta-kro/project -u original-org/project
EOF
    exit 1
}

# -- argument parsing --

while [[ $# -gt 0 ]]; do
    case "$1" in
        -f|--fork)
            FORK_REPO="$2"
            shift 2
            ;;
        -u|--upstream)
            UPSTREAM_REPO="$2"
            shift 2
            ;;
        -b|--branch)
            BRANCH="$2"
            shift 2
            ;;
        -d|--dry-run)
            DRY_RUN=true
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Error: unknown option '$1'"
            usage
            ;;
    esac
done

# -- helper functions --

log() {
    echo "[sync-fork] $*"
}

# runs a command, or prints it if dry-run mode is active
run() {
    if [[ "$DRY_RUN" == true ]]; then
        log "(dry-run) $*"
    else
        "$@"
    fi
}

# checks whether a given command exists on the system
require_cmd() {
#    if ! command -v "$1" &>/dev/null; then
#        echo "Error: '$1' is not installed or not in PATH."
#        exit 1
#    fi
    if ! command -v gh &>/dev/null; then
        echo "Error: gh (GitHub CLI) is not installed."
        echo ""
        echo "Install it using one of the following methods:"
        echo ""
        echo "  macOS (Homebrew):"
        echo "    brew install gh"
        echo ""
        echo "  Linux (Fedora/RHEL):"
        echo "    sudo dnf install gh"
        echo ""
        echo "  Linux (Debian/Ubuntu):"
        echo "    sudo apt install gh"
        echo ""
        echo "  other methods:"
        echo "    https://cli.github.com"
        echo ""
        echo "after installing, authenticate with:"
        echo "    gh auth login"
        exit 1
    fi
}

# extracts OWNER/REPO from a github remote url.
# handles https, ssh, and gh-cli style urls
parse_owner_repo() {
    local url="$1"
    echo "$url" | sed -E 's#.*github\.com[:/]##; s#\.git$##'
}

# -- preflight checks --

require_cmd gh
require_cmd git
require_cmd mktemp

if ! gh auth status &>/dev/null; then
    echo "Error: gh cli is not authenticated. Run 'gh auth login' first."
    exit 1
fi

# -- auto-detect fork repo from current directory if not provided --

if [[ -z "$FORK_REPO" ]]; then
    origin_url=$(git remote get-url origin 2>/dev/null || echo "")
    if [[ -n "$origin_url" ]]; then
        FORK_REPO=$(parse_owner_repo "$origin_url")
        log "detected fork from origin remote: $FORK_REPO"
    else
        echo "Error: --fork not provided and current directory is not a git repo with an origin remote."
        exit 1
    fi
fi

# -- auto-detect upstream repo via github api if not provided --

if [[ -z "$UPSTREAM_REPO" ]]; then
    # the gh api returns the parent repo for any fork; null if not a fork
    parent=$(gh api "repos/${FORK_REPO}" --jq '.parent.full_name // empty' 2>/dev/null || echo "")
    if [[ -n "$parent" ]]; then
        UPSTREAM_REPO="$parent"
        log "detected upstream from github api: $UPSTREAM_REPO"
    else
        echo "Error: --upstream not provided and '$FORK_REPO' does not appear to be a fork on github."
        exit 1
    fi
fi

log "fork:     $FORK_REPO"
log "upstream: $UPSTREAM_REPO"
log "branch:   $BRANCH"

# -- determine operating context --
# Two modes:
#    local  - already inside a checkout of the fork; operate in place.
#    remote - not inside the fork; clone to a temp dir, sync, push, discard.

WORK_DIR=""
CLONED=false

current_remote=$(git remote get-url origin 2>/dev/null || echo "")
current_owner_repo=$(parse_owner_repo "$current_remote")

if [[ "$current_owner_repo" == "$FORK_REPO" ]]; then
    WORK_DIR="$(git rev-parse --show-toplevel)"
    log "operating inside existing clone at $WORK_DIR"
else
    _TMPDIR=$(mktemp -d)
    WORK_DIR="$_TMPDIR"
    CLONED=true
    log "cloning $FORK_REPO into temp directory $WORK_DIR"
    run gh repo clone "$FORK_REPO" "$WORK_DIR" -- --single-branch --branch "$BRANCH"
fi

cd "$WORK_DIR"

# -- ensure working tree is clean when operating locally --
# Avoids corrupting uncommitted work. Skipped for temp clones
# since those are always clean.

if [[ "$CLONED" == false ]]; then
    if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
        echo "Error: working tree has uncommitted changes. Commit or stash them first."
        exit 1
    fi
fi

# -- set up upstream remote (idempotent) --

expected_upstream="https://github.com/${UPSTREAM_REPO}.git"

if git remote get-url upstream &>/dev/null; then
    existing=$(git remote get-url upstream)
    if [[ "$existing" != "$expected_upstream" ]]; then
        log "correcting upstream remote url"
        run git remote set-url upstream "$expected_upstream"
    fi
else
    log "adding upstream remote"
    run git remote add upstream "$expected_upstream"
fi

# -- fetch, merge, push --

log "fetching upstream/$BRANCH"
run git fetch upstream "$BRANCH"

log "checking out $BRANCH"
run git checkout "$BRANCH"

# pull fork's own remote state first to avoid behind-origin errors
log "fast-forward pulling origin/$BRANCH"
run git pull --ff-only origin "$BRANCH" || {
    echo "Error: fast-forward pull from origin/$BRANCH failed."
    echo "       The local branch may have diverged from the fork's remote."
    exit 1
}

# merge upstream changes, `ff-only` keeps the history linear and safe.
# If there is nothing new, `git merge --ff-only` is a no-op, making the
# entire script idempotent. Running it again immediately does nothing.
log "merging upstream/$BRANCH"
run git merge --ff-only upstream/"$BRANCH" || {
    echo "Error: fast-forward merge from upstream/$BRANCH failed."
    echo "       The fork and upstream have diverged. Manual merge or rebase is required."
    exit 1
}

log "pushing $BRANCH to origin"
run git push origin "$BRANCH"

# -- finished --
# cleanup of temp dir (if any) is handled by the EXIT trap

log "sync complete: $UPSTREAM_REPO/$BRANCH -> $FORK_REPO/$BRANCH"