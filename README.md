# dotfiles
All my configurations

## 2026 Setup (Current)

The new configuration uses a structured `2026/` directory and automated installation scripts.

### **Features**
*   **Shell**: Fish (Standard configs, Vi mode, cleaned secrets)
*   **Terminal**: Ghostty (Nerd Fonts, native Mac integration)
*   **Editor**: Vim (Minimal, Gruvbox Material theme, no heavy plugins)
*   **Prompt**: Starship
*   **Tools**: Tmux, pipx

### **Installation (New Machine)**

1.  Clone the repository:
    ```bash
    git clone https://github.com/atalw/dotfiles.git ~/dev/git/dotfiles
    ```
2.  Run the installer:
    ```bash
    cd ~/dev/git/dotfiles
    ./2026/install.sh
    ```
    *This will install dependencies (Homebrew, Fish, Vim, Fonts), backup existing configs, and symlink the new ones.*

3.  (Optional) Set macOS defaults:
    ```bash
    ./2026/macos.sh
    ```

---

## Legacy Setup (Pre-2026)

*Instructions below are for the old manual setup (Neovim/Packer/etc).*

### Configuration
Fish | Neovim

### Symlink files for Neovim

First delete files if they exist.

Symlink `nvim/`
`ln -s path/to/git/dotfiles/nvim ~/config/nvim`

### Symlink files for Vim

First delete both files if they exist.

Symlink `.vimrc`
`ln -s path/to/git/dotfiles/.vimrc ~/.vimrc`

Symlink `.vim`
`ln -s path/to/git/dotfiles/.vim ~/.vim`

### Symlink files for Starship

First delete file if it exists.

Symlink `starship.toml`
`ln -s path/to/git/dotfiles/starship.toml ~/config/starship.toml`
