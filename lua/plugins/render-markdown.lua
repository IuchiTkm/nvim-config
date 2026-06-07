return {
  "MeanderingProgrammer/render-markdown.nvim",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.nvim",
  },

  ft = { "markdown" },

  opts = {
    heading = {
      enabled = true,
    },
    bullet = {
      enabled = true,
    },
    code = {
      enabled = true,
    },
  },
}
