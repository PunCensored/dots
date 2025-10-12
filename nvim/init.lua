-- Settings
vim.o.number = true
vim.o.relativenumber = true
vim.diagnostic.config({virtual_text = false, virtual_lines = {current_line = true} })
vim.opt.winborder = "none"
vim.o.swapfile = false
vim.o.wildmenu = true
vim.o.wildoptions = "pum"
-- Vanilla Keymaps
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>a',':quit<CR>')
vim.keymap.set('n', '<leader>w',':write<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>y','"+y<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>d','"+d<CR>')
-- Plugin Keymaps
vim.keymap.set('n', '<leader>nn',':Neotree<CR>')
vim.keymap.set('n', '<leader>nd',':Neotree close<CR>')

require("config.lazy")
require('lualine').setup()

vim.lsp.enable({'luals', 'pyright'})
vim.lsp.config("luals",
{ settings = {Lua = {workspace = { library = vim.api.nvim_get_runtime_file("", true)}}}})
