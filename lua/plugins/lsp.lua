return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "ts_ls",
          "clojure_lsp",
        },
      })
    end,
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
          "goimports",
          "prettier",
          "cljfmt",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.gleam.setup({})
      lspconfig.clojure_lsp.setup({})

      -- :h vim.lsp.buf
      -- useful command to see all the lsp options we have ^
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end
        end,
        sources = {
          -- lua
          null_ls.builtins.formatting.stylua,

          -- ruby
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.formatting.rubocop,

          -- golang
          null_ls.builtins.diagnostics.golangci_lint,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.goimports,

          -- js/ts
          null_ls.builtins.formatting.prettierd,

          -- clojure
          null_ls.builtins.formatting.cljfmt,
        },
      })

      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
    end,
  },
}
