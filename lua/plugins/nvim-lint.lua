return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require 'lint'

        lint.linters_by_ft = {
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            typescriptreact = { 'eslint_d' },
            php = { 'phpstan' },
        }

        -- Configure eslint_d with minimal arguments
        lint.linters.eslint_d.args = {
            '--format',
            'json',
            '--quiet', -- Only report errors, not warnings
            '--rule',
            'linebreak-style: 0', -- This disables the linebreak-style rule
        }

        -- Custom parser to silently ignore ESLint configuration errors
        lint.linters.eslint_d.parser = function(output, bufnr)
            if output:match "Invalid option '--eslintrc'" or output:match 'Could not find config file' then
                -- Silently ignore these errors by returning an empty result
                return {}
            end

            -- For all other cases, use the default parser
            return require('lint.linters.eslint').parser(output, bufnr)
        end

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint(nil, { ignore_errors = true })
            end,
        })

        vim.keymap.set('n', '<leader>li', function()
            lint.try_lint()
        end, { desc = 'trigger linting for current file' })
    end,
}
