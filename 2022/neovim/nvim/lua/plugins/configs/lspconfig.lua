local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
	return
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings
local on_attach = function(client, bufnr)
	if client.resolved_capabilities.document_highlight then
		vim.cmd [[
		hi! LspReferenceRead cterm=bold ctermbg=red guibg=Grey
		hi! LspReferenceText cterm=bold ctermbg=red guibg=Grey
		hi! LspReferenceWrite cterm=bold ctermbg=red guibg=Grey
		]]
		vim.api.nvim_create_augroup('lsp_document_highlight', {})
		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			group = 'lsp_document_highlight',
			buffer = 0,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			group = 'lsp_document_highlight',
			buffer = 0,
			callback = vim.lsp.buf.clear_references,
		})
	end

	local opts = { buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set('n', '<leader>wl', function()
		vim.inspect(vim.lsp.buf.list_workspace_folders())
	end, opts)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	-- vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
	vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
