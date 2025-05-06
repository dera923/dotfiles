-- 補完エンジン設定ファイル
local cmp = require('cmp')
local luasnip = require('luasnip')

-- アイコン設定
local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  
  formatting = {
    format = function(entry, vim_item)
      -- アイコンを追加
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      
      -- 補完元の表示
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
        codeium = "[AI]",
      })[entry.source.name]
      
      return vim_item
    end,
  },
  
  -- 補完ソースの優先度設定
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'codeium' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  
  -- キーマッピング
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs(-4), -- ドキュメント上スクロール
    ['<C-j>'] = cmp.mapping.scroll_docs(4),  -- ドキュメント下スクロール
    ['<C-Space>'] = cmp.mapping.complete(),  -- 補完を強制的に表示
    ['<C-e>'] = cmp.mapping.abort(),         -- 補完をキャンセル
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Enterで選択を確定
    -- Tabキーで次の補完候補へ、Shift+Tabで前の候補へ
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
})

-- コマンドラインモード用の設定
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  })
})

-- 検索モード用の設定
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})