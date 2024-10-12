-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find()
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>gt', '<cmd>Telescope cder<cr>', { desc = '[G]o [T]o' })

-- Telescope cmdline
vim.keymap.set('n', '<leader>:', '<cmd>Telescope cmdline<cr>', { desc = 'Cmdline' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })



local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("n", "<C-z>", "<CMD>Format<CR>", { desc = "Format Document" })

-- move highlighted Text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- make cursor stay put when appending from line below
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in the middle when half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep copy when replacing
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "replace without changing clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]], { desc = "delete without yank" })

-- keymap guide
vim.keymap.set("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "Telescope [K]eymaps" })

-- oil
vim.keymap.set("n", "<leader>f", "<CMD>Oil<CR>", { desc = "File Explorer" })

-- neorg
vim.keymap.set("n", "<leader>nct", "<cmd>Neorg toggle-concealer<CR>", { desc = "Neorg concealer" })

-- vim.keymap.set("n", "<leader>ncs0", "<cmd>set conceallevel=0<CR>", { desc = "Neorg concealer level set 0" })
--
-- vim.keymap.set("n", "<leader>ncs1", "<cmd>set conceallevel=1<CR>", { desc = "Neorg concealer level set 1" })
--
-- vim.keymap.set("n", "<leader>ncs2", "<cmd>set conceallevel=2<CR>", { desc = "Neorg concealer level set 1" })

vim.keymap.set("n", "<leader>ntt", "<cmd>Neorg tangle current-file<CR>", { desc = "Neorg Tangle" })

vim.keymap.set("n", "<leader>nC", "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>",
  { desc = "Neorg open Code block" })

vim.keymap.set("n", "<leader>ns", "<cmd>Neorg generate-workspace-summary<CR>", { desc = "Neorg generate workspace Summary" })

vim.keymap.set("n", "<leader>nmi", "<cmd>Neorg inject-metadata<CR>", { desc = "Neorg metadata inject" })

vim.keymap.set("n", "<leader>nmu", "<cmd>Neorg update-metadata<CR>", { desc = "Neorg metadata update" })

-- neorg -- telescope
vim.keymap.set("n", "<leader>ntf", "<cmd>Telescope neorg insert_file_link<CR>", { desc = "Neorg telescope insert file link" })

vim.keymap.set("n", "<leader>ntl", "<cmd>Telescope neorg insert_link<CR>", { desc = "Neorg telescope insert link" })

vim.keymap.set("n", "<leader>nth", "<cmd>Telescope neorg search_headings<CR>", { desc = "Neorg telescope search Headings" })

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
