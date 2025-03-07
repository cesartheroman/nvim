return {
    'rmagatti/auto-session',
    config = function()
        require('auto-session').setup({
            log_level = 'error',
            auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            session_lens = {
                buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session
                load_on_setup = true,
                theme_conf = { border = true },
                previewer = false,
                mappings = {
                    -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
                    delete_session = { 'i', '<C-D>' },
                    alternate_session = { 'i', '<C-S>' },
                    copy_session = { 'i', '<C-Y>' },
                },
            },
        })

        -- set mapping for searching a session.
        vim.keymap.set('n', '<leader>ls', require('auto-session.session-lens').search_session, {
            noremap = true,
            desc = '[l]ist [s]essions',
        })

        -- For better auto-session experience
        vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end,
}
