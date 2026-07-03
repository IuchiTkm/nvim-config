return {
  {
    "danymat/neogen",
    version = "*",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "cs",
    config = function()
      require("neogen").setup({
        enabled = true,
        languages = {
          cs = {
            template = {
              annotation_convention = "xmldoc",
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>nd", function()
        require("neogen").generate()
      end, { silent = true, desc = "XMLサマリー生成" })
    end,
  },
}
