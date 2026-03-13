return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"tailwindcss",
					"stylelint_lsp",
					"dockerls",
					"docker_compose_language_service",
					"html",
					"cssls",
					"eslint",
					"rust_analyzer",
					"terraformls",
					"clangd",
					"cmake",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- =====================
			-- LSP CONFIG
			-- =====================

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("ts_ls", { capabilities = capabilities })
			vim.lsp.config("tailwindcss", { capabilities = capabilities })
			vim.lsp.config("stylelint_lsp", { capabilities = capabilities })
			vim.lsp.config("dockerls", { capabilities = capabilities })
			vim.lsp.config("docker_compose_language_service", { capabilities = capabilities })
			vim.lsp.config("html", { capabilities = capabilities })
			vim.lsp.config("cssls", { capabilities = capabilities })
			vim.lsp.config("rust_analyzer", { capabilities = capabilities })
			vim.lsp.config("terraformls", { capabilities = capabilities })
			vim.lsp.config("clangd", { capabilities = capabilities })
			vim.lsp.config("cmake", { capabilities = capabilities })
			vim.lsp.config("eslint", { capabilities = capabilities })

			-- =====================
			-- ENABLE SERVERS
			-- =====================

			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"tailwindcss",
				"stylelint_lsp",
				"dockerls",
				"docker_compose_language_service",
				"html",
				"cssls",
				"eslint",
				"rust_analyzer",
				"terraformls",
				"clangd",
				"cmake",
			})

			-- =====================
			-- KEYMAPS
			-- =====================

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
			vim.keymap.set("n", "gr", vim.lsp.buf.references)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
		end,
	},
}
