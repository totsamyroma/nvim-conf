vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('TermOpen', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.cmd('startinsert')
    end,
})

vim.keymap.set('n', '<leader>tt', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd('J')
end)

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
