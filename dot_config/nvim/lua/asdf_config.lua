-- ASDF環境設定
local M = {}

function M.setup()
  -- PATH環境変数にASDF shimsを追加
  local current_path = vim.env.PATH or ""
  local asdf_shims = os.getenv("HOME") .. "/.asdf/shims"
  local asdf_bin = os.getenv("HOME") .. "/.asdf/bin"
  
  -- PATHの先頭にASDF パスを追加
  vim.env.PATH = asdf_shims .. ":" .. asdf_bin .. ":" .. current_path
  
  -- Python用の設定
  vim.g.python3_host_prog = asdf_shims .. "/python3"
  
  -- Node.js用の設定
  vim.g.node_host_prog = asdf_shims .. "/node"
  
  -- LSP用の実行ファイルパス設定
  local lspconfig = require('lspconfig')
  
  -- Python LSP (pyright)
  lspconfig.pyright.setup({
    settings = {
      python = {
        pythonPath = asdf_shims .. "/python3"
      }
    }
  })
  
  -- Go LSP
  lspconfig.gopls.setup({
    cmd = {asdf_shims .. "/gopls"}
  })
  
  -- Rust LSP
  lspconfig.rust_analyzer.setup({
    cmd = {asdf_shims .. "/rust-analyzer"}
  })
  
  -- Node.js/TypeScript LSP
  lspconfig.tsserver.setup({
    cmd = {asdf_shims .. "/typescript-language-server", "--stdio"}
  })
end

return M 