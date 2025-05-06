return {
    'rmagatti/auto-session',
    event = 'DirChanged',
    config = function()
        require('auto-session').setup({
            log_level = 'error',
            session_lens = {
                buftypes_to_ignore = {},
                load_on_setup = true,
                mappings = {
                    alternate_session = { 'i', '<C-S>' },
                    copy_session = { 'i', '<C-Y>' },
                    delete_session = { 'i', '<C-D>' },
                },
                previewer = false,
                theme_conf = {
                    border = true,
                },
            },
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        })

        -- set mapping for searching a session.
        vim.keymap.set('n', '<leader>ls', function()
            require('auto-session.session-lens').search_session({})
        end, {
            noremap = true,
            desc = '[l]ist [s]essions',
        })

        -- For better auto-session experience
        vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end,
}
