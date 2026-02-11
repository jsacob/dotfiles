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

-- Plugins
require("lazy").setup({
    { "folke/tokyonight.nvim" },
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp"},
    { "L3MON4D3/LuaSnip"}
})

require("lsp")

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

