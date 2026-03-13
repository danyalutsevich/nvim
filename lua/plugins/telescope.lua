return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	config = function()
		local builtin = require("telescope.builtin")
		require("telescope").setup({
			extensions = {
				fzf = {},
			},
			defaults = {
				-- file_ignore_patterns = { "node_modules", ".git/" },
				initial_mode = "normal",
			},

			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})
		require("telescope").load_extension("fzf")

		vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume" })
		vim.keymap.set("n", "<leader>gg", builtin.grep_string, { desc = "Grep string" })

		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
		vim.keymap.set("n", "<leader>gh", builtin.git_bcommits, { desc = "Git buffer commits" })

		vim.keymap.set("n", "<leader>fs", builtin.symbols, { desc = "Find symbols" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "Colorscheme" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Old files" })
		vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Marks" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })
	end,
}
