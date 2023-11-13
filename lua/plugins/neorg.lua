return ({
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neorg/neorg-telescope",
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.export"] = {},    -- TODO: documentation missing on file types
        ["core.itero"] = {},     -- alt + Enter to make the next line also an interable line (e.g. lists)
        ["core.promo"] = {},     --
        ["core.summary"] = {},   --
        ["core.completion"] = {
          config = { engine = "nvim-cmp" },
          name = "[Neorg]"
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
        ["core.integrations.telescope"] = {},
      },
    })
    vim.o.conceallevel = 2
  end,
})
