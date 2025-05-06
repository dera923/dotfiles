-- TreeSitter設定ファイル
local M = {}

function M.setup()
  -- TreeSitterの設定
  require('nvim-treesitter.configs').setup {
    -- インストールするパーサーのリスト
    ensure_installed = { 
      "lua", "vim", "vimdoc", "regex", "bash", 
      "markdown", "javascript", "typescript", "python",
      "json", "yaml", "toml", "html", "css"
    },
    
    -- ensure_installed用のパーサーを同期的にインストール
    sync_install = false,
    
    -- 不足しているパーサーを自動的にインストール
    auto_install = true,
    
    -- ハイライト機能
    highlight = {
      -- 機能を有効化
      enable = true,
      
      -- 追加のVimregexハイライトを無効化
      additional_vim_regex_highlighting = false,
    },
    
    -- インデント機能
    indent = {
      enable = true
    },
    
    -- 括弧ペアの認識
    matchup = {
      enable = true,
    },
    
    -- 選択範囲の拡張
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<S-CR>",
        node_decremental = "<BS>",
      },
    },
    
    -- テキストオブジェクト
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
        },
      },
    },
  }
end

return M