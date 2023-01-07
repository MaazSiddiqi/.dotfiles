return {
	default_config = {
		cmd = { "ls_emmet", "--stdio" },
		filetypes = {
			"html",
			"css",
			"scss",
			"javascriptreact",
			"typescriptreact",
			"haml",
			"xml",
			"xsl",
			"pug",
			"slim",
			"sass",
			"stylus",
			"less",
			"sss",
			"hbs",
			"handlebars",
		},
		root_dir = function(fname)
			return vim.loop.cwd()
		end,
		settings = {},
	},
}
