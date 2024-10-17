return {
  "xiyaowong/transparent.nvim",
  config = function()
    require('transparent').clear_prefix('GitSigns')
    require('transparent').clear_prefix('DiagnosticSign')
  end,
  lazy = false,
  keys = { { "<leader>tt", "<cmd>TransparentToggle<CR>", desc = "[T]ransparent [T]oggle" } }
}
