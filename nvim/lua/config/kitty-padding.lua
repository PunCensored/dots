-- Only act when running inside kitty
if not vim.env.KITTY_WINDOW_ID then
  return
end

local function kitty_padding(value)
  vim.fn.system({
    "kitty", "@", "set-spacing",
    "--match", "id:" .. vim.env.KITTY_WINDOW_ID,
    "padding=" .. value,
  })
end

local group = vim.api.nvim_create_augroup("KittyPadding", { clear = true })

vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  group = group,
  callback = function() kitty_padding("0") end,
})

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  group = group,
  callback = function() kitty_padding("default") end,
})
