local luasnip = require("luasnip")

-- スニペット機能を初期化
require("luasnip.loaders.from_vscode").lazy_load()

-- 基本スニペットを追加（任意）
luasnip.add_snippets("all", {
  luasnip.snippet("test", {
    luasnip.text_node("This is a test snippet")
  }),
})

print("LuaSnip initialized")
