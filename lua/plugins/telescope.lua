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

    local fd_path = vim.fn.expand("~\\AppData\\Local\\Microsoft\\WinGet\\Packages\\sharkdp.fd_Microsoft.Winget.Source_8wekyb3d8bbwe\\fd-v10.4.2-x86_64-pc-windows-msvc\\fd.exe")
    vim.keymap.set("n", "<leader>ff", function()
      builtin.find_files({
        find_command = { fd_path, "--type", "f", "--color", "never" },
      })
    end, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  end,
}
