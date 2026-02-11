# ~/dotfiles/zsh/platforms/linux.zsh

# ==== Locale Fix ==== 
# mosh carries the machine's environment to the remote end
# this forces the remote end to use British English conventions 
# e.g. when Mac mosh into Fedora, it will use British dates,etc.
export LC_ALL=en_GB.UTF-8


