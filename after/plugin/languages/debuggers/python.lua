local ok, dap_python = pcall(require, "dap-python")
if not ok then
	return
end

local debugpy_python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

dap_python.test_runner = "pytest"
dap_python.setup(debugpy_python_path)
