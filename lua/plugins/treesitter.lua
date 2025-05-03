return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost' },
    dependencies = {
        'windwp/nvim-ts-autotag',
        {
            'nvim-treesitter/nvim-treesitter-context',
            config = function()
                require('treesitter-context').setup({
                    enable = true,
                    max_lines = 3,
                    trim_scope = 'inner',
                })
            end,
        },
    },
    opts = {
        ensure_installed = {
            'lua',
            'javascript',
            'typescript',
            'tsx',
            'go',
            'python',
            'html',
            'css',
            'json',
            'bash',
            'yaml',
            'dockerfile',
            'markdown',
            'vim',
            'vimdoc',
            'blade',
            'php',
            'php_only',
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
        autotag = { enable = true },
        -- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<C-space>',
                node_incremental = '<C-space>',
                scope_incremental = false,
                node_decremental = '<bs>',
            },
        },
    },
    config = function(_, opts)
        -- Configure the Blade parser
        local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = 'https://github.com/EmranMR/tree-sitter-blade',
                files = { 'src/parser.c' },
                branch = 'main',
            },
            filetype = 'blade',
        }

        vim.filetype.add({
            pattern = {
                ['.*%.blade%.php'] = 'blade',
            },
        })
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        require('nvim-treesitter.configs').setup(opts)

        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
}
