local function set_transparent()
  vim.cmd [[
    highlight Normal        guibg=NONE ctermbg=NONE
    highlight NormalNC      guibg=NONE ctermbg=NONE
    highlight NormalFloat   guibg=NONE ctermbg=NONE
    highlight FloatBorder   guibg=NONE ctermbg=NONE
    highlight EndOfBuffer   guibg=NONE ctermbg=NONE
    highlight SignColumn    guibg=NONE ctermbg=NONE
    highlight LineNr        guibg=NONE ctermbg=NONE
    highlight StatusLine    guibg=NONE
    highlight StatusLineNC  guibg=NONE
    highlight NERDTreeNormal   guibg=NONE
    highlight NERDTreeNormalNC guibg=NONE
  ]]
end

set_transparent()

-- カラースキーム変更後も透過を維持
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparent,
})
