local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
end
vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")

if not ok then
    return
end

-- Configure Neovim to automatically run :PackerCompile whenever init.lua changes
vim.cmd([[
  augroup packer_user_config
	autocmd!
	autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "single" }
		end,
		prompt_border = "single",
	},
	git = {
		clone_timeout = 600,
	},
	auto_clean = true,
	compile_on_sync = false,
}

return packer.startup(function(use)
	-- Packer can manage itself
	use { "wbthomason/packer.nvim" }

	use {
		'nvim-telescope/telescope.nvim',
		requires = { 
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-ui-select.nvim' },
			{ "nvim-telescope/telescope-file-browser.nvim" }
		},
		config = function() require "plugins.configs.telescope" end
	}
	-- Collection of configurations for built-in LSP client
	use {
		'neovim/nvim-lspconfig',
		config = function() require "plugins.configs.lspconfig" end
	}

	use {
		'simrat39/rust-tools.nvim',
		-- config in lspconfig.lua
		-- config = function() require "plugins.configs.rust-tools" end
	}
	use { "rust-lang/rust.vim" }

	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use {
		'hrsh7th/nvim-cmp', -- Autocompletion plugin
		event = "InsertEnter", -- for lazyload
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-calc", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }, -- Snippets source for nvim-cmp
		},
		config = function() require "plugins.configs.cmp" end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require "plugins.configs.treesitter" end
	}

	use {
		"lukas-reineke/indent-blankline.nvim",
		config = function() require("plugins.configs.indent") end,
	}


	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
	
end)
