return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    -- -- Snippet Engine & its associated nvim-cmp source
    -- {
    --   'L3MON4D3/LuaSnip',
    --   build = (function()
    --     -- Build Step is needed for regex support in snippets
    --     -- This step is not supported in many windows environments
    --     -- Remove the below condition to re-enable on windows
    --     if vim.fn.has 'win32' == 1 then
    --       return
    --     end
    --     return 'make install_jsregexp'
    --   end)(),
    -- },
    -- 'saadparwaiz1/cmp_luasnip',

    -- -- Adds LSP completion capabilities
    -- 'hrsh7th/cmp-nvim-lsp',
    -- 'hrsh7th/cmp-path',

    'rafamadriz/friendly-snippets',
  },

  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = { preset = 'default' },

    enabled = function()
      return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
          and vim.bo.buftype ~= "prompt"
          and vim.b.completion ~= false
    end,

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    completion = {
      -- Show documentation when selecting a completion item
      documentation = { auto_show = true, auto_show_delay_ms = 300 },

      -- Display a preview of the selected item on the current line
      ghost_text = { enabled = false },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    --   sources = {
    --     { name = 'nvim_lsp' },
    --     { name = 'luasnip' },
    --     { name = "neorg" },
    --     {
    --       name = 'path',
    --       option = {
    --         -- Options go into this table
    --         trailing_slash = true
    --       },
    --     },
    --   },
  },
  opts_extend = { "sources.default" }
}
-- -- [[ Configure nvim-cmp ]]
-- -- See `:help cmp`
-- local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
-- require('luasnip.loaders.from_vscode').lazy_load()
-- luasnip.config.setup {}
--
-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert {
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete {},
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_locally_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.locally_jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--     { name = "neorg" },
--     {
--       name = 'path',
--       option = {
--         -- Options go into this table
--         trailing_slash = true
--       },
--     },
--   },
--   experimental = { ghost_text = true },
-- }
