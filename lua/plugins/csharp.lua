-- C# ファイルでは coc.nvim を無効化
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.b.coc_enabled = 0
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- csharp-ls アタッチ時のキーマップ
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= "csharp_ls" then return end
    local buf = args.buf
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, silent = true })
    vim.keymap.set("n", "gr", function()
      local gen = require("telescope.make_entry").gen_from_quickfix()
      require("telescope.builtin").lsp_references({
        entry_maker = function(item)
          local entry = gen(item)
          if not entry then return nil end
          entry.display = function(e)
            local path = e.filename or ""
            local limit = 30
            if #path > limit then
              path = "…" .. path:sub(-limit)
            end
            local text = (e.text or ""):gsub("^%s+", "")
            return path .. "  " .. text
          end
          return entry
        end,
      })
    end, { buffer = buf, silent = true })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, silent = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, silent = true })
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { buffer = buf, silent = true })
  end,
})

vim.lsp.config("csharp_ls", {
  cmd = { vim.fn.expand("~/.dotnet/tools/csharp-ls.exe") },
  filetypes = { "cs" },
  root_dir = function(bufnr, cb)
    cb(vim.fs.root(bufnr, function(name)
      return name:match("%.sln$") ~= nil or name:match("%.csproj$") ~= nil
    end))
  end,
})
vim.lsp.enable("csharp_ls")

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    ft = "cs",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local cmp = require("cmp")
      cmp.setup.filetype("cs", {
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }),
      })
    end,
  },
}
