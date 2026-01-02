vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- exit to file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- exit to file explorer
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- move lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- open split window and put it right/below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- copy absolute and relative current file path to clipboard
vim.keymap.set('n', '<leader>capath', ':let @+=expand("%:p")<CR>')
vim.keymap.set('n', '<leader>crpath', ':let @+=expand("%")<CR>')
