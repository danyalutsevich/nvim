-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"

-- Disable swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- UI
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamed"

-- Misc
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Better search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.keymap.set("n", "<leader>f", ":lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "tt", ":TailwindFoldToggle<CR>")

-- Plugin management
require("config.lazy")
require("config.buffer-queue")

-- Colorscheme
vim.cmd([[colorscheme vscode]])

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Folding
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.opt.foldenable = true

-- Better navigation
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- vim.keymap.set('n','<c-k>',':wincmd k<CR>')
-- vim.keymap.set('n','<c-j>',':wincmd j<CR>')
-- vim.keymap.set('n','<c-h>',':wincmd h<CR>')
-- vim.keymap.set('n','<c-l>',':wincmd l<CR>')
