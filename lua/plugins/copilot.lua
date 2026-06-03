return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<M-l>", 'copilot#Accept("")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
    })
  end,
}
