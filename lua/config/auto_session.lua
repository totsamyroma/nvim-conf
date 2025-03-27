autosession = require('auto-session')

autosession.setup({
    auto_create = true,
    auto_restore = false,
    auto_save_enabled = true,
    log_level = 'error',
    show_auto_restore_notif = true,
    use_git_branch = true,
    session_lens = {
        load_on_setup = true, -- Initialize on startup (requires Telescope)
        theme_conf = { -- Pass through for Telescope theme options
            layout_config = { -- As one example, can change width/height of picker
                width = 0.8,    -- percent of window
                height = 0.5,
            },
        },
        previewer = true, -- File preview for session picker
     },
})

vim.keymap.set('n', '<leader>ls', vim.cmd.SessionSearch)
vim.keymap.set('n', '<leader>ds', vim.cmd.SessionDelete)
vim.keymap.set('n', '<leader>ss', vim.cmd.SessionSave)
vim.keymap.set('n', '<leader>rs', vim.cmd.SessionRestore)
