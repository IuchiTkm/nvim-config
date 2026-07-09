return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      vim.keymap.set("n", "<leader>mb", "<cmd>MarkdownPreviewToggle<CR>", { silent = true })
    end,
  },
}
