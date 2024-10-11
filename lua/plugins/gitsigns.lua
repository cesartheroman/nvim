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

            vim.keymap.set('n', '<leader>gg', vim.cmd.Git, { desc = '[G]it Status' })
            vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
            vim.keymap.set('n', '<leader>gl', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]it [L]ast Hunk' })
            vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]it [N]ext Hunk' })
            vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[G]it [P]review Hunk' })
            vim.keymap.set('n', '<leader>gb', require('gitsigns').toggle_current_line_blame, { buffer = bufnr, desc = '[G]it [B]lame' })
            vim.keymap.set('n', '<leader>gst', require('gitsigns').stage_hunk, { desc = '[G]it [S]tage' })
            vim.keymap.set('n', '<leader>gsu', require('gitsigns').undo_stage_hunk, { desc = '[G]it [S]tage [U]ndo' })
            vim.keymap.set('n', '<leader>gsb', require('gitsigns').stage_buffer, { desc = '[G]it [S]tage [B]uffer' })
        end,
    },
}
