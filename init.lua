vim.opt.termguicolors = true
vim.opt.showmode = false
require("config.lazy")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard=unnamed")
vim.cmd([[colorscheme vscode]])

vim.keymap.set("n", "<leader>f", ":lua vim.diagnostic.open_float()<CR>")
-- vim.keymap.set('n','<c-k>',':wincmd k<CR>')
-- vim.keymap.set('n','<c-j>',':wincmd j<CR>')
-- vim.keymap.set('n','<c-h>',':wincmd h<CR>')
-- vim.keymap.set('n','<c-l>',':wincmd l<CR>')
