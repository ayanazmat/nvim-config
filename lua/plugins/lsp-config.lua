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
          "gopls",
          "ts_ls"
        }
      })
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        -- allows ensuring linters are installed
        ensure_installed = {
          "stylua",
          "rubocop",
          "golangci-lint",
          "eslint_d"
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
      lspconfig.ts_ls.setup({})
      lspconfig.gopls.setup({
        settings = {
          gopls = {
          }
        }
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
