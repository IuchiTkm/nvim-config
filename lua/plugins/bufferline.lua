return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
      },
      highlights = {
        buffer_selected = {
          fg = "#ffffff",
          bg = "#3e4451",
          bold = true,
          italic = false,
        },
        indicator_selected = {
          fg = "#61afef",
          bg = "#3e4451",
        },
      },
    })
  end,
}
