return {
  "nvim-neorg/neorg",
  lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = true,
  keys = {
    -- neorg
    { "<leader>nct", "<cmd>Neorg toggle-concealer<CR>",                                  desc = "Neorg concealer" },

    -- ( "<leader>ncs0", "<cmd>set conceallevel=0<CR>", { desc = "Neorg concealer level set 0" })
    --
    -- ( "<leader>ncs1", "<cmd>set conceallevel=1<CR>", { desc = "Neorg concealer level set 1" })
    --
    -- ( "<leader>ncs2", "<cmd>set conceallevel=2<CR>", { desc = "Neorg concealer level set 1" })

    { "<leader>ntt", "<cmd>Neorg tangle current-file<CR>",                               desc = "Neorg Tangle" },

    { "<leader>nC",  "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>", desc = "Neorg open Code block" },

    { "<leader>ns",  "<cmd>Neorg generate-workspace-summary<CR>",                        desc = "Neorg generate workspace Summary" },

    { "<leader>nmi", "<cmd>Neorg inject-metadata<CR>",                                   desc = "Neorg metadata inject" },

    { "<leader>nmu", "<cmd>Neorg update-metadata<CR>",                                   desc = "Neorg metadata update" },

    { "<leader>ntf", "<cmd>Telescope neorg insert_file_link<CR>",                        desc = "Neorg telescope insert file link" },

    { "<leader>ntl", "<cmd>Telescope neorg insert_link<CR>",                             desc = "Neorg telescope insert link" },
    { "<leader>nth", "<cmd>Telescope neorg search_headings<CR>",                         desc = "Neorg telescope search Headings" },

  },
}
