-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/onoderahiroki/.cache/nvim/packer_hererocks/2.1.1744318430/share/lua/5.1/?.lua;/Users/onoderahiroki/.cache/nvim/packer_hererocks/2.1.1744318430/share/lua/5.1/?/init.lua;/Users/onoderahiroki/.cache/nvim/packer_hererocks/2.1.1744318430/lib/luarocks/rocks-5.1/?.lua;/Users/onoderahiroki/.cache/nvim/packer_hererocks/2.1.1744318430/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/onoderahiroki/.cache/nvim/packer_hererocks/2.1.1744318430/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ChatGPT.nvim"] = {
    config = { "\27LJ\2\n¤\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15perplexity\1\0\1\16api_key_cmd\29echo $PERPLEXITY_API_KEY\1\0\2\16api_key_cmd\25echo $OPENAI_API_KEY\15perplexity\0\nsetup\fchatgpt\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/ChatGPT.nvim",
    url = "https://github.com/jackMort/ChatGPT.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codeium.vim"] = {
    config = { "\27LJ\2\n1\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\20codeium_enabled\6g\bvim\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nÙ\3\0\0\6\0\23\0+6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\20\0'\4\21\0005\5\22\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\17:History<CR>\15<leader>fh\1\0\2\vsilent\2\fnoremap\2\17:Buffers<CR>\15<leader>fb\1\0\2\vsilent\2\fnoremap\2\f:Rg<CR>\n<C-f>\1\0\2\vsilent\2\fnoremap\2\15:Files<CR>\n<C-p>\6n\20nvim_set_keymap\bapi\1\3\0\0\14right:50%\vctrl-/\23fzf_preview_window\vwindow\1\0\1\vwindow\0\1\0\2\vheight\4³æÌ™\3³æŒÿ\3\nwidth\4Í™³æ\fÌ™³ÿ\3\15fzf_layout\6g\bvim\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["image.nvim"] = {
    config = { "\27LJ\2\nš\4\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0005\5\n\0=\5\6\4=\4\v\3=\3\f\2B\0\2\1K\0\1\0\17integrations\nneorg\1\2\0\0\tnorg\1\0\5\27download_remote_images\2 only_render_image_at_cursor\1\fenabled\2\25clear_in_insert_mode\1\14filetypes\0\rmarkdown\1\0\2\nneorg\0\rmarkdown\0\14filetypes\1\3\0\0\rmarkdown\fvimwiki\1\0\5\27download_remote_images\2 only_render_image_at_cursor\1\fenabled\2\25clear_in_insert_mode\1\14filetypes\0\1\0\b\15max_height\0\14max_width\0!max_height_window_percentage\0032\17kitty_method\vnormal\17integrations\0 max_width_window_percentage\0\fbackend\nkitty\28kitty_tmux_write_to_pty\2\nsetup\nimage\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/image.nvim",
    url = "https://github.com/3rd/image.nvim"
  },
  ["iron.nvim"] = {
    config = { "\27LJ\2\nÛ\4\0\0\a\0\31\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\v\0005\4\6\0005\5\4\0005\6\3\0=\6\5\5=\5\a\0045\5\t\0005\6\b\0=\6\5\5=\5\n\4=\4\f\3=\3\14\2B\0\2\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\28\0'\4\29\0005\5\30\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\22<cmd>IronHide<CR>\15<leader>rh\1\0\1\fnoremap\2\23<cmd>IronFocus<CR>\15<leader>rf\1\0\1\fnoremap\2\25<cmd>IronRestart<CR>\15<leader>rr\1\0\1\fnoremap\2\22<cmd>IronRepl<CR>\15<leader>rs\6n\20nvim_set_keymap\bapi\bvim\vconfig\1\0\1\vconfig\0\20repl_definition\1\0\2\18repl_open_cmd\31vertical botright 80 split\20repl_definition\0\blua\1\0\1\fcommand\0\1\2\0\0\blua\vpython\1\0\2\blua\0\vpython\0\fcommand\1\0\1\fcommand\0\1\2\0\0\fipython\nsetup\14iron.core\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/iron.nvim",
    url = "https://github.com/hkupty/iron.nvim"
  },
  ["jupyter-vim"] = {
    config = { "\27LJ\2\n¯\2\0\0\6\0\15\0\0296\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\24:JupyterConnect<CR>\15<leader>jc\1\0\1\fnoremap\2\31:JupyterImportThisFile<CR>\15<leader>ji\1\0\1\fnoremap\2\24:JupyterRunFile<CR>\15<leader>jr\6n\20nvim_set_keymap\bapi\20jupyter_mapkeys\6g\bvim\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/jupyter-vim",
    url = "https://github.com/jupyter-vim/jupyter-vim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "https://github.com/kdheepak/lazygit.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["minimap.vim"] = {
    config = { "\27LJ\2\nß\1\0\0\6\0\v\0\0216\0\0\0009\0\1\0)\1\n\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\23:MinimapToggle<CR>\15<leader>mm\6n\20nvim_set_keymap\bapi!minimap_auto_start_win_enter\23minimap_auto_start\18minimap_width\6g\bvim\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/minimap.vim",
    url = "https://github.com/wfxr/minimap.vim"
  },
  ["molten-nvim"] = {
    config = { "\27LJ\2\nê\a\0\0\6\0$\0Y6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\20\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0006\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\18\0'\3\15\0'\4\19\0005\5\20\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\30\0'\4\31\0005\5 \0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3!\0'\4\"\0005\5#\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\26:MoltenShowOutput<CR>\20<localleader>os\1\0\2\vsilent\2\fnoremap\2\26:MoltenHideOutput<CR>\20<localleader>oh\1\0\2\vsilent\2\fnoremap\2\22:MoltenDelete<CR>\20<localleader>rd\1\0\2\vsilent\2\fnoremap\2\30:MoltenReevaluateCell<CR>\20<localleader>rr\1\0\2\vsilent\2\fnoremap\2\28:MoltenEvaluateLine<CR>\20<localleader>rl\1\0\2\vsilent\2\fnoremap\2%:<C-u>MoltenEvaluateVisual<CR>gv\6v\1\0\2\vsilent\2\fnoremap\2\30:MoltenEvaluateVisual<CR>\20<localleader>vs\1\0\2\vsilent\2\fnoremap\2\20:MoltenInit<CR>\20<localleader>mi\6n\20nvim_set_keymap\bapi\31molten_virt_lines_off_by_1\28molten_virt_text_output\23molten_wrap_output\28molten_auto_open_output!molten_output_win_max_height\tnone\26molten_image_provider\6g\bvim\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/molten-nvim",
    url = "https://github.com/benlubas/molten-nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\nÖ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\blsp\1\0\1\blsp\0\roverride\1\0\1\roverride\0\1\0\3 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\0021vim.lsp.util.convert_input_to_markdown_lines\2\nsetup\nnoice\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.null-ls\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15cmp-config\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.lsp-config\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["telescope-media-files.nvim"] = {
    config = { "\27LJ\2\nÕ\2\0\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0005\2\t\0005\3\b\0005\4\6\0005\5\5\0=\5\a\4=\4\3\3=\3\n\2B\0\2\0016\0\v\0009\0\f\0009\0\r\0'\2\14\0'\3\15\0'\4\16\0005\5\17\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\31:Telescope media_files<CR>\15<leader>fp\6n\20nvim_set_keymap\bapi\bvim\15extensions\1\0\1\15extensions\0\1\0\1\16media_files\0\14filetypes\1\0\2\14filetypes\0\rfind_cmd\arg\1\5\0\0\bpng\bjpg\tjpeg\bgif\nsetup\16media_files\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n‰\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\a\0005\5\6\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\rdefaults\1\0\1\rdefaults\0\18layout_config\15horizontal\1\0\1\15horizontal\0\1\0\1\18preview_width\4³æÌ™\3³æŒÿ\3\25file_ignore_patterns\1\0\2\18layout_config\0\25file_ignore_patterns\0\1\3\0\0\17node_modules\n.git/\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    config = { "\27LJ\2\nÁ\1\0\0\6\0\r\0\0196\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\20:DBUIToggle<CR>\15<leader>db\6n\20nvim_set_keymap\bapi\v/db_ui\tdata\fstdpath\afn\24db_ui_save_location\6g\bvim\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-translator"] = {
    config = { "\27LJ\2\nF\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\ndeepl\31translator_default_engines\6g\bvim\0" },
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  ["zoxide.vim"] = {
    loaded = true,
    path = "/Users/onoderahiroki/.local/share/nvim/site/pack/packer/start/zoxide.vim",
    url = "https://github.com/nanotee/zoxide.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-translator
time([[Config for vim-translator]], true)
try_loadstring("\27LJ\2\nF\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\ndeepl\31translator_default_engines\6g\bvim\0", "config", "vim-translator")
time([[Config for vim-translator]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\nÙ\3\0\0\6\0\23\0+6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\1=\1\2\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\20\0'\4\21\0005\5\22\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\17:History<CR>\15<leader>fh\1\0\2\vsilent\2\fnoremap\2\17:Buffers<CR>\15<leader>fb\1\0\2\vsilent\2\fnoremap\2\f:Rg<CR>\n<C-f>\1\0\2\vsilent\2\fnoremap\2\15:Files<CR>\n<C-p>\6n\20nvim_set_keymap\bapi\1\3\0\0\14right:50%\vctrl-/\23fzf_preview_window\vwindow\1\0\1\vwindow\0\1\0\2\vheight\4³æÌ™\3³æŒÿ\3\nwidth\4Í™³æ\fÌ™³ÿ\3\15fzf_layout\6g\bvim\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: molten-nvim
time([[Config for molten-nvim]], true)
try_loadstring("\27LJ\2\nê\a\0\0\6\0$\0Y6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\20\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0006\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\18\0'\3\15\0'\4\19\0005\5\20\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\30\0'\4\31\0005\5 \0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3!\0'\4\"\0005\5#\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\26:MoltenShowOutput<CR>\20<localleader>os\1\0\2\vsilent\2\fnoremap\2\26:MoltenHideOutput<CR>\20<localleader>oh\1\0\2\vsilent\2\fnoremap\2\22:MoltenDelete<CR>\20<localleader>rd\1\0\2\vsilent\2\fnoremap\2\30:MoltenReevaluateCell<CR>\20<localleader>rr\1\0\2\vsilent\2\fnoremap\2\28:MoltenEvaluateLine<CR>\20<localleader>rl\1\0\2\vsilent\2\fnoremap\2%:<C-u>MoltenEvaluateVisual<CR>gv\6v\1\0\2\vsilent\2\fnoremap\2\30:MoltenEvaluateVisual<CR>\20<localleader>vs\1\0\2\vsilent\2\fnoremap\2\20:MoltenInit<CR>\20<localleader>mi\6n\20nvim_set_keymap\bapi\31molten_virt_lines_off_by_1\28molten_virt_text_output\23molten_wrap_output\28molten_auto_open_output!molten_output_win_max_height\tnone\26molten_image_provider\6g\bvim\0", "config", "molten-nvim")
time([[Config for molten-nvim]], false)
-- Config for: image.nvim
time([[Config for image.nvim]], true)
try_loadstring("\27LJ\2\nš\4\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0005\5\n\0=\5\6\4=\4\v\3=\3\f\2B\0\2\1K\0\1\0\17integrations\nneorg\1\2\0\0\tnorg\1\0\5\27download_remote_images\2 only_render_image_at_cursor\1\fenabled\2\25clear_in_insert_mode\1\14filetypes\0\rmarkdown\1\0\2\nneorg\0\rmarkdown\0\14filetypes\1\3\0\0\rmarkdown\fvimwiki\1\0\5\27download_remote_images\2 only_render_image_at_cursor\1\fenabled\2\25clear_in_insert_mode\1\14filetypes\0\1\0\b\15max_height\0\14max_width\0!max_height_window_percentage\0032\17kitty_method\vnormal\17integrations\0 max_width_window_percentage\0\fbackend\nkitty\28kitty_tmux_write_to_pty\2\nsetup\nimage\frequire\0", "config", "image.nvim")
time([[Config for image.nvim]], false)
-- Config for: minimap.vim
time([[Config for minimap.vim]], true)
try_loadstring("\27LJ\2\nß\1\0\0\6\0\v\0\0216\0\0\0009\0\1\0)\1\n\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\23:MinimapToggle<CR>\15<leader>mm\6n\20nvim_set_keymap\bapi!minimap_auto_start_win_enter\23minimap_auto_start\18minimap_width\6g\bvim\0", "config", "minimap.vim")
time([[Config for minimap.vim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.null-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: iron.nvim
time([[Config for iron.nvim]], true)
try_loadstring("\27LJ\2\nÛ\4\0\0\a\0\31\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\v\0005\4\6\0005\5\4\0005\6\3\0=\6\5\5=\5\a\0045\5\t\0005\6\b\0=\6\5\5=\5\n\4=\4\f\3=\3\14\2B\0\2\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\15\0009\0\16\0009\0\17\0'\2\18\0'\3\28\0'\4\29\0005\5\30\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\22<cmd>IronHide<CR>\15<leader>rh\1\0\1\fnoremap\2\23<cmd>IronFocus<CR>\15<leader>rf\1\0\1\fnoremap\2\25<cmd>IronRestart<CR>\15<leader>rr\1\0\1\fnoremap\2\22<cmd>IronRepl<CR>\15<leader>rs\6n\20nvim_set_keymap\bapi\bvim\vconfig\1\0\1\vconfig\0\20repl_definition\1\0\2\18repl_open_cmd\31vertical botright 80 split\20repl_definition\0\blua\1\0\1\fcommand\0\1\2\0\0\blua\vpython\1\0\2\blua\0\vpython\0\fcommand\1\0\1\fcommand\0\1\2\0\0\fipython\nsetup\14iron.core\frequire\0", "config", "iron.nvim")
time([[Config for iron.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15cmp-config\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: jupyter-vim
time([[Config for jupyter-vim]], true)
try_loadstring("\27LJ\2\n¯\2\0\0\6\0\15\0\0296\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\24:JupyterConnect<CR>\15<leader>jc\1\0\1\fnoremap\2\31:JupyterImportThisFile<CR>\15<leader>ji\1\0\1\fnoremap\2\24:JupyterRunFile<CR>\15<leader>jr\6n\20nvim_set_keymap\bapi\20jupyter_mapkeys\6g\bvim\0", "config", "jupyter-vim")
time([[Config for jupyter-vim]], false)
-- Config for: telescope-media-files.nvim
time([[Config for telescope-media-files.nvim]], true)
try_loadstring("\27LJ\2\nÕ\2\0\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0005\2\t\0005\3\b\0005\4\6\0005\5\5\0=\5\a\4=\4\3\3=\3\n\2B\0\2\0016\0\v\0009\0\f\0009\0\r\0'\2\14\0'\3\15\0'\4\16\0005\5\17\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\31:Telescope media_files<CR>\15<leader>fp\6n\20nvim_set_keymap\bapi\bvim\15extensions\1\0\1\15extensions\0\1\0\1\16media_files\0\14filetypes\1\0\2\14filetypes\0\rfind_cmd\arg\1\5\0\0\bpng\bjpg\tjpeg\bgif\nsetup\16media_files\19load_extension\14telescope\frequire\0", "config", "telescope-media-files.nvim")
time([[Config for telescope-media-files.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.lsp-config\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n‰\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\a\0005\5\6\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\rdefaults\1\0\1\rdefaults\0\18layout_config\15horizontal\1\0\1\15horizontal\0\1\0\1\18preview_width\4³æÌ™\3³æŒÿ\3\25file_ignore_patterns\1\0\2\18layout_config\0\25file_ignore_patterns\0\1\3\0\0\17node_modules\n.git/\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: ChatGPT.nvim
time([[Config for ChatGPT.nvim]], true)
try_loadstring("\27LJ\2\n¤\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15perplexity\1\0\1\16api_key_cmd\29echo $PERPLEXITY_API_KEY\1\0\2\16api_key_cmd\25echo $OPENAI_API_KEY\15perplexity\0\nsetup\fchatgpt\frequire\0", "config", "ChatGPT.nvim")
time([[Config for ChatGPT.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21config.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: vim-dadbod-ui
time([[Config for vim-dadbod-ui]], true)
try_loadstring("\27LJ\2\nÁ\1\0\0\6\0\r\0\0196\0\0\0009\0\1\0006\1\0\0009\1\3\0019\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\20:DBUIToggle<CR>\15<leader>db\6n\20nvim_set_keymap\bapi\v/db_ui\tdata\fstdpath\afn\24db_ui_save_location\6g\bvim\0", "config", "vim-dadbod-ui")
time([[Config for vim-dadbod-ui]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\blsp\1\0\1\blsp\0\roverride\1\0\1\roverride\0\1\0\3 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\0021vim.lsp.util.convert_input_to_markdown_lines\2\nsetup\nnoice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: codeium.vim
time([[Config for codeium.vim]], true)
try_loadstring("\27LJ\2\n1\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\20codeium_enabled\6g\bvim\0", "config", "codeium.vim")
time([[Config for codeium.vim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
