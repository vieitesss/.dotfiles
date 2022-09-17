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
local lualine = "~/.config/nvim/lua/vt/lualine.lua"
function light()
  global.background = "light"
  vim.g.catppuccin_flavour = "latte"
  vim.api.nvim_command("colorscheme catppuccin")
  vim.fn.system([[sed -i "s/theme.*/theme = 'onelight',/g" ]] .. lualine)
end

function dark()
  global.background = "dark"
  vim.api.nvim_command("colorscheme gruvbox")
  vim.fn.system([[sed -i "s/theme.*/theme = 'gruvbox',/g" ]] .. lualine)
end

function getTheme()
  return vim.fn.system([[cat ~/.config/kitty/current-theme.conf | grep name: | awk '{print $3}']]):match("^%s*(.-)%s*$")
end

function setTheme()
  local theme = getTheme()

  if theme == "Gruvbox" then
    dark()
  else
    light()
  end

  vim.api.nvim_command("luafile " .. lualine)
end

setTheme()

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
