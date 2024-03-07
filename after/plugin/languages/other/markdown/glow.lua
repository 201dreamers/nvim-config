local ok, glow = pcall(require, "glow")
if not ok then
    return
end

-- -----
-- Setup
-- -----
glow.setup({
    width = 120,
    width_ratio = 0.8, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
    height_ratio = 0.8,
})
