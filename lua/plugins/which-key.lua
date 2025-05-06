return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
        plugins = { spelling = true },
        defaults = {
            mode = { 'n', 'v' },
            [']'] = { name = '+next' },
            ['['] = { name = '+prev' },
        },
    },
    keys = {
        -- Define key prefixes
        { '<leader>b', nil, { desc = 'buffer next/prev' } },
        { '<leader>ch', nil, { desc = 'code/chat gippity' } },
        { '<leader>e', nil, { desc = 'neotree' } },
        { '<leader>g', nil, { desc = 'git' } },
        { '<leader>h', nil, { desc = 'harpoon' } },
        { '<leader>l', nil, { desc = 'list session' } },
        { '<leader>t', nil, { desc = 'todo comments' } },
        { '<leader>v', nil, { desc = 'vim maximize' } },
        { '<leader>z', nil, { desc = 'code folding' } },
        -- Define groups
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>w_', hidden = true },
    },
}
