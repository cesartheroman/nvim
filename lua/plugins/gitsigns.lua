return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        -- See `:help gitsigns.txt`
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
            local builtin = require('telescope.builtin')
            local gitsigns = require('gitsigns')

            vim.keymap.set('n', '<leader>gg', vim.cmd.Git, { desc = '[G]it Status' })
            vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
            vim.keymap.set('n', '<leader>gl', function()
                gitsigns.nav_hunk('prev')
            end, { buffer = bufnr, desc = '[G]it [L]ast Hunk' })
            vim.keymap.set('n', '<leader>gn', function()
                gitsigns.nav_hunk('next')
            end, { buffer = bufnr, desc = '[G]it [N]ext Hunk' })
            vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { buffer = bufnr, desc = '[G]it [P]review Hunk' })
            vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = '[G]it [B]lame' })
            vim.keymap.set('n', '<leader>gsh', gitsigns.stage_hunk, { desc = '[G]it [S]tage [H]unk' })
            vim.keymap.set('n', '<leader>gsu', gitsigns.undo_stage_hunk, { desc = '[G]it [S]tage [U]ndo' })
            vim.keymap.set('n', '<leader>gsb', gitsigns.stage_buffer, { desc = '[G]it [S]tage [B]uffer' })
        end,
    },
}
