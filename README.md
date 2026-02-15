# Dotfiles
My unified dotfiles configs for cross-platform dev environments.

> **Minimalist. Fast. Cross-Platform.**
> Configuration files for macOS and Fedora Linux, managed with GNU Stow.

## About
This repository contains my personal configuration files (dotfiles). The goal is to set up a consistent, clean, cross-platform syncing, high-performance development environment across **macOS (Apple Silicon)** and **Fedora Linux**.


### What's Inside?
* **Shell:** Zsh (Vanilla + Autosuggestions + Syntax Highlighting)
* **Terminal Prompt:** [Starship](https://starship.rs) (Custom 2-line prompt, git/env integration)
* **Terminal:** [Alacritty](https://alacritty.org) (Minimalist, blurred background)
* **File Manager:** [Yazi](https://github.com/sxyazi/yazi) (Terminal-based, Vim-like)
* **Editor:** Neovim (Lightweight config)
* **Tools:**
    * `eza` (Modern `ls` replacement)
    * `fzf` (Fuzzy finder)
    * `fastfetch` (System info)
    * `bat` (Cat clone with syntax highlighting)
    * `ripgrep` (Fast grep)

---

## Installation

### Option 1: Manual Clone (Recommended)
This is the safest way to install. It allows you  to review the scripts before running them.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/sasta-kro/dotfiles.git ~/dotfiles
    ```

2.  **Enter the directory:**
    ```bash
    cd ~/dotfiles
    ```

3.  **Run the setup script:**
    ```bash
    sh scripts/setup_dotfiles.sh 
    ```
    or this (does the same thing)
    ```bash
    chmod +x scripts/setup_dotfiles.sh
    ./scripts/setup_dotfiles.sh
    ```

### Option 2: Quick Install (One-Line)
*Note: This simply clones the repo to `~/dotfiles` and runs the script automatically.*

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/sasta-kro/dotfiles/main/scripts/setup_dotfiles.sh)"
```

### What does the script do?

The `setup_dotfiles.sh` script is **idempotent** (safe to run multiple times). It performs the following steps:

1. **Detects OS:** Determines if the user is on MacOS or Fedora.
2. **Installs Dependencies:**
    - *MacOS:* Installs Homebrew (if missing) and packages via `brew bundle`.
    - *Fedora:* Installs packages via `dnf`.
3. **Backs up Conflicts:** Checks if there are already files like `~/.zshrc` or `~/.config/nvim`. If found, it moves them to `~/dotfiles_backup_<timestamp>`.
4. **Links Configs:** Uses **GNU Stow** to symlink files from this repo to the home directory.
5. **Final Polish:** Sets Zsh as the default shell and handles font setups.

---

## Custom Aliases
There are few custom workflow enhancements included in this setup

| **Command** | **Action**                                                                                                   |
|-------------|--------------------------------------------------------------------------------------------------------------|
| **`y`**     | Opens **Yazi**. When yazi is quit by pressing `q`, the shell `cd` to the directory it was quit on. (convenient) |
| **`ls`**    | Aliased to `eza` (icons + show all files).                                                                   |
| **`ls1`**   | List details.                                                                                                |
| **`ls2`**   | Shows files inside folders <br/> `ls2="eza --icons=always --tree --level=1 *"`                               |
| **`cl`**    | Clear terminal.                                                                                              |
| **`..`**    | Go up one directory.                                                                                         |

> and more alias that can be seen in `dotfiles/.config/zshrc/common.zsh`

## Directory Structure
I used **GNU Stow** to manage symlinks. The folder structure mirrors the target `$HOME` directory (specifically the `.config` folder).

```plaintext
~/dotfiles
├── .config/
│   ├── alacritty/    # Terminal config
│   ├── fastfetch/    # System info config
│   ├── nvim/         # Neovim init.lua
│   ├── starship/     # Prompt config
│   ├── yazi/         # File manager config
│   └── zshrc/        # Modular Zsh configs
├── scripts/
│   └── setup_dotfiles.sh  # The magic installer
├── .zshrc            # The entry point (symlinked to ~/.zshrc)
└── README.md

```

Here is the "Why I Made This Project" section, drafted to sound technically sophisticated and architecturally driven. It highlights the specific engineering challenges you solved without using emojis or em dashes.

You can paste this right before the **License** section.

---

## Why I Made This Project
I developed this solution to solve the problem of configuration drift and cognitive load associated with maintaining different development environments. My workflow includes daily driving an Apple Silicon MacBook, a remote Fedora Linux workstation, and multiple headless Fedora servers. Manually syncing shell aliases, editor configurations, and terminal behaviors across these distinct Unix-like systems became a significant bottleneck, and gets really tiring.

The primary challenge was achieving strict environment consistency without sacrificing platform-specific optimizations. MacOS relies on BSD-based utilities and Homebrew, while Fedora utilizes GNU coreutils and DNF. A naive copy-paste approach fails to account for these underlying binary differences.

To address this, I architected a modular configuration system inspired by Kotlin Multiplatform and Jetpack Compose project structure. I separated the configuration into a shared core configs (common logic, aliases, and universal aesthetic configurations) and platform-specific implementations (package management and OS-dependent environment variables).

This project implements:

- **Infrastructure as Code (IaC) principles** for personal dotfiles, ensuring the setup script is idempotent. It converges the system state rather than blindly executing commands, allowing safe re-runs without duplication.
- **Symlink Management via GNU Stow**, decoupling the configuration source from the installation target. This allows for atomic updates and granular version control without polluting the home directory.
- **Low-Latency Shell Performance**, explicitly rejecting monolithic frameworks like Oh My Zsh in favor of manual sourcing and asynchronous plugin loading. This ensures instant shell startup times on both local hardware and high-latency SSH sessions.

This unified architecture ensures that whether I am on a local GPU-accelerated Alacritty session or a remote headless SSH connection, my muscle memory for keybindings and shell behavior remains identical.

## ⚖️ License
MIT License. Feel free to fork and modify for your own use!
