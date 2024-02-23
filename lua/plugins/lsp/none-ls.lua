return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")
		local null_ls_utils = require("null-ls.utils")

		-- To setup formatters and linters
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		-- To setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- Ensure Mason installs linters and formatters
		mason_null_ls.setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"eslint_d",
				"isort",
				"black",
				"pylint",
			},
		})

		-- Configure null-ls
		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			-- Setup formatters and linters
			sources = {
				formatting.stylua,
				formatting.prettier,
				diagnostics.eslint_d.with({
					condition = function(utils)
						-- only enable if root has .eslintrc.js or .eslintrc.cjs
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
					end,
				}),
				formatting.isort,
				formatting.black,
				diagnostics.pylint,
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
