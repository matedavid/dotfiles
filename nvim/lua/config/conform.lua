require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt", lsp_format = "fallback" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		objc = { "clang_format" },
		objcpp = { "clang_format" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
