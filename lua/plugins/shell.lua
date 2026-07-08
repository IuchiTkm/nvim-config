vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= "bashls" then return end
    local buf = args.buf
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, silent = true })
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { buffer = buf, silent = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, silent = true })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, silent = true })
  end,
})

vim.lsp.config("bashls", {
  cmd = { vim.fn.exepath("bash-language-server") ~= "" and vim.fn.exepath("bash-language-server") or "bash-language-server", "start" },
  filetypes = { "sh" },
  root_dir = function(bufnr, cb)
    cb(vim.fs.root(bufnr, { ".git", ".bashrc", ".bash_profile" }) or vim.fn.getcwd())
  end,
})
vim.lsp.enable("bashls")

return {}
