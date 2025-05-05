-- when switching, remember to set lualine theme
local tokyo = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
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
    dark_variant = "moon",
    styles = {
      transparency = true
    }
  },
  config = function()
    vim.cmd.colorscheme 'rose-pine'
  end,
}

local gruv = {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require('gruvbox').setup({
      contrast = "hard",
      overrides = {
        SignColumn = { bg = "#1d2021" }
      }
    })
    vim.cmd.colorscheme 'gruvbox'
  end,
}

local kanagawa = {
  "rebelot/kanagawa.nvim",
  config = function()
    vim.cmd.colorscheme 'kanagawa'
  end,
}

local cyberdream = {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  config = function()
    vim.o.background = 'dark'
    require('cyberdream').setup({
      transparent = true,
      saturation = 0.7,
    })
    vim.cmd.colorscheme 'cyberdream'
  end,
  priority = 1000,
}

return cyberdream
