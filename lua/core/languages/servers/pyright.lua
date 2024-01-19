local lspconfig = require("lspconfig")

local opts = {
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				-- diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
}

return function()
	lspconfig.pyright.setup(opts)
end
