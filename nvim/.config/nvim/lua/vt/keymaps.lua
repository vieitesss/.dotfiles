local keymap = vim.keymap.set
local s = { silent = true }

----- Normal -----
------------------

--- save and quit
keymap("n", "<Leader>ww", ":w!<CR>", s)
keymap("n", "<Leader>q", ":q<CR>", s)
keymap("n", "<Leader>Q", ":wq<CR>", s)

--- no highlight
keymap("n", "<Leader>no", ":noh<CR>", s)

--- window movements
keymap("n", "<Leader>H", ":wincmd H<CR>", s)
keymap("n", "<Leader>J", ":wincmd J<CR>", s)
keymap("n", "<Leader>K", ":wincmd K<CR>", s)
keymap("n", "<Leader>L", ":wincmd L<CR>", s)
keymap("n", "<Leader>o", ":wincmd o<CR>", s)

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

--- buffer movements
keymap("n", "<Leader>bp", ":bprev<CR>", s)
keymap("n", "<Leader>bn", ":bnext<CR>", s)
keymap("n", "<Leader>bd", ":bd<CR>", s)
keymap("n", "<Leader>bb", ":buffer", s)

-- tabs
keymap("n", "<Leader>te", ":tabnew<CR>", s)
keymap("n", "<Leader>tn", ":tabn<CR>", s)
keymap("n", "<Leader>tp", ":tabp<CR>", s)

--- split windows
keymap("n", "<Leader>\\", ":vsplit<CR>", s)
keymap("n", "<Leader>-", ":split<CR>", s)
keymap("n", "<Leader>=", "<C-w>=")

--- reload file
keymap("n", "<Leader>so", ":so %<CR>", s)
keymap("n", "<Leader><Leader>e", ":e<CR>", s)

--- formatting
keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s)

--- pdfviewer
keymap("n", "<Leader>pdf", ":lua OPENPDFVIEWER()<CR>", s)

----- Insert -----
------------------
--- quit
keymap("i", "jk", "<Esc>")

-- delete word backwards
keymap("i", "<M-BS>", "<Esc>ciw")

----- Visual -----
------------------

--- quit
keymap("v", "<Leader>o", "<Esc>")

--- paste without losing previous paste
keymap("v", "<Leader>p", '"_dP')

--- move lines
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

--- copy
keymap("x", "<C-c>", [["+y]], s)
