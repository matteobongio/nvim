return ({
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neorg/neorg-telescope",
    -- "tamton-aquib/neorg-jupyter"
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.export"] = {},    -- TODO: documentation missing on file types
        -- ["core.qol.toc"] = {}, -- aerial does the same thing
        ["core.itero"] = {},     -- alt + Enter to make the next line also an interable line (e.g. lists)
        ["core.promo"] = {},     --
        ["core.summary"] = {},   --
        -- ["core.ui.calendar"] = {},    -- <leader>id to open
        ["core.completion"] = {
          config = { engine = "nvim-cmp" },
          name = "[Neorg]"
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              -- prog = "~/Documents/University/Programming Fundamentals/notes",
              -- comparch = "~/Documents/University/Computer Arch/notes"
            },
          },
        },
        ["core.integrations.telescope"] = {},
        -- ["external.jupyter"] = {} -- TODO: doesn't seem to work
      },
    })
    vim.o.conceallevel = 2
  end,
})
