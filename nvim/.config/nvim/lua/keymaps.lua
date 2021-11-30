local keymap = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }
local n = { noremap = true }
local s = { silent = true }
 
vim.g.mapleader = ' '

----- Normal -----
------------------

-- save and quit
keymap('n', '<Leader>w', ':w<CR>', {})
keymap('n', '<Leader>q', ':q<CR>', {})
keymap('n', '<Leader>wq', ':wq<CR>', {})

-- window movements
keymap('n', '<Leader>h', ':wincmd h<CR>', n)
keymap('n', '<Leader>j', ':wincmd j<CR>', n)
keymap('n', '<Leader>k', ':wincmd k<CR>', n)
keymap('n', '<Leader>l', ':wincmd l<CR>', n)
keymap('n', '<Leader>H', ':wincmd H<CR>', n)
keymap('n', '<Leader>J', ':wincmd J<CR>', n)
keymap('n', '<Leader>K', ':wincmd K<CR>', n)
keymap('n', '<Leader>L', ':wincmd L<CR>', n)
keymap('n', '<Leader>o', ':wincmd o<CR>', n)
keymap('n', '<Leader>cw', ':wincmd q<CR>', n)
keymap('n', '<Leader>=', ':vertical resize +10<CR>', n)
keymap('n', '<Leader>-', ':vertical resize -10<CR>', n)

-- buffer movements
keymap('n', '<Leader>bp', ':bprev<CR>', {})
keymap('n', '<Leader>bn', ':bnext<CR>', {})
keymap('n', '<Leader>bd', ':bd<CR>', {})
keymap('n', '<Leader>bb', ':buffer', {})

-- edit init.lua
keymap('n', '<Leader>ve', ':e ~/.config/nvim/init.lua<CR>', s)

-- reload file
keymap('n', '<Leader>rf', ':so %<CR>', s)

----- Insert -----
------------------
keymap('i', 'jk', '<Esc>', {})

----- Visual -----
------------------

-- quit
keymap('v', 'oo', '<Esc>', {})

-- move lines
keymap('v', 'J', ':m \'>+1<CR>gv=gv', n)
keymap('v', 'K', ':m \'>-2<CR>gv=gv', n)
