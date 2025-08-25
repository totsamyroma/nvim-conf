local plugin = require("chatgpt")

plugin.setup({})

function getCurrentWindow()
  return vim.api.nvim_get_current_win()
end

function setCurrentWindow(win)
  vim.api.nvim_set_current_win(win)
end

function withActiveWindowSwap(fun)
  local win = getCurrentWindow()
  fun()
  local chatgpt_win = getCurrentWindow()
  setCurrentWindow(win)
  setCurrentWindow(chatgpt_win)
end

vim.api.nvim_create_user_command("ChatGPT", function()
  withActiveWindowSwap(plugin.openChat)
end, {})
