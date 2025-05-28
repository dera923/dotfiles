-- ~/.config/nvim/init.lua

-- ASDF環境設定を最初に読み込む
require('asdf_config').setup()

-- 基本設定ファイルを読み込む
require('options')    -- 基本設定オプション
require('keymaps')    -- キーマップ設定
require('plugins')    -- プラグイン設定
require('colorscheme').setup() -- カラースキーム設定

-- ファイルタイプごとのインデント設定
vim.cmd([[
  augroup file_indent
    autocmd!
    autocmd FileType python setlocal shiftwidth=4 tabstop=4
    autocmd FileType lua setlocal shiftwidth=2 tabstop=2
    autocmd FileType javascript,typescript setlocal shiftwidth=2 tabstop=2
  augroup END
]])

-- 起動時にNvimTreeを自動的に開く
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})

-- Perplexity連携のためのカスタムコマンド
vim.api.nvim_create_user_command('Perplexity', function(opts)
  -- 選択されたテキストを取得
  local selected_text = vim.fn.getreg('"')
  
  -- DeepLで日本語から英語に翻訳（シェルコマンド実行）
  local translated = vim.fn.system('deepl translate ja en "' .. selected_text .. '"')
  
  -- Perplexityへ問い合わせ（ChatGPTプラグインを経由）
  vim.cmd('ChatGPTRun perplexity ' .. translated)
end, {range = true})

-- キーマッピング（ビジュアルモードで選択したテキストをPerplexityに送信）
vim.api.nvim_set_keymap('v', '<leader>pp', ':Perplexity<CR>', {noremap = true, silent = true})

-- カスタムコマンドの読み込み
require('runlog')
require('runbench')
