-- See `:help nvim-treesitter`
return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		-- configure treesitter
		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"python",
				"go",
				"bash",
				"yaml",
				"dockerfile",
				"markdown",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
