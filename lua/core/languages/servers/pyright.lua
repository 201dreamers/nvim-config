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
	lspconfig.pylsp.setup(opts)
end
