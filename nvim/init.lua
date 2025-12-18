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
vim.keymap.set('n', '<leader><BS>',':quit<CR>')
vim.keymap.set('n', '<leader><leader>',':write<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>y','"+y<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>d','"+d<CR>')

vim.keymap.set('n', '<leader>s,',':vsplit<CR>')
vim.keymap.set('n', '<leader>sh',':split<CR>')

vim.keymap.set('n', '<leader>b',':bprevious<CR>')

vim.keymap.set('n', '<leader>rn',':wincmd h<CR>')
vim.keymap.set('n', '<leader>re',':wincmd j<CR>')
vim.keymap.set('n', '<leader>ri',':wincmd k<CR>')
vim.keymap.set('n', '<leader>ro',':wincmd l<CR>')
vim.keymap.set('n', '<leader>rp',':wincmd p<CR>')
vim.keymap.set('n', '<leader>we', '<cmd>resize +2<CR>')
vim.keymap.set('n', '<leader>wi', '<cmd>resize -2<CR>')
vim.keymap.set('n', '<leader>wn', '<cmd>vertical resize +5<CR>')
vim.keymap.set('n', '<leader>wo', '<cmd>vertical resize -5<CR>')
vim.keymap.set('n', '<leader>h', ':help ')
-- plugin keymaps
vim.keymap.set('n', '<leader>no',':Neotree<cr>')
vim.keymap.set('n', '<leader>nd',':Neotree close<cr>')
vim.keymap.set('n', '<leader>p',':Typstpreview<cr>')

require("config.lazy")
require('lualine').setup()

vim.lsp.enable({'luals', 'pyright', 'tinymist', 'js'})
vim.lsp.config("luals",
{ settings = {Lua = {workspace = { library = vim.api.nvim_get_runtime_file("", true)}}}})
