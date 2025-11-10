# NocoBase 繁體中文版

這是 NocoBase 的完整繁體中文化版本，專為台灣、香港、澳門等繁體中文使用者打造。

## 🎯 特色

- ✅ **完整繁體中文化** - 所有 UI 介面、外掛、文件都已轉換為繁體中文
- ✅ **一鍵部署** - 支援 Zeabur、Docker、本地部署
- ✅ **預設繁體中文** - 系統預設語言設定為繁體中文
- ✅ **台灣本土化** - 針對台灣使用習慣進行優化

## 🚀 快速部署到 Zeabur

[![Deploy on Zeabur](https://zeabur.com/button.svg)](https://zeabur.com/templates)

### 部署步驟

1. 點擊上方 "Deploy on Zeabur" 按鈕
2. 選擇此 GitHub 倉庫
3. 等待自動部署完成
4. 使用預設帳號登入：
   - 帳號：`admin@nocobase.com`
   - 密碼：`admin123`

## 🛠️ 本地開發

### 環境需求

- Node.js 18+
- PostgreSQL 12+
- Yarn 1.22+

### 安裝步驟

```bash
# 1. Clone 專案
git clone https://github.com/your-username/nocobase-zh-tw.git
cd nocobase-zh-tw

# 2. 安裝依賴
yarn install

# 3. 設定環境變數
cp .env.example .env
# 編輯 .env 檔案，設定資料庫連線

# 4. 初始化資料庫
yarn nocobase install

# 5. 啟動開發伺服器
yarn dev
```

## 📋 繁體中文化內容

### 已完成轉換

- ✅ 核心系統介面 (85+ 檔案)
- ✅ 所有官方外掛
- ✅ 使用者手冊和文件
- ✅ 錯誤訊息和提示
- ✅ 表單驗證訊息
- ✅ 選單和導覽

### 轉換對照

| 簡體中文 | 繁體中文 |
|---------|---------|
| 数据表 | 資料表 |
| 字段 | 欄位 |
| 用户 | 使用者 |
| 设置 | 設定 |
| 编辑 | 編輯 |
| 删除 | 刪除 |
| 创建 | 建立 |
| 保存 | 儲存 |

## 🔧 環境變數配置

```env
# 應用設定
APP_ENV=production
APP_HOST=0.0.0.0
APP_PORT=13000
DEFAULT_LOCALE=zh-TW

# 資料庫設定
DB_DIALECT=postgres
DB_HOST=your-db-host
DB_PORT=5432
DB_DATABASE=nocobase
DB_USER=your-username
DB_PASSWORD=your-password

# 管理員帳號
INIT_ROOT_EMAIL=admin@nocobase.com
INIT_ROOT_PASSWORD=admin123
INIT_ROOT_NICKNAME=管理員
```

## 📚 使用說明

### 登入系統

1. 開啟瀏覽器，訪問部署的網址
2. 使用預設管理員帳號登入
3. 系統將自動使用繁體中文介面

### 建立資料表

1. 點擊「資料表配置」
2. 選擇「建立資料表」
3. 填寫資料表名稱和欄位
4. 儲存設定

### 設計介面

1. 點擊右上角「介面配置」圖示
2. 拖曳區塊到頁面
3. 配置區塊屬性
4. 儲存變更

## 🤝 貢獻指南

歡迎提交 Issue 和 Pull Request 來改善繁體中文化品質！

### 回報問題

如果發現翻譯錯誤或遺漏，請：

1. 在 GitHub 建立 Issue
2. 描述問題位置和建議修正
3. 提供螢幕截圖（如適用）

### 提交改善

1. Fork 此專案
2. 建立功能分支
3. 修改翻譯檔案
4. 提交 Pull Request

## 📄 授權

本專案基於 [AGPL-3.0](LICENSE) 授權，與 NocoBase 官方保持一致。

## 🔗 相關連結

- [NocoBase 官方網站](https://www.nocobase.com/)
- [NocoBase 官方文件](https://docs.nocobase.com/)
- [NocoBase GitHub](https://github.com/nocobase/nocobase)
- [Zeabur 部署平台](https://zeabur.com/)

## 💬 社群支援

- 📧 Email: support@your-domain.com
- 💬 Telegram: @nocobase-zh-tw
- 🐛 Issues: [GitHub Issues](https://github.com/your-username/nocobase-zh-tw/issues)

---

**讓 NocoBase 說繁體中文！** 🇹🇼