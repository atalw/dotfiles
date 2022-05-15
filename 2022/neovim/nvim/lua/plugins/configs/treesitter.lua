local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
    return
end

vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")

treesitter.setup {
    ensure_installed = { "rust" },

    highlight = {
        enable = false,
        additional_vim_regex_highlighting = false
    }
}

