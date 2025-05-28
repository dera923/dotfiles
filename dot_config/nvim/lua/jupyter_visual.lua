-- jupyter_visual.lua（簡易版）
local M = {}

-- シンプルなPythonスクリプトを作成する関数
function M.create_simple_example()
  -- 新しいバッファを作成
  vim.cmd('new')
  vim.cmd('setlocal filetype=python')
  
  -- サンプルコードを挿入
  local code = [[
# シンプルな可視化サンプル

import matplotlib.pyplot as plt
import numpy as np

# サンプルデータ
months = ['1月', '2月', '3月', '4月', '5月', '6月']
sales_a = [120, 150, 180, 210, 250, 290]
sales_b = [85, 95, 125, 155, 175, 195]

# 棒グラフの作成
plt.figure(figsize=(10, 6))
plt.bar(months, sales_a, color='royalblue', alpha=0.7, label='商品A')
plt.bar(months, sales_b, color='crimson', alpha=0.7, label='商品B', bottom=sales_a)
plt.title('月別売上（積み上げ棒グラフ）', fontsize=15)
plt.xlabel('月')
plt.ylabel('売上')
plt.legend()
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.tight_layout()

# 保存（Neovimから直接見るため）
plt.savefig('/tmp/sales_chart.png')
plt.close()

print("グラフを /tmp/sales_chart.png に保存しました")
print("ターミナルで次のコマンドを実行して表示できます: open /tmp/sales_chart.png")
]]

  -- バッファにコードを挿入
  local lines = {}
  for line in code:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  
  -- ファイル名を設定
  vim.cmd('file simple_viz_example.py')
  
  -- 保存
  vim.cmd('write')
  
  print("シンプルな可視化スクリプトを作成しました")
  print("実行するには: :!python3 %")
end

return M
