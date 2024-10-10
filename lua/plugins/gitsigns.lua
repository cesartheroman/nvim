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
            vim.keymap.set('n', '<leader>gl', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]it [L]ast Hunk' })
            vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]it [N]ext Hunk' })
            vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[G]it [P]review Hunk' })
            vim.keymap.set('n', '<leader>gb', require('gitsigns').toggle_current_line_blame, { buffer = bufnr, desc = '[G]it [B]lame' })
        end,
    },
}
