vim.o.completeopt = 'menuone,noselect'

local cmp = require('cmp')
-- local luasnip = require('luasnip')
local lspkind = require('lspkind')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-l>"] = cmp.mapping(function(fallback)
            -- if cmp.visible() then
            --     cmp.close()
            if vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else 
                fallback()
            end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<c-space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'vsnip'},
        { name = 'nvim_lsp', max_item_count = 6},
        { name = 'path'},
        -- { name = 'luasnip'},
    },
    {
        {name = 'buffer'}
    }),
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                vsnip = "[VSnip]",
                nvim_lsp = "[LSP]",
                buffer = "[BUF]"
                -- luasnip = "[LuaSnip]",
            }
        }
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    experimental = {
        -- native_menu = false,
        ghost_text = true,
    },
}
