return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    keys = {
        {
            '<leader>e',
            ':Neotree toggle<CR>',
            { desc = 'Toggle Neotree' },
        },
        {
            '<leader>ef',
            ':Neotree reveal_force_cwd<CR>',
            { desc = 'Toggle Neotree in CWD' },
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
}
