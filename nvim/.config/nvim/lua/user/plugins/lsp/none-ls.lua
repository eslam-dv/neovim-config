return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics
		-- local completion = null_ls.builtins.completion

		null_ls.setup({
			debug = false,
			sources = {
				formatting.prettier.with({ --[[ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } ]]
				}),
				formatting.black.with({ extra_args = { "--fast" } }),
				formatting.stylua,
				-- diagnostics.flake8
        require("none-ls.diagnostics.eslint_d")
			},
		})
	end,
}
