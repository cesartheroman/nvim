return {
	"folke/which-key.nvim",
	event = "VeryLazy",
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
			["<leader>e"] = { desc = "neotree" },
			["<leader>f"] = { name = "find/file" },
			["<leader>h"] = { name = "harpoon" },
			["<leader>g"] = { name = "git" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
