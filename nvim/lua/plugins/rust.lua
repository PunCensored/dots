return {
  {
    "mrcjkb/rustaceanvim",
    -- Check the README for the current major version and pin it, e.g. version = "^6"
    lazy = false, -- the plugin lazy-loads itself; don't lazy-load it again
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            local map = function(keys, fn, desc)
              vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "Rust: " .. desc })
            end

            -- rustaceanvim-specific commands
            map("<leader>ca", function() vim.cmd.RustLsp("codeAction") end, "Code action")
	    -- map("K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, "Hover actions")
            map("<leader>rr", function() vim.cmd.RustLsp("runnables") end, "Runnables")
            map("<leader>rt", function() vim.cmd.RustLsp("testables") end, "Testables")
            map("<leader>rd", function() vim.cmd.RustLsp("debuggables") end, "Debuggables")
            map("<leader>re", function() vim.cmd.RustLsp("explainError") end, "Explain error")
            map("<leader>rm", function() vim.cmd.RustLsp("expandMacro") end, "Expand macro")
            map("<leader>rc", function() vim.cmd.RustLsp("openCargo") end, "Open Cargo.toml")

            -- standard LSP maps (skip these if your config already sets them globally)
            --map("gd", vim.lsp.buf.definition, "Go to definition")
            --map("gr", vim.lsp.buf.references, "References")

            -- format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
            })
          end,
          default_settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              check = { command = "clippy" }, -- run clippy instead of cargo check
              procMacro = { enable = true },
            },
          },
        },
      }
    end,
  },

  -- Cargo.toml helpers: version hints, completion, upgrades
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {},
  },
}
