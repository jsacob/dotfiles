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

-- Settings
    vim.opt.expandtab = true
    vim.opt.clipboard="unnamedplus"
    vim.opt.tabstop=4
    vim.opt.softtabstop=4
    vim.opt.shiftwidth=4

    vim.opt.number=true
    vim.opt.relativenumber=true
    vim.opt.termguicolors=true

-- Plugins
require("lazy").setup({
    { "folke/tokyonight.nvim" },
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp"},
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "L3MON4D3/LuaSnip"},
    { "nvim-telescope/telescope.nvim" },
})

-- Lsp call and such 
pcall(require, "lsp")

-- Theme
require("tokyonight").setup({
    transparent = true,
    styles = {
        sidebars = "transparent",
	floats = "transparent"
	},
})
vim.cmd("colorscheme tokyonight")

-- Keybinds
vim.g.mapleader = " "

local key = vim.keymap.set
key('n', '<leader>w', ':write<CR>')
key('n', '<leader>q', ':quit<CR>')
key('n', '<leader>`', ':terminal<CR>')
key('n', '<leader>so', ':source<CR>')
-- Telescope 

local builtin = require('telescope.builtin')
key('n', '<leader>ff', builtin.find_files, { desc = 'Telescope switch buffers' })
key('n', '<leader>lg', builtin.live_grep, { desc = 'Telescope live grep' })
key('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope git commits' })
key('n', '<leader>jl', builtin.jumplist, { desc = 'jumping to prev folders and such' })
key('n', '<leader>h', builtin.help_tags, { desc = 'help files' })



