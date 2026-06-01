-- nvim-tree
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })

-- Markdown preview
vim.keymap.set("n", "<leader>mp", "<cmd>RenderMarkdown toggle<cr>", { silent = true, desc = "Markdown Render Toggle" })

----------------------------------------------------
-- ウィンドウ分割 (WezTermのペイン分割キーバインドと統一)
-- WezTerm leader = Ctrl+q
-- Neovim leader = \（バックスラッシュ）
----------------------------------------------------
-- \d → 上下分割 (WezTerm: LEADER+d / SplitVertical)
vim.keymap.set("n", "<leader>d", ":split<CR>", { silent = true })
-- \r → 左右分割 (WezTerm: LEADER+r / SplitHorizontal)
vim.keymap.set("n", "<leader>r", ":vsplit<CR>", { silent = true })
-- \x → ウィンドウを閉じる (WezTerm: LEADER+x)
vim.keymap.set("n", "<leader>x", "<C-w>c", { silent = true })
-- \h/j/k/l → ウィンドウ移動 (WezTerm: LEADER+h/j/k/l)
vim.keymap.set("n", "<leader>h", "<C-w>h", { silent = true })
vim.keymap.set("n", "<leader>j", "<C-w>j", { silent = true })
vim.keymap.set("n", "<leader>k", "<C-w>k", { silent = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { silent = true })
-- \z → ズーム切り替え (WezTerm: LEADER+z / TogglePaneZoomState)
vim.keymap.set("n", "<leader>z", "<C-w>z", { silent = true })
