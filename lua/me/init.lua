require('me.remap')
require('me.cabbrevs')

-- share buffer clipboard with system clipboard
vim.opt.clipboard:append { 'unnamedplus' }

-- enable numbers and relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- show vertical bar at 120 characters
vim.opt.colorcolumn = '120'

-- smart indent
vim.opt.smartindent = true

--  other
-- vim.opt.scrolloff = 10

vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- refresh file after external change
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
    command = 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None',     pattern = { "*" },
})
