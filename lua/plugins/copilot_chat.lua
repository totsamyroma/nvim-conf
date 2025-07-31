return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    tag = "v3.12.2",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      mappings = {
        complete = {
          insert = "<C-n>",
        },
        reset = {
          insert = "<C-r>",
          normal = "<C-r>",
        },
      },
      -- See Configuration section for options
      window = {
        layout = 'horizontal', -- 'horizontal' or 'vertical'
      }
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
