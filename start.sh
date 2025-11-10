#!/bin/bash

echo "🚀 啟動 NocoBase 繁體中文版..."

# 等待資料庫就緒
echo "⏳ 等待資料庫連線..."
sleep 10

# 初始化資料庫（如果需要）
if [ "$NODE_ENV" = "production" ]; then
    echo "🔧 初始化生產環境..."
    yarn nocobase install --silent || echo "⚠️ 初始化警告，繼續啟動..."
fi

# 啟動應用
echo "✅ 啟動 NocoBase..."
exec yarn nocobase start