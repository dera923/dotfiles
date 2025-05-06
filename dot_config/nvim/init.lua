-- 基本設定ファイルを読み込む
require('options')    -- 基本設定オプション
require('keymaps')    -- キーマップ設定
require('plugins')    -- プラグイン設定

-- TreeSitterの設定を読み込む
require('config.treesitter').setup()

-- カラースキーム設定
vim.cmd('colorscheme tokyonight')

-- ファイルタイプごとのインデント設定
vim.cmd([[
  augroup file_indent
    autocmd!
    autocmd FileType python setlocal shiftwidth=4 tabstop=4
    autocmd FileType lua setlocal shiftwidth=2 tabstop=2
    autocmd FileType javascript,typescript setlocal shiftwidth=2 tabstop=2
  augroup END
]])


