local lspconfig = require('lspconfig')

-- Python
lspconfig.pyright.setup{}

-- Lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- TypeScript/JavaScript
lspconfig.ts_ls.setup{}

-- JSON
lspconfig.jsonls.setup{}

-- HTML
lspconfig.html.setup{}

-- CSS
lspconfig.cssls.setup{} 