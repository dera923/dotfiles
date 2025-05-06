-- config/nvim-tree.lua
local M = {}

function M.setup()
  require('nvim-tree').setup({
    sort_by = "case_sensitive",
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
  })
end

return M