-- キーマップ設定
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- リーダーキーをスペースに設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Pythonファイル実行
vim.keymap.set('n', '<F5>', ':w<CR>:!python3 %<CR>', { noremap = true, silent = false })
-- JavaScriptファイル実行
vim.keymap.set('n', '<F6>', ':w<CR>:!node %<CR>', { noremap = true, silent = false })

-- ノーマルモード
-- ウィンドウ操作
keymap("n", "<C-h>", "<C-w>h", opts) -- 左のウィンドウへ
keymap("n", "<C-j>", "<C-w>j", opts) -- 下のウィンドウへ
keymap("n", "<C-k>", "<C-w>k", opts) -- 上のウィンドウへ
keymap("n", "<C-l>", "<C-w>l", opts) -- 右のウィンドウへ

-- ウィンドウのリサイズ
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- バッファ操作
keymap("n", "<S-l>", ":bnext<CR>", opts)     -- 次のバッファへ
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- 前のバッファへ
keymap("n", "<leader>c", ":bd<CR>", opts)    -- バッファを閉じる

-- 画面内検索結果移動
keymap("n", "n", "nzzzv", opts) -- 次の検索結果へ（画面中央に）
keymap("n", "N", "Nzzzv", opts) -- 前の検索結果へ（画面中央に）

-- インデント調整後にビジュアルモードを維持
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- 行の移動（上下）
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- 貼り付け時に選択したテキストを上書きしない
keymap("v", "p", '"_dP', opts)

-- ESCの代わりに使えるショートカット
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- 検索ハイライトをクリア
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- LSP関連のキーマップ
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Telescope関連のキーマップ
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", opts)

-- Git関連のキーマップ
keymap("n", "<leader>gs", "<cmd>Gitsigns toggle_signs<CR>", opts)
keymap("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", opts)
keymap("n", "<leader>gj", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)

-- ファイルツリー関連
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", opts)

-- ChatGPT関連
keymap("n", "<leader>cc", "<cmd>ChatGPT<CR>", opts)
keymap("v", "<leader>ce", "<cmd>ChatGPTEditWithInstructions<CR>", opts)