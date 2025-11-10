FROM node:18-alpine

# 設定工作目錄
WORKDIR /app

# 安裝系統依賴
RUN apk add --no-cache \
    git \
    python3 \
    make \
    g++ \
    sqlite

# 複製 package.json 和 yarn.lock
COPY package.json yarn.lock ./

# 安裝依賴
RUN yarn install --frozen-lockfile

# 複製源碼
COPY . .

# 初始化和建置
RUN yarn nocobase install --silent
RUN yarn build

# 暴露端口
EXPOSE 13000

# 設定環境變數
ENV NODE_ENV=production
ENV APP_ENV=production
ENV APP_HOST=0.0.0.0
ENV APP_PORT=13000
ENV DEFAULT_LOCALE=zh-TW

# 複製啟動腳本
COPY start.sh ./
RUN chmod +x start.sh

# 啟動命令
CMD ["./start.sh"]