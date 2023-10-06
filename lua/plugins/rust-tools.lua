return {
  "simrat39/rust-tools.nvim",
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'nvim-lua/plenary.nvim'
  },
  opts = {
    server = {
      -- capabilities = vim.lsp.protocol.make_client_capabilities(),
      on_attach = function(_, bufnr)
        local rt = require("rust-tools")
        local wk = require("which-key")
        -- Hover actions
        vim.keymap.set("n", "<leader>zh", rt.hover_actions.hover_actions,
          { desc = "Rust Hover actions", buffer = bufnr })
        vim.keymap.set("n", "<leader>zc", function()
          rt.open_cargo_toml.open_cargo_toml()
        end, { desc = "Rust open [C]argo.toml" })
        -- Code action groups
        -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        wk.register({
          ['<leader>z'] = { name = 'Rust Tools', _ = 'which_key_ignore' }
        })
      end,
    },
  }
}
