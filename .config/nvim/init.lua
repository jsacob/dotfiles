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
    { "L3MON4D3/LuaSnip"}
})

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

