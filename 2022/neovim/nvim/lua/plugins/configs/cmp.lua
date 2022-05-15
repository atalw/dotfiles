-- nvim-cmp setup
local ok, cmp = pcall(require, "cmp")

if not ok then
    return
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local luasnip = require 'luasnip'

-- local cmp = require 'cmp'
cmp.setup {
    fields = { "kind", "abbr", "menu" },
    completion = {
        autocomplete = false,
        completeopt = "menu,menuone,noselect",
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1,
    },
    formatting = {
        fields = { "abbr", "kind", "menu" }
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
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
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
        { name = 'nvim_lsp_signature_help' }
    },
    preselect = cmp.PreselectMode.None,
}

-- Autocomplete with delay
vim.cmd[[
    let s:timer = 0
    autocmd TextChangedI * call s:on_text_changed()
    function! s:on_text_changed() abort
        call timer_stop(s:timer)
        let s:timer = timer_start(500, function('s:complete'))
    endfunction
    function! s:complete(...) abort
        lua require('cmp').complete({ reason = require('cmp').ContextReason.Auto })
    endfunction
]]
