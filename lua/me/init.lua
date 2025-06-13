require('me.remap')
require('me.commands')
require('me.cabbrevs')
require('me.gcode_syntax')

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

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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

vim.api.nvim_create_augroup('gcode', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'gcode',
  pattern = '*.gcode',
  command = 'set filetype=gcode',
})

