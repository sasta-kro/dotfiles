# ~/dotfiles/.zshrc

# This file is the just orchestrator to load the zsh configs. 
# The actual config logic is in the other files.

# Directory location of the actual zsh config files
ZSH_CONFIG="$HOME/.config/zshrc"


# Loading common logic for every platform (the primary zshrc file) 
# this points to the symlink that stow creates. not the acutal source file. 
if [[ -f "$ZSH_CONFIG/common.zsh" ]]; then
    source "$ZSH_CONFIG/common.zsh"
else
    echo "WARNING: $ZSH_CONFIG/common.zsh not found!"
fi



# Platform Specific Logic
# There shouldn't be a lot of configs in these other than the essentials for OS

if [[ "$(uname)" == "Darwin" ]]; then 
    source "$ZSH_CONFIG/platforms/mac.zsh"	# for Mac
elif [[ "$(uname)" == "Linux" ]]; then
    # We are on Fedora (Host or VM)
    source "$ZSH_CONFIG/platforms/linux.zsh"	 # for Linux (Fedora)
fi
