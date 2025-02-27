local is_ok, mason = pcall(require, "mason")
if not is_ok then
	return
end

local lspconfig
is_ok, lspconfig = pcall(require, "mason-lspconfig")
if not is_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

lspconfig.setup({
	ensured_installed = {
		"gopls",
		"graphql",
		"groovyls",
		"html",
		"cssls",
		"jdtls",
		"eslint",
		"pylsp",
		"lua_ls",
		"rust_analyzer",
		"tl_ls",
	},
})
