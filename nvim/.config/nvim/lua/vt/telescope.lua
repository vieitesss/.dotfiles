local builtin = require("telescope.builtin")

local M = {}

M.search_dotfiles = function()
	builtin.find_files({
		prompt_title = "Dotfiles",
		-- cwd = "~/.dotfiles/",
		cwd = "~/.mac_config/",
	})
end

M.search_in_repo = function ()
    local git_home_dir = vim.api.nvim_cmd(vim.api.nvim_parse_cmd(":Git rev-parse --show-toplevel", {}), { output = true })
	builtin.find_files({
		prompt_title = "Git repo",
		cwd = git_home_dir,
	})
end

M.search_nvim = function()
	builtin.find_files({
		prompt_title = "Nvim Config",
		cwd = "~/.config/nvim/",
	})
end

M.search_projects = function()
	builtin.find_files({
		prompt_title = "My projects",
		cwd = "~/projects/",
		follow = true,
		hidden = false,
	})
end

return M
