local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "maaz.lsp.mason"
require("maaz.lsp.handlers").setup()
require "maaz.lsp.null-ls"
