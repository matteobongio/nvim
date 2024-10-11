return {
  "ThePrimeagen/harpoon",
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  lazy = true,
  keys = {
    -- from the quickmenu, open a file in: a vertical split with control+v, a horizontal split with control+x, a new tab with control+t
    { "<leader><S-h>m", function() require("harpoon.ui").toggle_quick_menu() end, mode = "n", desc = "Harpoon Quick Menu" },

    { "<leader><S-h>a", function() require("harpoon.mark").add_file() end, mode = "n", desc = "Harpoon add file" }
  }
}
