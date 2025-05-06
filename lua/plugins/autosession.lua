return {
    'rmagatti/auto-session',
    event = 'DirChanged',
    keys = {
        {
            '<leader>ls',
            function()
                require('auto-session.session-lens').search_session({})
            end,
            desc = '[l]ist [s]essions',
        },
    },
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

        -- For better auto-session experience
        vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end,
}
