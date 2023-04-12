return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        {
            "williamboman/mason.nvim",
            name = "mason",
            config = true
        },
        {
            "williamboman/mason-lspconfig.nvim",
            name = "mason-lspconfig",
            opts = {
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "jdtls",
                    "marksman",
                    "pyright",
                },
            }
        },
        {
            "glepnir/lspsaga.nvim",
            config = function ()
                require'lspsaga'.setup({
                    symbol_in_winbar = {
                        enable = false
                    }
                })
            end,
        },
    },
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local keymap = vim.keymap
        local on_attach = function(_, bufnr)
            -- client.server_capabilities.semanticTokensProvider = nil
            local opts = { noremap = true, silent = true, buffer = bufnr }

            keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
            keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)
            keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
            keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
            keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<CR>", opts)
            keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
            keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
            keymap.set("n", "<leader>ou", "<cmd>Lspsaga outline<CR>", opts)

            keymap.set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
            keymap.set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
            keymap.set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
            keymap.set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        end

        local lspconfig = require('lspconfig')

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.bashls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.tsserver.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.marksman.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.jdtls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.ltex.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                ltex = {
                    disabledRules = {
                        ["en-US"] = { "MORFOLOGIK_RULE_EN_US", "EN_A_VS_AN" },
                    }
                }
            }
        })

        -- lspconfig.texlab.setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        lspconfig.pylsp.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.sumneko_lua.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    completion = {
                        enable = true,
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        enable = true,
                        globals = { "vim", "use", "love" },
                        -- disable = { "lowercase-global" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                        -- maxPreload = 2000,
                        -- preloadFileSize = 1000,
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
    end
}
