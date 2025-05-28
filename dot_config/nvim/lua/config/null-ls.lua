local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
    
    -- Lua
    null_ls.builtins.formatting.stylua,
    
    -- JavaScript/TypeScript
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    
    -- JSON
    null_ls.builtins.formatting.jq,
  },
}) 