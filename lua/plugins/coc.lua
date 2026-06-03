return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    vim.keymap.set("i", "<TAB>", function()
      return vim.fn["coc#pum#visible"]() == 1
        and vim.fn["coc#pum#next"](1)
        or "<TAB>"
    end, { silent = true, noremap = true, expr = true })

    vim.keymap.set("i", "<S-TAB>", function()
      return vim.fn["coc#pum#visible"]() == 1
        and vim.fn["coc#pum#prev"](1)
        or "<S-TAB>"
    end, { silent = true, noremap = true, expr = true })

    vim.keymap.set("i", "<CR>", function()
      return vim.fn["coc#pum#visible"]() == 1
        and vim.fn["coc#pum#confirm"]()
        or "<CR>"
    end, { silent = true, noremap = true, expr = true })
  end,
}
