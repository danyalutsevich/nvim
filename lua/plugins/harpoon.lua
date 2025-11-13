return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- Basic configuration
		harpoon.setup({
			menu = {
				width = 80,
			},
		})

		-- Simple keybindings
		-- Mark current file for quick access
		vim.keymap.set("n", "<leader>hm", function()
			harpoon:list():append()
			vim.notify("File marked with Harpoon", vim.log.levels.INFO, { title = "Harpoon" })
		end, { desc = "Mark file" })

		-- Open the quick menu
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon menu" })

		-- Quickly jump to first, second, third, fourth marked file
		vim.keymap.set("n", "<leader>h1", function()
			harpoon:list():select(1)
		end, { desc = "Jump to file 1" })

		vim.keymap.set("n", "<leader>h2", function()
			harpoon:list():select(2)
		end, { desc = "Jump to file 2" })

		vim.keymap.set("n", "<leader>h3", function()
			harpoon:list():select(3)
		end, { desc = "Jump to file 3" })

		vim.keymap.set("n", "<leader>h4", function()
			harpoon:list():select(4)
		end, { desc = "Jump to file 4" })

		-- Navigate through marked files
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Next marked file" })

		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Previous marked file" })
	end,
}

