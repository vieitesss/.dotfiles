local telescope = require("telescope")
local actions  = require("telescope.actions")
local builtin  = require("telescope.builtin")

telescope.setup {
    defaults = {
        --file_sorter = require'telescope.sorters'.get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        --grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new
    },
    extensions = {
--        fzy_native = {
--            override_generic_sorter = false,
--            override_file_sorter = true,
--        }
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"}
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        buffers = {
            initial_mode = "normal",
            show_all_buffers = true,
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                n = {
                    ["dd"] = actions.delete_buffer,
                    ["V"] = actions.add_selection
                }
            }
        },
        lsp_references = {
            initial_mode = "normal"
        }
    }
}
--telescope.load_extension('fzy_native')
telescope.load_extension('media_files')

local M = {}

M.search_dotfiles = function ()
    builtin.find_files({
        prompt_title = "Dotfiles",
        cwd = "~/.dotfiles/",
    })
end

M.search_nvim = function ()
    builtin.find_files({
        prompt_title = "Nvim Config",
        cwd = "~/.config/nvim/"
    })
end

return M
