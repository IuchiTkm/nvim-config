return {
  {
    "stevearc/conform.nvim",
    ft = "cs",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          cs = { "csharpier" },
        },
        format_on_save = {
          timeout_ms = 3000,
          lsp_fallback = false,
        },
      })
    end,
  },
}
