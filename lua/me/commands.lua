vim.api.nvim_create_user_command('Cop', function()
    vim.cmd('term zsh -lic cop')
end, {})

vim.api.nvim_create_user_command('Spec', function()
    vim.cmd('term zsh -lic spec %')
end, {})
