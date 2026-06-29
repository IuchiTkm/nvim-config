return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("telescope").setup({
      defaults = {
        preview = {
          treesitter = false,
        },
        path_display = function(_, path)
          local limit = 15
          if #path <= limit then
            return path
          end
          return "…" .. path:sub(-limit)
        end,
      },
    })

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  end,
}
