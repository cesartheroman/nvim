return {
    'folke/noice.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    config = function()
        require('notify').setup({
            stages = 'static',
            top_down = false,
        })

        require('noice').setup({
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            routes = {
                {
                    filter = {
                        event = 'notify',
                        find = 'No information available',
                    },
                    opts = { skip = true },
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = 3,
                        col = '50%',
                    },
                    size = {
                        width = '60%', -- Set desired width here
                        height = 'auto',
                    },
                },
            },
        })

        vim.keymap.set('n', '<leader>dn', function()
            require('notify').dismiss({ silent = true, pending = true })
        end, { desc = '[d]ismiss [n]otification' })
    end,
}
