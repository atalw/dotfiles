-- nvim-cmp setup
local ok, cmp = pcall(require, "cmp")

if not ok then
    return
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

-- local icons = {
--     Text = "",
--     Method = "",
--     Function = "",
--     Constructor = "⌘",
--     Field = "ﰠ",
--     Variable = "",
--     Class = "ﴯ",
--     Interface = "",
--     Module = "",
--     Property = "ﰠ",
--     Unit = "塞",
--     Value = "",
--     Enum = "",
--     Keyword = "廓",
--     Snippet = "",
--     Color = "",
--     File = "",
--     Reference = "",
--     Folder = "",
--     EnumMember = "",
--     Constant = "",
--     Struct = "פּ",
--     Event = "",
--     Operator = "",
--     TypeParameter = "",
-- }

local luasnip = require 'luasnip'

-- local cmp = require 'cmp'
cmp.setup {
	fields = { "kind", "abbr", "menu" },
	completion = {
		completeopt = "menu,menuone,noinsert",
		keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
		keyword_length = 1,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-Space>'] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },	
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = "nvim_lsp" },
        { name = "path" },
		{ name = 'buffer' },
		{ name = 'calc' },
		{ name = 'luasnip' },
	},
	preselect = cmp.PreselectMode.None,
}
