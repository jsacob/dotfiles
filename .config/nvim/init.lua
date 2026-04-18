vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =========================
-- General Settings
-- =========================
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Nice UI improvements
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- Leader key
vim.g.mapleader = " "

-- =========================
-- Plugins
-- =========================
require("lazy").setup({

  -- Theme
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight-storm")
    end,
  },

  -- Alternative theme (optional)
  { "folke/tokyonight.nvim" },

  -- File Tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Discord Presence
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup()
    end,
  },

  -- TreeSitter
  {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- Use the legacy branch
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      -- ... your other old config
    })
  end,
},

  -- lazygit
  {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
},

  -- LSP
  { "mason-org/mason.nvim" },
  { "mason-org/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "L3MON4D3/LuaSnip" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },

  -- terminal
  {'akinsho/toggleterm.nvim', version = "*", config = true}

})

-- =========================
-- External Configs
-- =========================
pcall(require, "lsp")

-- =========================
-- Keybinds
-- =========================
local key = vim.keymap.set

key('n', '<leader>w', ':write<CR>')
key('n', '<leader>q', ':quit<CR>')
key('n', '<leader>`', ':terminal<CR>')
key('n', '<leader>so', ':source<CR>')

key('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover Information" })

-- Telescope
local builtin = require('telescope.builtin')
key('n', '<leader><CR>', ":Telescope<CR>", { desc = 'Telescope' })
key('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
key('n', '<leader>lg', builtin.live_grep, { desc = 'Live grep' })
key('n', '<leader>jl', builtin.jumplist, { desc = 'Jumplist' })
key('n', '<leader>h', builtin.help_tags, { desc = 'Help tags' })

-- File tree toggle
key('n', '<leader>b', ':NvimTreeToggle<CR>')

-- Term
key('n', '<leader>t', ':ToggleTerm<CR>')
