return {
  --  To check the current status of installed tools and/or manually install
  --  other tools, you can run
  --    :Mason
  --
  --  You can press `g?` for help in this menu.
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    -- Import mason, mason-lspconfig, and mason-tool-installer
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    -- Enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    -- Setup mason with list of servers to install
    mason_lspconfig.setup {
      ensure_installed = {
        'lua_ls',
        'tsserver',
        'html',
        'cssls',
        'tailwindcss',
        'pyright',
        'gopls',
        'rust_analyzer',
        'emmet_ls',
        'mdx_analyzer',
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    }

    -- For formatting
    mason_tool_installer.setup {
      ensure_installed = {
        'stylua', -- lua formatter
        'prettier', -- js/ts formatter
        'eslint_d', -- js linter
        'isort', -- python import sort
        'black', -- python formatter
        'pylint', -- python linter
      },
    }
  end,
}
