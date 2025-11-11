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

vim.keymap.set('n', '<leader>vs',':vsplit<CR>')
vim.keymap.set('n', '<leader>hs',':split<CR>')

vim.keymap.set('n', '<leader>b',':bprevious<CR>')

vim.keymap.set('n', '<leader>rn',':wincmd h')
vim.keymap.set('n', '<leader>re',':wincmd j')
vim.keymap.set('n', '<leader>ri',':wincmd k')
vim.keymap.set('n', '<leader>ro',':wincmd l')
vim.keymap.set('n', '<leader>rp',':wincmd p')
-- Plugin Keymaps
vim.keymap.set('n', '<leader>nn',':Neotree<CR>')
vim.keymap.set('n', '<leader>nd',':Neotree close<CR>')
vim.keymap.set('n', '<leader>p',':TypstPreview<CR>')

require("config.lazy")
require('lualine').setup()

vim.lsp.enable({'luals', 'pyright', 'tinymist'})
vim.lsp.config("luals",
{ settings = {Lua = {workspace = { library = vim.api.nvim_get_runtime_file("", true)}}}})
