local mason_lspconfig = require("mason-lspconfig")

local servers = {
	"lua_ls",
	"clangd",
}

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- Common on_attach function to set keymaps when LSP attaches
local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }

	-- Hover / info
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	-- Go-to
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

	-- Diagnostics
	vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, opts)

	-- Code actions & rename
	vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)

	-- Formatting
	vim.keymap.set("n", "<Leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end

-- clangd
vim.lsp.config("clangd", {
    on_attach = on_attach,
    cmd = { "clangd", "--header-insertion=never" },
})
vim.lsp.enable("clangd")

-- rest of servers
for _, server in ipairs(servers) do
	if server ~= "clangd" then
		vim.lsp.config(server, {
			on_attach = on_attach,
		})

		vim.lsp.enable(server)
	end
end
