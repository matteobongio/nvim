-- when switching, remember to set lualine theme
local tokyo = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    vim.cmd.colorscheme 'tokyonight-moon'
  end
}

local onedark = {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'onedark'
  end,
}
local catp = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-macchiato'
  end,
}

return catp
