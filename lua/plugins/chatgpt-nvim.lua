return {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        { 'folke/trouble.nvim', cmd = 'TroubleToggle' },
        { 'nvim-telescope/telescope.nvim', cmd = 'Telescope' },
    },
    config = function()
        local keymap = vim.keymap

        keymap.set('n', '<leader>ch', ':ChatGPT<CR>', { desc = 'ChatGippity' })
        keymap.set('n', '<leader>cha', ':ChatGPTActAs<CR>', { desc = 'ChatGippity [a]ct as' })
        keymap.set('n', '<leader>chc', ':ChatGPTCompleteCode<CR>', { desc = 'ChatGippity [c]omplete code' })
        keymap.set('n', '<leader>che', ':ChatGPTEditWithInstructions<CR>', { desc = 'ChatGippity [e]dit with instructions' })
        keymap.set('n', '<leader>chr', ':ChatGPTRun', { desc = 'ChatGippity' })

        require('chatgpt').setup({
            openai_params = {
                frequency_penalty = 0,
                presence_penalty = 0,
                max_tokens = 4095,
                temperature = 0.2,
                top_p = 0.1,
                n = 1,
            },
        })
    end,
}
