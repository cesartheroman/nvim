require('core')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { import = 'plugins' },
    { import = 'plugins.lsp' },
})
require('plugins-custom/greet').setup({
    name = 'David',
})
require('plugins-custom/myplugin').setup()
require('plugins-custom/quicknotes').setup()
