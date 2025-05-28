
vim内で可視化を行うためのユーティリティ

local M = {}

-- ASCIIグラフを表示
function M.ascii_chart(data, labels, title)
  -- 新しいバッファを作成
  vim.cmd('new')
  vim.cmd('setlocal buftype=nofile')
  vim.cmd('setlocal bufhidden=wipe')
  
  -- タイトルを挿入
  local lines = {title or "データ可視化", ""}
  
  -- 最大値を取得
  local max_val = 0
  for _, val in ipairs(data) do
    if val > max_val then max_val = val end
  end
  
  -- 棒グラフの最大幅
  local max_width = 50
  
  -- 各データの棒グラフを作成
  for i, val in ipairs(data) do
    local label = labels and labels[i] or tostring(i)
    local bar_len = math.floor((val / max_val) * max_width)
    local bar = string.rep('█', bar_len)
    table.insert(lines, string.format("%-8s | %s %d", label, bar, val))
  end
  
  -- 統計情報
  local sum = 0
  for _, val in ipairs(data) do sum = sum + val end
  local avg = sum / #data
  
  table.insert(lines, "")
  table.insert(lines, string.format("合計: %d", sum))
  table.insert(lines, string.format("平均: %.2f", avg))
  
  -- バッファに行を挿入
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.cmd('setlocal nomodifiable')
  vim.cmd('setlocal filetype=markdown')
end

-- 外部コマンドで生成したプロットを表示（gnuplot, matplotlib等）
function M.external_plot(data, labels, title, plot_type)
  -- 一時ファイルを作成
  local data_file = os.tmpname()
  local f = io.open(data_file, 'w')
  
  -- データの書き出し
  f:write("# index label value\n")
  for i, val in ipairs(data) do
    local label = labels and labels[i] or tostring(i)
    f:write(string.format("%d %s %f\n", i, label, val))
  end
  f:close()
  
  -- プロットタイプに基づいてコマンドを選択
  local cmd
  if plot_type == "gnuplot" then
    local script_file = os.tmpname()
    local sf = io.open(script_file, 'w')
    sf:write(string.format([[
      set terminal dumb 80 24
      set title "%s"
      set style data histogram
      set style fill solid
      set xtics rotate by -45
      plot "%s" using 3:xtic(2) title "Values"
    ]], title or "Data Plot", data_file))
    sf:close()
    cmd = string.format("gnuplot %s", script_file)
  elseif plot_type == "matplotlib" then
    cmd = string.format([[
      python3 -c "
import matplotlib.pyplot as plt
import numpy as np
data = np.loadtxt('%s', skiprows=1)
plt.figure(figsize=(10, 6))
plt.bar(data[:, 0], data[:, 2])
plt.title('%s')
plt.savefig('/tmp/nvim_plot.png')
print('Plot saved to /tmp/nvim_plot.png')
      "
    ]], data_file, title or "Data Plot")
  else
    -- デフォルトはシンプルなPython出力
    cmd = string.format([[
      python3 -c "
import sys
data = []
with open('%s') as f:
    for line in f:
        if line.startswith('#'): continue
        parts = line.strip().split()
        if len(parts) >= 3:
            data.append((parts[1], float(parts[2])))
print('=== %s ===')
for label, val in data:
    bar = '#' * int(val / max(v for _, v in data) * 40)
    print(f'{label:8} | {bar} {val}')
      "
    ]], data_file, title or "Data Plot")
  end
  
  -- 新しいバッファでコマンドを実行
  vim.cmd('new')
  vim.cmd('setlocal buftype=nofile')
  vim.cmd(string.format('read !%s', cmd))
  vim.cmd('setlocal nomodifiable')
  
  -- 一時ファイルを削除
  os.remove(data_file)
  if plot_type == "gnuplot" then
    os.remove(script_file)
  end
end

-- REPLにコードを送信する関数
function M.send_to_repl(code)
  if vim.fn.exists(':IronRepl') == 2 then
    -- iron.nvimが利用可能
    if not vim.g.iron.repl_open then
      vim.cmd('IronRepl')
    end
    require('iron.core').send(nil, code)
  else
    -- 代替手段：terminal
    if vim.fn.bufnr('term://') == -1 then
      vim.cmd('terminal')
    end
    vim.api.nvim_chan_send(vim.b.terminal_job_id, code .. "\n")
  end
end

-- メモリ内の変数を使って可視化するショートカット
M.data = {23, 45, 67, 89, 76, 54}
M.labels = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'}

-- クイック可視化関数（メニュー表示）
function M.quick_visualize()
  local options = {
    "1. ASCIIグラフ表示",
    "2. Gnuplotで可視化 (要インストール)",
    "3. Pythonで可視化 (要Matplotlib)",
    "4. REPLでデータを処理",
    "5. キャンセル"
  }
  
  vim.ui.select(options, {
    prompt = "可視化方法を選択:",
  }, function(choice)
    if not choice then return end
    
    if choice:match("^1") then
      M.ascii_chart(M.data, M.labels, "データ可視化")
    elseif choice:match("^2") then
      M.external_plot(M.data, M.labels, "Gnuplotグラフ", "gnuplot")
    elseif choice:match("^3") then
      M.external_plot(M.data, M.labels, "Matplotlibグラフ", "matplotlib")
    elseif choice:match("^4") then
      local code = "data = " .. vim.inspect(M.data) .. "\n" ..
                  "labels = " .. vim.inspect(M.labels) .. "\n" ..
                  "print('データロード完了!')"
      M.send_to_repl(code)
    end
  end)
end

return M
