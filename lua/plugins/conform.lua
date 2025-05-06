return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local conform = require('conform')

        conform.setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
                html = { 'prettier' },
                go = { 'gofmt' },
                python = { 'isort', 'black' },
                css = { 'prettier' },
                blade = { 'blade-formatter' },
            },
        })

        vim.keymap.set({ 'n', 'v' }, '<leader>fo', function()
            conform.format({
                async = false,
                lsp_fallback = true,
            })
        end, { desc = '[fo]rmat file' })
    end,
}
