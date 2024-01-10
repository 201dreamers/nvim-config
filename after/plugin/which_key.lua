local ok, wk = pcall(require, "which-key")

if not ok then
    return
end

wk.register({
    ["<leader>s"] = { name = "+search" },
    ["<leader>d"] = { name = "+diagnostic" },
    ["<leader>g"] = { name = "+git" },
    ["<leader>t"] = { name = "+table mode" },
    ["<leader>o"] = { name = "+orgmode" },
    ["<leader>l"] = {
        name = "+lsp",
        g = "+goto",
    },
})
