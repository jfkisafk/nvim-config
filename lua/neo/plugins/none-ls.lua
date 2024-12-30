return {
  "nvimtools/none-ls.nvim",
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.ktlint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.revive,
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.diagnostics.spectral,
        null_ls.builtins.diagnostics.staticcheck,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.tfsec,
        null_ls.builtins.diagnostics.vacuum,
        null_ls.builtins.diagnostics.yamllint,

        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format this file" })
  end,
}
