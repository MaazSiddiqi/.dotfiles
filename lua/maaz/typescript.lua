local opts = {
	on_attach = require("maaz.lsp.handlers").on_attach,
	capabilities = require("maaz.lsp.handlers").capabilities,
}
local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings.tsserver")
if has_custom_opts then
	opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
end

require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = opts,
})
