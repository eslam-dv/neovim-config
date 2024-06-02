return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local nvim_lsp = require("lspconfig")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- Mappings.
				local map = vim.keymap.set
				map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
				map("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
				map("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
				map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				map("n", "[d", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
				map("n", "]d", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
				map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = { "html", "cssls", "tsserver", "pyright", "emmet_ls" }

		for _, server in ipairs(servers) do
			nvim_lsp[server].setup({
				capabilities = capabilities,
			})
		end

		nvim_lsp["lua_ls"].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		-- change diagnositc icons
		local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local config = {
			virtual_text = true,
			signs = {
				active = signs, -- show signs
			},
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(config)
	end,
}
