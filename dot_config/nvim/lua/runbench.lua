vim.api.nvim_create_user_command("RunBench", function(opts)
  local file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")
  local lang_map = {
    py = "python",
    c = "c",
    go = "go",
    rs = "rust",
    java = "java",
    sql = "sql"
  }
  local lang = lang_map[ext] or "unknown"
  if lang == "unknown" then
    print("Unsupported file extension: " .. ext)
    return
  end
  vim.cmd("silent !run_bench " .. lang .. " " .. file)
  print("Benchmark sent for " .. file .. " [" .. lang .. "]")
end, {})
