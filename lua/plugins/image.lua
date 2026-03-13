return {
	"3rd/image.nvim",
	config = function()
		local ok, image = pcall(require, "image")
		if not ok then
			vim.notify("image.nvim: failed to load", vim.log.levels.WARN)
			return
		end

		local setup_ok, err = pcall(image.setup, {
			backend = "kitty", -- or "ueberzug" or "sixel"
			processor = "magick_cli", -- or "magick_rock"
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					only_render_image_at_cursor_mode = "popup", -- or "inline"
					floating_windows = false, -- if true, images will be rendered in floating markdown windows
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
				asciidoc = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					only_render_image_at_cursor_mode = "popup",
					floating_windows = false,
					filetypes = { "asciidoc", "adoc" },
				},
				neorg = {
					enabled = true,
					filetypes = { "norg" },
				},
				rst = {
					enabled = true,
				},
				typst = {
					enabled = true,
					filetypes = { "typst" },
				},
				html = {
					enabled = false,
				},
				css = {
					enabled = false,
				},
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			scale_factor = 1.0,
			window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = {
				"cmp_menu",
				"cmp_docs",
				"snacks_notif",
				"scrollview",
				"scrollview_sign",
			},
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
		})
		if not setup_ok then
			vim.notify("image.nvim setup failed: " .. tostring(err), vim.log.levels.WARN)
		end
	end,
}
