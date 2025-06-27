local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.formatting.clang_format.with({
      filetypes = {"c", "cpp", "cs"},
    }),

    null_ls.builtins.formatting.black.with({
      filetypes = {"python"},
    }),

    null_ls.builtins.diagnostics.mypy.with({
      filetypes = {"python"},
    }),

    null_ls.builtins.formatting.biome.with({
      filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc", "css"},
    }),

    null_ls.builtins.diagnostics.tidy.with({
      filetypes = {"html", "xml"},
    }),
    null_ls.builtins.formatting.htmlbeautifier.with({
      filetypes = {"html"},
    }),

  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = augroup,
      --   buffer = bufnr,
      --   callback = function ()
      --     vim.lsp.buf.format({ bufnr = bufnr})
      --   end,
      -- })
    end
  end,
}
return opts
