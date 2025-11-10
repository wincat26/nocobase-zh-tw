#!/bin/bash

echo "🚀 NocoBase 繁體中文版 - Zeabur 部署腳本"
echo "=================================="

# 檢查是否已推送到 GitHub
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "❌ 請先將代碼推送到 GitHub"
    echo "執行以下指令："
    echo "git remote add origin https://github.com/YOUR_USERNAME/nocobase-zh-tw.git"
    echo "git push -u origin main"
    exit 1
fi

echo "✅ Git 倉庫已設定"

# 檢查 zeabur.json 是否存在
if [ ! -f "zeabur.json" ]; then
    echo "❌ zeabur.json 檔案不存在"
    exit 1
fi

echo "✅ Zeabur 配置檔案已就緒"

echo ""
echo "📋 部署資訊："
echo "- 專案名稱: nocobase-zh-tw"
echo "- 預設語言: 繁體中文 (zh-TW)"
echo "- 預設帳號: admin@nocobase.com"
echo "- 預設密碼: admin123"
echo ""

echo "🔗 請前往 Zeabur Dashboard 完成部署："
echo "https://dash.zeabur.com"
echo ""
echo "部署步驟："
echo "1. 點擊 'New Project'"
echo "2. 選擇 'Deploy from GitHub'"
echo "3. 選擇 'nocobase-zh-tw' 倉庫"
echo "4. 等待自動部署完成"
echo ""
echo "🎉 部署完成後即可使用繁體中文 NocoBase！"