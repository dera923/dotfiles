-- LSP設定ファイル
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

-- 言語サーバーのリスト
local servers = {
  'pyright',        -- Python
  'gopls',          -- Go
  'rust_analyzer',  -- Rust
  'tsserver',       -- TypeScript/JavaScript
  'lua_ls',         -- Lua
  'sqlls',          -- SQL
  'jdtls',          -- Java
  'html',           -- HTML
  'cssls',          -- CSS
  'jsonls',         -- JSON
}

-- Mason-LSPConfig連携セットアップ
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

-- LSPの共通設定を定義
local opts = {
  on_attach = function(client, bufnr)
    -- キーマップ設定を行う
    -- (keymaps.luaですでに設定しています)
    
    -- フォーマット機能の重複を避けるため、null-lsを使う場合はここで無効化
    if client.name == "tsserver" or client.name == "lua_ls" or client.name == "pyright" then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end,
  
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

-- 各言語サーバーの設定
mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup(opts)
  end,
  
  -- カスタム設定が必要な言語サーバーは個別に設定
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup {
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end,
}