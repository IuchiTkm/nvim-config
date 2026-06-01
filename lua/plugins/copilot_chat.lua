return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "github/copilot.vim" },
  },
  build = "make tiktoken",
  config = function()
    require("CopilotChat").setup({
      window = {
        layout = "vertical",
        width = 0.4,
      },
      auto_follow_cursor = true,
    })

    -- バッファの内容全体を使って Copilot とチャットする
    function CopilotChatBuffer()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer() })
      end
    end
    vim.keymap.set("n", "<leader>ccq", "<cmd>lua CopilotChatBuffer()<cr>", { noremap = true, silent = true })
  end,
}
