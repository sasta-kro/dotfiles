#!/bin/bash

# ==============================================================================
# Universal Setup Script (Fedora & macOS)
# 
# install script for fresh machine
# `sh -c "$(curl -fsSL https://raw.githubusercontent.com/sasta-kro/dotfiles/main/scripts/bootstrap.sh)"`
# ==============================================================================


# --- Configuration ---
REPO_URL="https://github.com/sasta-kro/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# --- Colors ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# --- Helpers ---
log() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

# ==============================================================================
# Pre-Check: Git & Repo
# ==============================================================================

ensure_git() {
    if ! command -v git &> /dev/null; then
        log "Git not found. Installing..."
        if [[ "$(uname)" == "Darwin" ]]; then
            xcode-select --install # This usually installs git on Mac
        elif [ -f /etc/fedora-release ]; then
            sudo dnf install -y git
        fi
    fi
}

clone_repo() {
    ensure_git
    if [ ! -d "$DOTFILES_DIR" ]; then
        log "Dotfiles not found at $DOTFILES_DIR. Cloning..."
        git clone "$REPO_URL" "$DOTFILES_DIR"
        success "Cloned repository."
    else
        log "Dotfiles already exist. Pulling latest changes..."
        cd "$DOTFILES_DIR" && git pull origin main
    fi
}

# ==============================================================================
# Package Installation
# ==============================================================================

install_dependencies() {
    if [[ "$(uname)" == "Darwin" ]]; then
        # --- MacOS ---
        if ! command -v brew &> /dev/null; then
            warn "Installing Homebrew..."
            # direct raw file contents endpoint (no HTML). safe for curl -sL.
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            
            # Add brew to PATH for this session (for Apple Silicon)
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi

        log "Installing Brew Bundles..."
        brew update
        # Core List
        brew install stow zsh fzf starship eza fastfetch neovim yazi bat ripgrep
        
    elif [ -f /etc/fedora-release ]; then
        # --- Fedora ---
        log "Detected Fedora. Installing DNF packages..."
        sudo dnf install -y \
            zsh git stow fzf neovim \
            util-linux-user \
            yazi bat ripgrep \
            fastfetch \
            starship \
            eza 
            # Note: recent Fedora versions have fastfetch/eza in default repos. 
            # If not, the script will error, but usually it works on F40+.
    fi
}

# ==============================================================================
# Intelligent Backup
# ==============================================================================

backup_conflicts() {
    log "Scanning for conflicts to backup..."
    
    # Switch to dotfiles dir to see what we are about to stow
    cd "$DOTFILES_DIR" || exit 1

    # Find all files in current dir, ignoring .git, .gitignore, etc.
    # We loop through files in dotfiles/ and check if they exist in $HOME
    for file in .*; do
        # Skip .git and .stow-local-ignore and . (current dir) and .. (parent)
        if [[ "$file" == "." || "$file" == ".." || "$file" == ".git" || "$file" == ".gitignore" || "$file" == ".stow-local-ignore" ]]; then
            continue
        fi

        target="$HOME/$file"

        # Check if the target file exists in HOME and is NOT a symlink
        if [ -e "$target" ] && [ ! -L "$target" ]; then
            warn "Conflict detected: $target"
            mkdir -p "$BACKUP_DIR"
            mv "$target" "$BACKUP_DIR/$file"
            success "Moved $target -> $BACKUP_DIR/$file"
        fi
    done
}

# ==============================================================================
# Stow & Shell
# ==============================================================================

apply_stow() {
    log "Applying Stow..."
    cd "$DOTFILES_DIR" || exit 1
    
    # --adopt is lowkey risky, just standard `stow .` is fine if backups are done
    stow .
    success "Stow complete."
}

finalize_setup() {
    # Check if Zsh is installed
    if command -v zsh &> /dev/null; then
        current_shell=$(basename "$SHELL")
        if [ "$current_shell" != "zsh" ]; then
            log "Changing shell to Zsh..."
            # Using chsh without sudo first (usually works), else prompt user
            chsh -s "$(which zsh)"
        fi
    fi
    
    echo ""
    success "Setup Complete! restart the terminal"
}

# ==============================================================================
# Main Execution 
# ==============================================================================

clone_repo          # get the files first
install_dependencies # get the tools (stow, etc)
backup_conflicts    # move old junk out of the way
apply_stow          #  link the new files
finalize_setup      # set Shell