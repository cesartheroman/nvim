return {
    'jackMort/ChatGPT.nvim',
    keys = {
        { '<leader>chh', ':ChatGPT<CR>', { desc = 'ChatGippity' } },
        { '<leader>che', ':ChatGPTRun explain_code<CR>', { desc = 'ChatGippity' } },
        { '<leader>cha', ':ChatGPTActAs<CR>', { desc = 'ChatGippity [a]ct as' } },
        { '<leader>chc', ':ChatGPTCompleteCode<CR>', { desc = 'ChatGippity [c]omplete code' } },
    },
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope.nvim', cmd = 'Telescope' },
    },
    config = function()
        require('chatgpt').setup({
            api_host_cmd = 'echo -n https://openrouter.ai/api',
            api_key_cmd = 'op read op://Personal/open-router/api-key',
            api_type_cmd = 'echo localai',
            openai_params = {
                model = 'google/gemini-2.5-flash-preview-05-20',
                -- model = 'openrouter/auto',
                -- model = 'openai/o4-mini',
                max_tokens = 2000,
            },
            extra_curl_params = {
                '-H',
                'HTTP-Referer: https://github.com/jackMort/ChatGPT.nvim',
                '-H',
                'X-Title: ChatGPTnvim',
            },
        })
    end,
}
