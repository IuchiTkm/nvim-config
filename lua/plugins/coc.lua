return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
    vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
    vim.keymap.set("n", "K", function()
      vim.fn.CocActionAsync("doHover")
    end, { silent = true })

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

  end,
}
