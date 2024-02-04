local lspconfig = require("lspconfig")

local opts = {
    settings = {
        pylsp = {
            plugins = {
                rope = {
                    enabled = false,
                },
                pyflakes = {
                    enabled = false,
                },
                mccabe = {
                    enabled = false,
                },
                pycodestyle = {
                    enabled = false,
                },
                pydocstyle = {
                    enabled = false,
                },
                autopep8 = {
                    enabled = false,
                },
                yapf = {
                    enabled = false,
                },
                flake8 = {
                    enabled = false,
                },
                pylint = {
                    enabled = false,
                },
            },
        },
    },
}

return function()
    lspconfig.pylsp.setup(opts)
end
