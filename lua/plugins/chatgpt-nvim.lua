return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>ch", ":ChatGPT<CR>", { desc = "ChatGippity" })
		keymap.set("n", "<leader>cha", ":ChatGPTActAs<CR>", { desc = "ChatGippity [a]ct as" })
		keymap.set("n", "<leader>chc", ":ChatGPTCompleteCode<CR>", { desc = "ChatGippity [c]omplete code" })
		keymap.set(
			"n",
			"<leader>che",
			":ChatGPTEditWithInstructions<CR>",
			{ desc = "ChatGippity [e]dit with instructions" }
		)
		keymap.set("n", "<leader>chr", ":ChatGPTRun", { desc = "ChatGippity" })

		require("chatgpt").setup({})
	end,
}
