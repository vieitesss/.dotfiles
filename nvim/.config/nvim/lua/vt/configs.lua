local global = vim.o
local window = vim.wo
local buffer = vim.bo

-- General
vim.api.nvim_command("filetype plugin indent on")
global.guicursor = "i:block"
-- vim.opt.cmdheight = 0
global.showcmdloc = "statusline"
vim.api.nvim_command("set noshowmode")
-- vim.api.nvim_command("set termguicolors")

-- Ignore case
vim.api.nvim_command("set ignorecase")

-- Winbar
-- global.winbar = "%m %f"

-- Indent
global.autoindent = true
global.expandtab = true
global.tabstop = 4
global.softtabstop = 4
global.shiftwidth = 4
global.shiftround = true

-- Block when insert
-- vim.cmd([[set guicursor=i:block]])

-- Numbers
window.number = true
window.relativenumber = true

-- Lines
window.wrap = false

-- Auto chdir
-- global.autochdir = true

-- Lines to edges
global.scrolloff = 8

-- Cursor
window.cursorline = true
global.ruler = true

-- Words substitution
global.inccommand = "nosplit"

-- Mouse
global.mouse = "a"

-- Read files always
global.autoread = true

-- Syntax
buffer.syntax = "ON"

-- Time to complete key code sequence
global.ttimeoutlen = 5

-- Hidden
global.hidden = true

-- Undofile
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

-- Clipboard
-- global.clipboard = "unnamedplus"
