
-- Configure Neovim to automatically run :PackerCompile whenever plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- vim.cmd[[highlight IndentBlanklineContextChar guibg=#ffffff]]
vim.cmd[[highlight IndentBlanklineChar guifg=#282828 gui=nocombine]]


return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use "lukas-reineke/indent-blankline.nvim"

	require("indent_blankline").setup {
		char = "▏",
		context_char = "▏",
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

end)
