#!/bin/bash

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ------------------------------------------------------
# Install Dependencies
# ------------------------------------------------------

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Please install Homebrew first: https://brew.sh/"
    exit 1
fi

echo "Installing dependencies with Homebrew..."

# Update Homebrew
# brew update

# Install binaries
brew install vim fish starship tmux pipx

# Install Fonts
brew install --cask font-meslo-lg-nerd-font

# Install Casks
brew install --cask ghostty

echo "Dependencies installed."

# ------------------------------------------------------
# Configure pipx
# ------------------------------------------------------
pipx ensurepath

# ------------------------------------------------------
# Configure Shell
# ------------------------------------------------------
FISH_PATH="$(which fish)"
if ! grep -q "$FISH_PATH" /etc/shells; then
    echo "Adding Fish to /etc/shells..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi

if [ "$SHELL" != "$FISH_PATH" ]; then
    echo "Changing default shell to Fish..."
    chsh -s "$FISH_PATH"
fi

# ------------------------------------------------------
# Symlink Dotfiles
# ------------------------------------------------------

echo "Setting up dotfiles from $DOTFILES_DIR..."

# Function to safely link files
link_file() {
    src="$1"
    dest="$2"
    
    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$dest")"
    
    # Check if a file/link already exists at destination
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up existing $dest to ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi
    
    echo "Linking $src -> $dest"
    ln -s "$src" "$dest"
}

# 1. Vim
link_file "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
link_file "$DOTFILES_DIR/vim/colors" "$HOME/.vim/colors"

# 2. Fish
link_file "$DOTFILES_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"

# 3. Ghostty
link_file "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

# 4. Starship
link_file "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

# 5. Tmux
link_file "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

echo "Done! Restart your terminal or shell to see changes."
