vim.api.nvim_create_user_command('Cop', function()
    vim.cmd('term zsh -lic cop')
end, {})

vim.api.nvim_create_user_command('Spec', function()
    vim.cmd('term zsh -lic spec %')
end, {})

vim.api.nvim_create_autocmd("FileType",  {
    pattern = { "json" },
    callback = function()
      vim.api.nvim_set_option_value("formatprg", "jq", { scope = 'local' })
    end,
})
