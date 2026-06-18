return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        { "<leader>t1", "<cmd>1ToggleTerm direction=horizontal<CR>", desc = "Terminal 1" },
        { "<leader>t2", "<cmd>2ToggleTerm direction=horizontal<CR>", desc = "Terminal 2" },
        { "<leader>t3", "<cmd>3ToggleTerm direction=horizontal<CR>", desc = "Terminal 3" },
        { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",       desc = "Terminal Float" },
    },
    config = function()
        require("toggleterm").setup({
            direction = "horizontal",
            size = 15,
            shell = "pwsh",
        })

        -- ノーマルモードからウィンドウ移動（コード→ターミナルも同じキーで）
        vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
        vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
        vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
        vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

        -- ターミナル内からウィンドウ移動
        vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true })
        vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true })
        vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true })
        vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { silent = true })

        -- ターミナル内から矢印キーでリサイズ
        vim.keymap.set("t", "<C-Up>",    "<C-\\><C-n><C-w>+i", { silent = true })
        vim.keymap.set("t", "<C-Down>",  "<C-\\><C-n><C-w>-i", { silent = true })
        vim.keymap.set("t", "<C-Left>",  "<C-\\><C-n><C-w><i", { silent = true })
        vim.keymap.set("t", "<C-Right>", "<C-\\><C-n><C-w>>i", { silent = true })
    end,
}
