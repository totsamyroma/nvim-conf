local plugin = require('rose-pine')

plugin.setup({
    variant = 'main',
    enable = {
        terminal = true,
    },
    groups = {
        panel = "base",
    },
    highlight_groups = {
        TelescopeBorder = { bg = "none" },
        FloatBorder = { bg = "none" },
        Pmenu = { bg = "surface" },
        PmenuSel = { bg = "highlight_med" },
        PmenuSbar = { bg = "overlay" },
        PmenuThumb = { bg = "muted" },
    },
})

vim.cmd("colorscheme rose-pine")
