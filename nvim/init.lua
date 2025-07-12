require("config.lazy")
require('lualine').setup()

vim.wo.number = true
-- vim.wo.relativenumber = true


-- Open Neotree on 'n'
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
