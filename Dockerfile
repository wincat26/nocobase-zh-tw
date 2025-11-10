# 使用官方 NocoBase 映像
FROM nocobase/nocobase:main

# 設定工作目錄
WORKDIR /app

# 複製繁體中文語言包
COPY packages/core/client/src/locale/zh-TW.json ./packages/core/client/src/locale/
COPY packages/plugins/@nocobase/plugin-localization/src/locale/zh-TW.json ./packages/plugins/@nocobase/plugin-localization/src/locale/

# 複製所有繁體中文檔案
COPY packages/plugins/@nocobase/*/src/locale/zh-TW.json ./packages/plugins/@nocobase/*/src/locale/ 2>/dev/null || true
COPY packages/plugins/@nocobase/*/src/server/locale/zh-TW.json ./packages/plugins/@nocobase/*/src/server/locale/ 2>/dev/null || true

# 設定環境變數
ENV DEFAULT_LOCALE=zh-TW
ENV INIT_ROOT_EMAIL=admin@nocobase.com
ENV INIT_ROOT_PASSWORD=admin123
ENV INIT_ROOT_NICKNAME=管理員
ENV APP_PORT=13000

# 暴露端口
EXPOSE 13000