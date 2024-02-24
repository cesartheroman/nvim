-- See `:help vim.o`
local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.autoindent = true

opt.number = true
opt.relativenumber = true

opt.clipboard:append("unnamedplus")

-- turn off swapfile
opt.swapfile = false

-- line break on whole words
opt.linebreak = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
