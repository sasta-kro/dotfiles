# ~/dotfiles/zsh/common.zsh


# ====== Locale (for mosh, and terminal compatibility) ======
export LANG=en_GB.UTF-8
# This overrides the "LC_CTYPE=UTF-8" error that macOS gives when trying to mosh into Linux machines
export LC_CTYPE="en_GB.UTF-8"


# ====== Default Editor =====
export EDITOR='vim'


# ====== Utility CLI programs =======
# fzf (Fuzzy Finder)
# ctrl+t = search for file and print path
# ctrt+r = search command history
# type ** and press tab to search for a file and replace in place of **
eval "$(fzf --zsh)"


# Yazi wrapper - Allows `y` to cd into directory on exit
# by default `yazi` doesn't move user into current viewing folder when exited
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# ====== Aliases ==========
## vanilla util aliases 
alias cl="clear"
alias ..="cd .."
alias ...="cd ../.."

## EZA - better and prettier ls
alias ls="eza --icons=always -a"  # show all files (hidden files as well)
## tree format prints
alias ls1="eza --icons=always --long --no-permissions --no-user --no-time -a"
alias ls2="eza --icons=always --tree --level=1 *"
alias ls3="eza --icons=always --tree --level=2 *"


# ====== Visuals ====
# Starship - terminal prompt decoration (ohmyzsh replacement)
# This loads the config from ~/dotfiles/.config/starship.toml automatically
eval "$(starship init zsh)"

# fetch when startup
fastfetch


