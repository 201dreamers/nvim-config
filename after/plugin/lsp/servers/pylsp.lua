require("lspconfig").pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true,
                    indentWidth = 4,
                    lineLength = 120,
                    severities = {
                        F401 = "W",
                        F403 = "W",
                        F405 = "W",
                        F541 = "W",
                        F811 = "W",
                        F841 = "W",
                    },
                },
                pycodestyle = {
                    maxLineLength = 120,
                    indentSize = 4,
                },
            },
        },
    },
})
