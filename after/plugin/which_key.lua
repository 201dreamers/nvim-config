local ok, wk = pcall(require, "which-key")
if not ok then
    return
end

wk.add({
    { "<leader>s", group = "search" },
    { "<leader>g", group = "git" },
    { "<leader>o", group = "orgmode" },
    { "<leader>l", group = "language" },
    { "<leader>lg", group = "goto" },
    { "<leader>d", group = "debug" },
    { "<leader>t", group = "text modify" },
    { "<leader>tm", desc = "toggle table mode" },
    { "<leader>tt", desc = "tabelize" },
})
