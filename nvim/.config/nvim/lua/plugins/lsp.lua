local installer = require('nvim-lsp-installer')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

----- Global configs -----
-- local servers = { 'pyright', 'jdtls', 'jsonls', 'clangd', 'ltex' }
local on_attach = function()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = false,

        -- show signs
        signs = true,

        -- delay update diagnostics
        update_in_insert = false,
        }
    )
end

installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach
    }

    ------- Sumneko_lua config -----
    if server.name == "sumneko_lua" then
        local runtime_path = vim.split(package.path, ';')
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")

        opts = {
            settings = {
                Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim', 'use'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
                },
            },
        }
    end

    server:setup(opts)
end)
