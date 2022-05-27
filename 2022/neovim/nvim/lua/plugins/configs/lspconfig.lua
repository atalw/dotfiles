local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
    return
end

vim.diagnostic.config({
    virtual_text = false,
})
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

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
    vim.keymap.set('n', 'gD', "<cmd>tab split | lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set('n', 'gd', "<cmd> tab split | lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
        vim.inspect(vim.lsp.buf.list_workspace_folders())
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            -- delay update diagnostics
            update_in_insert = false,
        }
    )
end


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
    local serverOpts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    if lsp == "rust_analyzer" then
        local ok_rt, rust_tools = pcall(require, "rust-tools")
        if not ok_rt then
            print("Failed to load rust tools, will set up `rust_analyzer` without `rust-tools`.")
        else
            -- https://github.com/simrat39/rust-tools.nvim#configuration
            rust_tools.setup({
                server = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                -- allFeatures = true,
                                -- features = {"keys-bip39"},
                            },
                            checkOnSave = {
                                command = "clippy",
                            }
                        }
                    }
                },
                tools = {
                    autoSetHints = true,
                    hover_with_actions = true,
                    runnables = { use_telescope = true },
                    inlay_hints = {
                        show_parameter_hints = true,
                        only_current_line = false,
                        highlight = "Comment"
                    },
                    hover_actions = {
                        auto_focus = false
                    }
                },
            })
            goto continue
        end
    end

    lspconfig[lsp].setup(serverOpts)
    ::continue::
end

-- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
-- We don't want to call lspconfig.rust_analyzer.setup() when using rust-tools. See
-- * https://github.com/simrat39/rust-tools.nvim/issues/183
-- * https://github.com/simrat39/rust-tools.nvim/issues/177
-- lspconfig.rust_analyzer.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {
--                 importGranularity = "module",
--                 importPrefix = "self",
--             },
--             hover = {
--                 documentation = "true",
--             },
--             lens = {
--                 enable = "true",
--             }
--         }
--     }
--
