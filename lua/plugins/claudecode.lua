return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>",      desc = "Claude Code 開閉" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code フォーカス" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>",  mode = "v", desc = "選択範囲をClaudeに送信" },
      { "<leader>aa", "<cmd>ClaudeCodeAdd %<cr>", desc = "現在のファイルをコンテキストに追加" },
    },
  },
}
