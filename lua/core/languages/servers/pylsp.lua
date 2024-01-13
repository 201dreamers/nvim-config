local lspconfig = require("lspconfig")

local opts = {
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    -- executable = "<path-to-ruff-bin>",  -- Custom path to ruff
                    -- path = "<path_to_custom_ruff_toml>",  -- Custom config for ruff to use
                    -- preview = false,  -- Whether to enable the preview style linting and formatting

                    lineLength = 120,
                    select = { "E", "F", "UP", "B", "SIM", "I" },
                    perFileIgnores = { ["__init__.py"] = "F401" },
                    targetVersion = "py311",
                    enabled = true,
                    indentWidth = 4,
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
}

return function()
    lspconfig.pylsp.setup(opts)
end
