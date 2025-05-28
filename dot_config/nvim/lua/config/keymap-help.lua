-- ~/.config/nvim/lua/config/keymap-help.lua
local M = {}

function M.show_help()
  local help_text = [[
## ファイル操作 (nvim-tree)
- <C-n>        ファイルエクスプローラーの表示/非表示
- Enter        ファイルを開く
- o            ファイルを開く
- s            新しいウィンドウで横に分割して開く
- v            新しいウィンドウで縦に分割して開く
- a            新規ファイル作成
- d            ファイル削除
- r            ファイル名変更
- y            ファイルパスコピー
- Y            ファイル名コピー
- -            親ディレクトリに移動
- <C-v>        垂直分割して開く
- <C-x>        水平分割して開く
- <C-t>        新しいタブで開く

## ウィンドウ移動
- <C-h>        左のウィンドウへ移動
- <C-j>        下のウィンドウへ移動
- <C-k>        上のウィンドウへ移動
- <C-l>        右のウィンドウへ移動

## LSP機能
- K            ホバー（定義表示）
- gd           定義へ移動
- gr           参照を検索
- <Leader>ca   コードアクション
- <Leader>rn   名前変更
- [d           前の診断へ移動
- ]d           次の診断へ移動

## Telescope (ファイル検索)
- <Leader>ff   ファイル検索
- <Leader>fg   テキスト検索 (Live Grep)
- <Leader>fb   バッファ検索
- <Leader>fh   ヘルプドキュメント検索
  ]]
  
  -- 新しいバッファを作成して表示
  vim.cmd('new')
  vim.cmd('setlocal buftype=nofile')
  vim.cmd('setlocal bufhidden=wipe')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(help_text, '\n'))
  vim.cmd('setlocal filetype=markdown')
  vim.cmd('setlocal nomodifiable')
  vim.cmd('setlocal nomodified')
  vim.cmd('nnoremap <buffer> q :close<CR>')
end

return M
