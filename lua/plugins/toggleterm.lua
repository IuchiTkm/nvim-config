return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        { "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Toggle Terminal" },
    },
    config = function()
        require("toggleterm").setup({
            direction = "horizontal",
            size = 15,
        })

        -- ターミナル内から Ctrl+h/k でコードペインに移動
        vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true })
        vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true })
    end,
}
