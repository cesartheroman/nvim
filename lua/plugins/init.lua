--  For plugins that are <= 10 lines of config
return {
    'christoomey/vim-tmux-navigator',
    'tpope/vim-fugitive',
    'stevearc/dressing.nvim',
    {
        'szw/vim-maximizer',
        keys = {
            { '<leader>vm', '<cmd>MaximizerToggle<CR>', desc = '[v]im [m]aximize split' },
        },
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
    -- Colorschemes
    {
        'bluz71/vim-nightfly-colors',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme('nightfly')
        end,
    },
    { 'folke/tokyonight.nvim', event = 'User LazyColorscheme' },
    { 'catppuccin/nvim', event = 'User LazyColorscheme' },
}
