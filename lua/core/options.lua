-- See `:help vim.o`
local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.autoindent = true

opt.number = true
opt.relativenumber = true

-- Enable mouse mode
opt.mouse = "a"

-- Sync clipboard between OS and Neovim, use as register
opt.clipboard:append("unnamedplus")

-- turn off swapfile
opt.swapfile = false

-- line break on whole words
opt.linebreak = true

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- Allow backspace on indent, end of line or insert mode start position
opt.backspace = "indent,eol,start"

-- wrap text
opt.wrap = true

-- Place column line
opt.colorcolumn = "80"

-- Enable signcolumn to prevent buffer from jumping right
opt.signcolumn = "yes"

-- Enable persistent undo history
opt.undofile = true

opt.termguicolors = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 8
