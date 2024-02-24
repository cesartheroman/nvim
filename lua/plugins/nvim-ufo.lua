return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		require("ufo").setup({
			provider_selector = function(_bufnr, _filetype, _buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
