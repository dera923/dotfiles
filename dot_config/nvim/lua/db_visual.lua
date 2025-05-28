-- ~/.config/nvim/lua/db_visual.lua（簡略版）
local M = {}

-- SQLiteデータベースに接続する関数
function M.connect_sqlite(db_path)
  print("SQLite database connected: " .. db_path)
  return db_path
end

-- SQLクエリを実行してその結果を取得する関数
function M.execute_query(db_path, query)
  -- 一時ファイルにクエリを保存
  local temp_file = vim.fn.tempname() .. ".sql"
  local file = io.open(temp_file, "w")
  file:write(query)
  file:close()
  
  -- SQLiteコマンドを直接実行し、結果を取得
  local result_file = vim.fn.tempname()
  local cmd = string.format("sqlite3 %s < %s > %s", db_path, temp_file, result_file)
  os.execute(cmd)
  
  -- 結果を読み込む
  local result = ""
  local f = io.open(result_file, "r")
  if f then
    result = f:read("*all")
    f:close()
  end
  
  -- 一時ファイルを削除
  os.remove(temp_file)
  os.remove(result_file)
  
  return result
end

-- クエリ結果を可視化する関数
function M.visualize_query(db_path, query, title)
  -- データベースに接続
  db_path = M.connect_sqlite(db_path)
  
  -- クエリを実行して結果を取得
  local result = M.execute_query(db_path, query)
  
  -- 結果がなければ終了
  if result == "" then
    print("クエリの結果がありません")
    return
  end
  
  -- 結果を解析
  local labels = {}
  local values = {}
  
  for line in result:gmatch("[^\r\n]+") do
    local parts = {}
    for part in line:gmatch("%S+") do
      table.insert(parts, part)
    end
    
    if #parts >= 2 and tonumber(parts[2]) then
      table.insert(labels, parts[1])
      table.insert(values, tonumber(parts[2]))
    end
  end
  
  -- データがあれば可視化
  if #values > 0 then
    -- visualizeモジュールを使用
    local visualize = require('visualize')
    visualize.bar_chart(values, labels, title or "SQLクエリ結果")
  else
    print("可視化できるデータがありません")
  end
end

-- サンプルデモ関数
function M.demo()
  -- サンプルデータベースファイルのパス
  local db_path = vim.fn.expand("~/nvim_test/sql/sample.db")
  
  -- サンプルSQLファイルを実行してデータベースを作成
  local init_sql = [[
  CREATE TABLE IF NOT EXISTS sales (
    id INTEGER PRIMARY KEY,
    year INTEGER,
    month INTEGER,
    product TEXT,
    amount INTEGER
  );
  
  -- サンプルデータ挿入（既存データを削除）
  DELETE FROM sales;
  INSERT INTO sales (year, month, product, amount) VALUES
    (2023, 1, '商品A', 120),
    (2023, 2, '商品A', 150),
    (2023, 3, '商品A', 180),
    (2023, 4, '商品A', 210),
    (2023, 5, '商品A', 250),
    (2023, 6, '商品A', 290),
    (2023, 1, '商品B', 85),
    (2023, 2, '商品B', 95),
    (2023, 3, '商品B', 125),
    (2023, 4, '商品B', 155),
    (2023, 5, '商品B', 175),
    (2023, 6, '商品B', 195);
  ]]
  
  -- 初期化SQLを実行
  local init_file = vim.fn.tempname() .. ".sql"
  local file = io.open(init_file, "w")
  file:write(init_sql)
  file:close()
  
  os.execute("sqlite3 " .. db_path .. " < " .. init_file)
  os.remove(init_file)
  
  -- 月別売上クエリ実行と可視化
  local query = "SELECT month, SUM(amount) as total_sales FROM sales WHERE year = 2023 GROUP BY month ORDER BY month"
  M.visualize_query(db_path, query, "2023年月別売上")
end

return M
