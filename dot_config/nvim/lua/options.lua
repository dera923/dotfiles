-- VSCode風オプション設定
local opt = vim.opt

-- VSCodeのデフォルト設定に近いUI設定
opt.number = true         -- 行番号表示
opt.relativenumber = false -- VSCodeはデフォルトで相対行番号を使用しない
opt.wrap = false          -- 長い行を折り返さない
opt.showmatch = true      -- 対応する括弧を強調表示
opt.cursorline = true     -- カーソル行をハイライト
opt.signcolumn = "yes"    -- サイン列を常に表示
opt.termguicolors = true  -- 24bitカラーを使用
opt.laststatus = 2        -- ステータスラインを常に表示
opt.cmdheight = 1         -- コマンドラインの高さ
opt.showmode = false      -- モード表示を非表示(VSCode風)
opt.showtabline = 2       -- タブラインを常に表示
opt.title = true          -- ウィンドウのタイトルを設定

-- エディタの挙動
opt.expandtab = true      -- タブをスペースに変換
opt.shiftwidth = 2        -- インデント幅
opt.tabstop = 2           -- タブ幅
opt.softtabstop = 2       -- 編集中のタブ幅
opt.smartindent = true    -- スマートインデント
opt.autoindent = true     -- 自動インデント

-- 検索設定
opt.ignorecase = true     -- 大文字小文字を区別しない
opt.smartcase = true      -- 大文字が含まれる場合は区別する
opt.hlsearch = true       -- 検索結果をハイライト
opt.incsearch = true      -- インクリメンタル検索

-- システム関連
opt.backup = false        -- バックアップファイル作成しない
opt.swapfile = false      -- スワップファイル作成しない
opt.undofile = true       -- 永続的アンドゥ
opt.updatetime = 300      -- 更新時間を短く
opt.clipboard = "unnamedplus" -- システムクリップボードと連携
opt.mouse = "a"           -- マウス操作を有効化

-- ファイル処理
opt.fileencoding = "utf-8" -- ファイルエンコーディング
opt.hidden = true         -- バッファを保持したままバッファ切替可能に

-- 補完メニュー設定
opt.completeopt = {"menu", "menuone", "noselect"} -- 補完メニュー設定

-- スクロールオフセット（VSCode風）
opt.scrolloff = 8         -- カーソル移動時に上下8行は常に表示
opt.sidescrolloff = 8     -- 左右スクロール時のオフセット

-- その他VSCode風設定
opt.splitbelow = true     -- 水平分割は下に
opt.splitright = true     -- 垂直分割は右に


-- ターミナル出力バッファサイズを増やす
vim.o.termguicolors = true
vim.o.lazyredraw = false
vim.o.ttyfast = true
vim.o.scrollback = 100000
vim.o.redrawtime = 10000
vim.o.maxmempattern = 10000
