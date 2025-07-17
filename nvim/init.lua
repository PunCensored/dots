require("config.lazy")
require('lualine').setup()

vim.wo.number = true
-- vim.wo.relativenumber = true

-- Set nvim.notify as default notification
vim.notify = require("notify")

-- Open Neotree on 'n'
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

vim.lsp.enable('pyrefly')

vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.config({ virtual_lines = { only_current_line = true } })]]
