return {
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        handler_opts = {
          border = "rounded",
        },
        hint_enable = true,
        hint_prefix = "» ",
        hi_parameter = "LspSignatureActiveParameter",
        floating_window = true,
      })
    end,
  },
}
