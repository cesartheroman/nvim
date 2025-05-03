return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup()
        local keymap = vim.keymap

        -- For adding file and opening up Harpoon UI
        keymap.set('n', '<leader>ha', function()
            harpoon:list():add()
        end, { desc = 'Add file ' })
        keymap.set('n', '<leader>hh', function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = 'Harpoon UI' })

        -- For navigating through Harpooned files
        keymap.set('n', '<leader>h1', function()
            harpoon:list():select(1)
        end)
        keymap.set('n', '<leader>h2', function()
            harpoon:list():select(2)
        end)
        keymap.set('n', '<leader>h3', function()
            harpoon:list():select(3)
        end)
        keymap.set('n', '<leader>h4', function()
            harpoon:list():select(4)
        end)
        keymap.set('n', '<leader>h5', function()
            harpoon:list():select(5)
        end)
        keymap.set('n', '<leader>h6', function()
            harpoon:list():select(6)
        end)
        keymap.set('n', '<leader>h7', function()
            harpoon:list():select(7)
        end)
        keymap.set('n', '<leader>h8', function()
            harpoon:list():select(8)
        end)
        keymap.set('n', '<leader>h9', function()
            harpoon:list():select(9)
        end)
        keymap.set('n', '<leader>h0', function()
            harpoon:list():select(0)
        end)
    end,
}
