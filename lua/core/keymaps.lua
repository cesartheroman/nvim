-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- See `:help vim.keymap.set()`
-- Use 'jk' to exist Insert mode
keymap.set("i", "jk", "<ESC>")

-- Navigation within Insert Mode
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-l>", "<Right>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-k>", "<Up>")

-- Copy all
keymap.set("n", "<C-c>", "<cmd> %y+ <CR>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Format file
keymap.set("n", "<leader>fo", vim.lsp.buf.format, { desc = "[fo]rmat file" })

-- Clear search highlights
keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })

-- Navigate next buffer
keymap.set("n", "<leader>bb", ":bnext<CR>", { desc = "Buffer next" })

-- Navigate previous buffer
keymap.set("n", "<leader>bn", ":bprev<CR>", { desc = "Buffer prev" })

-- Up + Down Navigation
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up while keeping cursor in middle of page" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down while keeping cursor in middle of page" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Spit window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Spit window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Switch between windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })

--allow search terms to stay in the middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- todo trouble
keymap.set("n", "<leader>tt", ":TodoTrouble<CR>", { desc = "[t]odo [t]ouble" })
keymap.set("n", "<leader>tf", ":TodoTelescope<CR>", { desc = "[t]elescope [f]ind todos" })

-- Higlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
