--[[

Neovim init file
Maintainer: Derek

--]]

if vim.g.vscode then
-- VSCode extension
else
	-- Import Lua Modules
	require("core.autocmds")
	require("core.keymaps")
	require("core.lazy")
	require("core.colorscheme")
	require("core.statusline")
	require("core.options")
	require("lsp.lspconfig")
	require("plugins.nvim-tree")
	require("plugins.indent-blankline")
	require("plugins.nvim-cmp")
	require("plugins.nvim-treesitter")
	require("plugins.alpha-nvim")
	require("plugins.telescope")
end
