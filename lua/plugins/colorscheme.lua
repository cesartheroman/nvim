return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  {
    'bluz71/vim-nightfly-colors',
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.colorscheme 'nightfly'
    end,
  },
  { 'folke/tokyonight.nvim', event = 'User LazyColorscheme' },
  { 'catppuccin/nvim', event = 'User LazyColorscheme' },
}
