local dap_ok, dap = pcall(require, "dap")
local dapui_ok, dapui = pcall(require, "dapui")
if not (dap_ok and dapui_ok) then
	return
end

-- -----
-- Setup
-- -----
dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close

-- --------
-- Mappings
-- --------
local map = vim.keymap.set

map("n", "<leader>db", ":DapToggleBreakpoing<cr>", { desc = "toggle breakpoint" })
