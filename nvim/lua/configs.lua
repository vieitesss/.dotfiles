local global = vim.o
local window = vim.wo
local buffer = vim.bo

-- Colorscheme
global.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Indent
buffer.autoindent = true
buffer.expandtab = true
buffer.tabstop = 4
buffer.softtabstop = 4
buffer.shiftwidth = 4
global.shiftround = true

-- Block when insert
vim.cmd([[set guicursor=i:block]])

-- Numbers
window.number = true
window.relativenumber = true

-- Lines to edges
window.scrolloff = 8

-- Cursor
window.cursorline = true
global.ruler = true

-- Mouse
global.mouse = "a"

-- Read files always
global.autoread = true
