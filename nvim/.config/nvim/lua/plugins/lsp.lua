local nvim_lsp = require('lspconfig')
local installer = require('nvim-lsp-installer')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities
    }
    server:setup(opts)
end)

----- Global configs -----
local servers = { 'pyright', 'jdtls', 'jsonls', 'clangd', 'ltex' }
local on_attach = function(_, bufnr)
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

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

------- Sumneko_lua config -----
local sumneko_root_path = "/home/" .. os.getenv("USER") .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server"
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
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
            globals = {'vim'},
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

