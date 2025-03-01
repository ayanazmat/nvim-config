return {
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
      },
    })

    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
  end,
}
