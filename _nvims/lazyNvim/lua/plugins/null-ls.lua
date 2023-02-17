-- TODO make it not overrite defaults
return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources, {
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.black,

      nls.builtins.diagnostics.eslint_d,

      nls.builtins.code_actions.eslint_d,
    })
  end,
}
