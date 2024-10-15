return {
  "xiyaowong/transparent.nvim",
  config = function()
    require('transparent').clear_prefix('GitSigns')
  end,
  keys = { { "<leader>tt", "<cmd>TransparentToggle<CR>", desc = "[T]ransparent [T]oggle" } }
}
