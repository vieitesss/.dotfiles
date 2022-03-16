local telescope = require'telescope'
local actions  = require 'telescope.actions'
telescope.setup{
    defaults = {
        --file_sorter = require'telescope.sorters'.get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        --grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new
    },
--    extensions = {
--        fzy_native = {
--            override_generic_sorter = false,
--            override_file_sorter = true,
--        }
--    },
    pickers = {
        find_files = {
            hidden = true
        },
        buffers = {
            mappings = {
                n = {
                    ["dd"] = actions.delete_buffer + actions.move_to_top
                }
            }
        }
    }
}
--telescope.load_extension('fzy_native')

local M = {}
M.search_dotfiles = function ()
    require'telescope.builtin'.find_files({
        prompt_title = "< Dotfiles >",
        cwd = "~/.dotfiles/",
    })
end

return M
