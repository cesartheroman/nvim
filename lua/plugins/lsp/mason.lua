return {
    --  To check the current status of installed tools and/or manually install
    --  other tools, you can run
    --    :Mason
    --
    --  You can press `g?` for help in this menu.
    'williamboman/mason.nvim',
    -- Load Mason only when needed
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        local mason = require 'mason'
        local mason_lspconfig = require 'mason-lspconfig'
        local mason_tool_installer = require 'mason-tool-installer'

        -- Enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        })

        -- Setup mason with list of servers to install
        mason_lspconfig.setup({
            ensure_installed = {
                'lua_ls',
                'ts_ls',
                'pyright',
                'jedi_language_server',
                'gopls',
                'intelephense',
                'solargraph',
                'ruby_lsp',
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        -- For formatting
        mason_tool_installer.setup({
            ensure_installed = {
                'stylua',
                'prettier',
                'eslint_d',
                'isort',
                'black',
                'standardrb',
                'solargraph',
            },
        })
    end,
}
