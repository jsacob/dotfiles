local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },

    -- Add the gruvbox plugin
    { "ellisonleao/gruvbox.nvim" },

    {
      "MunifTanjim/prettier.nvim",
      config = function()
        require("prettier").setup({
          bin = "prettier", -- or `prettierd` if you have it installed
          filetypes = {
            "javascript",
            "typescript",
            "css",
            "html",
            "json",
            "markdown",
            "cpp", -- C++ file type added
          },
        })
      end,
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "gruvbox", "tokyonight", "habamax" } }, -- Include gruvbox here
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Autocmd to format files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.css", "*.html", "*.json", "*.md", "*.cpp" }, -- C++ included
  callback = function()
    vim.cmd("Prettier")
  end,
})

-- Configure LazyVim to load gruvbox as the colorscheme
vim.cmd("colorscheme gruvbox") -- Set gruvbox as the active colorscheme
