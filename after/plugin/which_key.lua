local ok, wk = pcall(require, "which-key")

if not ok then
    return
end

wk.register({
    ["<leader>s"] = { name = "+search" },
    ["<leader>d"] = { name = "+diagnostic" },
    ["<leader>g"] = { name = "+git" },
    ["<leader>t"] = {
        name = "+text modify",
        m = "toggle table mode",
        t = "tabelize",
    },
    ["<leader>o"] = { name = "+orgmode" },
    ["<leader>l"] = {
        name = "+language",
        g = "+goto",
    },
})
