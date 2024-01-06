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

-- lualine theme = 'dracula-nvim'
local dracula = {
  "Mofiqul/dracula.nvim",
  -- name = "dracula",
  -- priority = 1000,
  config = function()
    vim.cmd.colorscheme 'dracula'
  end,
}

local rosepine = {
  "rose-pine/neovim",
  opts = {
    name = "rose-pine",
    -- priority = 1000,
    variant = 'moon',
  },
  config = function()
    vim.cmd.colorscheme 'rose-pine'
  end,
}
return tokyo
