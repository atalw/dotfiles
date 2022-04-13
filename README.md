# dotfiles
All my configurations

## Configuration
Fish | Neovim

## Symlink files for Neovim

First delete files if they exist.

Symlink `nvim/`
`ln -s path/to/git/dotfiles/nvim ~/config/nvim`

## Symlink files for Vim

First delete both files if they exist.

Symlink `.vimrc`
`ln -s path/to/git/dotfiles/.vimrc ~/.vimrc`

Symlink `.vim`
`ln -s path/to/git/dotfiles/.vim ~/.vim`

## Symlink files for Starship

First delete file if it exists.

Symlink `starship.toml`
`ln -s path/to/git/dotfiles/starship.toml ~/config/starship.toml`
