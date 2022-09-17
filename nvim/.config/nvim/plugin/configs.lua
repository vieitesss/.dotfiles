local global = vim.o
local window = vim.wo
local buffer = vim.bo

-- General
vim.api.nvim_command("filetype plugin indent on")

-- Auto-formatting
vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]

-- Ignore case
vim.api.nvim_command("set ignorecase")

-- Colorscheme
global.background = "light"
vim.g.catppuccin_flavour = "latte"
vim.api.nvim_command("colorscheme catppuccin")
-- vim.api.nvim_command("hi Normal guibg=NONE ctermbg=NONE")

-- Winbar
global.winbar = "%m %f"

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
-- window.relativenumber = true

-- Lines
window.wrap = false

-- Auto chdir
global.autochdir = true

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
