return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        local keymap = vim.keymap

        -- For adding file and opening up Harpoon UI
        keymap.set('n', '<leader>hh', ui.toggle_quick_menu, { desc = 'UI' })
        keymap.set('n', '<leader>ha', mark.add_file, { desc = 'Add file ' })

        -- For navigating through Harpooned files
        keymap.set('n', '<leader>h1', function()
            ui.nav_file(1)
        end)
        keymap.set('n', '<leader>h2', function()
            ui.nav_file(2)
        end)
        keymap.set('n', '<leader>h3', function()
            ui.nav_file(3)
        end)
        keymap.set('n', '<leader>h4', function()
            ui.nav_file(4)
        end)
        keymap.set('n', '<leader>h5', function()
            ui.nav_file(5)
        end)
        keymap.set('n', '<leader>h6', function()
            ui.nav_file(6)
        end)
        keymap.set('n', '<leader>h7', function()
            ui.nav_file(7)
        end)
        keymap.set('n', '<leader>h8', function()
            ui.nav_file(8)
        end)
    end,
}
