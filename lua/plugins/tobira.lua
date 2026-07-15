return {
  "kamegoro/tobira.nvim",
  event = "VeryLazy",
  config = function()
    require("tobira").setup({ lang = "ja" })

    -- tobira はハードコードで row=1（画面上部右）に表示する。
    -- nvim_open_win を一時ラップして呼び出し時に row を画面下部へ変更する。
    local float = require("tobira.ui.float")
    local patch_open_win = function(orig_fn)
      return function(...)
        local orig = vim.api.nvim_open_win
        vim.api.nvim_open_win = function(buf, enter, opts)
          if type(opts) == "table" and opts.relative == "editor" and opts.row == 1 then
            local win_h = opts.height or 5
            opts.row = vim.o.lines - win_h - 4
          end
          return orig(buf, enter, opts)
        end
        local result = orig_fn(...)
        vim.api.nvim_open_win = orig
        return result
      end
    end

    float.show = patch_open_win(float.show)
    if float.celebrate then
      float.celebrate = patch_open_win(float.celebrate)
    end
  end,
}
