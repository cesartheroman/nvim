-- See `:help lua-guide-autocommands`
--Autocmds are automatically loaded on the VeryLazy event

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Dynamic tab formatting for Go and Python
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'go', 'python' },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = vim.bo.filetype == 'python'
    end,
})
