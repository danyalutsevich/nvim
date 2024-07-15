return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		function tprint(tbl, indent)
			if not indent then
				indent = 0
			end
			for k, v in pairs(tbl) do
				formatting = string.rep("  ", indent) .. k .. ": "
				if type(v) == "table" then
					print(formatting)
					tprint(v, indent + 1)
				elseif type(v) == "boolean" then
					print(formatting .. tostring(v))
				else
					print(formatting .. v)
				end
			end
		end

		-- tprint({"a", "b", "c",v={"f"}})
		-- tprint(require("null-ls"))
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,
			},
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
