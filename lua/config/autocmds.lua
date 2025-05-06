-- See `:help lua-guide-autocommands`
--Autocmds are automatically loaded on the VeryLazy event

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
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

-- Create an augroup to avoid duplicate autocommands
vim.api.nvim_create_augroup('WorkProjectIndent', { clear = true })

-- Autocommand to override any js/ts indent settings to favor project settings
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    group = 'WorkProjectIndent',
    pattern = { '*.js', '*.ts', '*.jsx', '*.tsx' },
    callback = function()
        local home = os.getenv 'HOME'
        local work_dir = home .. '/code/projects/work'
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname == '' or not bufname:match(work_dir) then
            return
        end

        local current_dir = vim.fn.fnamemodify(bufname, ':p:h')
        -- vim.fn.findfile will search upward from current_dir (note the trailing ;)
        local config_path = vim.fn.findfile('.prettierrc', current_dir .. ';')
        if config_path == '' then
            return -- No configuration file found, so keep your defaults
        end

        local content = table.concat(vim.fn.readfile(config_path), '\n')
        local ok, config = pcall(vim.fn.json_decode, content)
        if not ok then
            vim.notify('Failed to parse ' .. config_path, vim.log.levels.ERROR)
            return
        end

        local tab_width = config.tabWidth or 2
        vim.bo.tabstop = tab_width
        vim.bo.shiftwidth = tab_width
        vim.bo.softtabstop = tab_width
        vim.bo.expandtab = not config.useTabs
    end,
})
