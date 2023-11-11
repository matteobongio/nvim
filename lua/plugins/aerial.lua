return {
  'stevearc/aerial.nvim',
  opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    -- disable_max_lines = vim.g.max_file.lines,
    -- disable_max_size = vim.g.max_file.size,
    layout = { min_width = 28 },
    show_guides = true,
    filter_kind = false,
    guides = {
      mid_item = "├ ",
      last_item = "└ ",
      nested_top = "│ ",
      whitespace = "  ",
    },
    -- When true, don't load aerial until a command or function is called
    -- Defaults to true, unless `on_attach` is provided, then it defaults to false
    lazy_load = true,

    -- Disable aerial on files with this many lines
    disable_max_lines = 10000,

    -- Disable aerial on files this size or larger (in bytes)
    disable_max_size = 2000000, -- Default 2MB

    highlight_mode = "split_width",

    -- Highlight the closest symbol if the cursor is not exactly on one.
    highlight_closest = true,

    ignore = {
      -- Ignore unlisted buffers. See :help buflisted
      unlisted_buffers = false,

      -- List of filetypes to ignore.
      filetypes = {},

      -- Ignored buftypes.
      -- Can be one of the following:
      -- false or nil - No buftypes are ignored.
      -- "special"    - All buffers other than normal, help and man page buffers are ignored.
      -- table        - A list of buftypes to ignore. See :help buftype for the
      --                possible values.
      -- function     - A function that returns true if the buffer should be
      --                ignored or false if it should not be ignored.
      --                Takes two arguments, `bufnr` and `buftype`.
      buftypes = "special",

      -- Ignored wintypes.
      -- Can be one of the following:
      -- false or nil - No wintypes are ignored.
      -- "special"    - All windows other than normal windows are ignored.
      -- table        - A list of wintypes to ignore. See :help win_gettype() for the
      --                possible values.
      -- function     - A function that returns true if the window should be
      --                ignored or false if it should not be ignored.
      --                Takes two arguments, `winid` and `wintype`.
      wintypes = "special",
    },
    -- Use symbol tree for folding. Set to true or false to enable/disable
    -- Set to "auto" to manage folds if your previous foldmethod was 'manual'
    -- This can be a filetype map (see :help aerial-filetype-map)
    manage_folds = false,

    -- When you fold code with za, zo, or zc, update the aerial tree as well.
    -- Only works when manage_folds = true
    link_folds_to_tree = false,

    -- Fold code when you open/collapse symbols in the tree.
    -- Only works when manage_folds = true
    link_tree_to_folds = true,

    -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
    -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
    nerd_font = "auto",
  },
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
}
