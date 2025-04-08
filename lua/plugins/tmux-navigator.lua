return {
	"christoomey/vim-tmux-navigator",
	config = function()
		vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>")
		vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>")
		-- vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>")
		-- vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>")

		-- Custom mappings for left/right with nvim-tree
		vim.keymap.set("n", "<C-h>", function()
			-- vim.cmd("NvimTreeOpen")
			vim.cmd("TmuxNavigateLeft")
		end)

		vim.keymap.set("n", "<C-l>", function()
			-- vim.cmd("NvimTreeClose")
			vim.cmd("TmuxNavigateRight")
		end)
	end,
}
