return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		plugins = { spelling = true },
		defaults = {
			mode = { "n", "v" },
			["]"] = { name = "+next" },
			["["] = { name = "+prev" },
			["<leader>b"] = { desc = "buffer next/prev" },
			["<leader>c"] = { desc = "code/chat gippity" },
			["<leader>e"] = { desc = "neotree" },
			["<leader>f"] = { desc = "find" },
			["<leader>g"] = { desc = "git" },
			["<leader>h"] = { desc = "harpoon" },
			["<leader>l"] = { desc = "list session" },
			["<leader>r"] = { desc = "rename/restart" },
			["<leader>s"] = { desc = "window splits" },
			["<leader>t"] = { desc = "todo comments" },
			["<leader>v"] = { desc = "vim maximize" },
			["<leader>x"] = { desc = "trouble" },
			["<leader>z"] = { desc = "code folding" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
