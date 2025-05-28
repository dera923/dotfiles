-- プラグイン設定ファイル
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer自身を管理
  use 'wbthomason/packer.nvim'

  -- 依存プラグイン
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- カラースキーム 
  use 'folke/tokyonight.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- ファイル検索＆ファジーファインダー
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
          layout_config = {
            horizontal = {
              preview_width = 0.6,
            },
          },
        },
      }
    end
  }

  -- fzf連携
  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }
  use {
    'junegunn/fzf.vim',
    config = function()
      -- FZF設定
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
      vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
      
      -- キーマッピング
      vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<C-f>', ':Rg<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<leader>fb', ':Buffers<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<leader>fh', ':History<CR>', {noremap = true, silent = true})
    end
  }

  -- データベース接続
  use 'tpope/vim-dadbod'
  use {
    'kristijanhusak/vim-dadbod-ui',
    requires = {'tpope/vim-dadbod', 'kristijanhusak/vim-dadbod-completion'},
    config = function()
      vim.g.db_ui_save_location = vim.fn.stdpath('data') .. '/db_ui'
      vim.api.nvim_set_keymap('n', '<leader>db', ':DBUIToggle<CR>', {noremap = true})
    end
  }

  -- REPLと開発環境強化
  use {
    'hkupty/iron.nvim',
    config = function()
      require('iron.core').setup {
        config = {
          repl_definition = {
            python = {
              command = {"ipython"}
            },
            lua = {
              command = {"lua"}
            }
          },
          repl_open_cmd = 'vertical botright 80 split'
        }
      }
      -- キーマッピング
      vim.api.nvim_set_keymap('n', '<leader>rs', '<cmd>IronRepl<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>IronRestart<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', '<leader>rf', '<cmd>IronFocus<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', '<leader>rh', '<cmd>IronHide<CR>', {noremap = true})
    end
  }

  -- Jupyter連携
  use {
    'jupyter-vim/jupyter-vim',
    config = function()
      vim.g.jupyter_mapkeys = 0
      -- キーマッピング
      vim.api.nvim_set_keymap('n', '<leader>jr', ':JupyterRunFile<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', '<leader>ji', ':JupyterImportThisFile<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', '<leader>jc', ':JupyterConnect<CR>', {noremap = true})
    end
  }

  -- molten-nvim (Jupyter Notebook統合)
  use {
    'benlubas/molten-nvim',
    run = ':UpdateRemotePlugins',
    config = function()
      -- molten-nvim設定
      vim.g.molten_image_provider = "none"  -- iTerm2 + tmux環境用
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = true
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
      
      -- キーマッピング
      vim.api.nvim_set_keymap('n', '<localleader>mi', ':MoltenInit<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<localleader>vs', ':MoltenEvaluateVisual<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('v', '<localleader>vs', ':<C-u>MoltenEvaluateVisual<CR>gv', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<localleader>rl', ':MoltenEvaluateLine<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<localleader>rr', ':MoltenReevaluateCell<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<localleader>rd', ':MoltenDelete<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<localleader>oh', ':MoltenHideOutput<CR>', {noremap = true, silent = true})
      vim.api.nvim_set_keymap('n', '<localleader>os', ':MoltenShowOutput<CR>', {noremap = true, silent = true})
    end
  }

  -- image.nvim (画像表示サポート)
  use {
    '3rd/image.nvim',
    config = function()
      require('image').setup({
        backend = "kitty",  -- iTerm2でも動作する場合があります
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" },
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "norg" },
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        kitty_method = "normal",
        kitty_tmux_write_to_pty = true,  -- tmux環境での設定
      })
    end
  }

  -- Markdown実行
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  -- ターミナル内画像表示ツール連携
  use {
    'wfxr/minimap.vim',
    config = function()
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 0
      vim.g.minimap_auto_start_win_enter = 0
      vim.api.nvim_set_keymap('n', '<leader>mm', ':MinimapToggle<CR>', {noremap = true})
    end
  }

  -- 画像プレビュー機能（外部プログラム連携）
  use {
    'nvim-telescope/telescope-media-files.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require('telescope').load_extension('media_files')
      require('telescope').setup {
        extensions = {
          media_files = {
            filetypes = {"png", "jpg", "jpeg", "gif"},
            find_cmd = "rg"
          }
        }
      }
      vim.api.nvim_set_keymap('n', '<leader>fp', ':Telescope media_files<CR>', {noremap = true})
    end
  }

  -- ファイルツリー表示
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', 
    },
    config = function()
      require('config.nvim-tree')
    end
  }

  -- LSP関連
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp-config')
    end
  }
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }
  use 'williamboman/mason-lspconfig.nvim'
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
      require('lspsaga').setup {}
    end
  }
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end
  }

  -- コード補完エンジン
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('cmp-config')
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'

  -- スニペット
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  }
  use 'rafamadriz/friendly-snippets'

  -- フォーマッター＆リンター
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
    require('config.null-ls')
    end
  }

  -- Codeium AI補完
  use {
    'Exafunction/codeium.vim',
    config = function()
      vim.g.codeium_enabled = true
    end
  }

  -- ステータスライン
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {}
    end
  }

  -- バッファライン
  use {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
    end
  }

  -- 通知UI改善
  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify'
    },
    config = function()
      require('noice').setup {
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
      }
    end
  }

  -- Git連携
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {}
    end
  }
  use 'tpope/vim-fugitive'
  use {
    'kdheepak/lazygit.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }

  -- プロジェクト管理
  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {}
    end
  }

  -- ChatGPT連携
  use {
    'jackMort/ChatGPT.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require('chatgpt').setup({
        api_key_cmd = "echo $OPENAI_API_KEY",
        -- Perplexity用カスタム設定を追加
        perplexity = {
          api_key_cmd = "echo $PERPLEXITY_API_KEY",
        }
      })
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  
  use 'nvim-treesitter/nvim-treesitter-textobjects'  -- テキストオブジェクト機能のため

  -- zoxide連携
  use 'nanotee/zoxide.vim'

  -- 日本語→英語変換（翻訳）用
  use {
    'voldikss/vim-translator',
    config = function()
      vim.g.translator_default_engines = {'deepl'}
    end
  }

  -- 自動的にパッケージがインストールされたらNeovimを同期
  if packer_bootstrap then
    require('packer').sync()
  end
end)
