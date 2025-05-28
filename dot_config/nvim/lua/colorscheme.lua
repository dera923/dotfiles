-- 高コントラストで読みやすいカラースキーム
local M = {}

function M.setup()
  -- カラースキームリセット
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.o.termguicolors = true
  
  -- 基本的な配色設定（高コントラスト）
  vim.cmd([[
    " 基本的な背景と文字色
    highlight Normal guibg=#1a1a1a guifg=#ffffff
    
    " エディタUI要素
    highlight Cursor guibg=#ffffff
    highlight CursorLine guibg=#333333 gui=NONE
    highlight CursorLineNr guifg=#ffffff guibg=#333333
    highlight LineNr guifg=#aaaaaa
    
    " 選択・検索ハイライト - 控えめに
    highlight Visual guibg=#454545 guifg=NONE gui=NONE
    highlight Search guibg=#505050 guifg=#ffffff
    
    " NvimTree設定 - 高コントラスト
    highlight NvimTreeNormal guibg=#252525 guifg=#eeeeee
    highlight NvimTreeEndOfBuffer guibg=#252525 guifg=#252525
    highlight NvimTreeCursorLine guibg=#383838 gui=NONE
    highlight NvimTreeFolderName guifg=#dddddd gui=bold
    highlight NvimTreeFolderIcon guifg=#dddddd
    highlight NvimTreeOpenedFolderName guifg=#ffffff gui=bold
    highlight NvimTreeOpenedFolderIcon guifg=#ffffff
    highlight NvimTreeIndentMarker guifg=#555555
    highlight NvimTreeRootFolder guifg=#aaaaaa gui=bold
    
    " シンタックスハイライト - 控えめな色で
    highlight Comment guifg=#888888
    highlight Constant guifg=#bbbbbb
    highlight String guifg=#bbbbbb
    highlight Identifier guifg=#dddddd
    highlight Function guifg=#dddddd
    highlight Statement guifg=#dddddd
    highlight Keyword guifg=#dddddd
    highlight Type guifg=#dddddd

    " エラーメッセージの表示を見やすくする
    highlight ErrorMsg guifg=#ffffff guibg=#ff0000 gui=bold
    highlight WarningMsg guifg=#ffffff guibg=#ff5500 gui=bold
    highlight ModeMsg guifg=#ffffff
    highlight MoreMsg guifg=#ffffff
    highlight Question guifg=#ffffff
  
    " メッセージエリアの背景色を暗くして文字を明るく
    highlight MsgArea guifg=#ffffff guibg=#222222
  ]])
end

return M
