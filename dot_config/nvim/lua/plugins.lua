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
      require('telescope').setup {}
    end
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  -- ファイルツリー表示
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', 
    },
    config = function()
      require('nvim-tree').setup {}
    end
  }

  -- LSP関連
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp-config')
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
    config = function()
      require('null-ls').setup({
        sources = {
          require('null-ls').builtins.formatting.prettier,
          require('null-ls').builtins.formatting.black,
          require('null-ls').builtins.formatting.stylua,
          require('null-ls').builtins.diagnostics.eslint,
          require('null-ls').builtins.diagnostics.flake8,
        },
      })
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
      })
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  
  use 'nvim-treesitter/nvim-treesitter-textobjects'  -- テキストオブジェクト機能のため

  -- ~/.config/nvim/lua/plugins.luaに追加
use {
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons'
}

-- fzf連携
use {
  'junegunn/fzf',
  run = function() vim.fn['fzf#install']() end
}
use 'junegunn/fzf.vim'

-- telescope-fzf-native.nvim（既存の設定を更新）
use {
  'nvim-telescope/telescope-fzf-native.nvim',
  run = 'make',
  config = function()
    require('telescope').load_extension('fzf')
  end
}

-- ~/.config/nvim/lua/config/nvim-tree.luaとして保存
require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
})

-- キーマップの追加（~/.config/nvim/lua/keymaps.lua）
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

  -- 自動的にパッケージがインストールされたらNeovimを同期
  if packer_bootstrap then
    require('packer').sync()
  end
end)