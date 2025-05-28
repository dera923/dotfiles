-- VSCode風キーマッピング
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- リーダーキーをスペースに設定
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"  -- molten用にバックスラッシュに変更

-- ノーマルモード
-- ファイル操作 (VSCode風)
keymap("n", "<C-s>", ":w<CR>", opts)                   -- 保存 (Ctrl+S)
keymap("n", "<C-q>", ":q<CR>", opts)                   -- 終了 (Ctrl+Q)
keymap("n", "<C-w>", ":bd<CR>", opts)                  -- バッファを閉じる (Ctrl+W)

-- ウィンドウ操作
keymap("n", "<C-h>", "<C-w>h", opts)                   -- 左のウィンドウへ
keymap("n", "<C-j>", "<C-w>j", opts)                   -- 下のウィンドウへ
keymap("n", "<C-k>", "<C-w>k", opts)                   -- 上のウィンドウへ
keymap("n", "<C-l>", "<C-w>l", opts)                   -- 右のウィンドウへ

-- 可視化ユーティリティのキーマッピング
keymap("n", "<leader>vv", ":lua require('visualize').quick_visualize()<CR>", opts)
keymap("n", "<leader>va", ":lua require('visualize').ascii_chart({23, 45, 67, 89, 76, 54}, {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'}, '月別データ')<CR>", opts)

-- バッファ/タブ操作 (VSCode風)
keymap("n", "<C-PageDown>", ":bnext<CR>", opts)        -- 次のタブへ
keymap("n", "<C-PageUp>", ":bprevious<CR>", opts)      -- 前のタブへ
keymap("n", "<C-t>", ":tabnew<CR>", opts)              -- 新しいタブ

-- 検索
keymap("n", "<C-f>", "/", opts)                        -- 検索 (Ctrl+F)
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)          -- ハイライト解除

-- VSCode風のマルチカーソル (NvimではSimulate)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)             -- 行を下に移動
keymap("n", "<A-k>", ":m .-2<CR>==", opts)             -- 行を上に移動
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)         -- 選択範囲を下に移動
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)         -- 選択範囲を上に移動

-- インサートモード
keymap("i", "<C-s>", "<C-O>:w<CR>", opts)              -- 保存
keymap("i", "<C-v>", '<C-r>+', opts)                   -- 貼り付け
keymap("i", "<C-z>", "<C-O>u", opts)                   -- 元に戻す

-- ビジュアルモード
keymap("v", "<", "<gv", opts)                          -- インデント減少後も選択維持
keymap("v", ">", ">gv", opts)                          -- インデント増加後も選択維持

-- コマンドモード
keymap("c", "<C-v>", "<C-R>+", opts)                   -- コマンドラインで貼り付け

-- ファイルツリー (VSCode Explorer)
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)      -- エクスプローラー表示/非表示

-- LSP関連 (VSCode風)
keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)              -- 名前変更
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)         -- 定義へ移動
keymap("n", "<S-F12>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)       -- 参照を検索
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)          -- ホバー情報
keymap("n", "<A-F12>", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)   -- 実装へ移動
keymap("n", "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)        -- クイックフィックス

-- navi
keymap("n", "<leader>n", ":Navi<CR>", opts)

