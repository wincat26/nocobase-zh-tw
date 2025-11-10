# 使用官方 NocoBase 映像
FROM nocobase/nocobase:main

# 設定工作目錄
WORKDIR /app

# 複製所有繁體中文語言包
COPY packages/ ./packages/

# 設定環境變數
ENV DEFAULT_LOCALE=zh-TW
ENV INIT_ROOT_EMAIL=admin@nocobase.com
ENV INIT_ROOT_PASSWORD=admin123
ENV INIT_ROOT_NICKNAME=管理員
ENV APP_PORT=13000

# 暴露端口
EXPOSE 13000