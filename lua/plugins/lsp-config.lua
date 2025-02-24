return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- :h vim.lsp.buf
      -- useful command to see all the lsp options we have ^
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end
  }
}
