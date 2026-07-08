vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2d3343" })

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.formatoptions:append("r")
    vim.opt_local.comments = "b:-,b:*,b:+"
  end,
})

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Dockerコンテナ内ではOSC 52でWindowsクリップボードと連携
if vim.fn.filereadable("/.dockerenv") == 1 then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.swapfile = false

vim.opt.fileencodings = "ucs-bom,utf-8,cp932,default,latin1"
