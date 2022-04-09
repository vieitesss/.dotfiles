local global = vim.o
local window = vim.wo
local buffer = vim.bo

-- General
vim.cmd([[filetype plugin indent on]])

-- Ignore case
vim.cmd([[set ignorecase]])

-- Colorscheme
global.background = "dark"
vim.cmd([[colorscheme dracula]])

-- Indent
global.autoindent = true
global.expandtab = true
global.tabstop = 4
global.softtabstop = 4
global.shiftwidth = 4
global.shiftround = true

-- Block when insert
vim.cmd([[set guicursor=i:block]])

-- Numbers
window.number = true
-- window.relativenumber = true

-- Lines
window.wrap = false

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

-- Clipboard
global.clipboard = "unnamedplus"
