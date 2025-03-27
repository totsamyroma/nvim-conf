require('rose-pine').setup({
    variant = 'main',
    enable = {
        terminal = true,
    },
    groups = {
        panel = "base",
    },
    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- StatusLine = { fg = "love", bg = "love", blend = 15 },
        -- VertSplit = { fg = "muted", bg = "muted" },
        -- Visual = { fg = "base", bg = "text", inherit = false },
        TelescopeBorder = { fg = "#6e6a86", bg = "none" },
        FloatBorder = { fg = "#6e6a86", bg = "none" },
    },
})

vim.cmd("colorscheme rose-pine")

