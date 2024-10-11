return {
  'jbyuki/nabla.nvim',
  lazy = true,
  keys = {

    { "<leader>np", function() require('nabla').popup() end, mode = "n", desc = "Nabla Popup" },
    {
      "<leader>ne",
      function()
        require "nabla".enable_virt({
          autogen = true, -- auto-regenerate ASCII art when exiting insert mode
          silent = true, -- silents error messages
        })
      end,
      mode = "n",
      desc = "Nabla enable"
    },
    { "<leader>nd", function() require('nabla').disable_virt() end, mode = "n", desc = "Nabla disable" },
  }
}
