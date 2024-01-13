local dap_ok, dap = pcall(require, "dap")
local dapui_ok, dapui = pcall(require, "dapui")
if not (dap_ok and dapui_ok) then
	return
end


-- -----
-- Setup
-- -----
dapui.setup()
dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close

-- --------
-- Mappings
-- --------
local map = vim.keymap.set

map("n", "<leader>db", ":DapToggleBreakpoint<cr>", { desc = "breakpoint" })
map("n", "<leader>dc", ":DapContinue<cr>", { desc = "continue/attach" })
map("n", "<leader>dn", ":DapStepOver<cr>", { desc = "next" })
map("n", "<leader>du", ":DapStepOut<cr>", { desc = "up" })
map("n", "<leader>dd", ":DapStepInto<cr>", { desc = "down" })
map("n", "<leader>dt", ":DapTerminate<cr>", { desc = "terminate" })
