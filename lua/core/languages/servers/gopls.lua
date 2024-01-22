local lspconfig = require("lspconfig")

local opts = {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

return function()
	lspconfig.gopls.setup(opts)
end
