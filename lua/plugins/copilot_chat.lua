return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    tag = "v4.7.4",
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
      },
      temperature = 0.1,           -- Lower = focused, higher = creative
      auto_insert_mode = true,     -- Enter insert mode when opening
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
