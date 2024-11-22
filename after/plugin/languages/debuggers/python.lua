local dap_ok, dap = pcall(require, "dap")
local dap_python_ok, dap_python = pcall(require, "dap-python")
if not (dap_ok and dap_python_ok) then
    return
end

-- local debugpy_python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
-- dap_python.test_runner = "pytest"
-- dap_python.setup(debugpy_python_path)

local function get_python_path()
    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    local cwd = vim.fn.getcwd()
    local venv = os.getenv("VIRTUAL_ENV")
    if not venv then
        venv = cwd .. "/venv"
    end

    local possible_paths = {
        venv .. "/bin/python",
        cwd .. "/.venv/bin/python",
    }

    for _, path in ipairs(possible_paths) do
        if vim.fn.executable(path) == 1 then
            return path
        end
    end

    return "/usr/bin/python"
end

dap_python.setup(get_python_path())

dap.configurations.python = {
    {
        type = "python",
        request = "attach",
        name = "debugpy",
        justMyCode = false,
        connect = {
            host = "127.0.0.1",
            port = 5678,
        },
        python = get_python_path,
    },
}
