local ok, wk = pcall(require, "which-key")
if not ok then
    return
end

wk.add({
    { "<leader>s", group = "search" },
    { "<leader>g", group = "git" },
    { "<leader>o", group = "oil" },
    { "<leader>l", group = "language" },
    { "<leader>lg", group = "goto" },
    { "<leader>d", group = "debug" },
    { "<leader>t", group = "text mod" },
    { "<leader>tm", desc = "toggle tab mode" },
    { "<leader>tt", desc = "tabelize" },
})
