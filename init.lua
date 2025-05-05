--[[
=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/


  And then you can explore or search through `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

--]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Put anything you want to happen only in Neovide here
if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.8
  vim.g.neovide_transparency = 0.8
  vim.o.guifont = "FiraCode Nerd Font Mono"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0.1
end
-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  -- 'tpope/vim-fugitive',
  -- 'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {
          text = {
            spinner = "moon"
          }
        }
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
      end,
    },
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto', -- 'gruvbox_dark', -- 'rose-pine', -- 'tokyonight',
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          {
            function()
              return ''
            end,
            separator = ''
          },
          {
            'mode',
            separator = { left = "", right = " " }
          }
        },
      }
    },
    --  default = { left = "", right = " " },
    -- round = { left = "", right = "" },
    -- block = { left = "█", right = "█" },
    -- arrow = { left = "", right = "" },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = "ibl",
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      {
        'jonarrien/telescope-cmdline.nvim',
        config = function()
          require("telescope").load_extension('cmdline')
        end
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
          require("telescope").load_extension('frecency')
        end,
      },
      {
        'zane-/cder.nvim',
        config = function()
          require('telescope').load_extension('cder')
        end

      },
      {
        'andrew-george/telescope-themes',
        config = function()
          require('telescope').load_extension('themes')
        end

      }

    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    event = "VeryLazy",
    build = ':TSUpdate',
  },

  -- color parenthesis
  {
    "HiPhish/rainbow-delimiters.nvim",
  },

  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  { import = 'plugins' },
  { import = 'plugins.ADHD' },
  { import = 'plugins.DAP' },
  -- { import = 'plugins.OTHER' },
}, {})



-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bibtex', 'latex' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    highlight = {
      enable = true,
      disable = { 'latex' },
    },

    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)


-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- nmap('<leader>z', vim.diagnostic.config({virtual_text=false}), 'Lsp shut up')

  vim.lsp.inlay_hint.enable(true)
  -- print(vim.lsp.inlay_hint.is_enabled())
  -- nmap('<leader>ch' ,vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()), 'toggle inline hints')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

vim.g.LSP_on_attach = on_attach

-- document existing key chains
-- require('which-key').register({
--   ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
--   ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
--   ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
--   ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
--   ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
--   ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
--   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
--   ['<leader>n'] = { name = 'Neorg/Nabla', _ = 'which_key_ignore' },
--   ['<leader>nt'] = { name = 'Telescope', _ = 'which_key_ignore' },
--   ['<leader>nm'] = { name = 'Metadata', _ = 'which_key_ignore' },
--   ['<leader>nc'] = { name = 'Soncealer', _ = 'which_key_ignore' },
--   ['<leader>ncs'] = { name = 'Set', _ = 'which_key_ignore' },
-- })

require('which-key').add({
  { "<leader>c",    group = "[C]ode" },
  { "<leader>c_",   hidden = true },
  { "<leader>d",    group = "[D]ocument" },
  { "<leader>d_",   hidden = true },
  { "<leader>g",    group = "[G]it" },
  { "<leader>g_",   hidden = true },
  { "<leader>h",    group = "More git" },
  { "<leader>h_",   hidden = true },
  { "<leader>n",    group = "Neorg/Nabla" },
  { "<leader>n_",   hidden = true },
  { "<leader>nc",   group = "Soncealer" },
  { "<leader>nc_",  hidden = true },
  { "<leader>ncs",  group = "Set" },
  { "<leader>ncs_", hidden = true },
  { "<leader>nm",   group = "Metadata" },
  { "<leader>nm_",  hidden = true },
  { "<leader>nt",   group = "Telescope" },
  { "<leader>nt_",  hidden = true },
  { "<leader>r",    group = "[R]ename" },
  { "<leader>r_",   hidden = true },
  { "<leader>s",    group = "[S]earch" },
  { "<leader>s_",   hidden = true },
  { "<leader>w",    group = "[W]orkspace" },
  { "<leader>w_",   hidden = true },
})

-- TODO: Double Check!!
--
-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()



----- computer graphics
local function get_jar_files()
  local jar_dir = vim.fn.getcwd() .. "/jars"
  local jars = vim.fn.glob(jar_dir .. "/*.jar", true, true)
  return jars
end
-----


-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  tinymist = {},
  nil_ls = {},
  jdtls = {

    java = {
      project = {
        referencedLibraries = get_jar_files(),   -- Dynamically include jars
      },
    },

  },
  zls = {},
  bashls = {},
  clangd = {},
  gopls = {},
  rust_analyzer = {},
  basedpyright = {},
  -- pyright = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  -- ts_ls = {},
  --   init_options = {
  --     plugins = {
  --       {
  --         name = "@vue/typescript-plugin",
  --         location = "./node_modules/@vue/typescript-plugin",
  --         languages = { "javascript", "typescript", "vue" },
  --       },
  --     },
  --   },
  --   filetypes = {
  --     "javascript",
  --     "typescript",
  --     "vue",
  --   },
  -- },
  -- volar = {
  --   -- add filetypes for typescript, javascript and vue
  --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  --   init_options = {
  --     vue = {
  --       -- disable hybrid mode
  --       hybridMode = false,
  --     },
  --     typescript = {
  --       -- TODO: fix this BS
  --       tsdk = "/nix/store/g6ns6m42fvybfzb2xjppcsfmb6k0jv5x-typescript-5.6.3/lib/node_modules/typescript/lib/"
  --     }
  --   },
  -- },
}

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.py" }, command = ":lua vim.diagnostic.config({virtual_text=false})" }
)

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

-- Get system information
local system_name = vim.loop.os_uname().sysname

if system_name == 'Linux' then
  local file = io.open('/etc/os-release', 'r')
  if file then
    local content = file:read '*all'
    file:close()
    if string.find(content, 'ID=nixos') then
      vim.g.system_id = 'nixos'
    end
  end
end

if vim.g.system_id == 'nixos' then
  local ensure_installed = vim.tbl_keys(servers)
  for _, server_name in pairs(ensure_installed) do
    if server_name ~= "rust_analyzer" or server_name ~= "haskel_language_server" then --rustaceanvim
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
        init_options = (servers[server_name] or {}).init_options,
      }
    end
  end
else
  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'
  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }
  mason_lspconfig.setup_handlers {
    function(server_name)
      if server_name ~= "rust_analyzer" or server_name ~= "haskel_language_server" then
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    end
  }
end


require("config")
require("remaps")
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
