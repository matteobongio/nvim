return {
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    plugins = {
      twilight = { enabled = false },
      kitty = {
        enabled = true,
        font = "+4", -- font size increment
      },
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function(win)
      vim.o.conceallevel = 0;
      vim.o.wrap = false;
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
    end,

  }
}
