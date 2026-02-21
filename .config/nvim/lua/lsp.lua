-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "clangd", "ts_ls" },
  highlight = {
      enable = true,
  };
})


local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "lua_ls", "pyright", "clangd", "ts_ls" }

for _, server in ipairs(servers) do
    -- This is the Neovim 0.11+ way that stops the warning
    vim.lsp.config(server, {
        install = {
             -- This helps Mason and the native config play nice
             package = server
        },
        capabilities = capabilities,
    })
    vim.lsp.enable(server)
end
-- LuaSnip + prebuilt snippets
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load() -- loads friendly-snippets

-- nvim-cmp
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

    mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  vim.diagnostic.config({
    virtual_text = true,
  });

  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
  },
})

