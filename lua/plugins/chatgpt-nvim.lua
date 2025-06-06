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
        local api_key = os.getenv('OPEN_ROUTER_API_KEY')
        if not api_key then
            vim.notify(
                'Error: OPEN_ROUTER_API_KEY env var is not set.' .. 'ChatGippity.nvim wil not function correctly.',
                vim.log.levels.ERROR,
                { title = 'ChatGippity.nvim Config Error' }
            )
        end
        require('chatgpt').setup({
            api_host_cmd = 'echo -n https://openrouter.ai/api',
            api_key_cmd = 'echo -n ' .. api_key,
            api_type_cmd = 'echo localai',
            openai_params = {
                model = 'google/gemini-2.5-flash-preview-05-20',
                -- model = 'anthropic/claude-sonnet-4',
                -- model = 'google/gemini-2.5-pro-preview',
                -- model = 'openai/o4-mini',
                -- model = 'openrouter/auto',
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
