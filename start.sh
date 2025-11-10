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
# 嘗試不同的啟動方式
if command -v nocobase >/dev/null 2>&1; then
    exec yarn nocobase start
else
    echo "⚠️ nocobase 命令找不到，使用替代方式..."
    exec node packages/core/app/lib/index.js start
fi