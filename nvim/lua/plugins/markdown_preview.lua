return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown" },
  opts = {
    heading = {
      -- アイコンをなくして # の数をそのまま表示
      icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
    },
  },
}
