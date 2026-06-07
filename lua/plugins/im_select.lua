return {
  "keaising/im-select.nvim",
  event = "VeryLazy",
  config = function()
    require("im_select").setup({
      default_im_select = "0",
      default_command = vim.fn.expand("~/bin/zenhan.exe"),
      set_default_events = { "InsertLeave" },
      set_previous_events = {},
    })
  end,
}
