return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 35,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			modified = {
				enable = true,
			},
			renderer = {
				group_empty = false,
				icons = {
					show = {
						modified = true,
					},
				},
			},
			update_focused_file = {
				enable = true,
			},
			git = { enable = true },
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		})
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})
	end,
}
