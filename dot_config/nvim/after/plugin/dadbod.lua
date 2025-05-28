-- vim-dadbod設定
vim.g.db_ui_save_location = vim.fn.stdpath('data') .. '/db_ui'
vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1

-- 接続を自動的に設定
vim.g.dbs = {
  pg_local = 'postgresql://postgres@localhost/postgres',
  sqlite_main = 'sqlite:~/databases/main.db'
}

-- キーマッピング
vim.api.nvim_set_keymap('n', '<leader>du', ':DBUIToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>df', ':DBUIFindBuffer<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dr', ':DBUIRenameBuffer<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dq', ':DBUILastQueryInfo<CR>', {noremap = true, silent = true})

-- SQLの自動補完を設定
vim.cmd([[
  autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = { { name = 'vim-dadbod-completion' }, { name = 'buffer' } } })
]])
