vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"yml", "yaml"},
    callback = function()
        vim.opt_local.foldmethod = "indent"
        vim.opt_local.foldenable = true
        vim.opt_local.foldlevel = 1
    end,
})
