# ~/dotfiles/zsh/platforms/mac.zsh

# ===== Homebrew =========
# prepends Homebrew’s bin so Homebrew-installed programs are found before system ones
export PATH="/opt/homebrew/bin:$PATH"

# Adds PostgreSQL 15’s bin (Homebrew keg) so psql, pg_ctl, etc, are available
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# adds user-local bin for scripts/tools installed to ~/.local/bin.
export PATH="$HOME/.local/bin:$PATH"


# ======== Conda / Mamba (Mac Only) ======
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# Points to the mamba binary (Conda-compatible package manager)
export MAMBA_EXE='/Users/saiaikeshwetunaung/miniforge3/bin/mamba';

# sets the root prefix directory used by mamba/conda environments (eg mfa)
export MAMBA_ROOT_PREFIX='/Users/saiaikeshwetunaung/miniforge3';

# Run mamba’s shell hook to get the init script, capture it in a variable
# The hook prints shell code that sets up PATH, CONDA_* vars, activation functions, etc.
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"

# If the hook succeeded (exit status 0) …
if [ $? -eq 0 ]; then
	# … run captured code so current shell gets conda/mamba integration
    eval "$__mamba_setup"
else
	# …otherwise just create a simple alias so `mamba` still runs
    alias mamba="$MAMBA_EXE"
fi
unset __mamba_setup # clean up the temporary variable
# <<< conda initialize <<<



# ====== eza colour fix, Mac Specific Colors ========
# Remove ugly black background blocks from ls/eza
# keep default colors, but override the "Background" folders to be simple Blue text

export LS_COLORS="ow=1;34"
export EZA_COLORS=$LS_COLORS # Force eza to use these colors


