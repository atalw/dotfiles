if status is-interactive
    # Core settings
    set fish_cursor_default block
    fish_vi_key_bindings

    # Aliases
    alias vi="vim"
    alias vim="vim"
    
    # Environment
    export EDITOR=vim
    
    # Standard Binary Paths
    fish_add_path "$HOME/.local/bin"
    fish_add_path "$HOME/.cargo/bin"      # Rust/Cargo tools
    fish_add_path "$HOME/.bun/bin"        # Bun tools
    fish_add_path "/opt/homebrew/bin"     # Homebrew

    # Starship prompt
    starship init fish | source
end
