return {
  {
    'kevinhwang91/nvim-ufo',
    event = 'BufEnter',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    config = function()
      local keymap = vim.keymap

      keymap.set('n', 'zR', require('ufo').openAllFolds)
      keymap.set('n', 'zM', require('ufo').closeAllFolds)

      --- @diagnostic disable: unused-local
      require('ufo').setup {
        provider_selector = function(_bufnr, _filetype, _buftype)
          return { 'treesitter', 'indent' }
        end,
      }
    end,
  },
}
