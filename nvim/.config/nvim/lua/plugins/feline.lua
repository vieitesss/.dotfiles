vim.opt.termguicolors = true

return {
    "famiu/feline.nvim",
    event = { "BufNewFile", "BufRead", "BufWritePost" },
    -- lazy = false,
    config = function ()
        local components = {
            active = {},
            inactive = {}
        }

        -- Left and right
        table.insert(components.active, {})
        table.insert(components.active, {})

        -- Right
        table.insert(components.inactive, {})

        local colors = require'kanagawa.colors'.setup()

        -- Left active components
        table.insert(components.active[1], {
            provider = 'vi_mode',
            icon = '',
            hl = function()
                return {
                    name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                    fg = colors.theme.ui.bg_gutter,
                    bg = colors.palette.crystalBlue,
                    style = 'bold'
                }
            end,
            padding = 'center',
            right_sep = {
                str = '',
                always_visible = true
            }
        })

        table.insert(components.active[1], {
            provider = 'git_branch',
            left_sep = '',
            right_sep = '',
        })

        table.insert(components.active[1], {
            provider = 'file_info',
            type = 'unique',
            file_modified_icon = 'M',
            left_sep = ' ',
        })

        table.insert(components.active[1], {
            provider = 'diagnostic_errors',
            hl = {
                fg = 'red'
            }
        })

        table.insert(components.active[1], {
            provider = 'diagnostic_warnings',
            hl = {
                fg = 'yellow'
            }
        })

        table.insert(components.active[1], {
            provider = 'diagnostic_hints',
            hl = {
                fg = 'oceanblue'
            }
        })

        table.insert(components.active[1], {
            provider = 'diagnostic_info',
            hl = {
                fg = 'green'
            }
        })

        -- Right active components
        table.insert(components.active[2], {
            provider = 'cmd',
            right_sep = ' ',
        })

        table.insert(components.active[2], {
            provider = 'position',
            right_sep = ' ',
        })

        -- Inactive components
        table.insert(components.inactive[1], {
            provider = 'file_info',
            type = 'unique'
        })

        require'feline'.setup({
            components = components,
            custom_providers = {
                cmd = function ()
                    return "%S"
                end,
                -- filetype = function ()
                --     local icon , color = require'nvim-web-devicons'.get_icon_color(vim.fn.expand("%"), vim.fn.expand("%:e"), { default = true })
                --     local type = vim.api.nvim_exec2("silent echo &filetype", { output = true }).output
                --     return icon .. " " .. type
                -- end
            }
        })

        require'feline'.add_theme('kanagawa', {
            fg = colors.theme.ui.fg,
            bg = colors.theme.ui.bg_gutter,
            black = colors.palette.dragonBlack0,
            skyblue = colors.palette.dragonBlue,
            cyan = colors.palette.lotusCyan,
            green = colors.palette.springGreen,
            oceanblue = '#0066cc',
            magenta = colors.palette.lotusViolet3,
            orange = colors.palette.surimiOrange,
            red = colors.palette.lotusRed,
            violet = '#8992a7',
            white = '#FFFFFF',
            yellow = colors.palette.lotusYellow3,
        })
        require'feline'.use_theme('kanagawa')
    end
}
