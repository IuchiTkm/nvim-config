local function get_zenhan_path()
  if vim.fn.has("win32") == 1 then
    return vim.fn.expand("~/bin/zenhan.exe")
  elseif vim.fn.has("wsl") == 1 then
    local win_user = vim.fn.system("cmd.exe /c echo %USERNAME% 2>/dev/null"):gsub("%s+", "")
    return "/mnt/c/Users/" .. win_user .. "/bin/zenhan.exe"
  end
  return ""
end

local zenhan = get_zenhan_path()

return {
  "keaising/im-select.nvim",
  event = "VeryLazy",
  enabled = function()
    if vim.fn.filereadable("/.dockerenv") == 1 then return false end
    return zenhan ~= "" and vim.fn.executable(zenhan) == 1
  end,
  config = function()
    require("im_select").setup({
      default_im_select = "0",
      default_command = zenhan,
      set_default_events = { "InsertLeave" },
      set_previous_events = {},
    })
  end,
}
