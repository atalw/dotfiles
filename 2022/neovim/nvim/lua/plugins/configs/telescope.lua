local ok, telescope = pcall(require, "telescope")

if not ok then
    return
end

-- local actions = require("telescope.extensions.actions")
local builtin = require("telescope.builtin")
local fb_actions = require "telescope".extensions.file_browser.actions

vim.cmd("nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>")
vim.cmd("nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>")
vim.cmd("nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>")
vim.cmd("nnoremap <leader>f/ <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")
vim.cmd("nnoremap <leader>fi <cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
vim.cmd("nnoremap <leader>so <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
vim.cmd("nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>")

telescope.setup {
    defaults = {
        mappings = {
            i = {},
            n = {}
        }
    },
    extensions = {
        file_browser = {
            mappings = {
                ["i"] = {
                    ["<C-p>"] = fb_actions.goto_parent_dir
                },
                ["n"] = {
                    ["p"] = fb_actions.goto_parent_dir
                }
            }
        },
        -- https://github.com/nvim-telescope/telescope-ui-select.nvim
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
        }
    }
}

telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

