return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        -- For adding file and opening up Harpoon UI
        {
            '<leader>hh',
            function()
                require('harpoon.ui').toggle_quick_menu()
            end,
            desc = 'UI',
        },
        {
            '<leader>ha',
            function()
                require('harpoon.mark').add_file()
            end,
            desc = 'Add file ',
        },
        -- stylua: ignore start
        -- For navigating through Harpooned files
        { '<leader>h1', function() require('harpoon.ui').nav_file(1) end },
        { '<leader>h2', function() require('harpoon.ui').nav_file(2) end },
        { '<leader>h3', function() require('harpoon.ui').nav_file(3) end },
        { '<leader>h4', function() require('harpoon.ui').nav_file(4) end },
        { '<leader>h5', function() require('harpoon.ui').nav_file(5) end },
        { '<leader>h6', function() require('harpoon.ui').nav_file(6) end },
        { '<leader>h7', function() require('harpoon.ui').nav_file(7) end },
        { '<leader>h8', function() require('harpoon.ui').nav_file(8) end },
        { '<leader>h9', function() require('harpoon.ui').nav_file(9) end },
        { '<leader>h0', function() require('harpoon.ui').nav_file(10) end },
        -- stylua: ignore end
    },
}
