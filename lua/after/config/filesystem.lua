vim.g.netrw_keepdir = 1

-- Change workinig diirectory to the directory of the current buffer
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "copilot" then -- avoid copilot buffer
      return
    end
  end,
})
