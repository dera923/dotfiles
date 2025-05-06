-- オプション設定ファイル
local opt = vim.opt

-- 表示関連
opt.number = true         -- 行番号表示
opt.relativenumber = true -- 相対行番号
opt.wrap = false          -- 長い行を折り返さない
opt.showmatch = true      -- 対応する括弧を強調表示
opt.cursorline = true     -- カーソルがある行を強調
opt.signcolumn = "yes"    -- サイン列を常に表示
opt.termguicolors = true  -- 24bitカラーを使用

-- 編集関連
opt.expandtab = true      -- タブをスペースに変換
opt.shiftwidth = 2        -- インデント幅
opt.tabstop = 2           -- タブ幅
opt.smartindent = true    -- スマートインデント
opt.autoindent = true     -- 自動インデント

-- 検索関連
opt.ignorecase = true     -- 大文字小文字を区別しない
opt.smartcase = true      -- 検索文字に大文字があれば区別する
opt.hlsearch = true       -- 検索結果をハイライト
opt.incsearch = true      -- インクリメンタル検索

-- システム関連
opt.backup = false        -- バックアップファイル作成しない
opt.swapfile = false      -- スワップファイル作成しない
opt.updatetime = 300      -- 更新時間
opt.clipboard = "unnamedplus" -- システムクリップボードと連携
opt.mouse = "a"           -- マウス操作を有効化
opt.undofile = true       -- 永続的アンドゥ
opt.undodir = vim.fn.expand('~/.config/nvim/undodir') -- アンドゥファイル保存先

-- ファイル処理
opt.fileencoding = "utf-8" -- ファイルエンコーディング
opt.hidden = true         -- バッファを保持したままバッファ切替可能に

-- 補完メニュー設定
opt.completeopt = {"menu", "menuone", "noselect"} -- 補完メニュー設定

-- スクロールオフセット
opt.scrolloff = 8         -- カーソル移動時に上下8行は常に表示