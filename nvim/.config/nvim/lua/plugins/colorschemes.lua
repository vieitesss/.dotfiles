return {
    {
        "morhetz/gruvbox",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                keywords = { "italic" },
                strings = { "italic" },
                booleans = { "italic" },
            }
        }
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        config = function ()
            require'kanagawa'.setup({
                overrides = function (_)
                    return {
                        String = { italic = true }
                    }
                end
            })
            vim.api.nvim_exec2("colorscheme kanagawa", {})
        end
    },
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        opts = {
            styles = {
                strings = "italic"
            }
        --     style = 'warmer',
        --     -- transparent = true,
        --     code_style = {
        --         keywords = "italic",
        --         functions = "italic",
        --         strings = "italic",
        --     },
        --     diagnostics = {
        --         darker = false
        --     }
        }
    }
}
