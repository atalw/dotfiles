local ok, indent = pcall(require, "indent_blankline")

if not ok then
    return
end

indent.setup {
    char = "│",
    context_char = "│",
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = false,
    space_char_blankline = " ",
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    show_foldtext = false,
    context_patterns = {
        "^if",
        "^while",
        "^for",
        "^match",
        "^trait",
        "^impl",
        "^Self",
        "^struct",
        "^enum",
        "^pub",
        "^fn",
        "^let .* {",
        "^{",
        "^loop",
    }
}

