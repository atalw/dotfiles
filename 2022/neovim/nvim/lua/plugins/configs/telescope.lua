local ok, telescope = pcall(require, "telescope")

if not ok then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

vim.cmd("nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>")
vim.cmd("nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>")
vim.cmd("nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>")
vim.cmd("nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>")

telescope.setup {
	defaults = {
		mappings = {
			n = {}
		}
	},
	extensions = {
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

telescope.load_extension("ui-select")

