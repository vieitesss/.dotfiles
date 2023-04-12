local cmp_kinds = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
    },
    -- lazy = false,
    event = "ModeChanged",
    config = function()
        local cmp = require('cmp')

        local status_luasnip, luasnip = pcall(require, "luasnip")
        if not status_luasnip then
            return
        end

        require("luasnip/loaders/from_vscode").lazy_load()

        cmp.setup({
            -- enabled = function()
            --     return true
            -- end,
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- window = {
            --     documentation = cmp.config.window.bordered(),
            --     completion = {
            --         col_offset = -2,
            --         side_padding = 1,
            --         scrolloff = 3,
            --     },
            -- },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-u>"] = cmp.mapping.scroll_docs(4),
                ["<C-l>"] = cmp.mapping(function(fallback)
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<Tab>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
            }),
            sources = {
                { name = "nvim_lua" },
                { name = "luasnip", max_item_count = 6 },
                { name = "nvim_lsp", max_item_count = 6 },
                { name = "buffer", max_item_count = 10 },
                { name = "path" },
            },
            completion = {
                completeopt = "menu,menuone,noselect"
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lua = "[API]",
                        nvim_lsp = "[LSP]",
                        buffer = "[BUF]",
                        luasnip = "[SNIP]",
                        cmdline = "[CMD]",
                        path = "[PATH]",
                    }
                    item.kind = cmp_kinds[item.kind] or ""
                    item.menu = menu_icon[entry.source.name]

                    return item
                end,
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" },
            }),
        })
    end
}
