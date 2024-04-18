-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- See `:help mapleader`
-- Set <space> as the leader key
-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Use 'jk' to exist Insert mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: [[ OG OPTIONS ]]
-- Navigation within Insert Mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

-- Copy all
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Format file
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, { desc = "[fo]rmat file" })

-- Clear search highlights
vim.keymap.set("n", "<leader>cc", ":nohl<CR>", { desc = "Clear search highlights" })

-- Navigate next buffer
vim.keymap.set("n", "<leader>bb", ":bnext<CR>", { desc = "Buffer next" })

-- Navigate previous buffer
vim.keymap.set("n", "<leader>bn", ":bprev<CR>", { desc = "Buffer prev" })

-- Up + Down Navigation
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up while keeping cursor in middle of page" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down while keeping cursor in middle of page" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Spit window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Spit window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

--allow search terms to stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- todo trouble
vim.keymap.set("n", "<leader>tt", ":TodoTrouble<CR>", { desc = "[t]odo [t]ouble" })
vim.keymap.set("n", "<leader>tf", ":TodoTelescope<CR>", { desc = "[t]elescope [f]ind todos" })
vim.keymap.set("n", "<leader>tl", ":TodoLocList<CR>", { desc = "[t]odo [l]oclist" })
vim.keymap.set("n", "<leader>tq", ":TodoQuickFix<CR>", { desc = "[t]odo [q]uickfix" })

vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
