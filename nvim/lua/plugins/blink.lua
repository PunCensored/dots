return {
{
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  -- use a release tag to download pre-built binaries
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    appearance = {
	nerd_font_variant = 'mono'
    },

     completion = { documentation = { auto_show = false } },

 }
 }
 }
