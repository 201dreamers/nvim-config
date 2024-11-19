local orgmode_ok, orgmode = pcall(require, "orgmode")
local org_bullets_ok, org_bullets = pcall(require, "org-bullets")

if not (orgmode_ok and org_bullets_ok) then
    return
end

-- Setup orgmode
orgmode.setup({
    org_agenda_files = "~/orgfiles/**/*",
    org_default_notes_file = "~/orgfiles/refile.org",
})

org_bullets.setup({
    concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
    symbols = {
        -- list symbol
        list = "•",
        -- headlines can be a list
        headlines = { "◉", "○", "✸", "✿" },
        checkboxes = {
            half = { "", "OrgTSCheckboxHalfChecked" },
            done = { "✓", "OrgDone" },
            todo = { "˟", "OrgTODO" },
        },
    },
})
