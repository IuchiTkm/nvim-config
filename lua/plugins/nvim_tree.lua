return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.schedule(function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "right",
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      filesystem_watchers = {
        ignore_dirs = { ".vs" },
      },
    })
    end)
  end,
}
