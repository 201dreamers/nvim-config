local ok, wk = pcall(require, "which-key")
if not ok then
    return
end

wk.register({
    ["<leader>s"] = { name = "+search" },
    ["<leader>d"] = { name = "+debug" },
    ["<leader>g"] = { name = "+git" },
    ["<leader>o"] = { name = "+orgmode" },
    ["<leader>t"] = {
        name = "+text modify",
        m = "toggle table mode",
        t = "tabelize",
    },
    ["<leader>l"] = {
        name = "+language",
        g = "+goto",
    },
})
