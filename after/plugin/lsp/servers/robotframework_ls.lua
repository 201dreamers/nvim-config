local main_repo = vim.fn.getcwd()
local python_executable = "/home/dhakman/SleepNumber/venv/bin/python3.10"

require("lspconfig").robotframework_ls.setup({
    config = {
        filetypes = { "robot", "resource" },
    },
    settings = {
        robot = {
            python = {
                executable = python_executable,
                env = {
                    CONNECTION = "BOSON",
                    PUMP = "dmytro-skuc-fuzion",
                },
            },
            language_server = {
                python = python_executable,
            },
            some_non_existing_option = "empty",
            pythonpath = {
                main_repo,
                main_repo .. "/tests/lib",
                main_repo .. "/device/fuzion",
                main_repo .. "/tests/lib/device/bamkeys",
                main_repo .. "/tests/lib/device/rf_fuzion",
                main_repo .. "/tools/secrets",
                main_repo .. "/tools",
            },
            libraries = {
                libdoc = {
                    needsArgs = {
                        "rf_fuzion_library_factory.RFFuzionLibraryFactory",
                    },
                },
            },
            lint = {
                undefinedLibraries = true,
                robocop = {
                    enabled = true,
                },
            },
            loadVariablesFromArgumentsFile = main_repo .. "/argumentfile.txt",
        },
    },
})
