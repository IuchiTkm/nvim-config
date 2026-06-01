-- バッファの内容全体を使って Copilot とチャットする
function CopilotChatBuffer()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer() })
  end
end

-- <leader>ccq で CopilotChatBuffer を呼び出す
vim.api.nvim_set_keymap("n", "<leader>ccq", "<cmd>lua CopilotChatBuffer()<cr>", { noremap = true, silent = true })

-- 背景透過（ColorScheme変更後も維持）
local function set_copilot_chat_transparent()
  vim.api.nvim_set_hl(0, "CopilotChatNormal", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "CopilotChatBorder", { bg = "NONE" })
end

set_copilot_chat_transparent()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_copilot_chat_transparent,
})

