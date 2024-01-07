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
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end
            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
          end
          local wk = require("which-key")
          local rt = require("rust-tools")
          -- Hover actions
          -- vim.keymap.set("n", "<leader>zc", function()
          --   rt.open_cargo_toml.open_cargo_toml()
          -- end, { desc = "Rust open [C]argo.toml" })
          -- Code action groups
          -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          
          nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
          nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          
          -- See `:help K` for why this keymap
          nmap('K', rt.hover_actions, 'Hover Actions')
          nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
          
          -- Lesser used LSP functionality
          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          wk.register({
            ['<leader>z'] = { name = 'Rust Tools', _ = 'which_key_ignore' }
          })
      end,
    },
  }
}
