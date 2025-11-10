# 使用官方 NocoBase 映像
FROM nocobase/nocobase:main

# 設定工作目錄
WORKDIR /app

# 複製所有繁體中文語言包
COPY packages/ ./packages/

# 設定環境變數
ENV NODE_ENV=production
ENV APP_ENV=production
ENV APP_HOST=0.0.0.0
ENV APP_PORT=13000
ENV DEFAULT_LOCALE=zh-TW
ENV INIT_ROOT_EMAIL=admin@nocobase.com
ENV INIT_ROOT_PASSWORD=admin123
ENV INIT_ROOT_NICKNAME=管理員
ENV DB_DIALECT=postgres

# 暴露端口
EXPOSE 13000

# 複製健康檢查腳本
COPY healthcheck.js ./

# 健康檢查
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD node healthcheck.js

# 啟動命令
CMD ["yarn", "start"]