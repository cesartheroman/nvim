-- See `:help vim.keymap.set()`
-- See `:help mapleader`
-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Use 'jk' to exist Insert mode
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', 'kj', '<ESC>')

-- Remap :W to :w
vim.cmd('cabbrev W w')
vim.cmd('cabbrev Q q')
vim.cmd('cabbrev Wq wq')

-- Copy all
vim.keymap.set('n', '<C-c>', '<cmd> %y+ <CR>')

-- Select all
vim.keymap.set('n', '<C-g>', 'gg<S-v>G', { desc = 'select all' })

-- Navigate next buffer
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Buffer next' })

-- Navigate previous buffer
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { desc = 'Buffer prev' })

-- Preserve yanked/pasted content
vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true })

-- Delete single char w/o copying into register
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Up + Down Navigation
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up while keeping cursor in middle of page' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down while keeping cursor in middle of page' })

--allow search terms to stay in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Spit window vertically' })
vim.keymap.set('n', '<leader>sz', '<C-w>s', { desc = 'Spit window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', ']t', function()
    require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[t', function()
    require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- Keymaps for saving and quitting while working on laptop
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>gv', { noremap = true, silent = true })
vim.keymap.set('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-q>', '<Esc>:q<CR>a', { noremap = true, silent = true })
vim.keymap.set('v', '<C-q>', '<Esc>:q<CR>gv', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ux', function()
    -- Find the most recent buffer that is still ilsted but not curretnly visible
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    for _, buf in ipairs(buffers) do
        if buf.hidden == 1 then
            -- Open the buffer in a new split
            vim.cmd('split')
            vim.cmd('buffer ' .. buf.bufnr)
            return
        end
    end
    vim.notify('No hidden buffers to reopen.', vim.log.levels.WARN)
end, { desc = 'Reopen Last Closed Split Buffer ' })
