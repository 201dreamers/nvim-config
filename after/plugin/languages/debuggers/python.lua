local mason_ok, mason_registry = pcall(require, "mason-registry")
local dap_python_ok, dap_python = pcall(require, "dap-python")
if not (mason_ok and dap_python_ok) then
	return
end

local debugpy = mason_registry.get_package("debugpy") -- note that this will error if you provide a non-existent package name
local debugpy_python_path = debugpy:get_install_path() .. "/venv/bin/python"

dap_python.setup(debugpy_python_path)
