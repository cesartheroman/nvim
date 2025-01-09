return {
    --  Check out: https://github.com/echasnovski/mini.nvim
    --  Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
        -- Simple and easy statusline.
        local statusline = require 'mini.statusline'
        -- set use_icons to true if you have a Nerd Font
        statusline.setup({ use_icons = vim.g.have_nerd_font })

        -- You can configure sections in the statusline by overriding their
        -- default behavior. For example, here we set the section for
        -- cursor location to LINE:COLUMN
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return '%2l:%-2v'
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_filename = function()
            local filename = vim.fn.expand '%:t'
            local parent_dir = vim.fn.expand '%:h:t'
            return parent_dir .. '/' .. filename
        end

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.inactive = function()
            local filename = vim.fn.expand '%:t'
            local parent_dir = vim.fn.expand '%:h:t'
            return parent_dir .. '/' .. filename
        end
        -- Active indent guide and indent text objects. When you're browsing
        -- code, this highlights the current level of indentation, and animates
        -- the highlighting.
        local indentscope = require 'mini.indentscope'
        indentscope.setup({
            symbol = '│',
            options = { try_as_border = true },
            init = function()
                vim.api.nvim_create_autocmd('FileType', {
                    pattern = {
                        'help',
                        'alpha',
                        'dashboard',
                        'neo-tree',
                        'Trouble',
                        'trouble',
                        'lazy',
                        'mason',
                        'notify',
                        'toggleterm',
                        'lazyterm',
                    },
                    callback = function()
                        vim.b.miniindentscope_disable = true
                    end,
                })
            end,
        })
    end,
}
