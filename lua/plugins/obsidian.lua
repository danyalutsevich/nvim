local workspace_name = "life"
local vault_path = "/Users/danlutsevich/Library/Mobile Documents/iCloud~md~obsidian/Documents"
local normalized_vault_path = vim.fn.fnamemodify(vault_path, ":p")

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	init = function()
		local group = vim.api.nvim_create_augroup("ObsidianVaultCwd", { clear = true })
		vim.api.nvim_create_autocmd("DirChanged", {
			group = group,
			callback = function()
				local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
				if cwd ~= normalized_vault_path then
					vim.g.obsidian_prev_cwd = cwd
				end
			end,
		})
		-- Seed once for this session.
		if not vim.g.obsidian_prev_cwd or vim.g.obsidian_prev_cwd == "" then
			local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
			if cwd ~= normalized_vault_path then
				vim.g.obsidian_prev_cwd = cwd
			end
		end
	end,
	keys = {
		{
			"<leader>ov",
			function()
				local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
				if cwd ~= normalized_vault_path then
					vim.g.obsidian_prev_cwd = cwd
				end
				vim.cmd("ObsidianWorkspace " .. workspace_name)
				vim.cmd("tcd " .. vim.fn.fnameescape(vault_path))
				local ok, api = pcall(require, "nvim-tree.api")
				if ok then
					api.tree.open()
					api.tree.change_root(vault_path)
					api.tree.focus()
				else
					vim.cmd("NvimTreeOpen " .. vim.fn.fnameescape(vault_path))
					vim.cmd("NvimTreeFocus")
				end
			end,
			desc = "Obsidian: open vault",
		},
		{
			"<leader>ob",
			function()
				local prev = vim.g.obsidian_prev_cwd
				if prev and prev ~= "" then
					vim.cmd("tcd " .. vim.fn.fnameescape(prev))
					local ok, api = pcall(require, "nvim-tree.api")
					if ok then
						api.tree.open()
						api.tree.change_root(prev)
						api.tree.focus()
					end
				else
					vim.notify("No previous directory saved. Use <leader>ov first.", vim.log.levels.WARN)
				end
			end,
			desc = "Obsidian: back to previous dir",
		},
	},
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = workspace_name,
				path = vault_path,
			},
		},

		-- see below for full list of options 👇
	},
}
