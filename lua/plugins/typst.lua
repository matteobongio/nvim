return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  build = function() require 'typst-preview'.update() end,
  keys = {
    { "<leader>tp", "<cmd>TypstPreview<cr>" }
  }
}
