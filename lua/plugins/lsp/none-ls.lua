return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'jay-babu/mason-null-ls.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local mason_null_ls = require 'mason-null-ls'
    local null_ls_utils = require 'null-ls.utils'

    -- To setup formatters and linters
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- To setup format on save
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    -- Ensure Mason installs linters and formatters
    mason_null_ls.setup {
      ensure_installed = {
        'stylua',
        'prettier',
        'eslint_d',
        'isort',
        'black',
        'pylint',
      },
      handlers = {
        -- Prevent the automatic setup of mason-null-ls and do the setup manually in the null-ls block below.
        pylint = function() end,
      },
    }

    -- For use in the null_ls setup pylint function, this is the venv path we will force pylint to use
    local venv_path =
      'import sys; sys.path.append("/usr/lib/python3.11/site-packages"); import pylint_venv; pylint_venv.inithook(force_venv_activation=True, quiet=True)'

    -- Configure null-ls
    null_ls.setup {
      -- add package.json as identifier for root (for typescript monorepos)
      root_dir = null_ls_utils.root_pattern('.null-ls-root', 'Makefile', '.git', 'package.json'),
      -- Setup formatters and linters
      sources = {
        formatting.stylua,
        formatting.prettier,
        formatting.isort,
        formatting.black,
        -- Was having false errors with pylint, seems to be because pylint has a hard time finding venv path
        -- See more: https://github.com/serranomorante/.dotfiles/blob/main/docs/python-dev-setup.md
        diagnostics.pylint.with {
          extra_args = { '--init-hook', venv_path },
        },
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == 'null-ls'
                end,
                bufnr = bufnr,
              }
            end,
          })
        end
      end,
    }
  end,
}
