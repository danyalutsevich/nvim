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
				group_empty = true,
				icons = {
					show = {
						modified = true,
					},
				},
			},
			filters = {
				dotfiles = false,
			},
		})
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})
	end,
}
