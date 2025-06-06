return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-h>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
    },
    view_options = {
      show_hidden = true
    },
  },
  keys = {
    { "<leader>f", "<CMD>Oil<CR>", desc = "File Explorer" },
  },
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
