local null_ls = require("null-ls")

-- null-lsソースの設定
local sources = {
  -- フォーマッター
  null_ls.builtins.formatting.prettier.with({
    condition = function()
      return vim.fn.executable("prettier") == 1
    end,
  }),
  null_ls.builtins.formatting.stylua.with({
    condition = function()
      return vim.fn.executable("stylua") == 1
    end,
  }),
  -- 必要に応じて他のソースを追加
}

null_ls.setup({
  sources = sources,
})