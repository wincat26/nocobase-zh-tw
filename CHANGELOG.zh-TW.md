# 更新日誌

本專案的所有重要更改都将記錄在此檔案中。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/),
并且本專案遵循 [语义化版本](https://semver.org/spec/v2.0.0.html)。

## [v1.9.3](https://github.com/nocobase/nocobase/compare/v1.9.2...v1.9.3) - 2025-11-05

### 🚀 最佳化

- **[database]** 对 MariaDB 連線實例增加 `multipleStatements` 選項，以支持一次查詢中呼叫多条语句 ([#7781](https://github.com/nocobase/nocobase/pull/7781)) by @mytharcher

- **[工作流]** 支持工作流中的資料区块使用一致的詳情区块配置選單 ([#7771](https://github.com/nocobase/nocobase/pull/7771)) by @mytharcher

### 🐛 修復

- **[server]** 使用應用名称隔离發布订阅的频道 ([#7762](https://github.com/nocobase/nocobase/pull/7762)) by @mytharcher

- **[client]** 修復 “Maximum call stack size exceeded” ([#7780](https://github.com/nocobase/nocobase/pull/7780)) by @zhangzhonghe

- **[database]** 欄位名为 snake_case 风格時，索引欄位判断不正確的问题 ([#7776](https://github.com/nocobase/nocobase/pull/7776)) by @2013xile

- **[工作流]** 修復了集群模式下工作流排程器無法正確識別空闲狀態的问题，该问题可能导致外掛未就绪就開始消费佇列事件 ([#7768](https://github.com/nocobase/nocobase/pull/7768)) by @mytharcher

- **[行動裝置（已废弃）]** 修復行動裝置的日期欄位預設值彈出視窗無法選取日期的问题 ([#7783](https://github.com/nocobase/nocobase/pull/7783)) by @zhangzhonghe

- **[工作流：审批]** 修復複製审批工作流時报错的问题 by @mytharcher

- **[邮件管理]** mailMessages新增索引 by @jiannx

## [v1.9.2](https://github.com/nocobase/nocobase/compare/v1.9.1...v1.9.2) - 2025-11-04

### 🚀 最佳化

- **[工作流：审批]** 在转签和加签時通知新的审批人 by @mytharcher

### 🐛 修復

- **[工作流]** 修復在服務拆分模式下，手動執行带中断节点的工作流一直等待的问题 ([#7767](https://github.com/nocobase/nocobase/pull/7767)) by @mytharcher

- **[邮件管理]** 给索引新增迁移腳本 by @jiannx

## [v1.9.1](https://github.com/nocobase/nocobase/compare/v1.9.0...v1.9.1) - 2025-11-04

### 🐛 修復

- **[工作流：审批]** 並行分支中不再支持建立审批节点，避免流程狀態导致的问题 by @mytharcher

- **[邮件管理]** 新增同步日誌 by @jiannx

## [v1.9.0](https://github.com/nocobase/nocobase/compare/v1.8.33...v1.9.0) - 2025-11-02

## 新特性

### 欄位驗證規則

支持为欄位配置多种驗證規則（如必填、格式、長度、範圍、正则表达式等），在表单提交時自動校验输入資料，确保資料准确性一致性。驗證规可在欄位設定中灵活配置。

![Field_validations.gif](https://static-docs.nocobase.com/20251031111521_rec_-6mjzt5.gif)

参考檔案：[欄位驗證](https://docs-cn.nocobase.com/handbook/data-modeling/collection-fields/validation)

### 表格区块支持新增「列設定」

允許使用者在不进入編輯模式的情况下調整列順序、可見性和固定位置，从而使資料顯示更加灵活和使用者友好

![20251031113318_rec_-5ffltd.gif](https://static-docs.nocobase.com/20251031113318_rec_-5ffltd.gif)

### 审批新增「資料儲存前」觸發模式

审批現在支持“資料儲存前”觸發模式——啟用后，审批发起時不会儲存資料，只有在审批通過后才会儲存資料。

![image-m52wzz.png](https://static-docs.nocobase.com/image-m52wzz.png)

### 审批觸發器中开放审批单据編號變數以供使用

公開了 Approval ID 變數，允許在工作流其他节点中參考，以实现更灵活的配置和資料追蹤。

![approcal_id.png](https://static-docs.nocobase.com/image-qsspfn.png)

### [非同步任務管理器] 支持通過環境變數和佇列进行非同步任務服務拆分

新增服務拆分机制，支持通過 `WORKER_MODE` 環境變數将工作流、非同步任務等服務独立執行，实现多节点部署与效能最佳化。

![20250803214857](https://static-docs.nocobase.com/20250803214857.png)

参考檔案：[服務拆分](https://docs-cn.nocobase.com/welcome/getting-started/deployment/cluster-mode/services-splitting)

### 新增用于處理佇列訊息的事件佇列

增加了一个專用的事件佇列来處理系統佇列訊息，提高了非同步任務處理能力和可靠性。

参考檔案：[集群模式：訊息佇列](https://docs-cn.nocobase.com/welcome/getting-started/deployment/cluster-mode#%E6%B6%88%E6%81%AF%E9%98%9F%E5%88%97)

### 为應用增加优雅停机的生命週期處理

引入了优雅關閉處理机制，在應用进程收到 SIGTERM / SIGINT 信号時，開始處理關閉流程，以避免部分進行中的資料操作造成的问题。

## 最佳化

### 系統表自增 ID 改为 53 位類別雪花 ID

将主鍵为自增 ID 且不具备唯一識別的系統表的 ID 修改为 53 位的類別雪花演算法 ID

![image-jrjc7e.png](https://static-docs.nocobase.com/image-jrjc7e.png)

### 支持檢視和繼續執行已停用工作流中的人工待办任務

人工待办的区块清單不再限制已停用工作流的待办任務展示，并允許对待办繼續提交。

### 邮件管理器

* 邮件資料支持重新同步
* 允許調整插入到邮件編輯器中的圖片大小
* 富文本編輯器支持软换行，最佳化邮件排版体验。
* 最佳化邮件清單效能，操作更流畅。

![20251031234300_rec_-jifryr.gif](https://static-docs.nocobase.com/20251031234300_rec_-jifryr.gif)

### 工作流模組最佳化

- 最佳化了 Workflow 模組中佇列執行相关的查詢效能，使用了分离欄位与索引来提升資料检索效率。

![Workflow Module.png](https://static-docs.nocobase.com/image-5b3byb.png)

## [v1.8.33](https://github.com/nocobase/nocobase/compare/v1.8.32...v1.8.33) - 2025-10-29

### 🚀 最佳化

- **[server]** 增加 Gateway 层日誌 ([#7683](https://github.com/nocobase/nocobase/pull/7683)) by @2013xile

### 🐛 修復

- **[database]** 跳過 MySQL JSON 列的預設值同步處理 ([#7696](https://github.com/nocobase/nocobase/pull/7696)) by @2013xile

- **[client]**
  - 修復彈出視窗内 iframe 区块联动規則失效问题 ([#7694](https://github.com/nocobase/nocobase/pull/7694)) by @katherinehhh

  - 修復操作面板中的扫描二维码無法配置联动規則 ([#7693](https://github.com/nocobase/nocobase/pull/7693)) by @katherinehhh

- **[工作流]** 修復在服務拆分模式下，工作流記憶體等待佇列處理不当导致部分工作流不執行的问题 ([#7692](https://github.com/nocobase/nocobase/pull/7692)) by @mytharcher

## [v1.8.32](https://github.com/nocobase/nocobase/compare/v1.8.31...v1.8.32) - 2025-10-27

### 🚀 最佳化

- **[server]** 最佳化載入本機化资源的方法，避免阻塞事件迴圈 ([#7653](https://github.com/nocobase/nocobase/pull/7653)) by @2013xile

- **[cache]** 避免因 clone 布隆篩選器造成的效能损耗 ([#7652](https://github.com/nocobase/nocobase/pull/7652)) by @2013xile

- **[操作：匯入記錄]** 改進了在未找到表头時的錯誤提示資訊 ([#7656](https://github.com/nocobase/nocobase/pull/7656)) by @mytharcher

### 🐛 修復

- **[client]**
  - 修復篩選区块中日期欄位清除時报错的问题 ([#7632](https://github.com/nocobase/nocobase/pull/7632)) by @katherinehhh

  - 修復欄位標題换行截断单词的问题 ([#7647](https://github.com/nocobase/nocobase/pull/7647)) by @katherinehhh

  - 修復編輯彈出視窗中子表格預設值失效的问题 ([#7631](https://github.com/nocobase/nocobase/pull/7631)) by @katherinehhh

- **[資料表欄位：中国行政区划]** 城市和县区相同時，無法匯入資料 ([#7673](https://github.com/nocobase/nocobase/pull/7673)) by @2013xile

- **[工作流]**
  - 修復开启分支的节点刪除后，保留的分支內部第一個节点的 key 被改为新值的问题 ([#7665](https://github.com/nocobase/nocobase/pull/7665)) by @mytharcher

  - 修復應用停止時日誌报错的问题 ([#7639](https://github.com/nocobase/nocobase/pull/7639)) by @mytharcher

- **[檔案管理器]** 修復 `.msg` 檔案無法正常上傳的问题 ([#7662](https://github.com/nocobase/nocobase/pull/7662)) by @mytharcher

- **[資料源：主資料程式庫]** 修復建立反向关系欄位后，多节点未同步元資料的问题 ([#7628](https://github.com/nocobase/nocobase/pull/7628)) by @mytharcher

- **[工作流：审批]**
  - 修復审批完成通知中的狀態文本的翻译问题，当使用者未設定语言偏好時使用系統配置的預設语言进行翻译 by @mytharcher

  - 修復加签后待办數字未更新的问题 by @mytharcher

## [v1.8.31](https://github.com/nocobase/nocobase/compare/v1.8.30...v1.8.31) - 2025-10-17

### 🐛 修復

- **[database]** 修復 `$in` 操作符的值为 `null` 時的报错问题 ([#7610](https://github.com/nocobase/nocobase/pull/7610)) by @mytharcher

- **[工作流：审批]**
  - 修復审批提交后資料程式庫报错時事务未正常回滚导致的事务逾時问题 by @mytharcher

  - 修復提交审批表单中部分變數未被解析的问题 by @mytharcher

## [v1.8.30](https://github.com/nocobase/nocobase/compare/v1.8.29...v1.8.30) - 2025-10-16

### 🐛 修復

- **[client]** 修復標籤页图标彈出視窗被遮挡的问题 ([#7607](https://github.com/nocobase/nocobase/pull/7607)) by @zhangzhonghe

## [v1.8.29](https://github.com/nocobase/nocobase/compare/v1.8.28...v1.8.29) - 2025-10-15

### 🚀 最佳化

- **[工作流：审批]** 重构分支配置以适配内核变更 by @mytharcher

### 🐛 修復

- **[工作流：审批]** 修復迁移腳本在未安裝應用時由于表不存在的报错问题 by @mytharcher

## [v1.8.28](https://github.com/nocobase/nocobase/compare/v1.8.27...v1.8.28) - 2025-10-14

### 🚀 最佳化

- **[client]** 在前端使用 `mime` 套件檢測檔案的 MIME 類型，以获得更准确的類型資料 ([#7551](https://github.com/nocobase/nocobase/pull/7551)) by @mytharcher

- **[工作流]**
  - 支持通過環境變數限制一个工作流中的最大节点数 ([#7542](https://github.com/nocobase/nocobase/pull/7542)) by @mytharcher

  - 刪除节点時增加“保留分支”選項 ([#7571](https://github.com/nocobase/nocobase/pull/7571)) by @mytharcher

- **[工作流：迴圈节点]** 支持通過環境變數限制迴圈节点的最大迴圈次数 ([#7543](https://github.com/nocobase/nocobase/pull/7543)) by @mytharcher

- **[工作流：审批]** 为自訂审批区块的詳情彈出視窗增加打印按钮 by @mytharcher

### 🐛 修復

- **[client]**
  - 修復預覽圖片同時旋轉和縮放顯示不正常的问题 ([#7573](https://github.com/nocobase/nocobase/pull/7573)) by @mytharcher

  - 修復 AssignedField 元件未实现動態属性导致的新增、更新节点上傳檔案錯誤问题 ([#7556](https://github.com/nocobase/nocobase/pull/7556)) by @mytharcher

- **[公開表单]** 修復公開表单中的檔案欄位上傳規則不正確的问题 ([#7553](https://github.com/nocobase/nocobase/pull/7553)) by @mytharcher

- **[日历]** 修復日历区块資料表設定唯一識別后詳情資料查詢錯誤问题 ([#7562](https://github.com/nocobase/nocobase/pull/7562)) by @katherinehhh

- **[認證：LDAP]** 修復含非 ASCII（UTF-8）DN 的 AD 登入失敗问题 by @2013xile

## [v1.8.27](https://github.com/nocobase/nocobase/compare/v1.8.26...v1.8.27) - 2025-10-02

### 🚀 最佳化

- **[client]** 支持預覽圖片時旋轉圖片 ([#7523](https://github.com/nocobase/nocobase/pull/7523)) by @mytharcher

- **[工作流]** 将排程相关邏輯拆分为独立的排程器 ([#7535](https://github.com/nocobase/nocobase/pull/7535)) by @mytharcher

### 🐛 修復

- **[client]** 修復左侧選單栏子選單不能正確高亮的问题 ([#7520](https://github.com/nocobase/nocobase/pull/7520)) by @duannyuuu

- **[工作流：迴圈节点]** 修復了迴圈节点條件未满足時仍錯誤繼續到下一项的问题 ([#7521](https://github.com/nocobase/nocobase/pull/7521)) by @mytharcher

- **[工作流]**
  - 修復由于佇列處理不当导致的工作流重複執行问题 ([#7533](https://github.com/nocobase/nocobase/pull/7533)) by @mytharcher

  - 修復绑定工作流配置中載入关系欄位上下文的工作流清單條件錯誤的问题 ([#7516](https://github.com/nocobase/nocobase/pull/7516)) by @mytharcher

  - 修復基于日期欄位的定時任務到期后不觸發的问题 ([#7524](https://github.com/nocobase/nocobase/pull/7524)) by @mytharcher

## [v1.8.26](https://github.com/nocobase/nocobase/compare/v1.8.25...v1.8.26) - 2025-09-20

### 🚀 最佳化

- **[client]** 表格列提示資訊和分組標題支持本機化 ([#7485](https://github.com/nocobase/nocobase/pull/7485)) by @katherinehhh

- **[日历]** 支持日历区块表头多语言顯示 ([#7508](https://github.com/nocobase/nocobase/pull/7508)) by @katherinehhh

### 🐛 修復

- **[client]** 修復選單的图标配置彈出視窗被遮挡的问题 ([#7515](https://github.com/nocobase/nocobase/pull/7515)) by @zhangzhonghe

- **[通知：站内信]**
  - 修復通知連結解析錯誤的问题 ([#7509](https://github.com/nocobase/nocobase/pull/7509)) by @mytharcher

  - 修復開啟通知彈出視窗不展示最近訊息的问题 ([#7514](https://github.com/nocobase/nocobase/pull/7514)) by @mytharcher

- **[工作流]** 修復工作流后台任務佇列订阅邏輯不正確导致執行訊息處理例外的问题 ([#7507](https://github.com/nocobase/nocobase/pull/7507)) by @mytharcher

- **[工作流：审批]**
  - 修復刪除外部資料源資料時报错的问题 by @mytharcher

  - 修復审批處理表单中公式欄位不自動变化的问题 by @mytharcher

## [v1.8.25](https://github.com/nocobase/nocobase/compare/v1.8.24...v1.8.25) - 2025-09-16

### 🚀 最佳化

- **[auth]** 支持在使用者名中使用 `.` ([#7504](https://github.com/nocobase/nocobase/pull/7504)) by @2013xile

### 🐛 修復

- **[client]** 修復按钮的图标配置彈出視窗被遮挡的问题 ([#7506](https://github.com/nocobase/nocobase/pull/7506)) by @zhangzhonghe

- **[模板打印]** 支持省市区欄位 by @jiannx

## [v1.8.24](https://github.com/nocobase/nocobase/compare/v1.8.23...v1.8.24) - 2025-09-12

### 🎉 新特性

- **[工作流：审批]** 支持审批時退回到任意节点 by @mytharcher

### 🚀 最佳化

- **[server]** 在訊息佇列中使用標準的系統日誌 ([#7480](https://github.com/nocobase/nocobase/pull/7480)) by @mytharcher

- **[client]** 移除檔案清單上多余的省略預覽浮层 ([#7479](https://github.com/nocobase/nocobase/pull/7479)) by @mytharcher

- **[工作流]** 最佳化工作流准备執行过程，支持使用已載入的节点資料 ([#7476](https://github.com/nocobase/nocobase/pull/7476)) by @mytharcher

- **[主題編輯器]** 新增对侧边選單栏的顏色配置 ([#7483](https://github.com/nocobase/nocobase/pull/7483)) by @duannyuuu

- **[Redis 訊息佇列配接器]** 在 Redis 訊息佇列配接器中使用標準的系統日誌 by @mytharcher

### 🐛 修復

- **[client]**
  - 修復 Popover 元件被遮挡的问题 ([#7491](https://github.com/nocobase/nocobase/pull/7491)) by @zhangzhonghe

  - 联动規則数值欄位「不為空」判断錯誤 ([#7477](https://github.com/nocobase/nocobase/pull/7477)) by @katherinehhh

  - 修復公開表单 select/多選/日期/富文本在只读時仍可編輯的问题 ([#7484](https://github.com/nocobase/nocobase/pull/7484)) by @katherinehhh

- **[工作流]** 修復潜在的工作流日誌快取报错问题 ([#7490](https://github.com/nocobase/nocobase/pull/7490)) by @mytharcher

- **[HTTP 請求加密]** 修復請求參數不支持原生 URLSearchParams 類型的问题 by @mytharcher

- **[資料源：REST API]** 修復 REST API URL 驗證規則 by @katherinehhh

- **[工作流：审批]** 修復审批完成通知中狀態文本未翻译的问题 by @mytharcher

## [v1.8.23](https://github.com/nocobase/nocobase/compare/v1.8.22...v1.8.23) - 2025-09-03

### 🚀 最佳化

- **[database]** 最佳化了 list API 的統計条数查詢，减少资源占用。 ([#7453](https://github.com/nocobase/nocobase/pull/7453)) by @aaaaaajie

- **[通知：站内信]** 支持站内信配置訊息提示的自動關閉等待時间 ([#7472](https://github.com/nocobase/nocobase/pull/7472)) by @mytharcher

- **[工作流：通知节点]** 支持通知节点測試執行 ([#7470](https://github.com/nocobase/nocobase/pull/7470)) by @mytharcher

### 🐛 修復

- **[client]**
  - 修復 編輯表单区块中，阅读态关系欄位在切换为標籤元件時渲染失敗的问题 ([#7468](https://github.com/nocobase/nocobase/pull/7468)) by @katherinehhh

  - 修復选定日期为最小允許日期時時间選擇限制無效的问题 ([#7461](https://github.com/nocobase/nocobase/pull/7461)) by @katherinehhh

- **[行動裝置]** 修復行動裝置不含時区的日期欄位未正確顯示時分秒 ([#7473](https://github.com/nocobase/nocobase/pull/7473)) by @katherinehhh

- **[公開表单]** 修復 公開表单欄位配置變數作为預設值時未生效的问题 ([#7467](https://github.com/nocobase/nocobase/pull/7467)) by @katherinehhh

- **[操作：匯入記錄]** 修復匯入xlsx重複資料時报错行数顯示錯誤 ([#7440](https://github.com/nocobase/nocobase/pull/7440)) by @aaaaaajie

- **[資料表：树]** 在刪除树表之后移除和该表有关的資料程式庫事件 ([#7459](https://github.com/nocobase/nocobase/pull/7459)) by @2013xile

- **[工作流：自訂操作事件]** 修復自訂操作事件初始化后不能直接手動執行的问题 by @mytharcher

- **[工作流：子流程]** 修復子流程重複還原執行的问题 by @mytharcher

- **[工作流：审批]** 对非目前审批人，不展示流程表格中的对应檢視按钮 by @mytharcher

## [v1.8.22](https://github.com/nocobase/nocobase/compare/v1.8.21...v1.8.22) - 2025-08-27

### 🐛 修復

- **[工作流]** 修復待办中心路由配置錯誤导致詳情彈出視窗不顯示的问题 ([#7452](https://github.com/nocobase/nocobase/pull/7452)) by @mytharcher

## [v1.8.21](https://github.com/nocobase/nocobase/compare/v1.8.20...v1.8.21) - 2025-08-26

### 🐛 修復

- **[檔案管理器]** 修復檔案表的 storage 欄位編輯時的报错 ([#7393](https://github.com/nocobase/nocobase/pull/7393)) by @mytharcher

- **[工作流：並行分支节点]** 修復並行分支节点在全部執行模式下狀態判断錯誤导致提前執行完成的问题 ([#7445](https://github.com/nocobase/nocobase/pull/7445)) by @mytharcher

- **[工作流：审批]** 补充审批完成通知中自訂模板的狀態變數 by @mytharcher

## [v1.8.20](https://github.com/nocobase/nocobase/compare/v1.8.19...v1.8.20) - 2025-08-25

### 🚀 最佳化

- **[工作流]** 調整工作流變數介面，支持预置额外變數清單 ([#7439](https://github.com/nocobase/nocobase/pull/7439)) by @mytharcher

- **[工作流：审批]**
  - 支持在自訂通知中使用审批相关變數 by @mytharcher

  - 支持結束节点终止流程后，变更审批狀態 by @mytharcher

### 🐛 修復

- **[client]**
  - 修復在某些场景下，行動裝置資料選擇器彈出視窗編輯記錄時出错的问题 ([#7444](https://github.com/nocobase/nocobase/pull/7444)) by @zhangzhonghe

  - 子表格中附件欄位必填校验不生效的问题 ([#7431](https://github.com/nocobase/nocobase/pull/7431)) by @katherinehhh

  - 修復附件 URL 欄位的 URL 中套件含查詢參數時图标展示不正確的问题 ([#7432](https://github.com/nocobase/nocobase/pull/7432)) by @mytharcher

- **[database]**
  - 修復了站内訊息載入更多時出现的 MySQL 语法錯誤。 ([#7438](https://github.com/nocobase/nocobase/pull/7438)) by @aaaaaajie

  - 修復匯出 Number 類型欄位時的精度问题 ([#7421](https://github.com/nocobase/nocobase/pull/7421)) by @aaaaaajie

- **[undefined]** 修復 MySQL 外部資料源中仅按日期欄位篩選資料不正確的问题 ([#7422](https://github.com/nocobase/nocobase/pull/7422)) by @aaaaaajie

- **[操作：匯入記錄]** 修復了当表的主鍵为单行文本時匯入失敗的问题 ([#7416](https://github.com/nocobase/nocobase/pull/7416)) by @aaaaaajie

- **[工作流]**
  - 补全自動刪除工作流的執行狀態選項 ([#7436](https://github.com/nocobase/nocobase/pull/7436)) by @mytharcher

  - 修復待办中心行動裝置選單相关问题 ([#7419](https://github.com/nocobase/nocobase/pull/7419)) by @mytharcher

- **[操作：匯入記錄 Pro]** 修復在 xlsx 匯入中使用字元串主鍵時更新结果不符合预期的问题。 by @aaaaaajie

## [v1.8.19](https://github.com/nocobase/nocobase/compare/v1.8.18...v1.8.19) - 2025-08-22

### 🎉 新特性

- **[工作流：审批]** 为通知配置增加内联模板類型 by @mytharcher

### 🚀 最佳化

- **[client]** 支持 Select 元件在阅读态時可以展示字元串識別的图标 ([#7420](https://github.com/nocobase/nocobase/pull/7420)) by @mytharcher

- **[database]** 最佳化 ACL Meta 查詢效能 ([#7400](https://github.com/nocobase/nocobase/pull/7400)) by @aaaaaajie

- **[行動裝置]** 最佳化行動裝置彈出視窗元件 ([#7414](https://github.com/nocobase/nocobase/pull/7414)) by @zhangzhonghe

### 🐛 修復

- **[database]** 修復了在读取 Postgres 外部資料表時，会錯誤套件含其他 schema 视图的问题 ([#7410](https://github.com/nocobase/nocobase/pull/7410)) by @aaaaaajie

- **[区块：模板]** 修復了邮件区块在继承模版中不可見的问题 ([#7430](https://github.com/nocobase/nocobase/pull/7430)) by @gchust

- **[操作：匯入記錄 Pro]** 匯入識別重複記錄時，禁止設定关系欄位 by @aaaaaajie

- **[工作流：审批]** 修復加签時載入使用者清單為空的问题 by @mytharcher

- **[迁移管理]** 生成迁移檔案的時候跳過最新版本 pg_dump 生成的 `\restrict` 和 `\unrestrict` 命令，解決还原报错的问题 by @2013xile

## [v1.8.18](https://github.com/nocobase/nocobase/compare/v1.8.17...v1.8.18) - 2025-08-19

### 🚀 最佳化

- **[工作流]** 将节点選擇選單更新为两列布局，以提升資訊密度使使用者能同時檢視更多選項 ([#7396](https://github.com/nocobase/nocobase/pull/7396)) by @mytharcher

- **[授權設定]** 授權設定中，每次拷贝最新InstanceID ([#7387](https://github.com/nocobase/nocobase/pull/7387)) by @jiannx

### 🐛 修復

- **[client]**
  - 修復 联动規則為空判断時,數字0 也视為空的问题 ([#7404](https://github.com/nocobase/nocobase/pull/7404)) by @katherinehhh

  - 修復連結按钮中文字换行的问题 ([#7406](https://github.com/nocobase/nocobase/pull/7406)) by @mytharcher

- **[行動裝置]** 修復行動裝置日期欄位顯示为錯誤格式的问题 ([#7412](https://github.com/nocobase/nocobase/pull/7412)) by @katherinehhh

- **[Office 檔案預覽]** 修復上傳檔案至附件 URL 欄位报错的问题 ([#7405](https://github.com/nocobase/nocobase/pull/7405)) by @mytharcher

- **[工作流]** 修復編輯工作流分類時报错和表单資料丢失的问题 ([#7408](https://github.com/nocobase/nocobase/pull/7408)) by @mytharcher

- **[工作流：邮件傳送节点]** 修復邮件节点可能存在還原執行不正常的问题 ([#7409](https://github.com/nocobase/nocobase/pull/7409)) by @mytharcher

- **[工作流：自訂操作事件]** 在对多条資料的觸發成功后清空選取行 by @mytharcher

- **[模板打印]** 多行資料中單選欄位打印 by @jiannx

- **[工作流：审批]** 修復載入审批記錄中外部資料源資料出现 404 的问题 by @mytharcher

## [v1.8.17](https://github.com/nocobase/nocobase/compare/v1.8.16...v1.8.17) - 2025-08-15

### 🎉 新特性

- **[工作流：审批]** 支持在同一个工作流中使用统一的待办任務標題 by @mytharcher

### 🚀 最佳化

- **[使用者認證]** 使用 token 參數登入成功后，移除 URL token 參數 ([#7386](https://github.com/nocobase/nocobase/pull/7386)) by @2013xile

- **[模板打印]** 支持多对多陣列欄位 by @jiannx

### 🐛 修復

- **[行動裝置]** 修復行動裝置审批彈出視窗中的表单提交的資料不正確的问题 ([#7389](https://github.com/nocobase/nocobase/pull/7389)) by @zhangzhonghe

- **[工作流]** 修復待办中心的頁面標題翻译 ([#7392](https://github.com/nocobase/nocobase/pull/7392)) by @mytharcher

- **[日历]** 修復了日历事件悬停提示框未顯示事件標題欄位內容，顯示为 “[object Object]” 的问题 ([#7372](https://github.com/nocobase/nocobase/pull/7372)) by @katherinehhh

- **[通知：站内信]** 修復多语言翻译 ([#7384](https://github.com/nocobase/nocobase/pull/7384)) by @mytharcher

- **[檔案管理器]** 移除檔案上傳大小的上限提示 ([#7391](https://github.com/nocobase/nocobase/pull/7391)) by @mytharcher

- **[檔案儲存：S3 (Pro)]**
  - 弃用可能造成问题的 `attachmentField` 參數 by @mytharcher

  - 修復 IAM 授權方式無法上傳檔案的问题 by @mytharcher

## [v1.8.16](https://github.com/nocobase/nocobase/compare/v1.8.15...v1.8.16) - 2025-08-14

### 🚀 最佳化

- **[通知：站内信]** 移除通過 `console.log` 输出的 SQL 日誌 ([#7368](https://github.com/nocobase/nocobase/pull/7368)) by @2013xile

### 🐛 修復

- **[server]** 部分請求沒有 `ctx.action`, 导致审计日誌中介軟體报错 ([#7369](https://github.com/nocobase/nocobase/pull/7369)) by @2013xile

- **[資料表欄位：公式]** 修復公式输入由于變數類型导致無法通過驗證的问题 ([#7373](https://github.com/nocobase/nocobase/pull/7373)) by @mytharcher

- **[備份管理器]** 備份大量檔案時，任務狀態可能提前顯示为“已成功”，但实际仍在進行中 by @gchust

## [v1.8.15](https://github.com/nocobase/nocobase/compare/v1.8.14...v1.8.15) - 2025-08-11

### 🚀 最佳化

- **[client]**
  - 新增“前天”日期變數支持 ([#7359](https://github.com/nocobase/nocobase/pull/7359)) by @katherinehhh

  - 最佳化切换彈出視窗標籤页的效能 ([#7353](https://github.com/nocobase/nocobase/pull/7353)) by @zhangzhonghe

- **[工作流]**
  - 修復不穩定的測試用例 ([#7349](https://github.com/nocobase/nocobase/pull/7349)) by @mytharcher

  - 工作流停用后也展示正常的標題 ([#7339](https://github.com/nocobase/nocobase/pull/7339)) by @mytharcher

- **[Office 檔案預覽]** 为預覽 `.odt` 檔案增加支持 ([#7347](https://github.com/nocobase/nocobase/pull/7347)) by @mytharcher

- **[備份管理器]** 最佳化 mysql 資料程式庫備份操作效能 by @gchust

### 🐛 修復

- **[client]**
  - 修復表单的多列布局在行動裝置沒有变成单列布局的问题 ([#7355](https://github.com/nocobase/nocobase/pull/7355)) by @zhangzhonghe

  - 修復批量刪除資料表時的錯誤 ([#7345](https://github.com/nocobase/nocobase/pull/7345)) by @aaaaaajie

  - 修復单独配置權限時未預設選取已儲存資料範圍的问题。 ([#7288](https://github.com/nocobase/nocobase/pull/7288)) by @aaaaaajie

- **[工作流]**
  - 重构新增节点的選單，并修復其导致的工作流画布渲染的效能问题 ([#7363](https://github.com/nocobase/nocobase/pull/7363)) by @mytharcher

  - 修復获取单条待办專案時的篩選條件錯誤问题 ([#7366](https://github.com/nocobase/nocobase/pull/7366)) by @mytharcher

  - 修復欄位選擇框的搜尋关鍵词符合问题 ([#7356](https://github.com/nocobase/nocobase/pull/7356)) by @mytharcher

  - 避免應用停止時呼叫佇列报错 ([#7348](https://github.com/nocobase/nocobase/pull/7348)) by @mytharcher

- **[通知：站内信]** 修復接收到站内信訊息但未弹出展示的问题 ([#7364](https://github.com/nocobase/nocobase/pull/7364)) by @mytharcher

- **[行動裝置]** 修復行動裝置日期元件使用日期變數限制可選範圍時日期顯示例外的问题 ([#7362](https://github.com/nocobase/nocobase/pull/7362)) by @katherinehhh

- **[檔案管理器]** 为檔案表增加 `storageId` 欄位以支持權限配置 ([#7351](https://github.com/nocobase/nocobase/pull/7351)) by @mytharcher

- **[工作流：並行分支节点]** 修復 MySQL 下並行分支节点在還原執行后假死的问题 ([#7346](https://github.com/nocobase/nocobase/pull/7346)) by @mytharcher

- **[工作流：抄送]** 修復区块無法移除的问题 ([#7338](https://github.com/nocobase/nocobase/pull/7338)) by @mytharcher

- **[Office 檔案預覽]** 支持 URL 中套件含 `.docx`, `.xlsx` 和 `.pptx` 的檔案預覽 ([#7336](https://github.com/nocobase/nocobase/pull/7336)) by @mytharcher

- **[資料可视化]** 圖表区块中篩選日期欄位設定預設值为日期變數時顯示不正確的问题 ([#7291](https://github.com/nocobase/nocobase/pull/7291)) by @katherinehhh

- **[工作流：审批]**
  - 修復审批原始詳情区块中联动規則失效的问题 by @mytharcher

  - 修復提交草稿時更新关系欄位的问题 by @mytharcher

## [v1.8.14](https://github.com/nocobase/nocobase/compare/v1.8.13...v1.8.14) - 2025-08-05

### 🐛 修復

- **[client]** 修復變數原始字元串会随表单提交的问题 ([#7337](https://github.com/nocobase/nocobase/pull/7337)) by @zhangzhonghe

- **[工作流：审批]** 为加签和转签的任務增加標題 by @mytharcher

## [v1.8.13](https://github.com/nocobase/nocobase/compare/v1.8.12...v1.8.13) - 2025-08-04

### 🎉 新特性

- **[認證：SAML 2.0]** 增加签名相关配置项 by @2013xile

### 🚀 最佳化

- **[工作流：JavaScript 节点]** 将日誌改为使用基础快取以避免集群模式的问题 by @mytharcher

### 🐛 修復

- **[client]**
  - 修復 操作面板滑鼠移上去 tooltip 顯示 [object Object] 的问题 ([#7322](https://github.com/nocobase/nocobase/pull/7322)) by @katherinehhh

  - 当在篩選表单中使用變數設定欄位預設值，且變數值為空時，输入框中会顯示變數的原始字元串 ([#7335](https://github.com/nocobase/nocobase/pull/7335)) by @zhangzhonghe

- **[資料表：树]** 修復树表路徑同步邏輯 ([#7330](https://github.com/nocobase/nocobase/pull/7330)) by @ChimingLiu

## [v1.8.12](https://github.com/nocobase/nocobase/compare/v1.8.11...v1.8.12) - 2025-08-01

### 🎉 新特性

- **[client]** 为 Input、TextArea、URL 和 InputNumber 元件新增了"自動聚焦"選項，啟用后输入框在頁面初始渲染時会自動获得焦点 ([#7320](https://github.com/nocobase/nocobase/pull/7320)) by @zhangzhonghe

### 🐛 修復

- **[client]**
  - 修復檔案預覽在空 URL 時报错的问题 ([#7315](https://github.com/nocobase/nocobase/pull/7315)) by @mytharcher

  - 为本機檔案預覽补全 URL ([#7314](https://github.com/nocobase/nocobase/pull/7314)) by @mytharcher

- **[utils]** 修復 parseDate 解析時间變數時区處理錯誤的问题 ([#7318](https://github.com/nocobase/nocobase/pull/7318)) by @katherinehhh

- **[undefined]** 将新外掛加入到预置集合 ([#7319](https://github.com/nocobase/nocobase/pull/7319)) by @mytharcher

- **[檔案管理器]** 修復上傳檔案時儲存引擎外鍵的權限问题 ([#7316](https://github.com/nocobase/nocobase/pull/7316)) by @mytharcher

- **[工作流]** 修復執行器登出時对 `undefined` 结果的處理 ([#7317](https://github.com/nocobase/nocobase/pull/7317)) by @mytharcher

- **[工作流：動態表达式計算节点]** 修復旧 API 导致的錯誤 ([#7321](https://github.com/nocobase/nocobase/pull/7321)) by @mytharcher

- **[工作流：子流程]** 修復子流程假死的问题 by @mytharcher

## [v1.8.11](https://github.com/nocobase/nocobase/compare/v1.8.10...v1.8.11) - 2025-07-30

### 🎉 新特性

- **[Office 檔案預覽]** 基于微软線上預覽支持預覽 Office 相关檔案 ([#7300](https://github.com/nocobase/nocobase/pull/7300)) by @mytharcher

### 🚀 最佳化

- **[client]** 選取選單后不自動關閉選單 ([#7252](https://github.com/nocobase/nocobase/pull/7252)) by @kerwin612

- **[通知：站内信]** 站内信訊息从 SSE 改为 WebSocket ([#7302](https://github.com/nocobase/nocobase/pull/7302)) by @mytharcher

- **[工作流]** 减少准备執行計畫時載入节点结果的數量 ([#7284](https://github.com/nocobase/nocobase/pull/7284)) by @mytharcher

- **[認證：钉钉]** 在钉钉客戶端中将導覽栏標題設定為空，而不是顯示 "Loading..." by @2013xile

### 🐛 修復

- **[client]**
  - 修復树表格無法展开的问题 ([#7309](https://github.com/nocobase/nocobase/pull/7309)) by @zhangzhonghe

  - 修復表格行拖曳排序不符合预期的问题 ([#6959](https://github.com/nocobase/nocobase/pull/6959)) by @ChimingLiu

  - 修復解析欄位預設值時出现死迴圈的问题 ([#7301](https://github.com/nocobase/nocobase/pull/7301)) by @zhangzhonghe

  - date field display issue  in association field data selector popup of filter form ([#7290](https://github.com/nocobase/nocobase/pull/7290)) by @katherinehhh

- **[工作流：HTTP 請求节点]** 修復竞态问题 ([#7310](https://github.com/nocobase/nocobase/pull/7310)) by @mytharcher

- **[工作流]** 修復 MySQL 下儲存執行記錄時大整型 ID 欄位的问题 ([#7292](https://github.com/nocobase/nocobase/pull/7292)) by @mytharcher

- **[操作：匯出記錄]** 修復匯出 Excel 時多层关系欄位格式不正確的问题。 ([#7277](https://github.com/nocobase/nocobase/pull/7277)) by @aaaaaajie

- **[資料源：外部 SQL Server]** 修復外部資料源 MSSQL datetime（無時区）欄位儲存格式不一致 by @aaaaaajie

- **[工作流：审批]** 修復基于外部資料源的审批表单中指派人選擇报错问题 by @mytharcher

## [v1.8.10](https://github.com/nocobase/nocobase/compare/v1.8.7...v1.8.10) - 2025-07-24

### 🎉 新特性

- **[認證：SAML 2.0]** 支持使用者未認證時，自動跳转到 SSO登入页 by @2013xile

- **[server]** 支持通過環境變數配置請求体大小限制 ([#7273](https://github.com/nocobase/nocobase/pull/7273)) by @aaaaaajie

- **[工作流：並行分支节点]** 为並行分支节点增加“全部執行”的模式 ([#7263](https://github.com/nocobase/nocobase/pull/7263)) by @mytharcher

- **[Redis 訊息佇列配接器]** 新增基于 Redis 的事件佇列配接器 by @mytharcher

### 🚀 最佳化

- **[工作流]** 为測試节点的變數增加 JSON 常數類型 ([#7274](https://github.com/nocobase/nocobase/pull/7274)) by @mytharcher

- **[AI 集成]** 移除呼叫 `saveJob` 的 `await` ([#7275](https://github.com/nocobase/nocobase/pull/7275)) by @mytharcher

- **[工作流：JSON 計算]** JSON 計算节点支持可測試 by @mytharcher

- **[server]** 記憶體佇列配接器并发支持未满载時繼續處理新任務 ([#7267](https://github.com/nocobase/nocobase/pull/7267)) by @mytharcher

- **[database]** 当資料量超过阈值時，自動啟用简易分页模式 ([#7227](https://github.com/nocobase/nocobase/pull/7227)) by @aaaaaajie

- **[工作流：人工處理节点]** storePopupContext 支持儲存預設的上下文 ([#7264](https://github.com/nocobase/nocobase/pull/7264)) by @zhangzhonghe

- **[Redis 訊息佇列配接器]** Redis 佇列配接器并发支持未满载時繼續處理新任務 by @mytharcher

### 🐛 修復

- **[client]**
  - 修復下拉关系欄位使用 formula 作为標題時未按模糊符合查詢的问题 ([#7280](https://github.com/nocobase/nocobase/pull/7280)) by @katherinehhh

  - 修復 子表单联动規則中缺失目前物件變數的问题 ([#7266](https://github.com/nocobase/nocobase/pull/7266)) by @katherinehhh

  - 資料選擇器設定標題欄位無效 ([#7251](https://github.com/nocobase/nocobase/pull/7251)) by @zhangzhonghe

  - 修復 Markdown 欄位在詳情视图中未正確渲染为 Markdown 的问题。 ([#7257](https://github.com/nocobase/nocobase/pull/7257)) by @aaaaaajie

  - 欄位变更后，依赖该欄位的关系欄位沒有清空值 ([#7262](https://github.com/nocobase/nocobase/pull/7262)) by @zhangzhonghe

  - 修復歷史資料中日期欄位使用废弃的日期變數時顯示例外的问题 ([#7253](https://github.com/nocobase/nocobase/pull/7253)) by @katherinehhh

- **[database]**
  - 修復当資料程式庫表命名风格导致自動开启簡單分页模式失效问题。 ([#7256](https://github.com/nocobase/nocobase/pull/7256)) by @aaaaaajie

  - 修復 PostgreSQL 大資料量匯出 XLSX 時的报错 ([#7228](https://github.com/nocobase/nocobase/pull/7228)) by @aaaaaajie

  - 表格区块設定mssql外部資料源預設主鍵排序，读取清單报错 ([#7259](https://github.com/nocobase/nocobase/pull/7259)) by @aaaaaajie

- **[auth]** 修復子應用配置中 `secret` 為空，無法登入的问题 ([#7239](https://github.com/nocobase/nocobase/pull/7239)) by @2013xile

- **[資料源管理]** 修復修改外部資料源导致属性重設 ([#7249](https://github.com/nocobase/nocobase/pull/7249)) by @aaaaaajie

- **[操作：批量編輯]** 資料選擇器中無法进行批量編輯和批量更新 ([#7250](https://github.com/nocobase/nocobase/pull/7250)) by @zhangzhonghe

- **[工作流]** 修復錯誤的依赖版本 ([#7258](https://github.com/nocobase/nocobase/pull/7258)) by @mytharcher

- **[資料源：外部 Oracle]** 修復修改外部資料源导致属性重設 by @aaaaaajie

- **[工作流：审批]** Link 按钮連結位址为目前頁面的彈出視窗，點擊開啟会顯示 404 by @zhangzhonghe

- **[邮件管理]** 邮件与標籤关系表在mysql下例外 by @jiannx

## [v1.8.7](https://github.com/nocobase/nocobase/compare/v1.8.6...v1.8.7) - 2025-07-17

### 🎉 新特性

- **[工作流: 日期計算节点]** 支持节点測試執行 by @mytharcher

### 🚀 最佳化

- **[client]** 顏色選擇器：新增四种推薦顏色 ([#7226](https://github.com/nocobase/nocobase/pull/7226)) by @zhangzhonghe

- **[工作流]** 改進比較邏輯以兼容日期值 ([#7237](https://github.com/nocobase/nocobase/pull/7237)) by @mytharcher

### 🐛 修復

- **[client]**
  - 修復 表格中操作列的樣式規則未生效问题 ([#7225](https://github.com/nocobase/nocobase/pull/7225)) by @katherinehhh

  - 刪除選單時，沒有刪除 uiSchemas 表中对应的資料 ([#7232](https://github.com/nocobase/nocobase/pull/7232)) by @zhangzhonghe

  - 避免非关系欄位在预載入关系欄位配置中被選擇 ([#7231](https://github.com/nocobase/nocobase/pull/7231)) by @mytharcher

- **[工作流：子流程]** 修復接收到召回信号時，待執行的計畫不在目前實例時报错问题 by @mytharcher

## [v1.8.6](https://github.com/nocobase/nocobase/compare/v1.8.5...v1.8.6) - 2025-07-16

### 🐛 修復

- **[client]**
  - 修復錯誤：Can't resolve 'react-device-detect' ([#7224](https://github.com/nocobase/nocobase/pull/7224)) by @zhangzhonghe

  - 修復联动規則中关系欄位顯示例外的问题 ([#7220](https://github.com/nocobase/nocobase/pull/7220)) by @katherinehhh

- **[database]** 修復外部資料源表設定簡單分页模式時的报错问题 ([#7222](https://github.com/nocobase/nocobase/pull/7222)) by @aaaaaajie

- **[資料表欄位：排序]** 修復了在複製操作中缺少排序欄位的问题 ([#7116](https://github.com/nocobase/nocobase/pull/7116)) by @katherinehhh

- **[工作流：审批]**
  - 为审批記錄清單增加审批已刪除的容错 by @mytharcher

  - 修復提交审批時的多级关系資料 by @mytharcher

  - 修復刪除資料時的例外 by @mytharcher

## [v1.8.5](https://github.com/nocobase/nocobase/compare/v1.8.4...v1.8.5) - 2025-07-14

### 🚀 最佳化

- **[資料表欄位：公式]** 增加更多可計算的欄位類型 ([#7215](https://github.com/nocobase/nocobase/pull/7215)) by @mytharcher

- **[工作流]** 在執行計畫由于狀態不可執行時用日誌替代抛错 ([#7217](https://github.com/nocobase/nocobase/pull/7217)) by @mytharcher

- **[工作流：审批]** 支持当关联业务資料刪除時，同時刪除审批資料 by @mytharcher

### 🐛 修復

- **[client]**
  - 修復联动規則左侧變數無法選取附件欄位的问题 ([#7213](https://github.com/nocobase/nocobase/pull/7213)) by @zhangzhonghe

  - 修復在 IOS 中下拉選擇元件被鍵盘遮挡的问题 ([#7149](https://github.com/nocobase/nocobase/pull/7149)) by @zhangzhonghe

  - 修復編輯表单中联动規則为選項欄位同時設定赋值和選項內容時赋值失效的问题 ([#7209](https://github.com/nocobase/nocobase/pull/7209)) by @katherinehhh

  - 篩選折叠面板：欄位設定預設值后頁面初始化沒有觸發篩選 ([#7206](https://github.com/nocobase/nocobase/pull/7206)) by @zhangzhonghe

  - 修復清單区块欄位赋值操作中选用看板排序欄位時报错的问题 ([#7208](https://github.com/nocobase/nocobase/pull/7208)) by @katherinehhh

  - 子選單切换時瀏覽器標籤標題未同步更新 ([#7207](https://github.com/nocobase/nocobase/pull/7207)) by @zhangzhonghe

  - 開啟彈出視窗操作：切换 Tab 標籤之后頁面顯示不符合预期 ([#7212](https://github.com/nocobase/nocobase/pull/7212)) by @zhangzhonghe

- **[acl]** 修復在使用套件含 root 角色的并集模式下刪除角色時报错的问题。 ([#7198](https://github.com/nocobase/nocobase/pull/7198)) by @aaaaaajie

- **[多應用管理器]** 修復認證選項出現在意外的位置 ([#7210](https://github.com/nocobase/nocobase/pull/7210)) by @mytharcher

- **[使用者認證]** 修復登入頁面不能捲動的问题 ([#7159](https://github.com/nocobase/nocobase/pull/7159)) by @zhangzhonghe

- **[工作流：审批]** 修復提交审批時的关系資料 by @mytharcher

## [v1.8.4](https://github.com/nocobase/nocobase/compare/v1.8.3...v1.8.4) - 2025-07-13

### 🎉 新特性

- **[多應用管理器]** 支持为子應用配置独立的認證密钥 ([#7197](https://github.com/nocobase/nocobase/pull/7197)) by @mytharcher

- **[工作流：抄送]** 工作流新增抄送节点 ([#7201](https://github.com/nocobase/nocobase/pull/7201)) by @mytharcher

### 🚀 最佳化

- **[通知：站内信]** 最佳化行動裝置訊息頁面的字型大小 ([#7199](https://github.com/nocobase/nocobase/pull/7199)) by @zhangzhonghe

- **[認證：钉钉]** 支持配置回呼 URL 協定和連接埠号 by @2013xile

### 🐛 修復

- **[通知：站内信]** 修復字元串格式的大整型時间戳导致的 dayjs 问题 ([#7196](https://github.com/nocobase/nocobase/pull/7196)) by @mytharcher

- **[工作流：审批]**
  - 避免使用者不存在時的报错 by @mytharcher

  - 重新載入审批記錄上的关系資料 by @mytharcher

  - 迁移腳本中更新 UI schema 時加入 `try/catch` by @mytharcher

## [v1.8.3](https://github.com/nocobase/nocobase/compare/v1.8.2...v1.8.3) - 2025-07-11

### 🚀 最佳化

- **[多應用管理器]** 为子應用增加資料程式庫和認證的独立配置 ([#7184](https://github.com/nocobase/nocobase/pull/7184)) by @mytharcher

### 🐛 修復

- **[操作：自訂請求]** 修復自訂請求操作成功后，跳转路由時連結位址變數解析錯誤的问题 ([#7186](https://github.com/nocobase/nocobase/pull/7186)) by @katherinehhh

## [v1.8.2](https://github.com/nocobase/nocobase/compare/v1.8.1...v1.8.2) - 2025-07-10

### 🎉 新特性

- **[工作流：审批]** 为觸發器增加区块初始化器 by @mytharcher

### 🚀 最佳化

- **[工作流]** 字元串比較运算前将操作数转换为字元串 ([#7190](https://github.com/nocobase/nocobase/pull/7190)) by @mytharcher

- **[資料表欄位：代码]** 增加欄位縮排配置 by @mytharcher

### 🐛 修復

- **[database]** 修復视图在区块中不顯示欄位的问题。 ([#7162](https://github.com/nocobase/nocobase/pull/7162)) by @aaaaaajie

- **[区块：看板]** 修復看板中子表格 UI 例外 & 支持設定看板每列宽度 ([#7189](https://github.com/nocobase/nocobase/pull/7189)) by @katherinehhh

- **[工作流：审批]** 修復区块和关系資料问题 by @mytharcher

## [v1.8.1](https://github.com/nocobase/nocobase/compare/v1.8.0...v1.8.1) - 2025-07-09

### 🐛 修復

- **[client]**
  - 表单中关系欄位表中的勾选欄位顯示不正確 ([#7176](https://github.com/nocobase/nocobase/pull/7176)) by @zhangzhonghe

  - 修復點擊按钮無法開啟彈出視窗的问题 ([#7180](https://github.com/nocobase/nocobase/pull/7180)) by @zhangzhonghe

- **[工作流：人工處理节点]** 修復使用节点變數時的报错 ([#7177](https://github.com/nocobase/nocobase/pull/7177)) by @mytharcher

- **[模板打印]** rootDataType欄位新增迁移腳本 by @jiannx

- **[工作流：审批]** 修復通過分支在沒有审批人的時候未執行的问题 by @mytharcher

## [v1.8.0](https://github.com/nocobase/nocobase/compare/v1.7.20...v1.8.0) - 2025-07-07

## 新特性

### 新增「忘记密碼」功能，支持信箱找回

支持通過邮件找回密碼。在「設定 > 使用者認證 > 忘记密碼」中啟用该功能，配置邮件通知渠道，并自訂重設密碼邮件內容（支持變數与 HTML 格式）。

![20250707104631_rec_-ihynhs.gif](https://static-docs.nocobase.com/20250707104631_rec_-ihynhs.gif)

参考檔案：[忘记密碼](https://docs-cn.nocobase.com/handbook/auth/user#%E5%BF%98%E8%AE%B0%E5%AF%86%E7%A0%81)

### 自訂彙總變數

支持建立計數、求和、平均值等統計變數，可用于選單徽章、頁面標籤等位置，让介面展示更加直观、資訊更丰富。

![20250707110736_rec_-fzpk98.gif](https://static-docs.nocobase.com/20250707110736_rec_-fzpk98.gif)

参考檔案：[自訂變數](https://docs-cn.nocobase.com/handbook/custom-variables)

### 邮件管理

邮件管理模組全面升級，支持邮件刪除、批量傳送、同步設定、AI 生成內容及多项体验最佳化。

![image-fyxonb.png](https://static-docs.nocobase.com/image-fyxonb.png)

### 資料源

支持外部資料源中的 SQL Server BIT 欄位，支持外部資料源按需載入資料表

![image-h3tk70.png](https://static-docs.nocobase.com/image-h3tk70.png)

### 文本複製

支持一鍵複製文本欄位內容

![20250707105447_rec_-m25b6x.gif](https://static-docs.nocobase.com/20250707105447_rec_-m25b6x.gif)

### [工作流：HTTP 請求节点] 支持 `multipart/form-data` 類型

在工作流中配置 HTTP 請求节点時，现已支持選擇 `multipart/form-data` 類型。啟用该類型后，可在請求 Body 中以 `form-data` 方式传递資料，支持套件含 `file` 類型欄位，实现檔案上傳等场景。

![image-gutu74.png](https://static-docs.nocobase.com/image-gutu74.png)

### [工作流：审批] 审批节点结果支持生成审批記錄變數

审批节点執行结果可作为變數供后续节点使用，支持狀態与資料自動記錄

![20250614095052](https://static-docs.nocobase.com/20250614095052.png)

参考檔案：[节点结果](https://docs-cn.nocobase.com/handbook/workflow-approval/node#%E8%8A%82%E7%82%B9%E7%BB%93%E6%9E%9C)

## 最佳化

### 支持在输入框中扫码填充資料

通用文本输入框元件新增 Enable Scan 配置项，啟用后将在输入框右侧顯示扫码按钮，支持扫码裝置录入，并可配置是否允許手動输入。

![image-u7gfro.png](https://static-docs.nocobase.com/image-u7gfro.png)

参考檔案：[扫码录入](https://docs-cn.nocobase.com/handbook/ui/fields/field-settings/enable-scan)

### Markdown 中支持本機化

Markdown 內容现已支持本機化，可使用 `{{t 'xxx'}}` 语法插入多语言文本。

![20250707132207_rec_-a1fu68.gif](https://static-docs.nocobase.com/20250707132207_rec_-a1fu68.gif)

参考檔案：[本機化](https://docs-cn.nocobase.com/handbook/ui/blocks/other-blocks/markdown#%E6%9C%AC%E5%9C%B0%E5%8C%96)

### 選單連結支持新視窗開啟

選單連結新增“Open in new window”配置项，支持自訂連結的開啟方式。

![image-x0qfsq.png](https://static-docs.nocobase.com/image-x0qfsq.png)

### 日历区块支持設定週起始日

可自訂日历视图的週起始日，支持選擇「週日」或「週一」，满足不同地区和使用习惯。

![image-uu5ubi.png](https://static-docs.nocobase.com/image-uu5ubi.png)

### Markdown（Vditor）檢視模式支持圖片點擊放大

在檢視模式下，支持點擊 Markdown 內容中的圖片进行放大預覽，提升阅读体验。

![20250707134351_rec_-zd0mvw.gif](https://static-docs.nocobase.com/20250707134351_rec_-zd0mvw.gif)

### 工作流模組功能与效能全面提升

- 支持使用更多欄位进行工作流篩選，提升查找效率
- 最佳化行動裝置展示樣式，提升操作体验
- 排除 JSON 欄位載入，显著提升執行計畫清單載入效能
- 节点測試執行新增日誌 API
- 調整 `getCollectionFieldOptions` 方法的 API 介面，增強灵活性

![image-5b3byb.png](https://static-docs.nocobase.com/image-5b3byb.png)

### 审批流程功能增強与体验提升

- 转签、加签人员選擇清單新增配置项，支持顯示更多欄位資訊，辅助更精准选人
- 時间线中的時间顯示調整为绝对時间，提升可读性
- 从工作流外掛中匯入审批相关資料表，避免本機表被重写
- 調整變數 API 介面结构，提升灵活性与一致性

![20250707141716_rec_-v2nc4q.gif](https://static-docs.nocobase.com/20250707141716_rec_-v2nc4q.gif)

### 支持通過環境變數配置資料程式庫連線池選項

可通過環境變數灵活設定資料程式庫連線池參數，提升部署灵活性。

![image-tz87as.png](https://static-docs.nocobase.com/image-tz87as.png)

### 评论区块支持分页顯示

支持对评论內容进行分页載入，提升大資料量场景下的載入效能与阅读体验。

![20250707135131_rec_-lk66qq.gif](https://static-docs.nocobase.com/20250707135131_rec_-lk66qq.gif)

### 行動裝置体验提升

- 通知彈出視窗适配行動裝置樣式，介面更清晰
- 行動裝置布局判断邏輯最佳化，提升回應准确性

## [v1.7.20](https://github.com/nocobase/nocobase/compare/v1.7.19...v1.7.20) - 2025-07-07

### 🐛 修復

- **[client]**
  - 欄位变更后，依赖该欄位的資料範圍应自動清空已选值 ([#7161](https://github.com/nocobase/nocobase/pull/7161)) by @zhangzhonghe

  - 修復設定表格列宽度無效的问题 ([#7158](https://github.com/nocobase/nocobase/pull/7158)) by @zhangzhonghe

  - 修復複製按钮彈出視窗中，篩選表单报错的问题 ([#7154](https://github.com/nocobase/nocobase/pull/7154)) by @zhangzhonghe

  - 修復了儲存一对一关系欄位报错问题 ([#7153](https://github.com/nocobase/nocobase/pull/7153)) by @aaaaaajie

- **[undefined]** 修復 e2e CI 檔案 ([#7160](https://github.com/nocobase/nocobase/pull/7160)) by @mytharcher

- **[檔案管理器]**
  - 修復 mimetype 類型檢測 ([#7164](https://github.com/nocobase/nocobase/pull/7164)) by @mytharcher

  - 修復 ESM 引起的编译錯誤 ([#7169](https://github.com/nocobase/nocobase/pull/7169)) by @mytharcher

- **[公開表单]** 修復公開表单中 Date Only 欄位選擇日期失敗的问题 ([#7168](https://github.com/nocobase/nocobase/pull/7168)) by @katherinehhh

- **[工作流]** 修復行動裝置需要多次左滑才能返回上一页的问题 ([#7165](https://github.com/nocobase/nocobase/pull/7165)) by @zhangzhonghe

- **[資料可视化]** 表格分页器问题 ([#7151](https://github.com/nocobase/nocobase/pull/7151)) by @2013xile

- **[工作流：审批]**
  - 修復撤回后关系資料不全的问题 by @mytharcher

  - 移除因更新 schema 造成逾時的事务 by @mytharcher

  - 修復审批被刪除后的頁面报错 by @mytharcher

  - 修復提交审批修改关系欄位的參數 by @mytharcher

## [v1.7.19](https://github.com/nocobase/nocobase/compare/v1.7.18...v1.7.19) - 2025-07-03

### 🚀 最佳化

- **[database]** 支持从環境變數配置連線池的選項 ([#7133](https://github.com/nocobase/nocobase/pull/7133)) by @mytharcher

- **[工作流]**
  - 排除 JSON 欄位載入以改進執行計畫清單載入效能 ([#7138](https://github.com/nocobase/nocobase/pull/7138)) by @mytharcher

  - 为节点測試執行增加日誌 API ([#7129](https://github.com/nocobase/nocobase/pull/7129)) by @mytharcher

- **[多應用管理器]** 多應用管理支持篩選操作 ([#7124](https://github.com/nocobase/nocobase/pull/7124)) by @katherinehhh

- **[工作流：审批]** 将時间线中的時间調整为绝对時间 by @mytharcher

### 🐛 修復

- **[client]**
  - 在連線视图中設定欄位顯示名称（displayName）未生效的问题 ([#7130](https://github.com/nocobase/nocobase/pull/7130)) by @aaaaaajie

  - 修復詳情区块中子表格設定背景顏色時樣式重複的问题 ([#7144](https://github.com/nocobase/nocobase/pull/7144)) by @katherinehhh

  - 工作流人工节点的 UI 配置，設定联动規則不能選擇目前表单變數 ([#7125](https://github.com/nocobase/nocobase/pull/7125)) by @zhangzhonghe

  - 修復 編輯表单中子表格的关系欄位設定的預設值覆盖已有資料的问题 ([#7120](https://github.com/nocobase/nocobase/pull/7120)) by @katherinehhh

  - 修復表单中的 Markdown 欄位未能实時顯示 $nForm 變數內容 ([#7147](https://github.com/nocobase/nocobase/pull/7147)) by @katherinehhh

  - 对基于 'x-acl-action' 的表单配置项容错 ([#7128](https://github.com/nocobase/nocobase/pull/7128)) by @mytharcher

- **[utils]** 修復使用 Exact day 變數篩選 DateOnly 或 Datetime (without time zone) 欄位時篩選錯誤的问题 ([#7113](https://github.com/nocobase/nocobase/pull/7113)) by @katherinehhh

- **[工作流]** 修復迴圈參考导致的报错 ([#7134](https://github.com/nocobase/nocobase/pull/7134)) by @mytharcher

- **[密碼策略]** 支持永久锁定使用者 by @2013xile

- **[工作流：子流程]** 修復集群模式下的问题 by @mytharcher

- **[工作流：审批]**
  - 从申请清單的篩選项中移除不可篩選的欄位 by @mytharcher

  - 补充表单的布局配置项 by @mytharcher

## [v1.7.18](https://github.com/nocobase/nocobase/compare/v1.7.17...v1.7.18) - 2025-06-26

### 🚀 最佳化

- **[工作流]** 最佳化行動裝置樣式 ([#7040](https://github.com/nocobase/nocobase/pull/7040)) by @mytharcher

- **[公開表单]** 最佳化公開表单中日期元件的效能 ([#7117](https://github.com/nocobase/nocobase/pull/7117)) by @zhangzhonghe

### 🐛 修復

- **[工作流]** 修復待办中心載入記錄的參數 ([#7123](https://github.com/nocobase/nocobase/pull/7123)) by @mytharcher

- **[WEB 客戶端]** 修復設定角色選單權限后頁面下区块不顯示的问题 ([#7112](https://github.com/nocobase/nocobase/pull/7112)) by @aaaaaajie

- **[工作流：审批]**
  - 修復审批觸發器中申请人變數名的问题 by @mytharcher

  - 修復行動裝置樣式 by @mytharcher

  - 修復审批关联表被刪除后的报错 by @mytharcher

## [v1.7.17](https://github.com/nocobase/nocobase/compare/v1.7.16...v1.7.17) - 2025-06-23

### 🐛 修復

- **[client]**
  - 修復日期欄位在含時间格式下的範圍约束錯誤 ([#7107](https://github.com/nocobase/nocobase/pull/7107)) by @katherinehhh

  - URL 查詢參數變數為空時，資料範圍的條件沒有被移除 ([#7104](https://github.com/nocobase/nocobase/pull/7104)) by @zhangzhonghe

- **[行動裝置]** 修復行動裝置彈出視窗的层级问题 ([#7110](https://github.com/nocobase/nocobase/pull/7110)) by @zhangzhonghe

- **[日历]** 修復日历区块快速建立事项時，表单日期欄位例外问题 ([#7106](https://github.com/nocobase/nocobase/pull/7106)) by @katherinehhh

## [v1.7.16](https://github.com/nocobase/nocobase/compare/v1.7.15...v1.7.16) - 2025-06-19

### 🐛 修復

- **[工作流]**
  - 修復已執行数在大整型数時檢查錯誤的问题 ([#7099](https://github.com/nocobase/nocobase/pull/7099)) by @mytharcher

  - 修復統計資料被不是主版本的工作流级联刪除的问题 ([#7103](https://github.com/nocobase/nocobase/pull/7103)) by @mytharcher

- **[操作：匯入記錄]** 修復批量匯入使用者名和密碼后無法登入的问题 ([#7076](https://github.com/nocobase/nocobase/pull/7076)) by @aaaaaajie

- **[工作流：审批]** 限制只有参与者可以檢視审批詳情 by @mytharcher

## [v1.7.15](https://github.com/nocobase/nocobase/compare/v1.7.14...v1.7.15) - 2025-06-18

### 🐛 修復

- **[client]**
  - 对每个欄位使用独立的變數範圍 ([#7012](https://github.com/nocobase/nocobase/pull/7012)) by @mytharcher

  - 欄位赋值：关系欄位無法被清空資料 ([#7086](https://github.com/nocobase/nocobase/pull/7086)) by @zhangzhonghe

  - 表格列的文本對齊功能無效 ([#7094](https://github.com/nocobase/nocobase/pull/7094)) by @zhangzhonghe

- **[工作流]** 修復已執行数在大整型数時檢查錯誤的问题 ([#7091](https://github.com/nocobase/nocobase/pull/7091)) by @mytharcher

- **[檔案管理器]** 修復审批處理中附件欄位無法被更新的问题 ([#7093](https://github.com/nocobase/nocobase/pull/7093)) by @mytharcher

- **[工作流：审批]** 使用比較代替隐式邏輯以避免類型问题 by @mytharcher

## [v1.7.14](https://github.com/nocobase/nocobase/compare/v1.7.13...v1.7.14) - 2025-06-17

### 🚀 最佳化

- **[client]** 网格卡片区块操作栏為空時自動隱藏 ([#7069](https://github.com/nocobase/nocobase/pull/7069)) by @zhangzhonghe

- **[驗證]** 移除 `verifiers:listByUser` 介面中回應的認證器配置資訊 ([#7090](https://github.com/nocobase/nocobase/pull/7090)) by @2013xile

### 🐛 修復

- **[database]** 修復 updateOrCreate 和 firstOrCreate 不支持关系更新的问题 ([#7088](https://github.com/nocobase/nocobase/pull/7088)) by @chenos

- **[client]**
  - 修復公開表单欄位預設值中 URL 查詢參數變數無效的问题 ([#7084](https://github.com/nocobase/nocobase/pull/7084)) by @katherinehhh

  - 修復 子表格列欄位 style 條件判断無效的问题 ([#7083](https://github.com/nocobase/nocobase/pull/7083)) by @katherinehhh

  - 篩選表单中，通過关系表欄位篩選無效 ([#7070](https://github.com/nocobase/nocobase/pull/7070)) by @zhangzhonghe

- **[資料表欄位：多对多 (陣列)]** 存在 `updatedBy` 欄位的時，更新多对多（陣列）欄位报错 ([#7089](https://github.com/nocobase/nocobase/pull/7089)) by @2013xile

- **[公開表单]** 公開表单：修復提交表单時报無權限的问题 ([#7085](https://github.com/nocobase/nocobase/pull/7085)) by @zhangzhonghe

## [v1.7.13](https://github.com/nocobase/nocobase/compare/v1.7.12...v1.7.13) - 2025-06-17

### 🚀 最佳化

- **[client]** Logo 容器宽度根据內容類型自适应（圖片固定 168px，文本自動宽度） ([#7075](https://github.com/nocobase/nocobase/pull/7075)) by @Cyx649312038

- **[工作流：审批]** 为转签、加签的人员選擇清單增加额外欄位顯示的配置项 by @mytharcher

### 🐛 修復

- **[client]**
  - 修復子表格欄位切换頁面后必填提示不消失的问题 ([#7080](https://github.com/nocobase/nocobase/pull/7080)) by @katherinehhh

  - 修復金额欄位元件从掩码改为數字后小數点丢失的问题 ([#7077](https://github.com/nocobase/nocobase/pull/7077)) by @katherinehhh

  - 修復子表格中 Markdown（Vditor）欄位元件渲染不正確的问题 ([#7074](https://github.com/nocobase/nocobase/pull/7074)) by @katherinehhh

- **[資料表欄位：自動編碼]** 修復基于字元串的大整數序列計算 ([#7079](https://github.com/nocobase/nocobase/pull/7079)) by @mytharcher

- **[備份管理器]** windows 平台下，还原 MySQL 應用時提示無法識別的命令錯誤 by @gchust

## [v1.7.12](https://github.com/nocobase/nocobase/compare/v1.7.11...v1.7.12) - 2025-06-16

### 🚀 最佳化

- **[client]** checkbox 欄位联动條件判断支持 "為空”和“不為空” ([#7073](https://github.com/nocobase/nocobase/pull/7073)) by @katherinehhh

### 🐛 修復

- **[client]** 建立反向关系欄位后，編輯关系欄位設定项“在目标資料表里建立反向关系欄位”未勾选 ([#6914](https://github.com/nocobase/nocobase/pull/6914)) by @aaaaaajie

- **[資料源管理]** 修改權限的資料範圍后，相关角色同步生效 ([#7065](https://github.com/nocobase/nocobase/pull/7065)) by @aaaaaajie

- **[權限控制]** 修復了在沒有預設角色時無法进入應用的问题 ([#7059](https://github.com/nocobase/nocobase/pull/7059)) by @aaaaaajie

- **[工作流：自訂操作事件]** 修復操作成功后配置中的重定向連結變數未解析的问题 by @mytharcher

## [v1.7.11](https://github.com/nocobase/nocobase/compare/v1.7.10...v1.7.11) - 2025-06-15

### 🎉 新特性

- **[文本複製]** 支持一鍵複製文本欄位內容 ([#6954](https://github.com/nocobase/nocobase/pull/6954)) by @zhangzhonghe

### 🐛 修復

- **[client]**
  - 关系欄位資料選擇器提交后未清空選取資料 ([#7067](https://github.com/nocobase/nocobase/pull/7067)) by @katherinehhh

  - 修復上傳元件的大小提示文字 ([#7057](https://github.com/nocobase/nocobase/pull/7057)) by @mytharcher

- **[server]** Cannot read properties of undefined (reading 'setMaaintainingMessage') ([#7064](https://github.com/nocobase/nocobase/pull/7064)) by @chenos

- **[工作流：迴圈节点]** 修復迴圈分支在條件未满足時仍然執行的问题 ([#7063](https://github.com/nocobase/nocobase/pull/7063)) by @mytharcher

- **[工作流：审批]**
  - 修復待办統計在執行計畫取消后未更新的问题 by @mytharcher

  - 修復觸發器變數中按類型篩選的缺陷 by @mytharcher

## [v1.7.10](https://github.com/nocobase/nocobase/compare/v1.7.9...v1.7.10) - 2025-06-12

### 🐛 修復

- **[client]**
  - 修復联动規則卡死的问题 ([#7050](https://github.com/nocobase/nocobase/pull/7050)) by @zhangzhonghe

  - 修復：在 APIClient 中新增可選链以避免 handler 未定义時报错 ([#7054](https://github.com/nocobase/nocobase/pull/7054)) by @sheldon66

  - 修復二级彈出視窗配置表单欄位時自動關閉彈出視窗的问题 ([#7052](https://github.com/nocobase/nocobase/pull/7052)) by @katherinehhh

- **[資料可视化]** 修復圖表区块中篩選表单的日期欄位設定为“介於”時元件未正確顯示的问题 ([#7051](https://github.com/nocobase/nocobase/pull/7051)) by @katherinehhh

- **[API 檔案]** 非 NocoBase 官方外掛無法展示API檔案 ([#7045](https://github.com/nocobase/nocobase/pull/7045)) by @chenzhizdt

- **[操作：匯入記錄]** 匯入 xlsx 禁止多行文本欄位插入非字元串格式資料 ([#7049](https://github.com/nocobase/nocobase/pull/7049)) by @aaaaaajie

## [v1.7.9](https://github.com/nocobase/nocobase/compare/v1.7.8...v1.7.9) - 2025-06-11

### 🐛 修復

- **[client]** 修復区块报错的问题 ([#7048](https://github.com/nocobase/nocobase/pull/7048)) by @gchust

## [v1.7.8](https://github.com/nocobase/nocobase/compare/v1.7.6...v1.7.8) - 2025-06-10

### 🎉 新特性

- **[审计日誌]** 新增環境變數 `AUDIT_LOGGER_TRANSPORT` 来控制日誌输出方式 by @2013xile

### 🚀 最佳化

- **[日历]** 支持設定日历区块的週起始日（週日或週一） ([#7032](https://github.com/nocobase/nocobase/pull/7032)) by @katherinehhh

- **[資料表欄位：多对多 (陣列)]** 修復資料表中 many-to-many(many) 欄位的權限錯誤 ([#7028](https://github.com/nocobase/nocobase/pull/7028)) by @aaaaaajie

### 🐛 修復

- **[client]**
  - 修復二级彈出視窗配置表单欄位時自動關閉彈出視窗的问题 ([#7042](https://github.com/nocobase/nocobase/pull/7042)) by @katherinehhh

  - 修復篩選表单中联动規則設定下拉選項欄位的 options 不生效问题 ([#7035](https://github.com/nocobase/nocobase/pull/7035)) by @katherinehhh

  - 篩選表单的驗證規則会导致篩選按钮無效 ([#6975](https://github.com/nocobase/nocobase/pull/6975)) by @zhangzhonghe

  - 修復区块模板中因重複介面請求而导致的欄位不顯示问题 ([#6985](https://github.com/nocobase/nocobase/pull/6985)) by @zhangzhonghe

- **[操作：匯入記錄]** 修復子表匯入关联欄位报错的问题 ([#7039](https://github.com/nocobase/nocobase/pull/7039)) by @aaaaaajie

- **[資料可视化]** 复选框欄位在圖表中應該顯示標籤值而不是原始值 ([#7033](https://github.com/nocobase/nocobase/pull/7033)) by @2013xile

- **[工作流]** 修復觸發器未正確配置時手動執行的报错 ([#7036](https://github.com/nocobase/nocobase/pull/7036)) by @mytharcher

- **[工作流：审批]**
  - 避免未找到欄位报错 by @mytharcher

  - 修復重新整理审批內容詳情页時 API 报错 by @mytharcher

- **[企业微信]** 网关中介軟體增加回呼路徑判断 by @2013xile

## [v1.7.6](https://github.com/nocobase/nocobase/compare/v1.7.5...v1.7.6) - 2025-06-09

### 🚀 最佳化

- **[client]** 禁止将一个分組選單移动到自己內部 ([#7005](https://github.com/nocobase/nocobase/pull/7005)) by @zhangzhonghe

### 🐛 修復

- **[client]**
  - 修復了区块读取外部資料源视图資料時报错的问题。 ([#7017](https://github.com/nocobase/nocobase/pull/7017)) by @aaaaaajie

  - 修復篩選区块參數錯誤的问题 ([#6966](https://github.com/nocobase/nocobase/pull/6966)) by @zhangzhonghe

  - 在联动規則中使用“目前物件”變數無效 ([#7008](https://github.com/nocobase/nocobase/pull/7008)) by @zhangzhonghe

  - 用联动規則無法清除子表格的必填标志 ([#7022](https://github.com/nocobase/nocobase/pull/7022)) by @zhangzhonghe

- **[undefined]** 修復将 possibleTypes 从資料程式庫固定值改为動態配置，解決應用升級后兼容性问题 by @aaaaaajie

- **[行動裝置]** 最佳化行動裝置彈出視窗卡顿的问题 ([#7029](https://github.com/nocobase/nocobase/pull/7029)) by @zhangzhonghe

- **[資料源管理]** 修復将 possibleTypes 从資料程式庫固定值改为動態配置，解決應用升級后兼容性问题 ([#7019](https://github.com/nocobase/nocobase/pull/7019)) by @aaaaaajie

- **[操作：匯入記錄]** 修復匯入XLSX树表格資料時批量編輯报错 ([#7013](https://github.com/nocobase/nocobase/pull/7013)) by @aaaaaajie

- **[工作流]** 修復工作流不存在時的頁面报错 ([#7023](https://github.com/nocobase/nocobase/pull/7023)) by @mytharcher

- **[工作流：JavaScript 节点]** 修復相对路徑引入套件失敗的问题 by @mytharcher

- **[工作流：审批]**
  - 修復工作流刪除之后报错的问题 by @mytharcher

  - 审批詳情中重新載入檔案資料以避免連結失效 by @mytharcher

  - 修復觸發器提供的變數 by @mytharcher

## [v1.7.5](https://github.com/nocobase/nocobase/compare/v1.7.4...v1.7.5) - 2025-06-07

### 🐛 修復

- **[client]** 对每个欄位使用独立的變數範圍 ([#7012](https://github.com/nocobase/nocobase/pull/7012)) by @mytharcher

- **[database]** 修復匯入xlsx功能缺失的建立人和最後更新人欄位 ([#7011](https://github.com/nocobase/nocobase/pull/7011)) by @aaaaaajie

- **[工作流]** 修復資料表事件在新增或更新模式時，新增的資料不套件含改变的欄位导致不觸發的问题 ([#7015](https://github.com/nocobase/nocobase/pull/7015)) by @mytharcher

- **[操作：匯出記錄 Pro]** 修復在带條件匯出附件時报错。 by @aaaaaajie

## [v1.7.4](https://github.com/nocobase/nocobase/compare/v1.7.3...v1.7.4) - 2025-06-06

### 🐛 修復

- **[client]**
  - 关系欄位阅读模式下 hover 時出现子表格和子表单 ([#7002](https://github.com/nocobase/nocobase/pull/7002)) by @zhangzhonghe

  - 修復彈出視窗按钮中的 Markdown 区块联动規則不生效的问题 ([#7007](https://github.com/nocobase/nocobase/pull/7007)) by @katherinehhh

- **[本機化]** 修復词条為空导致的报错 ([#7010](https://github.com/nocobase/nocobase/pull/7010)) by @2013xile

- **[非同步任務管理器]** 修復非同步匯入多次執行缺陷 ([#7006](https://github.com/nocobase/nocobase/pull/7006)) by @aaaaaajie

- **[操作：匯出記錄 Pro]** 修復非同步匯入多次執行缺陷 by @aaaaaajie

- **[工作流：审批]** 修復转签后其他人通過的审批無法繼續的问题 by @mytharcher

## [v1.7.3](https://github.com/nocobase/nocobase/compare/v1.7.2...v1.7.3) - 2025-06-06

### 🚀 最佳化

- **[工作流]** 支持使用更多欄位篩選工作流 ([#6995](https://github.com/nocobase/nocobase/pull/6995)) by @mytharcher

### 🐛 修復

- **[client]**
  - 修復彈出視窗詳情区块子表格翻页觸發未儲存提示的问题 ([#7004](https://github.com/nocobase/nocobase/pull/7004)) by @katherinehhh

  - 修復欄位赋值元件赋值變數時未顯示欄位標題 ([#7001](https://github.com/nocobase/nocobase/pull/7001)) by @katherinehhh

  - 修復欄位樣式联动規則設定不生效的问题 ([#7003](https://github.com/nocobase/nocobase/pull/7003)) by @katherinehhh

## [v1.7.2](https://github.com/nocobase/nocobase/compare/v1.7.1...v1.7.2) - 2025-06-05

### 🚀 最佳化

- **[操作：批量編輯]** 在選擇模式下使用 `filterByTk` 代替 `filter` 作为篩選參數 ([#6994](https://github.com/nocobase/nocobase/pull/6994)) by @mytharcher

- **[操作：匯入記錄 Pro]** 最佳化匯入xlsx檔案在處理超大資料量（高行列数）時的記憶體耗尽，系統卡死或崩溃 by @aaaaaajie

### 🐛 修復

- **[client]**
  - 修復欄位赋值元件中欄位標題未顯示的问题 ([#6987](https://github.com/nocobase/nocobase/pull/6987)) by @katherinehhh

  - 移动選單的清單中，选不到最後一个選單 ([#6997](https://github.com/nocobase/nocobase/pull/6997)) by @zhangzhonghe

- **[工作流]**
  - 修復篩選元件在切换分組分頁時不更新的问题 ([#6989](https://github.com/nocobase/nocobase/pull/6989)) by @mytharcher

  - 修復工作流統計資料未自動生成的问题 ([#6993](https://github.com/nocobase/nocobase/pull/6993)) by @mytharcher

## [v1.7.1](https://github.com/nocobase/nocobase/compare/v1.7.0...v1.7.1) - 2025-06-04

### 🎉 新特性

- **[資料可视化]** 在圖表转换配置中支持乘法和除法 ([#6788](https://github.com/nocobase/nocobase/pull/6788)) by @bugstark

### 🚀 最佳化

- **[公開表单]** 支持使用 URL 參數作为變數 ([#6973](https://github.com/nocobase/nocobase/pull/6973)) by @mytharcher

### 🐛 修復

- **[client]** 修復区块模板中因重複介面請求而导致的欄位不顯示问题 ([#6957](https://github.com/nocobase/nocobase/pull/6957)) by @zhangzhonghe

- **[工作流：人工處理节点]** 修復外部資料源导致初始化区块报错的问题 ([#6983](https://github.com/nocobase/nocobase/pull/6983)) by @mytharcher

## [v1.7.0](https://github.com/nocobase/nocobase/compare/v1.6.38...v1.7.0) - 2025-06-03

## 新特性

### 使用者角色并集

角色并集是一种權限管理模式，根据系統設定，系統开发者可以選擇使用独立角色、允許角色并集，或者仅使用角色并集，以满足不同的權限需求。

![20250312184651](https://static-docs.nocobase.com/20250312184651.png)

参考檔案：[角色并集](https://docs-cn.nocobase.com/handbook/acl/manual)

### 驗證管理与双因素身分認證（2FA）

驗證码功能已升級为驗證管理，支持多种身分驗證方式（如 TOTP），使用者可绑定驗證方式，在需要時完成身分驗證。系統还支持双因素認證（2FA），登入時需在密碼基础上额外驗證，有效提升账户安全。

![20250603133219_rec_-vg5hh3.gif](https://static-docs.nocobase.com/20250603133219_rec_-vg5hh3.gif)

参考檔案：

* [驗證管理](https://docs-cn.nocobase.com/handbook/verification)
* [双因素身分認證](https://docs-cn.nocobase.com/handbook/two-factor-authentication)
* [TOTP 認證器](https://docs-cn.nocobase.com/handbook/verification-totp-authenticator)

### 模板打印

檔案模板支持動態圖片和条形码渲染功能。

![](https://static-docs.nocobase.com/20250414211130-2025-04-14-21-11-31.png)

参考檔案：[模版打印](https://docs-cn.nocobase.com/handbook/action-template-print#%E5%9C%A8-docx-%E6%96%87%E4%BB%B6%E4%B8%AD%E6%8F%92%E5%85%A5%E5%8A%A8%E6%80%81%E5%9B%BE%E7%89%87)

### 多关鍵词篩選

多关鍵词篩選外掛为 NocoBase 平台增加了强大的文本篩選功能，让您能够使用多个关鍵词进行篩選，大大提高了資料查詢的灵活性和效率。

![20250603152726_rec_-ix3j8w.gif](https://static-docs.nocobase.com/20250603152726_rec_-ix3j8w.gif)

参考檔案：[多关鍵词篩選](https://docs-cn.nocobase.com/handbook/multi-keyword-filter)

### 日期篩選支持選擇相对時间範圍

支持按自訂時间偏移（天/週/月/季度/年）和指定日期进行篩選，满足更灵活的時间範圍查詢需求。

![20250603130948_rec_-plwa6o.gif](https://static-docs.nocobase.com/20250603130948_rec_-plwa6o.gif)

### 联动規則條件左侧支持變數

條件左侧變數用于定义联动規則中“判断的物件”，即基于该變數的值来进行條件判断，从而決定是否觸發联动行为。

![20250417214217](https://static-docs.nocobase.com/20250417214217.png)

参考檔案：[左侧變數](https://docs-cn.nocobase.com/handbook/ui/linkage-rule#%E5%B7%A6%E4%BE%A7%E5%8F%98%E9%87%8F)

### 区块继承模板

继承模板主要适用于希望区块能跟随模板的基础更新，但也需要做一些自己的調整的场景。通過继承模板建立的区块，会继承模板的配置，并能在此基础上进行擴充或覆盖。未被区块覆盖的配置会随模板更新而同步。

![主介面](https://static-docs.nocobase.com/main-screen-block-templates.png)

参考檔案：[继承模版](https://docs-cn.nocobase.com/handbook/block-template#%E7%BB%A7%E6%89%BF%E6%A8%A1%E6%9D%BF)

### 区块联动規則

支持在区块中配置联动規則，实现動態顯示区块。

![image-ccerr7.png](https://static-docs.nocobase.com/image-ccerr7.png)

参考檔案：[区块联动規則](https://docs-cn.nocobase.com/handbook/ui/blocks/block-settings/block-linkage-rule)

### 提交成功后

支持重新整理其它区块的資料，支持带參數数跳转詳情页。

![image-v29vlv.png](https://static-docs.nocobase.com/image-v29vlv.png)

参考檔案：[提交成功后](https://docs-cn.nocobase.com/handbook/ui/actions/action-settings/affter-successful)

### 工作流分類管理

![1-62ogb6.png](https://static-docs.nocobase.com/1-62ogb6.png)

### 部門和附件 URL 外掛开源

![image-br8u55.png](https://static-docs.nocobase.com/image-br8u55.png)

## 最佳化

### 联动規則属性最佳化

* 選擇類型欄位支持設定可選項属性
* 日期類型欄位支持設定日期範圍

![20250603143237_rec_-k8hene.gif](https://static-docs.nocobase.com/20250603143237_rec_-k8hene.gif)

参考檔案：[欄位联动規則](https://docs-cn.nocobase.com/handbook/ui/blocks/block-settings/field-linkage-rule)

### 匯入記錄Pro

匯入配置支持多欄位定唯一記錄，支持設定空白单元格覆盖和忽略模式。

![20250603153457_rec_-9zfsfx.gif](https://static-docs.nocobase.com/20250603153457_rec_-9zfsfx.gif)

参考檔案：[匯入 Pro](https://docs-cn.nocobase.com/handbook/action-import-pro)

### 匯出xlsx效能最佳化

* 匯出大資料表記憶體溢出應用卡死
* 匯出有概率出现重複資料
* 匯出資料按索引、唯一约束、索引策略查詢最佳化
* 新增匯出并发佇列和環境變數設定并发数
  ![20250505171706](https://nocobase-docs.oss-cn-beijing.aliyuncs.com/20250505171706.png)

参考檔案：

- [并发匯出](https://docs-cn.nocobase.com/handbook/action-export-pro#%E5%B9%B6%E5%8F%91%E5%AF%BC%E5%87%BA)
- [关于效能](https://docs-cn.nocobase.com/handbook/action-export-pro#%E5%85%B3%E4%BA%8E%E6%80%A7%E8%83%BD)

### 匯入xlsx效能最佳化

* 匯入策略由原来单条改为批量插入
* 重构重複識別，单条改为批量，更新邏輯，觸發工作流等邏輯不变

参考檔案：[关于效能](https://docs-cn.nocobase.com/handbook/action-import-pro#%E5%85%B3%E4%BA%8E%E6%80%A7%E8%83%BD)

### 工作流執行效率提升 100%

![image-va9ose.png](https://static-docs.nocobase.com/image-va9ose.png)

## [v1.6.38](https://github.com/nocobase/nocobase/compare/v1.6.37...v1.6.38) - 2025-06-03

### 🐛 修復

- **[client]**
  - 修復在彈出視窗中建立的区块，其資料表錯誤的问题 ([#6961](https://github.com/nocobase/nocobase/pull/6961)) by @zhangzhonghe

  - 修復子頁面中篩選表单預設值無效的问题 ([#6960](https://github.com/nocobase/nocobase/pull/6960)) by @zhangzhonghe

  - 修復角色資料表自訂範圍中外部資料源無法展开关系表欄位的问题 ([#6958](https://github.com/nocobase/nocobase/pull/6958)) by @katherinehhh

  - 修復“省略超出長度的內容”選項对关系欄位無效的问题 ([#6967](https://github.com/nocobase/nocobase/pull/6967)) by @zhangzhonghe

  - 修復单行文本欄位阅读模式下，值会顯示成一个陣列的问题 ([#6968](https://github.com/nocobase/nocobase/pull/6968)) by @zhangzhonghe

- **[使用者認證]** 因清理过期token导致的效能问题 ([#6981](https://github.com/nocobase/nocobase/pull/6981)) by @2013xile

- **[檔案管理器]** 修復阿里云 OSS 逾時配置项 ([#6970](https://github.com/nocobase/nocobase/pull/6970)) by @mytharcher

- **[工作流：自訂操作事件]** 修復工作台的初始化按钮 by @mytharcher

- **[認證：OIDC]** 登入按钮標題的本機化翻译不生效 by @2013xile

## [v1.6.37](https://github.com/nocobase/nocobase/compare/v1.6.36...v1.6.37) - 2025-05-30

### 🐛 修復

- **[client]**
  - 修復篩選按钮下拉清單的欄位順序 ([#6962](https://github.com/nocobase/nocobase/pull/6962)) by @zhangzhonghe

  - 修復編輯表单中子表格联动規則在清空关系欄位后觸發請求，未使用表单实時值計算值 ([#6963](https://github.com/nocobase/nocobase/pull/6963)) by @katherinehhh

  - 修復子表格中使用目前物件关系欄位值作为變數值時，当关系欄位值為空会发起請求的问题 ([#6969](https://github.com/nocobase/nocobase/pull/6969)) by @katherinehhh

- **[主題編輯器]** 隱藏主題切换選項，和修復彈出視窗樣式 ([#6964](https://github.com/nocobase/nocobase/pull/6964)) by @zhangzhonghe

- **[工作流：审批]** 修復转签加签時带关系條件的人员範圍查詢报错问题 by @mytharcher

## [v1.6.36](https://github.com/nocobase/nocobase/compare/v1.6.35...v1.6.36) - 2025-05-29

### 🚀 最佳化

- **[認證：OIDC]** 按信箱绑定使用者時忽略大小写 by @2013xile

## [v1.6.35](https://github.com/nocobase/nocobase/compare/v1.6.34...v1.6.35) - 2025-05-29

### 🎉 新特性

- **[undefined]**
  - 新增"输入框複製按钮"外掛，为单行文本欄位提供一鍵複製功能 ([#6894](https://github.com/nocobase/nocobase/pull/6894)) by @kerwin612

  - 新增"输入框複製按钮"外掛，为单行文本欄位提供一鍵複製功能 ([#6894](https://github.com/nocobase/nocobase/pull/6894)) by @kerwin612

  - 新增gitpod的支持，可以一鍵啟動开发環境，快速開始开发 ([#6922](https://github.com/nocobase/nocobase/pull/6922)) by @kerwin612

### 🚀 最佳化

- **[client]**
  - 解決表单隱藏控件也捕获了tab鍵的问题，极大提高了表单操作效率 ([#6942](https://github.com/nocobase/nocobase/pull/6942)) by @kerwin612

  - 選單連結支持配置是否在新視窗開啟 ([#6918](https://github.com/nocobase/nocobase/pull/6918)) by @katherinehhh

  - 弹出二次確認對話方塊之前先驗證欄位必填项 ([#6931](https://github.com/nocobase/nocobase/pull/6931)) by @katherinehhh

### 🐛 修復

- **[client]**
  - 关系欄位下拉請求資料按 200 条分页 ([#6950](https://github.com/nocobase/nocobase/pull/6950)) by @katherinehhh

  - 修復拖曳表格行時高亮位置不正確的问题 ([#6952](https://github.com/nocobase/nocobase/pull/6952)) by @chenos

  - 区块拖曳調整宽度失效 ([#6944](https://github.com/nocobase/nocobase/pull/6944)) by @chenos

  - 欄位赋值元件多语言不生效 ([#6945](https://github.com/nocobase/nocobase/pull/6945)) by @katherinehhh

  - 修復錯誤彈出視窗里的複製按钮複製出来是[object Object]的问题 ([#6908](https://github.com/nocobase/nocobase/pull/6908)) by @kerwin612

- **[資料表欄位：Markdown(Vditor)]** 修復 markdown-vditor 元件縮放后宽度例外 ([#6946](https://github.com/nocobase/nocobase/pull/6946)) by @katherinehhh

- **[工作流：审批]** 修復语言 by @mytharcher

## [v1.6.34](https://github.com/nocobase/nocobase/compare/v1.6.33...v1.6.34) - 2025-05-27

### 🎉 新特性

- **[操作：匯入記錄 Pro]**
  - 匯入配置支持多欄位定唯一記錄 by @aaaaaajie

  - 匯入配置支持設定空白单元格覆盖和忽略模式 by @aaaaaajie

### 🚀 最佳化

- **[undefined]** CI 環境升級 Node 版本至 20 ([#6927](https://github.com/nocobase/nocobase/pull/6927)) by @mytharcher

### 🐛 修復

- **[client]**
  - 联动規則條件不套件含任意一个判断邏輯錯誤 ([#6934](https://github.com/nocobase/nocobase/pull/6934)) by @katherinehhh

  - 区块高度設定未实時生效 ([#6904](https://github.com/nocobase/nocobase/pull/6904)) by @katherinehhh

- **[undefined]** 根据 commander 套件的需求改用 Node 20 版本 ([#6924](https://github.com/nocobase/nocobase/pull/6924)) by @mytharcher

- **[database]** 修復在多对多关系中，UUID 或nanoid 自動生成功能無法正常工作 ([#6912](https://github.com/nocobase/nocobase/pull/6912)) by @aaaaaajie

- **[操作：匯出記錄]** 修復匯出嵌套关系時失敗的问题。 ([#6917](https://github.com/nocobase/nocobase/pull/6917)) by @aaaaaajie

- **[資料源管理]** 解決無法拖曳排序的问题 ([#6937](https://github.com/nocobase/nocobase/pull/6937)) by @chenos

- **[API 檔案]** 补全 req.headers 中的子應用資訊 ([#6933](https://github.com/nocobase/nocobase/pull/6933)) by @chenos

- **[通知：站内信]** 修復了在應用内訊息中“全部标为已读”操作可能影响其他使用者資料的问题。 ([#6926](https://github.com/nocobase/nocobase/pull/6926)) by @sheldon66

- **[工作流：自訂操作事件]** 避免外掛載入順序导致的錯誤 by @mytharcher

- **[檔案儲存：S3 (Pro)]**
  - 修復預覽位址和上傳參數 by @mytharcher

  - 修復重複的上傳參數 by @mytharcher

- **[区块：分步表单]** 修復類型錯誤 by @mytharcher

- **[工作流：审批]**
  - 修復檢視我的申请詳情中 id 取值问题 by @mytharcher

  - 修復提交审批前 appends 和提交資料的計算 by @mytharcher

## [v1.6.33](https://github.com/nocobase/nocobase/compare/v1.6.32...v1.6.33) - 2025-05-23

### 🚀 最佳化

- **[undefined]** 构建 Full 版本 Docker 镜像 ([#6898](https://github.com/nocobase/nocobase/pull/6898)) by @chenos

- **[client]** 最佳化頁面越用越卡的问题 ([#6888](https://github.com/nocobase/nocobase/pull/6888)) by @zhangzhonghe

- **[日历]** 日历区块支持配置重新整理按钮 ([#6920](https://github.com/nocobase/nocobase/pull/6920)) by @katherinehhh

- **[工作流：自訂操作事件]** 基于中文语言的字典表修復英文翻译 by @mytharcher

- **[工作流：审批]** 支持在待办中心處理所有待办任務 by @mytharcher

### 🐛 修復

- **[client]**
  - 新增关联欄位時因 style 欄位格式导致的渲染报错 ([#6903](https://github.com/nocobase/nocobase/pull/6903)) by @katherinehhh

  - 联动規則中对多关系欄位的為空判断不正確 ([#6905](https://github.com/nocobase/nocobase/pull/6905)) by @katherinehhh

- **[資料表欄位：Markdown(Vditor)]** Markdown（Vditor）欄位未适配主題 ([#6919](https://github.com/nocobase/nocobase/pull/6919)) by @katherinehhh

- **[資料表：树]** 更新路徑表的時候避免由于符合到相似前綴，导致錯誤更新 ([#6913](https://github.com/nocobase/nocobase/pull/6913)) by @2013xile

- **[檔案管理器]**
  - 修復檔案預覽 URL 的生成符合規則 ([#6902](https://github.com/nocobase/nocobase/pull/6902)) by @mytharcher

  - 修復前端檔案表注入和上傳檔案參數 ([#6909](https://github.com/nocobase/nocobase/pull/6909)) by @mytharcher

  - 修復非圖片檔案的預覽位址 ([#6889](https://github.com/nocobase/nocobase/pull/6889)) by @mytharcher

- **[工作流：邮件傳送节点]** 處理未定义的 'to' 欄位并最佳化邮件收件人處理。 ([#6915](https://github.com/nocobase/nocobase/pull/6915)) by @sheldon66

- **[工作流：自訂操作事件]**
  - 修復自訂操作按钮點擊几次后表现不正常 by @mytharcher

  - 修復錯誤處理函式無法通過類別符合的问题 by @mytharcher

- **[工作流：审批]** 修復关系追加參數計算 by @mytharcher

## [v1.6.32](https://github.com/nocobase/nocobase/compare/v1.6.31...v1.6.32) - 2025-05-20

### 🐛 修復

- **[client]**
  - 刪除表格資料后分页未正確跳转 ([#6892](https://github.com/nocobase/nocobase/pull/6892)) by @katherinehhh

  - 关系欄位使用级联元件時，在彈出視窗首次開啟未顯示資料 ([#6886](https://github.com/nocobase/nocobase/pull/6886)) by @katherinehhh

## [v1.6.31](https://github.com/nocobase/nocobase/compare/v1.6.30...v1.6.31) - 2025-05-18

### 🚀 最佳化

- **[工作流]** 补全英文语言內容 ([#6885](https://github.com/nocobase/nocobase/pull/6885)) by @mytharcher

### 🐛 修復

- **[database]** 處理匯入欄位是字元串類型的空白单元格报错 ([#6880](https://github.com/nocobase/nocobase/pull/6880)) by @aaaaaajie

- **[client]**
  - 新增关联表格時未全部篩選已关联的資料 ([#6874](https://github.com/nocobase/nocobase/pull/6874)) by @katherinehhh

  - 子表单中放出关联欄位時未提交关联資料 ([#6883](https://github.com/nocobase/nocobase/pull/6883)) by @katherinehhh

  - 拖曳排序欄位未正確顯示所有可選欄位 ([#6875](https://github.com/nocobase/nocobase/pull/6875)) by @katherinehhh

- **[工作流]** 修復迴圈觸發限制更新后資料表事件觸發不正確 ([#6876](https://github.com/nocobase/nocobase/pull/6876)) by @mytharcher

- **[区块：操作面板]** 读取扫码器中的路由 basename，以适配桌面端。 ([#6877](https://github.com/nocobase/nocobase/pull/6877)) by @sheldon66

- **[工作流：人工處理节点]** 修復展示未處理待办時的渲染錯誤 ([#6879](https://github.com/nocobase/nocobase/pull/6879)) by @mytharcher

- **[工作流：审批]** 修復转签和加签時選擇指派人的清單載入问题 by @mytharcher

## [v1.6.30](https://github.com/nocobase/nocobase/compare/v1.6.29...v1.6.30) - 2025-05-15

### 🚀 最佳化

- **[client]** 增加阅读狀態圖片的内置尺寸選項 ([#6868](https://github.com/nocobase/nocobase/pull/6868)) by @katherinehhh

### 🐛 修復

- **[檔案管理器]**
  - 修復類型 ([#6873](https://github.com/nocobase/nocobase/pull/6873)) by @mytharcher

  - 修復無外鍵權限時建立檔案記錄 URL 無效的问题 ([#6863](https://github.com/nocobase/nocobase/pull/6863)) by @mytharcher

- **[操作：匯出記錄]** 匯入匯出欄位配置中刪除欄位严重卡顿 ([#6861](https://github.com/nocobase/nocobase/pull/6861)) by @katherinehhh

- **[資料可视化]** 在区块级别操作中開啟彈出視窗，新增圖表不顯示 ([#6864](https://github.com/nocobase/nocobase/pull/6864)) by @2013xile

- **[操作：匯出記錄 Pro]** pro 匯入匯出欄位配置中刪除欄位卡顿 by @katherinehhh

- **[檔案儲存：S3 (Pro)]** 变更为使用資料表欄位来定位儲存引擎 by @mytharcher

- **[備份管理器]** 修復编译時的類型錯誤 by @mytharcher

## [v1.6.29](https://github.com/nocobase/nocobase/compare/v1.6.28...v1.6.29) - 2025-05-13

### 🚀 最佳化

- **[工作流]** 支持複製任意多版本的草稿 ([#6851](https://github.com/nocobase/nocobase/pull/6851)) by @mytharcher

### 🐛 修復

- **[操作：匯出記錄]** 匯出多级关联关系和附件 URL 時的空值问题。 ([#6845](https://github.com/nocobase/nocobase/pull/6845)) by @aaaaaajie

- **[工作流：人工處理节点]** 修復待办中心計數錯誤问题 ([#6783](https://github.com/nocobase/nocobase/pull/6783)) by @mytharcher

- **[工作流：測試工具套件]** 修復由于缺少必要外掛造成失敗的測試用例 ([#6839](https://github.com/nocobase/nocobase/pull/6839)) by @mytharcher

- **[資料可视化]** 修復篩選嵌套多对多欄位报错 ([#6855](https://github.com/nocobase/nocobase/pull/6855)) by @2013xile

- **[工作流：子流程]** 修復不存在觸發器時导致的頁面崩溃 by @mytharcher

- **[檔案儲存：S3 (Pro)]** 访问位址有效期無效 by @jiannx

- **[工作流：审批]** 修復待办中心計數錯誤问题 by @mytharcher

## [v1.6.28](https://github.com/nocobase/nocobase/compare/v1.6.27...v1.6.28) - 2025-05-09

### 🐛 修復

- **[database]** 匯入文本欄位是數字值時失敗 ([#6699](https://github.com/nocobase/nocobase/pull/6699)) by @aaaaaajie

- **[client]** 被隱藏的欄位，依然会顯示出来 ([#6844](https://github.com/nocobase/nocobase/pull/6844)) by @zhangzhonghe

- **[操作：匯出記錄]** 修復匯出长文本錯誤 ([#6713](https://github.com/nocobase/nocobase/pull/6713)) by @aaaaaajie

- **[工作流：操作后事件]** 修復操作后事件中目前操作者變數在 Handlebars 模板中無法访问属性的问题 ([#6837](https://github.com/nocobase/nocobase/pull/6837)) by @mytharcher

- **[区块：操作面板]** 操作面板在暗黑模式下顏色不对 ([#6842](https://github.com/nocobase/nocobase/pull/6842)) by @zhangzhonghe

- **[操作：匯出記錄 Pro]** 修復匯出长文本錯誤 by @aaaaaajie

## [v1.6.27](https://github.com/nocobase/nocobase/compare/v1.6.26...v1.6.27) - 2025-05-08

### 🐛 修復

- **[client]**
  - 表格行内按钮拖曳時無法将其他按钮拖动至「複製」按钮 ([#6822](https://github.com/nocobase/nocobase/pull/6822)) by @katherinehhh

  - 表单中多个关系欄位展示关系表欄位時会导致关系欄位不提交 ([#6833](https://github.com/nocobase/nocobase/pull/6833)) by @katherinehhh

## [v1.6.26](https://github.com/nocobase/nocobase/compare/v1.6.25...v1.6.26) - 2025-05-07

### 🎉 新特性

- **[区块：iframe]** Iframe 区块支持配置 allow 属性 ([#6824](https://github.com/nocobase/nocobase/pull/6824)) by @zhangzhonghe

- **[模板打印]** 新增：模板打印中 Option 欄位支持 `{ label, value }` 结构的下拉選項。 by @sheldon66

### 🐛 修復

- **[client]**
  - 嵌套的子頁面中，滑鼠悬浮在“建立区块”按钮時不顯示区块清單 ([#6832](https://github.com/nocobase/nocobase/pull/6832)) by @zhangzhonghe

  - 当改变篩選表单的关系欄位元件为資料選擇器時，沒有“允許多選”配置项 ([#6656](https://github.com/nocobase/nocobase/pull/6656)) by @zhangzhonghe

  - 表单欄位驗證規則违反時錯誤資訊多次顯示 ([#6805](https://github.com/nocobase/nocobase/pull/6805)) by @katherinehhh

  - 子表格中子表单（彈出視窗）無法配置联动規則的 ([#6803](https://github.com/nocobase/nocobase/pull/6803)) by @katherinehhh

  - 修復無法在篩選表单中選擇一对多欄位的子欄位作为篩選项的问题 ([#6809](https://github.com/nocobase/nocobase/pull/6809)) by @zhangzhonghe

  - 阅读模式下子表格分页栏被遮住 ([#6830](https://github.com/nocobase/nocobase/pull/6830)) by @katherinehhh

  - 篩選表单中的表格選擇器，樣式例外 ([#6827](https://github.com/nocobase/nocobase/pull/6827)) by @zhangzhonghe

- **[database]**
  - 修復多对一关系欄位在 MariaDB 下外鍵为大整數配置了 appends 時無法載入的问题 ([#6823](https://github.com/nocobase/nocobase/pull/6823)) by @mytharcher

  - 修復測試用例 ([#6811](https://github.com/nocobase/nocobase/pull/6811)) by @mytharcher

- **[資料表欄位：附件（URL）]** 联动規則中附件（URL）欄位不应支持配置 value ([#6831](https://github.com/nocobase/nocobase/pull/6831)) by @katherinehhh

- **[工作流：自訂操作事件]** 觸發工作流按钮联动規則不正常 by @katherinehhh

## [v1.6.25](https://github.com/nocobase/nocobase/compare/v1.6.24...v1.6.25) - 2025-04-29

### 🎉 新特性

- **[undefined]** 新增 license kit 发套件ci ([#6786](https://github.com/nocobase/nocobase/pull/6786)) by @jiannx

- **[資料可视化：EChrats]** 条形图支持“y轴反向”設定 by @2013xile

### 🚀 最佳化

- **[utils]** 增加篩選按钮欄位清單的高度，和对欄位进行排序分類 ([#6779](https://github.com/nocobase/nocobase/pull/6779)) by @zhangzhonghe

- **[client]** 最佳化子表格新增按钮樣式，并将分页器与按钮排列在同一行 ([#6790](https://github.com/nocobase/nocobase/pull/6790)) by @katherinehhh

- **[檔案管理器]** 增加 OSS 儲存引擎的逾時時间配置项，且預設为 10 分钟 ([#6795](https://github.com/nocobase/nocobase/pull/6795)) by @mytharcher

- **[密碼策略]** 預設密碼过期時间修改为不过期 by @2013xile

- **[企业微信]** 更新使用者信箱時優先使用企业信箱而不是个人信箱 by @2013xile

### 🐛 修復

- **[client]**
  - 折叠面板区块中，当點擊关系欄位搜尋框的清空按钮后，不應該刪除資料範圍 ([#6782](https://github.com/nocobase/nocobase/pull/6782)) by @zhangzhonghe

  - 关系欄位，在顯示关系表下的欄位資料時不提交資料 ([#6798](https://github.com/nocobase/nocobase/pull/6798)) by @katherinehhh

  - 禁止将選單移动到頁面 tab 的前面和后面 ([#6777](https://github.com/nocobase/nocobase/pull/6777)) by @zhangzhonghe

  - 表格区块在篩選時重複顯示資料 ([#6792](https://github.com/nocobase/nocobase/pull/6792)) by @zhangzhonghe

  - 篩選表单中，切换欄位操作符后，重新整理頁面会报错 ([#6781](https://github.com/nocobase/nocobase/pull/6781)) by @zhangzhonghe

- **[database]**
  - 避免文本類型输入資料不是字元串時的报错 ([#6797](https://github.com/nocobase/nocobase/pull/6797)) by @mytharcher

  - 补充sql collection和view collection 的unavailableActions ([#6765](https://github.com/nocobase/nocobase/pull/6765)) by @katherinehhh

- **[create-nocobase-app]** 回退 mariadb 版本至 2.5.6，解決兼容性问题 ([#6762](https://github.com/nocobase/nocobase/pull/6762)) by @chenos

- **[使用者認證]** 不允許修改認證器識別 ([#6808](https://github.com/nocobase/nocobase/pull/6808)) by @2013xile

- **[模板打印]** 修復：修正權限校验邏輯，防止未授權操作。 by @sheldon66

- **[檔案儲存：S3 (Pro)]** 访问位址有效期無效 by @jiannx

- **[区块：树]** 通過外鍵連線后，點擊觸發篩選，篩選條件為空 by @zhangzhonghe

## [v1.6.24](https://github.com/nocobase/nocobase/compare/v1.6.23...v1.6.24) - 2025-04-24

### 🚀 最佳化

- **[client]** 調整上傳檔案的提示資訊 ([#6757](https://github.com/nocobase/nocobase/pull/6757)) by @mytharcher

### 🐛 修復

- **[client]**
  - 视圖表，無編輯權限時允許顯示匯出按钮 ([#6763](https://github.com/nocobase/nocobase/pull/6763)) by @katherinehhh

  - 新增表单中顯示关系欄位子表格/子表单時关系資料也被新增 ([#6727](https://github.com/nocobase/nocobase/pull/6727)) by @katherinehhh

  - 在表单中获取关联表中的多对多陣列欄位資料不正確 ([#6744](https://github.com/nocobase/nocobase/pull/6744)) by @2013xile

## [v1.6.23](https://github.com/nocobase/nocobase/compare/v1.6.22...v1.6.23) - 2025-04-23

### 🚀 最佳化

- **[cli]** 最佳化 `nocobase upgrade` 命令的內部实现邏輯 ([#6754](https://github.com/nocobase/nocobase/pull/6754)) by @chenos

- **[模板打印]** 用客戶端角色访问控制取代了資料源操作權限控制。 by @sheldon66

### 🐛 修復

- **[cli]** 升級時自動更新專案的 package.json ([#6747](https://github.com/nocobase/nocobase/pull/6747)) by @chenos

- **[client]**
  - 新增关联表格時未篩選已关联的資料 ([#6750](https://github.com/nocobase/nocobase/pull/6750)) by @katherinehhh

  - 树表格中新增子記錄按钮的联动規則缺失「目前記錄」變數 ([#6752](https://github.com/nocobase/nocobase/pull/6752)) by @katherinehhh

- **[操作：匯入記錄]** 修復設定欄位權限時出现的匯入匯出例外。 ([#6677](https://github.com/nocobase/nocobase/pull/6677)) by @aaaaaajie

- **[区块：甘特图]** 甘特图区块設定月份视图時，日历头部月份重叠 ([#6753](https://github.com/nocobase/nocobase/pull/6753)) by @katherinehhh

- **[操作：匯出記錄 Pro]**
  - pro匯出按钮在點擊表格排序后丢失篩選參數 by @katherinehhh

  - 修復設定欄位權限時出现的匯入匯出例外。 by @aaaaaajie

- **[檔案儲存：S3 (Pro)]** 修復已上傳檔案的回應資料 by @mytharcher

- **[工作流：审批]** 修復预載入审批記錄資料的关系欄位 by @mytharcher

## [v1.6.22](https://github.com/nocobase/nocobase/compare/v1.6.21...v1.6.22) - 2025-04-22

### 🚀 最佳化

- **[create-nocobase-app]** 更新依赖，移除 SQLite 支持 ([#6708](https://github.com/nocobase/nocobase/pull/6708)) by @chenos

- **[檔案管理器]** 暴露公共套件 API ([#6705](https://github.com/nocobase/nocobase/pull/6705)) by @mytharcher

- **[工作流]** 为變數的類型集合增加日期相关類型 ([#6717](https://github.com/nocobase/nocobase/pull/6717)) by @mytharcher

### 🐛 修復

- **[client]**
  - 行動裝置顶部的導覽栏图标很难被刪除的问题 ([#6734](https://github.com/nocobase/nocobase/pull/6734)) by @zhangzhonghe

  - 通過外鍵連線后，點擊觸發篩選，篩選條件為空 ([#6634](https://github.com/nocobase/nocobase/pull/6634)) by @zhangzhonghe

  - 篩選按钮中日期欄位，切换picker 例外 ([#6695](https://github.com/nocobase/nocobase/pull/6695)) by @katherinehhh

  - 左侧選單的收起按钮会被绑定工作流彈出視窗遮挡的问题 ([#6733](https://github.com/nocobase/nocobase/pull/6733)) by @zhangzhonghe

  - 重新開啟联动規則時缺少操作選項约束 ([#6723](https://github.com/nocobase/nocobase/pull/6723)) by @katherinehhh

  - 未設定匯出權限時仍顯示匯出按钮 ([#6689](https://github.com/nocobase/nocobase/pull/6689)) by @katherinehhh

  - 被联动規則隱藏的必填欄位，不應該影响表单的提交 ([#6709](https://github.com/nocobase/nocobase/pull/6709)) by @zhangzhonghe

- **[server]** create-migration 命令生成的 appVersion 不准确 ([#6740](https://github.com/nocobase/nocobase/pull/6740)) by @chenos

- **[build]** 修復 tar 命令报错的问题 ([#6722](https://github.com/nocobase/nocobase/pull/6722)) by @mytharcher

- **[工作流]** 修復子流程執行定時任務报错的问题 ([#6721](https://github.com/nocobase/nocobase/pull/6721)) by @mytharcher

- **[工作流：自訂操作事件]** 支持多行記錄模式的手動執行 by @mytharcher

- **[檔案儲存：S3 (Pro)]** 增加 multer 邏輯用于服務端上傳 by @mytharcher

## [v1.6.21](https://github.com/nocobase/nocobase/compare/v1.6.20...v1.6.21) - 2025-04-17

### 🚀 最佳化

- **[client]** 为彈出視窗元件增加 delay API ([#6681](https://github.com/nocobase/nocobase/pull/6681)) by @mytharcher

- **[create-nocobase-app]** 升級部分依赖的版本 ([#6673](https://github.com/nocobase/nocobase/pull/6673)) by @chenos

### 🐛 修復

- **[client]**
  - 修復审批节点配置中參考模板区块的新增按钮报错问题 ([#6691](https://github.com/nocobase/nocobase/pull/6691)) by @mytharcher

  - 自訂的关系欄位沒有顯示关系欄位元件 ([#6692](https://github.com/nocobase/nocobase/pull/6692)) by @katherinehhh

  - 修復上傳元件语言问题 ([#6682](https://github.com/nocobase/nocobase/pull/6682)) by @mytharcher

  - 懒載入元件不存在時介面报错 ([#6683](https://github.com/nocobase/nocobase/pull/6683)) by @gchust

  - 补全原生的 Password 元件到封装过的输入元件 ([#6679](https://github.com/nocobase/nocobase/pull/6679)) by @mytharcher

  - 欄位赋值本表欄位清單中顯示了继承表欄位，应只顯示本表欄位 ([#6666](https://github.com/nocobase/nocobase/pull/6666)) by @katherinehhh

- **[database]** 修復 CI 编译錯誤 ([#6687](https://github.com/nocobase/nocobase/pull/6687)) by @aaaaaajie

- **[build]** 外掛依赖 AMD 程式庫時构建产物不正確 ([#6665](https://github.com/nocobase/nocobase/pull/6665)) by @gchust

- **[操作：匯入記錄]** 修復匯入套件含時间欄位的 xlsx 錯誤 ([#6672](https://github.com/nocobase/nocobase/pull/6672)) by @aaaaaajie

- **[工作流：人工處理节点]** 修復人工节点任務狀態常數 ([#6676](https://github.com/nocobase/nocobase/pull/6676)) by @mytharcher

- **[区块：iframe]** iframe 区块設定全高時頁面出现捲動条 ([#6675](https://github.com/nocobase/nocobase/pull/6675)) by @katherinehhh

- **[工作流：自訂操作事件]** 修復測試用例 by @mytharcher

- **[備份管理器]** 还原時若備份未設定密碼，但使用者输入了密碼，还原会出现逾時报错 by @gchust

## [v1.6.20](https://github.com/nocobase/nocobase/compare/v1.6.19...v1.6.20) - 2025-04-14

### 🎉 新特性

- **[部門]** 商业外掛部門、附件 URL、工作流回應訊息改为免费提供 ([#6663](https://github.com/nocobase/nocobase/pull/6663)) by @chenos

### 🐛 修復

- **[client]**
  - 篩選表单不應該顯示“未儲存修改”提示 ([#6657](https://github.com/nocobase/nocobase/pull/6657)) by @zhangzhonghe

  - 篩選表单中关系欄位的“允許多選”設定项不生效 ([#6661](https://github.com/nocobase/nocobase/pull/6661)) by @katherinehhh

  - 篩選表单中，当點擊篩選按钮時，如果有欄位未校验通過，依然会觸發篩選的问题 ([#6659](https://github.com/nocobase/nocobase/pull/6659)) by @zhangzhonghe

  - 切换到分組選單時，不應該跳转到已经在選單中被隱藏的頁面 ([#6654](https://github.com/nocobase/nocobase/pull/6654)) by @zhangzhonghe

- **[檔案儲存：S3 (Pro)]**
  - 整理语言文案 by @jiannx

  - baseurl 和 public 設定不再互相关联，改進 S3 pro 儲存的配置交互体验 by @jiannx

- **[迁移管理]** 迁移時若弹出環境變數彈出視窗，跳過自動備份選項会失效 by @gchust

## [v1.6.19](https://github.com/nocobase/nocobase/compare/v1.6.18...v1.6.19) - 2025-04-14

### 🐛 修復

- **[client]**
  - 修復預覽圖片被遮挡的问题 ([#6651](https://github.com/nocobase/nocobase/pull/6651)) by @zhangzhonghe

  - 表单区块中，欄位配置的預設值会先顯示为原始變數字元串然后再消失 ([#6649](https://github.com/nocobase/nocobase/pull/6649)) by @zhangzhonghe

## [v1.6.18](https://github.com/nocobase/nocobase/compare/v1.6.17...v1.6.18) - 2025-04-11

### 🚀 最佳化

- **[client]**
  - 为 `Variable.Input` 元件增加預設退避類型的 API ([#6644](https://github.com/nocobase/nocobase/pull/6644)) by @mytharcher

  - 最佳化未配置頁面時的提示 ([#6641](https://github.com/nocobase/nocobase/pull/6641)) by @zhangzhonghe

- **[工作流：延時节点]** 支持延遲時间使用變數 ([#6621](https://github.com/nocobase/nocobase/pull/6621)) by @mytharcher

- **[工作流：自訂操作事件]** 为觸發工作流按钮增加重新整理配置项 by @mytharcher

### 🐛 修復

- **[client]**
  - 子表格中描述資訊与操作按钮遮挡 ([#6646](https://github.com/nocobase/nocobase/pull/6646)) by @katherinehhh

  - 彈出視窗表单在 horizontal 布局下初始宽度計算錯誤，导致出现提示和 下划虚线 ([#6639](https://github.com/nocobase/nocobase/pull/6639)) by @katherinehhh

- **[檔案儲存：S3 (Pro)]** 修復next呼叫缺少await by @jiannx

- **[邮件管理]** 修復next呼叫缺少await by @jiannx

## [v1.6.17](https://github.com/nocobase/nocobase/compare/v1.6.16...v1.6.17) - 2025-04-09

### 🚀 最佳化

- **[utils]** 为 dayjs 套件增加時长擴充 ([#6630](https://github.com/nocobase/nocobase/pull/6630)) by @mytharcher

- **[client]**
  - 支持篩選元件中对欄位进行搜尋 ([#6627](https://github.com/nocobase/nocobase/pull/6627)) by @mytharcher

  - 为 `Input` 和 `Variable.TextArea` 元件增加 `trim` API ([#6624](https://github.com/nocobase/nocobase/pull/6624)) by @mytharcher

- **[錯誤處理器]** 在 AppError 元件中支持自訂標題。 ([#6409](https://github.com/nocobase/nocobase/pull/6409)) by @sheldon66

- **[IP 限制]** 更新 IP 限制訊息內容。 by @sheldon66

- **[檔案儲存：S3 (Pro)]** 支持儲存引擎的配置中使用全局變數 by @mytharcher

### 🐛 修復

- **[client]**
  - 联动規則條件設定为任意且無條件內容時属性設定不生效 ([#6628](https://github.com/nocobase/nocobase/pull/6628)) by @katherinehhh

  - 树表使用甘特图区块時資料顯示例外 ([#6617](https://github.com/nocobase/nocobase/pull/6617)) by @katherinehhh

  - 篩選表单中的关系欄位在重新整理頁面后，由于沒有携带 x-data-source 而报错 ([#6619](https://github.com/nocobase/nocobase/pull/6619)) by @zhangzhonghe

  - 連結中中文參數變數值解析失敗 ([#6618](https://github.com/nocobase/nocobase/pull/6618)) by @katherinehhh

- **[使用者]** 使用者个人资料表单 schema 的解析问题 ([#6635](https://github.com/nocobase/nocobase/pull/6635)) by @2013xile

- **[行動裝置]** 下拉單選欄位在行動裝置設定篩選符为套件含時元件未支持多選 ([#6629](https://github.com/nocobase/nocobase/pull/6629)) by @katherinehhh

- **[操作：匯出記錄]** 篩選資料后切换分页再匯出時篩選參數丢失 ([#6633](https://github.com/nocobase/nocobase/pull/6633)) by @katherinehhh

- **[邮件管理]** 邮件管理權限無法檢視邮件清單 by @jiannx

- **[檔案儲存：S3 (Pro)]** 当使用者上傳 logo 失敗時提示錯誤（設定为預設儲存的 S3 Pro） by @mytharcher

- **[工作流：审批]** 修復更新時间在迁移后变化 by @mytharcher

- **[迁移管理]** 部分服務器環境下迁移日誌建立日期顯示不正確 by @gchust

## [v1.6.16](https://github.com/nocobase/nocobase/compare/v1.6.15...v1.6.16) - 2025-04-03

### 🐛 修復

- **[client]**
  - 表单欄位設定不可編輯不起作用 ([#6610](https://github.com/nocobase/nocobase/pull/6610)) by @katherinehhh

  - 表单欄位標題因冒号导致的截断问题 ([#6599](https://github.com/nocobase/nocobase/pull/6599)) by @katherinehhh

- **[database]** 刪除一对多記錄時，同時传递 `filter` 和 `filterByTk` 參數，`filter` 套件含关系欄位時，`filterByTk` 參數失效 ([#6606](https://github.com/nocobase/nocobase/pull/6606)) by @2013xile

## [v1.6.15](https://github.com/nocobase/nocobase/compare/v1.6.14...v1.6.15) - 2025-04-01

### 🚀 最佳化

- **[database]**
  - 为多行文本類型欄位增加去除首尾空白字元的選項 ([#6603](https://github.com/nocobase/nocobase/pull/6603)) by @mytharcher

  - 为单行文本增加自動去除首尾空白字元的選項 ([#6565](https://github.com/nocobase/nocobase/pull/6565)) by @mytharcher

- **[檔案管理器]** 为儲存引擎表的文本欄位增加去除首尾空白字元的選項 ([#6604](https://github.com/nocobase/nocobase/pull/6604)) by @mytharcher

- **[工作流]** 最佳化代码 ([#6589](https://github.com/nocobase/nocobase/pull/6589)) by @mytharcher

- **[工作流：审批]** 支持审批表单使用区块模板 by @mytharcher

### 🐛 修復

- **[database]** 避免“日期時间（無時区）”欄位在值未变动的更新時觸發值改变 ([#6588](https://github.com/nocobase/nocobase/pull/6588)) by @mytharcher

- **[client]**
  - 关系欄位（select）放出关系表欄位時預設顯示 N/A ([#6582](https://github.com/nocobase/nocobase/pull/6582)) by @katherinehhh

  - 修復 `SchemaInitializerItem` 配置了 `items` 時 `disabled` 属性無效的问题 ([#6597](https://github.com/nocobase/nocobase/pull/6597)) by @mytharcher

  - 级联元件刪除后重新選擇時出现 'The value of xxx cannot be in array format' ([#6585](https://github.com/nocobase/nocobase/pull/6585)) by @katherinehhh

- **[資料表欄位：多对多 (陣列)]** 主表篩選带有多对多（陣列）欄位的关联表中的欄位报错的问题 ([#6596](https://github.com/nocobase/nocobase/pull/6596)) by @2013xile

- **[公開表单]** 檢視權限套件括 list 和 get ([#6607](https://github.com/nocobase/nocobase/pull/6607)) by @chenos

- **[使用者認證]** `AuthProvider` 中的 token 赋值 ([#6593](https://github.com/nocobase/nocobase/pull/6593)) by @2013xile

- **[工作流]** 修復同步選項展示问题 ([#6595](https://github.com/nocobase/nocobase/pull/6595)) by @mytharcher

- **[区块：地图]** 地图管理必填校验不应通過空格输入 ([#6575](https://github.com/nocobase/nocobase/pull/6575)) by @katherinehhh

- **[工作流：审批]**
  - 修復审批表单中的前端變數 by @mytharcher

  - 修復分支模式下配置拒絕则結束時的流程问题 by @mytharcher

## [v1.6.14](https://github.com/nocobase/nocobase/compare/v1.6.13...v1.6.14) - 2025-03-29

### 🐛 修復

- **[日历]** 日历区块以週为视图時，边界日期不顯示資料 ([#6587](https://github.com/nocobase/nocobase/pull/6587)) by @katherinehhh

- **[認證：OIDC]** 回呼路徑是字元串'null'時导致跳转不正確 by @2013xile

- **[工作流：审批]** 修復审批节点介面配置变更后資料未同步的问题 by @mytharcher

## [v1.6.13](https://github.com/nocobase/nocobase/compare/v1.6.12...v1.6.13) - 2025-03-28

### 🚀 最佳化

- **[非同步任務管理器]** 最佳化 Pro 匯入匯出按钮非同步邏輯 ([#6531](https://github.com/nocobase/nocobase/pull/6531)) by @chenos

- **[操作：匯出記錄 Pro]** 最佳化 Pro 匯入匯出按钮 by @katherinehhh

- **[迁移管理]** 允許執行迁移時跳過自動備份还原 by @gchust

### 🐛 修復

- **[client]** 同一表单中不同关系欄位的同名关系欄位的联动互相影响 ([#6577](https://github.com/nocobase/nocobase/pull/6577)) by @katherinehhh

- **[操作：批量編輯]** 點擊批量編輯按钮，配置完彈出視窗再開啟，彈出視窗是空白的 ([#6578](https://github.com/nocobase/nocobase/pull/6578)) by @zhangzhonghe

## [v1.6.12](https://github.com/nocobase/nocobase/compare/v1.6.11...v1.6.12) - 2025-03-27

### 🐛 修復

- **[区块：分步表单]**
  - 提交按钮預設和高亮情况下顏色一样 by @jiannx

  - 修復当欄位与其他表单欄位存在关联時，表单重設無效 by @jiannx

- **[工作流：审批]** 修復审批表单提交值的问题 by @mytharcher

## [v1.6.11](https://github.com/nocobase/nocobase/compare/v1.6.10...v1.6.11) - 2025-03-27

### 🚀 最佳化

- **[client]**
  - 最佳化 502 錯誤提示 ([#6547](https://github.com/nocobase/nocobase/pull/6547)) by @chenos

  - 仅支持纯文本檔案預覽 ([#6563](https://github.com/nocobase/nocobase/pull/6563)) by @mytharcher

- **[資料表欄位：自動編碼]** 支持使用 sequence 作为日历区块的標題欄位 ([#6562](https://github.com/nocobase/nocobase/pull/6562)) by @katherinehhh

- **[工作流：审批]** 支持审批處理按钮跳過表单驗證的設定 by @mytharcher

### 🐛 修復

- **[client]**
  - 資料範圍中篩選日期欄位顯示例外 ([#6564](https://github.com/nocobase/nocobase/pull/6564)) by @katherinehhh

  - 選項“省略超出長度的內容”需要重新整理頁面，开关的狀態才生效 ([#6520](https://github.com/nocobase/nocobase/pull/6520)) by @zhangzhonghe

  - 在彈出視窗中無法再次開啟彈出視窗 ([#6535](https://github.com/nocobase/nocobase/pull/6535)) by @zhangzhonghe

- **[API 檔案]** API 檔案頁面不能捲動 ([#6566](https://github.com/nocobase/nocobase/pull/6566)) by @zhangzhonghe

- **[工作流]** 确保建立工作流之前 key 已生成 ([#6567](https://github.com/nocobase/nocobase/pull/6567)) by @mytharcher

- **[工作流：操作后事件]** 多行記錄的批量操作需要觸發多次 ([#6559](https://github.com/nocobase/nocobase/pull/6559)) by @mytharcher

- **[使用者認證]** 註冊頁面欄位的本機化问题 ([#6556](https://github.com/nocobase/nocobase/pull/6556)) by @2013xile

- **[公開表单]** 公開表单頁面標題不應該顯示 Loading... ([#6569](https://github.com/nocobase/nocobase/pull/6569)) by @katherinehhh

## [v1.6.10](https://github.com/nocobase/nocobase/compare/v1.6.9...v1.6.10) - 2025-03-25

### 🐛 修復

- **[client]**
  - 新增連結頁面時，無法使用“目前使用者”變數 ([#6536](https://github.com/nocobase/nocobase/pull/6536)) by @zhangzhonghe

  - 欄位赋值对欄位进行“空值”赋值無效 ([#6549](https://github.com/nocobase/nocobase/pull/6549)) by @katherinehhh

  - `yarn doc` 命令报错 ([#6540](https://github.com/nocobase/nocobase/pull/6540)) by @gchust

  - 篩選表单中，移除下拉單選欄位的“允許多選”選項 ([#6515](https://github.com/nocobase/nocobase/pull/6515)) by @zhangzhonghe

  - 关系欄位的資料範圍联动不生效 ([#6530](https://github.com/nocobase/nocobase/pull/6530)) by @zhangzhonghe

- **[資料表：树]** 树表外掛的迁移腳本问题 ([#6537](https://github.com/nocobase/nocobase/pull/6537)) by @2013xile

- **[操作：自訂請求]** 無法下載utf8編碼的檔案 ([#6541](https://github.com/nocobase/nocobase/pull/6541)) by @2013xile

## [v1.6.9](https://github.com/nocobase/nocobase/compare/v1.6.8...v1.6.9) - 2025-03-23

### 🐛 修復

- **[client]** 操作按钮透明狀態导致 hover 時按钮 setting 顯示例外 ([#6529](https://github.com/nocobase/nocobase/pull/6529)) by @katherinehhh

## [v1.6.8](https://github.com/nocobase/nocobase/compare/v1.6.7...v1.6.8) - 2025-03-22

### 🐛 修復

- **[server]** Upgrade 命令可能造成工作流报错 ([#6524](https://github.com/nocobase/nocobase/pull/6524)) by @gchust

- **[client]** 表单中的子表格高度会随主表单高度一同設定 ([#6518](https://github.com/nocobase/nocobase/pull/6518)) by @katherinehhh

- **[使用者認證]**
  - X-Authenticator 缺失 ([#6526](https://github.com/nocobase/nocobase/pull/6526)) by @chenos

  - 移除認證器配置项前后的空格、换行符 ([#6527](https://github.com/nocobase/nocobase/pull/6527)) by @2013xile

- **[区块：地图]** 地图区块 密钥管理中不可見字元导致的密钥請求失敗的问题 ([#6521](https://github.com/nocobase/nocobase/pull/6521)) by @katherinehhh

- **[備份管理器]** 还原过程中可能引起工作流執行报错 by @gchust

- **[企业微信]** 获取通知配置時需要解析環境變數和密钥 by @2013xile

## [v1.6.7](https://github.com/nocobase/nocobase/compare/v1.6.6...v1.6.7) - 2025-03-20

### 🚀 最佳化

- **[工作流：邮件傳送节点]** 增加安全欄位配置描述。 ([#6510](https://github.com/nocobase/nocobase/pull/6510)) by @sheldon66

- **[通知：电子邮件]** 增加安全欄位配置描述。 ([#6501](https://github.com/nocobase/nocobase/pull/6501)) by @sheldon66

- **[日历]** 日历外掛新增开启或關閉快速建立事件可選設定 ([#6391](https://github.com/nocobase/nocobase/pull/6391)) by @Cyx649312038

### 🐛 修復

- **[client]** 時间欄位在中文语言下提交時报错 invalid input syntax for type time ([#6511](https://github.com/nocobase/nocobase/pull/6511)) by @katherinehhh

- **[檔案管理器]** COS 儲存的檔案無法访问 ([#6512](https://github.com/nocobase/nocobase/pull/6512)) by @chenos

- **[区块：地图]** 地图管理中密钥必填校验失敗 ([#6509](https://github.com/nocobase/nocobase/pull/6509)) by @katherinehhh

- **[WEB 客戶端]** 路由管理表格中的路徑与实际路徑不一样 ([#6483](https://github.com/nocobase/nocobase/pull/6483)) by @zhangzhonghe

- **[操作：匯出記錄 Pro]** 無法匯出附件 by @chenos

- **[工作流：审批]**
  - 修復空使用者造成頁面崩溃 by @mytharcher

  - 修復审批人介面配置新增查詢节点時的頁面崩溃 by @mytharcher

## [v1.6.6](https://github.com/nocobase/nocobase/compare/v1.6.5...v1.6.6) - 2025-03-18

### 🎉 新特性

- **[client]** 支持长文本欄位作为关系欄位的標題欄位 ([#6495](https://github.com/nocobase/nocobase/pull/6495)) by @katherinehhh

- **[工作流：彙總查詢节点]** 支持为彙總结果配置精度選項 ([#6491](https://github.com/nocobase/nocobase/pull/6491)) by @mytharcher

### 🚀 最佳化

- **[檔案儲存：S3 (Pro)]** 将文案“访问 URL 基础”改为“基础 URL” by @zhangzhonghe

### 🐛 修復

- **[evaluators]** 将表达式計算保留小數調整回 9 位 ([#6492](https://github.com/nocobase/nocobase/pull/6492)) by @mytharcher

- **[檔案管理器]** URL 转义 ([#6497](https://github.com/nocobase/nocobase/pull/6497)) by @chenos

- **[資料源：主資料程式庫]** 無法建立 MySQL 视图 ([#6477](https://github.com/nocobase/nocobase/pull/6477)) by @aaaaaajie

- **[工作流]** 修復歷史遗留任務數量工作流刪除后統計錯誤 ([#6493](https://github.com/nocobase/nocobase/pull/6493)) by @mytharcher

- **[嵌入 NocoBase]** 頁面顯示空白 by @zhangzhonghe

- **[備份管理器]**
  - 通過多應用模板建立子應用時備份中的上傳檔案未被正確还原 by @gchust

  - 还原 MySQL 資料程式庫備份時由于 GTID 集合重叠导致的失敗 by @gchust

- **[工作流：审批]**
  - 将退回的审批单据列入待办 by @mytharcher

  - 修復审批过程表格中发起人檢視按钮消失的问题 by @mytharcher

## [v1.6.5](https://github.com/nocobase/nocobase/compare/v1.6.4...v1.6.5) - 2025-03-17

### 🚀 最佳化

- **[檔案管理器]** 簡化生成檔案 URL 的邏輯和 API ([#6472](https://github.com/nocobase/nocobase/pull/6472)) by @mytharcher

- **[檔案儲存：S3 (Pro)]** 最佳化生成檔案 URL 的方法 by @mytharcher

- **[備份管理器]** 允許在相同版本的预發布和發布版本之间還原備份 by @gchust

### 🐛 修復

- **[client]**
  - 富文本欄位清空后提交時資料未刪除 ([#6486](https://github.com/nocobase/nocobase/pull/6486)) by @katherinehhh

  - 頁面右上角图标的顏色不会随主題变化 ([#6482](https://github.com/nocobase/nocobase/pull/6482)) by @zhangzhonghe

  - 點擊篩選表单的重設按钮無法清除网格卡片区块的篩選條件 ([#6475](https://github.com/nocobase/nocobase/pull/6475)) by @zhangzhonghe

- **[工作流：人工處理节点]**
  - 修復迁移腳本 ([#6484](https://github.com/nocobase/nocobase/pull/6484)) by @mytharcher

  - 修改迁移腳本确保執行 ([#6487](https://github.com/nocobase/nocobase/pull/6487)) by @mytharcher

  - 修復区块的篩選元件中工作流標題项 ([#6480](https://github.com/nocobase/nocobase/pull/6480)) by @mytharcher

  - 修復 id 列不存在時迁移腳本报错 ([#6470](https://github.com/nocobase/nocobase/pull/6470)) by @chenos

  - 避免歷史表被关系欄位同步出来 ([#6478](https://github.com/nocobase/nocobase/pull/6478)) by @mytharcher

- **[工作流：彙總查詢节点]** 修復对彙總结果为 null 時取整报错 ([#6473](https://github.com/nocobase/nocobase/pull/6473)) by @mytharcher

- **[工作流]** 不統計已刪除的工作流的待办 ([#6474](https://github.com/nocobase/nocobase/pull/6474)) by @mytharcher

- **[備份管理器]** 預設的備份設定不存在時服務器無法啟動 by @gchust

- **[工作流：审批]**
  - 修復审批表单中檔案欄位报错问题 by @mytharcher

  - 基于掛鉤事件修復待办任務數量 by @mytharcher

## [v1.6.4](https://github.com/nocobase/nocobase/compare/v1.6.3...v1.6.4) - 2025-03-14

### 🎉 新特性

- **[client]** 级联選擇元件新增資料範圍設定 ([#6386](https://github.com/nocobase/nocobase/pull/6386)) by @Cyx649312038

### 🚀 最佳化

- **[utils]** 将 `md5` 方法移到通用套件 ([#6468](https://github.com/nocobase/nocobase/pull/6468)) by @mytharcher

### 🐛 修復

- **[client]** 在树区块中，取消選取時，資料区块的資料沒有被清空 ([#6460](https://github.com/nocobase/nocobase/pull/6460)) by @zhangzhonghe

- **[檔案管理器]** 無法刪除 s3 檔案儲存的檔案 ([#6467](https://github.com/nocobase/nocobase/pull/6467)) by @chenos

- **[工作流]** 在資料選擇器中移除绑定工作流的配置按钮 ([#6455](https://github.com/nocobase/nocobase/pull/6455)) by @mytharcher

- **[檔案儲存：S3 (Pro)]** 修復 s3 pro 的签名 url 無法访问的问题 by @chenos

- **[工作流：审批]** 避免审批流程表格中由于沒有发起人時的頁面崩溃 by @mytharcher

## [v1.6.3](https://github.com/nocobase/nocobase/compare/v1.6.2...v1.6.3) - 2025-03-13

### 🎉 新特性

- **[企业微信]** 支持自訂登入按钮提示 by @2013xile

### 🐛 修復

- **[client]**
  - 修復圖片中特殊字元导致不顯示的问题 ([#6459](https://github.com/nocobase/nocobase/pull/6459)) by @mytharcher

  - 子表格切换分页数后新增資料页码顯示錯誤 ([#6437](https://github.com/nocobase/nocobase/pull/6437)) by @katherinehhh

  - Logo 的樣式与之前的不一致 ([#6444](https://github.com/nocobase/nocobase/pull/6444)) by @zhangzhonghe

- **[工作流：人工處理节点]** 修復迁移腳本报错 ([#6445](https://github.com/nocobase/nocobase/pull/6445)) by @mytharcher

- **[資料可视化]** 新增自訂篩選欄位時会出现已移除欄位 ([#6450](https://github.com/nocobase/nocobase/pull/6450)) by @2013xile

- **[檔案管理器]** 修復檔案管理一些问题 ([#6436](https://github.com/nocobase/nocobase/pull/6436)) by @mytharcher

- **[操作：自訂請求]** 自訂請求的服務端權限校验錯誤 ([#6438](https://github.com/nocobase/nocobase/pull/6438)) by @katherinehhh

- **[資料源管理]** 角色管理中切换資料源沒有載入对应資料表 ([#6431](https://github.com/nocobase/nocobase/pull/6431)) by @katherinehhh

- **[操作：批量編輯]** 修復批量編輯提交時未能觸發工作流的问题 ([#6440](https://github.com/nocobase/nocobase/pull/6440)) by @mytharcher

- **[工作流：自訂操作事件]** 移除 E2E 測試中的 `only` by @mytharcher

- **[工作流：审批]**
  - 修復审批表单中关系資料未展示的问题 by @mytharcher

  - 修復外部資料源审批時的报错 by @mytharcher

## [v1.6.2](https://github.com/nocobase/nocobase/compare/v1.6.1...v1.6.2) - 2025-03-12

### 🐛 修復

- **[client]** 表单日期欄位日期範圍，最大日期可選範圍少一天 ([#6418](https://github.com/nocobase/nocobase/pull/6418)) by @katherinehhh

- **[通知：站内信]** 避免錯誤的接收人配置导致查詢出全部使用者 ([#6424](https://github.com/nocobase/nocobase/pull/6424)) by @sheldon66

- **[工作流：人工處理节点]**
  - 修復遗漏表前綴和 schema 的迁移腳本 ([#6425](https://github.com/nocobase/nocobase/pull/6425)) by @mytharcher

  - 調整迁移腳本版本範圍限制为 `<1.7.0` ([#6430](https://github.com/nocobase/nocobase/pull/6430)) by @mytharcher

## [v1.6.1](https://github.com/nocobase/nocobase/compare/v1.6.0...v1.6.1) - 2025-03-11

### 🐛 修復

- **[client]**
  - 使用“$anyOf”操作符時，联动規則無效 ([#6415](https://github.com/nocobase/nocobase/pull/6415)) by @zhangzhonghe

  - 使用連結按钮開啟的彈出視窗，資料不更新 ([#6411](https://github.com/nocobase/nocobase/pull/6411)) by @zhangzhonghe

  - 子表格刪除記錄的時候多選欄位值錯誤且選項缺失 ([#6405](https://github.com/nocobase/nocobase/pull/6405)) by @katherinehhh

- **[通知：站内信]** 在站内信清單中，将背景顏色与訊息卡片的顏色区分开，以提升视觉层次感和可读性。 ([#6417](https://github.com/nocobase/nocobase/pull/6417)) by @sheldon66

## [v1.6.0](https://github.com/nocobase/nocobase/compare/v1.5.25...v1.6.0) - 2025-03-11

## 新特性

### 集群模式

企业版可通過相关外掛支持集群模式部署，應用以集群模式執行時，可以通過多个實例和使用多核模式来提高應用的对并发访问處理的效能。

![20241231010814](https://static-docs.nocobase.com/20241231010814.png)

参考檔案：[集群部署](https://docs-cn.nocobase.com/welcome/getting-started/deployment/cluster-mode)

### 密碼策略

为所有使用者設定密碼規則，密碼有效期和密碼登入安全策略，管理锁定使用者。

![](https://static-docs.nocobase.com/202412281329313.png)

参考檔案：[密碼策略和使用者锁定](https://docs-cn.nocobase.com/handbook/password-policy)

### Token 安全策略

Token 安全策略是一种用于保护系統安全和体验的功能配置。它套件括了三个主要配置项：“工作階段有效期”、“Token 有效週期” 和 “过期 Token 重新整理時限” 。

![20250105111821-2025-01-05-11-18-24](https://static-docs.nocobase.com/20250105111821-2025-01-05-11-18-24.png)

参考檔案：[Token 安全策略](https://docs-cn.nocobase.com/handbook/token-policy)

### IP 限制

NocoBase 支持管理員对使用者访问 IP 設定白名单或黑名单，以限制未授權的外部網路連線或阻止已知的恶意 IP 位址，降低安全风险。同時支持管理員查詢访问拒絕日誌，識別风险 IP。

![2025-01-23-10-07-34-20250123100733](https://static-docs.nocobase.com/2025-01-23-10-07-34-20250123100733.png)

参考檔案：[IP 限制](https://docs-cn.nocobase.com/handbook/IP-restriction)

### 變數和密钥

集中配置和管理環境變數和密钥，用于敏感資料儲存、配置資料重用、環境配置隔离等。

![1ee6c3fa09533b19f4d6038f53b06006.png](https://static-docs.nocobase.com/1ee6c3fa09533b19f4d6038f53b06006.png)

参考檔案：[變數和密钥](https://docs-cn.nocobase.com/handbook/environment-variables)

### 迁移管理

用于将應用配置从一个應用環境迁移到另一个應用環境。

![20250107105005](https://static-docs.nocobase.com/20250107105005.png)

参考檔案：[迁移管理](https://docs-cn.nocobase.com/handbook/migration-manager)[發布管理](https://docs-cn.nocobase.com/handbook/release-management)

### 路由管理

* **選單資料独立并改名为路由**：選單資料从 UI Schema 中拆分出来，改名为**路由**，分为 `desktopRoutes` 和 `mobileRoutes` 两张表，分别对应桌面端路由和行動裝置路由。
* **選單前端最佳化，支持折叠与回應式**：選單在前端实现了**折叠**与**回應式**适配，提升了使用体验。

![20250107115449](https://static-docs.nocobase.com/20250107115449.png)

参考檔案：[路由管理](https://docs-cn.nocobase.com/handbook/routes)

### 角色和權限

* 支持配置更多的操作按钮權限，套件括彈出視窗、連結、扫码、觸發工作流
  ![b0a7905d9fd4beaaf21592b1f56fe752.png](https://static-docs.nocobase.com/b0a7905d9fd4beaaf21592b1f56fe752.png)
* 支持配置標籤页權限

  ![4fd3a5144a2301638b9f24b033d33add.png](https://static-docs.nocobase.com/4fd3a5144a2301638b9f24b033d33add.png)

### 使用者管理

支持配置使用者个人资料表单

![171e5a4c61033afb237c9ae1a3d89000.png](https://static-docs.nocobase.com/171e5a4c61033afb237c9ae1a3d89000.png)

### 工作流

在全局工具列中增加流程待办中心入口，并实時提示人工节点、审批的相关待办任務數量。

![855c58536f9fd29ae353dd19b3aff73f.png](https://static-docs.nocobase.com/855c58536f9fd29ae353dd19b3aff73f.png)

### 工作流：自訂操作事件

支持全局和批量資料觸發自訂操作事件。

![106ae1296d180718799eb6d7f423805c.png](https://static-docs.nocobase.com/106ae1296d180718799eb6d7f423805c.png)

### 工作流：审批

* 支持转签、加签。![审批节点_介面配置_操作表单区块](https://static-docs.nocobase.com/20241226232013.png)
* 支持审批人在提交审批時修改申请內容。![审批节点_介面配置_操作表单_修改审批內容欄位](https://static-docs.nocobase.com/20241226232124.png)
* 支持在审批介面中配置审批基础資訊区块。
* 最佳化审批发起和待办区块的樣式和交互，同時也在全局的流程待办中心中内置。![待办中心-审批](https://static-docs.nocobase.com/20250310161203.png)
* 不再区分发起审批的位置，审批中心区块可以发起和處理所有审批。

### 工作流：JSON 變數對應节点

新增用于将上游节点结果中的 JSON 資料對應为變數的專用节点。

![建立节点](https://static-docs.nocobase.com/20250113173635.png)

参考檔案：[JSON 變數對應](https://docs-cn.nocobase.com/handbook/workflow/nodes/json-variable-mapping)

### 擴充能力提升及外掛示例


| 擴充项                 | 外掛示例                                                        |
| ---------------------- | --------------------------------------------------------------- |
| 資料表预置欄位擴充     | @nocobase-sample/plugin-data-source-main-custom-preset-fields   |
| 日历顏色欄位可選項擴充 | @nocobase-sample/plugin-calendar-register-color-field           |
| 日历標題欄位可選項擴充 | @nocobase-sample/plugin-calendar-register-title-field           |
| 公式可選項欄位擴充     | @nocobase-sample/plugin-field-formula-register-expression-field |
| 看板分組欄位擴充       | @nocobase-sample/plugin-kanban-register-group-field             |
| 篩選操作符擴充         | @nocobase-sample/plugin-register-filter-operator                |
| 檔案儲存擴充           | @nocobase-sample/plugin-file-storage-demo                       |

## 不兼容变更

### Token 安全策略更新

1.6 版本新增了 [Token 安全策略](https://docs-cn.nocobase.com/handbook/token-policy)，Auth 認證檢查未通過時，将返回 401 錯誤并跳转至登入页。此行为与之前版本有所不同。如需跳過檢查，可参考以下示例进行處理：

前端請求

```javascript
useRequest({
  url: '/test',
  skipAuth: true,
});

api.request({
  url: '/test',
  skipAuth: true,
});
```

后端中介軟體

```javascript
class PluginMiddlewareExampleServer extends plugin {
  middlewareExample = (ctx, next) => {
    if (ctx.path === '/path/to') {
      ctx.skipAuthCheck = true;
    }
    await next();
  };
  async load() {
    this.app.dataSourceManager.afterAddDataSource((dataSource) => {
      dataSource.resourceManager.use(this.middlewareExample, {
        before: 'auth',
      });
    });
  }
}
```

### 单元測試函式 agent.login 由同步改为非同步

由于認證流程需要进行一些非同步操作，測試函式 login 改为非同步, 示例：

```TypeScript
import { createMockServer } from '@nocobase/test';

describe('my db suite', () => {
  let app;
  let agent;

  beforeEach(async () => {
    app = await createMockServer({
      registerActions: true,
      acl: true,
      plugins: ['users', 'auth', 'acl'],
    });
    agent = await app.agent().login(1);
  });

  test('case1', async () => {
    await agent.get('/examples');
    await agent.get('/examples');
    await agent.resource('examples').create();
  });
});
```

### 提供全新的使用者中心設定项的擴充 API

API

```ts
type UserCenterSettingsItemOptions = SchemaSettingsItemType & { aclSnippet?: string };

class Application {
  addUserCenterSettingsItem(options: UserCenterSettingsItemOptions);
}
```

示例

```javascript
class PluginUserCenterSettingsExampleClient extends plugin {
  async load() {
    this.app.addUserCenterSettingsItem({
      name: 'nickName',
      Component: NickName,
      sort: 0,
    });
  }
}
```

## [v1.5.25](https://github.com/nocobase/nocobase/compare/v1.5.24...v1.5.25) - 2025-03-09

### 🐛 修復

- **[server]** `yarn start` 啟動服務器后前端快取未重新整理 ([#6394](https://github.com/nocobase/nocobase/pull/6394)) by @gchust

- **[工作流：审批]** 避免錯誤的审批人配置导致查詢出全部使用者 by @mytharcher

- **[企业微信]** 修復登入提示連結和钉钉登入錯誤 by @chenzhizdt

## [v1.5.24](https://github.com/nocobase/nocobase/compare/v1.5.23...v1.5.24) - 2025-03-07

### 🎉 新特性

- **[資料可视化]** 支持在圖表查詢中設定 NULLS 排序 ([#6383](https://github.com/nocobase/nocobase/pull/6383)) by @2013xile

### 🚀 最佳化

- **[工作流]** 支持在資料表事件中不觸發工作流 ([#6379](https://github.com/nocobase/nocobase/pull/6379)) by @mytharcher

### 🐛 修復

- **[操作：匯入記錄 Pro]** 使用额外的選項来觉得是否在匯入時觸發工作流的資料表事件 by @mytharcher

- **[操作：匯出記錄 Pro]** pro 匯出按钮匯出資料時缺失sort 參數 by @katherinehhh

## [v1.5.23](https://github.com/nocobase/nocobase/compare/v1.5.22...v1.5.23) - 2025-03-06

### 🐛 修復

- **[client]**
  - 日期元件缺陷，選擇的日期時间会少一个小時 ([#6359](https://github.com/nocobase/nocobase/pull/6359)) by @katherinehhh

  - 继承父表的欄位在表格中缺少排序設定项 ([#6372](https://github.com/nocobase/nocobase/pull/6372)) by @katherinehhh

## [v1.5.22](https://github.com/nocobase/nocobase/compare/v1.5.21...v1.5.22) - 2025-03-06

### 🚀 最佳化

- **[client]** 按钮新增防雙擊處理 ([#6351](https://github.com/nocobase/nocobase/pull/6351)) by @Cyx649312038

### 🐛 修復

- **[database]** 修復当关系欄位的源表識別欄位值为數字型字元串時，获取关系資料記錄报错的问题 ([#6360](https://github.com/nocobase/nocobase/pull/6360)) by @2013xile

## [v1.5.21](https://github.com/nocobase/nocobase/compare/v1.5.20...v1.5.21) - 2025-03-05

### 🚀 最佳化

- **[工作流]** 后置节点结果載入以提升執行記錄画布效能 ([#6344](https://github.com/nocobase/nocobase/pull/6344)) by @mytharcher

- **[工作流：彙總查詢节点]** 对彙總后的數字进行小數四舍五入的處理 ([#6358](https://github.com/nocobase/nocobase/pull/6358)) by @mytharcher

### 🐛 修復

- **[client]**
  - 子表单隱藏欄位標題時欄位元件与主表单中的元件未對齊 ([#6357](https://github.com/nocobase/nocobase/pull/6357)) by @katherinehhh

  - 資料表继承模型中关系区块在彈出視窗中未顯示 ([#6303](https://github.com/nocobase/nocobase/pull/6303)) by @katherinehhh

  - 修復建立檔案表時的报错 ([#6363](https://github.com/nocobase/nocobase/pull/6363)) by @mytharcher

- **[工作流]** 修復載入节点结果的權限问题 ([#6352](https://github.com/nocobase/nocobase/pull/6352)) by @mytharcher

## [v1.5.20](https://github.com/nocobase/nocobase/compare/v1.5.19...v1.5.20) - 2025-03-03

### 🐛 修復

- **[client]** 已经自訂 favicon 的頁面，在頁面載入時会闪一下 NocoBase 的 favicon ([#6337](https://github.com/nocobase/nocobase/pull/6337)) by @zhangzhonghe

- **[区块：地图]** 地图欄位不顯示配置项 ([#6336](https://github.com/nocobase/nocobase/pull/6336)) by @zhangzhonghe

- **[自訂品牌]** 已经自訂 favicon 的頁面，在頁面載入時会闪一下 NocoBase 的 favicon by @zhangzhonghe

- **[模板打印]** 模板打印外掛和備份管理器外掛都开启時，無法上傳本機備份还原應用 by @gchust

## [v1.5.19](https://github.com/nocobase/nocobase/compare/v1.5.18...v1.5.19) - 2025-03-01

### 🐛 修復

- **[client]** 关系欄位阅读模式下hover時出现新增按钮 ([#6322](https://github.com/nocobase/nocobase/pull/6322)) by @katherinehhh

- **[操作：匯出記錄 Pro]** 匯出附件按钮setting多了新增区块 by @katherinehhh

- **[操作：匯入記錄 Pro]** 关系区块匯入按钮的識別重複記錄依据欄位下拉無內容 by @katherinehhh

## [v1.5.18](https://github.com/nocobase/nocobase/compare/v1.5.17...v1.5.18) - 2025-02-27

### 🐛 修復

- **[区块：操作面板]** 設定操作面板的高度無效 ([#6321](https://github.com/nocobase/nocobase/pull/6321)) by @zhangzhonghe

## [v1.5.17](https://github.com/nocobase/nocobase/compare/v1.5.16...v1.5.17) - 2025-02-27

### 🐛 修復

- **[client]**
  - 無评论表時點擊建立评论区块报错 ([#6309](https://github.com/nocobase/nocobase/pull/6309)) by @katherinehhh

  - 點擊树区块节点時报错 ([#6314](https://github.com/nocobase/nocobase/pull/6314)) by @zhangzhonghe

  - 點擊左侧選單后，子頁面被例外關閉 ([#6305](https://github.com/nocobase/nocobase/pull/6305)) by @zhangzhonghe

  - 当表达式的值為空時，不清空欄位的值 ([#6300](https://github.com/nocobase/nocobase/pull/6300)) by @zhangzhonghe

- **[資料表欄位：自動編碼]** 修復自動編號欄位在只读模式下未停用 ([#6274](https://github.com/nocobase/nocobase/pull/6274)) by @mytharcher

- **[檔案管理器]** 修復继承表的迁移问题 ([#6310](https://github.com/nocobase/nocobase/pull/6310)) by @mytharcher

- **[權限控制]** 配置資料表權限，使用多对多欄位作为資料範圍篩選條件，回應的資料記錄不正確 ([#6304](https://github.com/nocobase/nocobase/pull/6304)) by @2013xile

- **[区块：看板]** 彈出視窗中看板区块使用彈出視窗記錄變數篩選資料不正確 ([#6290](https://github.com/nocobase/nocobase/pull/6290)) by @katherinehhh

- **[区块：树]** 點擊树区块节点時报错 by @zhangzhonghe

## [v1.5.16](https://github.com/nocobase/nocobase/compare/v1.5.15...v1.5.16) - 2025-02-26

### 🚀 最佳化

- **[備份管理器]** 允許还原備份到缺少部分外掛的應用 by @gchust

### 🐛 修復

- **[client]** 富文本欄位元件無法刪除清空所有內容 ([#6287](https://github.com/nocobase/nocobase/pull/6287)) by @katherinehhh

- **[檔案管理器]**
  - 修復迁移腳本并补充測試用例 ([#6288](https://github.com/nocobase/nocobase/pull/6288)) by @mytharcher

  - 修復檔案表 `path` 列的類型 ([#6294](https://github.com/nocobase/nocobase/pull/6294)) by @mytharcher

  - 修復迁移腳本并补充測試用例 ([#6288](https://github.com/nocobase/nocobase/pull/6288)) by @mytharcher

## [v1.5.15](https://github.com/nocobase/nocobase/compare/v1.5.14...v1.5.15) - 2025-02-25

### 🚀 最佳化

- **[檔案管理器]**
  - URL 欄位長度增加为 1024 ([#6275](https://github.com/nocobase/nocobase/pull/6275)) by @mytharcher

  - 檔案上傳時生成的檔案名由隨機改成檔案名加隨機後綴。 ([#6217](https://github.com/nocobase/nocobase/pull/6217)) by @chenos

- **[区块：操作面板]** 最佳化行動裝置樣式 ([#6270](https://github.com/nocobase/nocobase/pull/6270)) by @zhangzhonghe

### 🐛 修復

- **[cli]** 最佳化 nocobase upgrade 命令行 ([#6280](https://github.com/nocobase/nocobase/pull/6280)) by @chenos

## [v1.5.14](https://github.com/nocobase/nocobase/compare/v1.5.13...v1.5.14) - 2025-02-24

### 🐛 修復

- **[備份管理器]** 在"从本機備份还原"操作彈出視窗中，點擊刪除图标不会清空檔案清單 by @gchust

## [v1.5.13](https://github.com/nocobase/nocobase/compare/v1.5.12...v1.5.13) - 2025-02-22

### 🐛 修復

- **[client]** 修復逐个上傳檔案后之前的檔案消失的问题 ([#6260](https://github.com/nocobase/nocobase/pull/6260)) by @mytharcher

- **[工作流：操作前事件]** 修復回應訊息节点的錯誤訊息不顯示的问题 by @mytharcher

## [v1.5.12](https://github.com/nocobase/nocobase/compare/v1.5.11...v1.5.12) - 2025-02-21

### 🚀 最佳化

- **[工作流]** 在工作流画布的节点上隱藏节点 ID ([#6251](https://github.com/nocobase/nocobase/pull/6251)) by @mytharcher

### 🐛 修復

- **[檔案管理器]** 升級 AWS SDK 版本以修復 MinIO 上傳问题 ([#6253](https://github.com/nocobase/nocobase/pull/6253)) by @mytharcher

## [v1.5.11](https://github.com/nocobase/nocobase/compare/v1.5.10...v1.5.11) - 2025-02-20

### 🎉 新特性

- **[工作流]** 支持擴充工作流节点分組 ([#6237](https://github.com/nocobase/nocobase/pull/6237)) by @mytharcher
参考檔案：[擴充节点分組](https://docs-cn.nocobase.com/handbook/workflow/development/api#registerinstructiongroup)
### 🐛 修復

- **[client]**
  - 关系区块中的关联按钮彈出視窗在行動裝置的顯示例外 ([#6235](https://github.com/nocobase/nocobase/pull/6235)) by @katherinehhh

  - 篩選表单欄位的 Picker 与格式設定不符合 ([#6234](https://github.com/nocobase/nocobase/pull/6234)) by @katherinehhh

  - 在停用狀態下正確展示 `<Variable.TextArea />` 元件 ([#6197](https://github.com/nocobase/nocobase/pull/6197)) by @mytharcher

  - 修復上傳多个檔案后檔案丢失的问题 ([#6247](https://github.com/nocobase/nocobase/pull/6247)) by @mytharcher

- **[工作流]**
  - 修復工作流画布的樣式细节 ([#6240](https://github.com/nocobase/nocobase/pull/6240)) by @mytharcher

  - 支持修改密碼時觸發使用者表的工作流 ([#6248](https://github.com/nocobase/nocobase/pull/6248)) by @mytharcher

## [v1.5.10](https://github.com/nocobase/nocobase/compare/v1.5.9...v1.5.10) - 2025-02-17

### 🚀 最佳化

- **[資料表欄位：Markdown(Vditor)]** Vditor CDN 使用本機资源 ([#6229](https://github.com/nocobase/nocobase/pull/6229)) by @chenos

### 🐛 修復

- **[工作流：迴圈节点]** 修復迴圈內部有等待节点時提前登出的问题 ([#6236](https://github.com/nocobase/nocobase/pull/6236)) by @mytharcher

## [v1.5.9](https://github.com/nocobase/nocobase/compare/v1.5.8...v1.5.9) - 2025-02-17

### 🐛 修復

- **[client]**
  - 頁面横向捲動条例外 ([#6232](https://github.com/nocobase/nocobase/pull/6232)) by @katherinehhh

  - 關閉子頁面時，会觸發多次区块資料請求 ([#6233](https://github.com/nocobase/nocobase/pull/6233)) by @zhangzhonghe

  - 介面上关联欄位選單缺少唯一性 key 属性 ([#6230](https://github.com/nocobase/nocobase/pull/6230)) by @gchust

- **[資料可视化]** 資料源識別套件含 `-` 時，篩選报错的问题 ([#6231](https://github.com/nocobase/nocobase/pull/6231)) by @2013xile

## [v1.5.8](https://github.com/nocobase/nocobase/compare/v1.5.7...v1.5.8) - 2025-02-16

### 🐛 修復

- **[client]**
  - 嵌入頁面無法開啟欄位連結的彈出視窗 ([#6222](https://github.com/nocobase/nocobase/pull/6222)) by @gchust

  - 編輯表单中，顯示的关系欄位值不会随着关联欄位变化而变化 ([#6210](https://github.com/nocobase/nocobase/pull/6210)) by @Cyx649312038

- **[行動裝置]** 權限配置表格中，行動裝置選單資料展示不全 ([#6219](https://github.com/nocobase/nocobase/pull/6219)) by @zhangzhonghe

## [v1.5.7](https://github.com/nocobase/nocobase/compare/v1.5.6...v1.5.7) - 2025-02-13

### 🚀 最佳化

- **[通知：站内信]** 移除 SSE 連線重試的控制台錯誤日誌。 ([#6205](https://github.com/nocobase/nocobase/pull/6205)) by @sheldon66

### 🐛 修復

- **[client]**
  - 关系資料快捷建立操作的彈出視窗中元件缺少拖动設定项 ([#6201](https://github.com/nocobase/nocobase/pull/6201)) by @katherinehhh

  - 数值格式化精度設定未生效 ([#6202](https://github.com/nocobase/nocobase/pull/6202)) by @katherinehhh

  - 修復在表单中，清空某个关系欄位后，然后點擊提交，这个关系欄位沒有被清空的问题 ([#5540](https://github.com/nocobase/nocobase/pull/5540)) by @zhangzhonghe

  - 提交資料后，区块不重新整理 ([#6206](https://github.com/nocobase/nocobase/pull/6206)) by @zhangzhonghe

  - 关系欄位清空后，範圍联动的关系欄位UI資料顯示清空但提交時值依然存在 ([#6207](https://github.com/nocobase/nocobase/pull/6207)) by @katherinehhh

  - 表格中無編輯權限的行記錄仍顯示編輯操作 ([#6204](https://github.com/nocobase/nocobase/pull/6204)) by @katherinehhh

- **[資料表欄位：排序]** 修復排序欄位類型在外部資料源未註冊的问题 ([#6212](https://github.com/nocobase/nocobase/pull/6212)) by @mytharcher

- **[使用者認證]** WebSocket 認證问题 ([#6209](https://github.com/nocobase/nocobase/pull/6209)) by @2013xile

- **[資料表欄位：附件（URL）]** 修復 hook 中弃用的請求位址 by @mytharcher

## [v1.5.6](https://github.com/nocobase/nocobase/compare/v1.5.5...v1.5.6) - 2025-02-12

### 🐛 修復

- **[client]**
  - 切换頁面后，区块不重新整理 ([#6200](https://github.com/nocobase/nocobase/pull/6200)) by @zhangzhonghe

  - 表格行的彈出視窗操作新增表单区块是目前記錄的子表時，区块未顯示 ([#6190](https://github.com/nocobase/nocobase/pull/6190)) by @katherinehhh

  - 表格区块在無資料時高度設定不生效 ([#6192](https://github.com/nocobase/nocobase/pull/6192)) by @katherinehhh

- **[操作：自訂請求]**
  - 自訂請求按钮中“目前記錄”變數值不正確 ([#6196](https://github.com/nocobase/nocobase/pull/6196)) by @zhangzhonghe

  - 自訂請求按钮兼容舊版本的變數 ([#6194](https://github.com/nocobase/nocobase/pull/6194)) by @zhangzhonghe

- **[資料可视化]** 在操作面板彈出視窗中新增圖表区块不顯示 ([#6198](https://github.com/nocobase/nocobase/pull/6198)) by @2013xile

## [v1.5.5](https://github.com/nocobase/nocobase/compare/v1.5.4...v1.5.5) - 2025-02-11

### 🚀 最佳化

- **[通知：站内信]** 增加在站内信渠道中获取最新訊息標題和最新接收時间的測試用例。 ([#6189](https://github.com/nocobase/nocobase/pull/6189)) by @sheldon66

## [v1.5.4](https://github.com/nocobase/nocobase/compare/v1.5.3...v1.5.4) - 2025-02-10

### 🚀 最佳化

- **[工作流]** 为複製工作流操作增加載入中提示 ([#6179](https://github.com/nocobase/nocobase/pull/6179)) by @mytharcher

### 🐛 修復

- **[client]**
  - 修復新增資料节点的欄位配置报错 ([#6187](https://github.com/nocobase/nocobase/pull/6187)) by @mytharcher

  - 篩選表单中的关系欄位不顯示“允許多選”配置项 ([#6174](https://github.com/nocobase/nocobase/pull/6174)) by @zhangzhonghe

  - 用联动規則将欄位隱藏后，欄位不再顯示 ([#6182](https://github.com/nocobase/nocobase/pull/6182)) by @zhangzhonghe

- **[utils]** 最佳化 storage/plugins 读取邏輯 ([#6186](https://github.com/nocobase/nocobase/pull/6186)) by @chenos

- **[通知：站内信]** 修復：在渠道清單 API 的訊息時间戳和標題子查詢中新增使用者篩選條件，确保資料隔离。 ([#6185](https://github.com/nocobase/nocobase/pull/6185)) by @deepure

- **[備份管理器]** 容错模式还原時備份中的使用者上傳檔案未複製到 uploads 檔案夹 by @gchust

## [v1.5.3](https://github.com/nocobase/nocobase/compare/v1.5.2...v1.5.3) - 2025-02-07

### 🐛 修復

- **[client]**
  - 點擊 belongsToArray 欄位開啟的彈出視窗，获取的資料錯誤 ([#6173](https://github.com/nocobase/nocobase/pull/6173)) by @zhangzhonghe

  - 篩選表单時间欄位运算符設定成“介於”，元件未变成時间範圍選擇器 ([#6170](https://github.com/nocobase/nocobase/pull/6170)) by @katherinehhh

  - 看板、日历区块的彈出視窗編輯表单未顯示 "Unsaved changes" ([#6172](https://github.com/nocobase/nocobase/pull/6172)) by @katherinehhh

## [v1.5.2](https://github.com/nocobase/nocobase/compare/v1.5.1...v1.5.2) - 2025-02-06

### 🚀 最佳化

- **[行動裝置]** 当沒有配置權限時，隱藏行動裝置配置页 header ([#6171](https://github.com/nocobase/nocobase/pull/6171)) by @zhangzhonghe

### 🐛 修復

- **[工作流：通知节点]** 确保当使用者输入套件含 handlebars 语法時，通知能够正確傳送。 ([#6164](https://github.com/nocobase/nocobase/pull/6164)) by @sheldon66

- **[工作流：人工處理节点]** 修復人工节点使用终止按钮提交表单資料未被解析的问题 ([#6160](https://github.com/nocobase/nocobase/pull/6160)) by @mytharcher

## [v1.5.1](https://github.com/nocobase/nocobase/compare/v1.5.0...v1.5.1) - 2025-02-06

### 🐛 修復

- **[client]**
  - `子表单(彈出視窗)`標題翻译不正確 ([#6159](https://github.com/nocobase/nocobase/pull/6159)) by @gchust

  - 子表单欄位設定为“隱藏保留值”時，其預設值變數不能正常工作 ([#6165](https://github.com/nocobase/nocobase/pull/6165)) by @zhangzhonghe

## [v1.5.0](https://github.com/nocobase/nocobase/compare/v1.4.34...v1.5.0) - 2025-02-05

## 内核最佳化

### 文本欄位支持啟用連結

開啟方式支持抽屉、對話方塊和頁面三种方式。

![20250207212903](https://static-docs.nocobase.com/20250207212903.png)

### 关系区块支持关联和解除关联操作

![20250207211837](https://static-docs.nocobase.com/20250207211837.png)

### 支持除錯工作流

可以在配置工作流時直接觸發工作流进行除錯。

<video width="100%" controls>
      <source src="https://static-docs.nocobase.com/20250207213343_rec_.mp4" type="video/mp4">
</video>

### 最佳化行動裝置日期相关元件交互体验

![0084553986f6b3de21ca62f22d09a91a.png](https://static-docs.nocobase.com/0084553986f6b3de21ca62f22d09a91a.png)

### 前端效能最佳化

- 最佳化首屏載入速度
- 前端构建工具更改为 rspack
- 最佳化各外掛套件入口檔案大小
- 提升大資料表格渲染效能
- 最佳化選單切换時的卡顿现象
- 新增 lazy 和 useLazy 前端程式庫按需載入的方法

`lazy` 和 `useLazy` 用法介绍

```ts
import {lazy, useLazy} from '@nocobase/client';

// 匯出一个元件
const { RolesManagement } = lazy(() => import('./RolesManagement'), 'RolesManagement');

// 匯出多个元件
const { AuthLayout, SignInPage, SignUpPage } = lazy(() => import('./pages'), 'AuthLayout', 'SignInPage', 'SignUpPage');

// 匯出預設元件
const ThemeList = lazy(() => import('./components/ThemeList'));

// 返回hook
const useReactToPrint = useLazy<typeof import('react-to-print').useReactToPrint>(
  () => import('react-to-print'),
  'useReactToPrint',
);
  
// 返回library
const parseExpression = useLazy<typeof import('cron-parser').parseExpression>(
  () => import('cron-parser'),
  'parseExpression',
);
```

## 新外掛

### 匯入 Pro

支持非同步匯入操作，独立线程執行，支持大量資料匯入。

![20250119221221](https://static-docs.nocobase.com/20250119221221.png)

参考檔案：

- [匯入 Pro](https://docs-cn.nocobase.com/handbook/action-import-pro)

### 匯出 Pro

支持非同步匯出操作，独立线程執行，支持大量資料匯出，支持附件匯出。

![20250119221237](https://static-docs.nocobase.com/20250119221237.png)

参考檔案：

- [匯出 Pro](https://docs-cn.nocobase.com/handbook/action-export-pro)

### 模板打印

模板打印外掛支持使用 Word、Excel 和 PowerPoint 編輯模板檔案（支持 `.docx`、`.xlsx`、`.pptx` 格式），在模板中設定占位符和邏輯结构，从而動態生成预定格式的檔案，如 `.docx`、`.xlsx`、`.pptx` 以及 `.pdf` 檔案。可以广泛應用于生成各類別业务檔案，例如报价单、发票、合同等。

主要功能

* **多格式支持**：兼容 Word、Excel 和 PowerPoint 模板，满足不同檔案生成需求。
* **動態資料填充**：通過占位符和邏輯结构，自動填充和生成檔案內容。
* **灵活的模板管理**：支持新增、編輯、刪除和分類管理模板，便于维护和使用。
* **丰富的模板语法**：支持基本取代、陣列访问、迴圈、條件输出等多种模板语法，满足複雜檔案生成需求。
* **格式化器支持**：提供條件输出、日期格式化、數字格式化等功能，提升檔案的可读性和专业性。
* **高效的输出格式**：支持直接生成 PDF 檔案，方便分享和打印。

![20250119221258](https://static-docs.nocobase.com/20250119221258.png)

参考檔案：

- [模板打印](https://docs-cn.nocobase.com/handbook/action-template-print)

### 审计日誌

用于記錄和追踪系統内的使用者活动和资源操作歷史。

![20250119221319](https://static-docs.nocobase.com/20250119221319.png)

参考檔案：

- [审计日誌](https://docs-cn.nocobase.com/handbook/audit-logger)

### 工作流：子流程

用于在一个工作流中呼叫其他的流程，可以使用目前流程的變數作为子流程的输入，并使用子流程的输出作为目前流程的變數在后续节点中使用。

![20250119221334](https://static-docs.nocobase.com/20250119221334.png)

参考檔案：

- [工作流：子流程](https://docs-cn.nocobase.com/handbook/workflow-subflow)

### 邮件管理

允許将对谷歌、微软邮件账户接入到NocoBase中，进行邮件的收发、檢視、管理等操作。也可以将邮件集成到頁面中。

![20250119221346](https://static-docs.nocobase.com/20250119221346.png)

参考檔案：

- [邮件管理](https://docs-cn.nocobase.com/handbook/email-manager/usage-admin)

### 檔案儲存：S3(Pro)

支持兼容 S3 協定的檔案儲存類型，例如亚马逊 S3、阿里云 OSS、腾讯云 COS、MinIO 等。支持檔案直传、私有访问。

![20250119221404](https://static-docs.nocobase.com/20250119221404.png)

参考檔案：

- [檔案儲存：S3(Pro)](https://docs-cn.nocobase.com/handbook/file-manager/storage/s3-pro)

## [v1.4.34](https://github.com/nocobase/nocobase/compare/v1.4.33...v1.4.34) - 2025-02-02

### 🐛 修復

- **[client]** 選擇資料后無法提交 ([#6148](https://github.com/nocobase/nocobase/pull/6148)) by @zhangzhonghe

## [v1.4.33](https://github.com/nocobase/nocobase/compare/v1.4.32...v1.4.33) - 2025-01-28

### 🐛 修復

- **[認證：OIDC]** 設定 state cookie 的 `same-site` 策略为 `lax` by @2013xile

## [v1.4.32](https://github.com/nocobase/nocobase/compare/v1.4.31...v1.4.32) - 2025-01-27

### 🐛 修復

- **[actions]** 修復“移动”操作以觸發工作流 ([#6144](https://github.com/nocobase/nocobase/pull/6144)) by @mytharcher

## [v1.4.31](https://github.com/nocobase/nocobase/compare/v1.4.30...v1.4.31) - 2025-01-26

### 🚀 最佳化

- **[client]** 篩選表单中篩選元件与 filterable 中設定一致 ([#6110](https://github.com/nocobase/nocobase/pull/6110)) by @katherinehhh

- **[檔案管理器]** 支持刪除檔案記錄時同時刪除檔案 ([#6127](https://github.com/nocobase/nocobase/pull/6127)) by @mytharcher

### 🐛 修復

- **[database]**
  - 修復無法按 UUID 篩選的问题 ([#6138](https://github.com/nocobase/nocobase/pull/6138)) by @chareice

  - 修復更新無主鍵表的问题 ([#6124](https://github.com/nocobase/nocobase/pull/6124)) by @chareice

- **[client]**
  - 資料源管理頁面报错 ([#6141](https://github.com/nocobase/nocobase/pull/6141)) by @zhangzhonghe

  - 当联动規則的條件中使用了沒有顯示出来的关系欄位時，按钮的联动規則無效 ([#6140](https://github.com/nocobase/nocobase/pull/6140)) by @zhangzhonghe

  - 修復关系欄位的快捷新增操作彈出視窗表单中變數顯示不对的问题 ([#6119](https://github.com/nocobase/nocobase/pull/6119)) by @katherinehhh

  - 快捷新增的彈出視窗里不顯示內容 ([#6123](https://github.com/nocobase/nocobase/pull/6123)) by @zhangzhonghe

  - 修復关系欄位区块不請求資料的问题 ([#6125](https://github.com/nocobase/nocobase/pull/6125)) by @zhangzhonghe

  - 修復子表格/子表单上設定的联动規則，会作用关系欄位的彈出視窗中区块中 ([#5543](https://github.com/nocobase/nocobase/pull/5543)) by @katherinehhh

- **[資料表欄位：中国行政区划]** 修復行政区划关联的權限问题 ([#6137](https://github.com/nocobase/nocobase/pull/6137)) by @chareice

- **[工作流]** 修復生成錯誤的 SQL ([#6128](https://github.com/nocobase/nocobase/pull/6128)) by @mytharcher

- **[資料表欄位：多对多 (陣列)]** 修復在子表单中更新多对多（陣列）欄位無效的问题 ([#6136](https://github.com/nocobase/nocobase/pull/6136)) by @2013xile

- **[行動裝置]** 修復 行動裝置下拉選擇只读狀態可點擊和文本溢出螢幕问题 ([#6130](https://github.com/nocobase/nocobase/pull/6130)) by @katherinehhh

## [v1.4.30](https://github.com/nocobase/nocobase/compare/v1.4.29...v1.4.30) - 2025-01-23

### 🐛 修復

- **[client]** 修復表格中关系欄位顯示 N/A 的问题 ([#6109](https://github.com/nocobase/nocobase/pull/6109)) by @zhangzhonghe

- **[資料表：树]** 禁止将树表节点自身設定为其父节点 ([#6122](https://github.com/nocobase/nocobase/pull/6122)) by @2013xile

- **[工作流：HTTP 請求节点]** 修復請求节点在迴圈呼叫中狀態为等待的问题 ([#6120](https://github.com/nocobase/nocobase/pull/6120)) by @mytharcher

- **[工作流：測試工具套件]** 修復依赖權限控制的多資料源測試用例 ([#6116](https://github.com/nocobase/nocobase/pull/6116)) by @mytharcher

- **[備份管理器]** 修復部分備份檔案無法被正確解压还原的问题 by @gchust

## [v1.4.29](https://github.com/nocobase/nocobase/compare/v1.4.28...v1.4.29) - 2025-01-21

### 🎉 新特性

- **[区块：操作面板]** 支持配置行動裝置操作面板每行顯示的图标數量 ([#6106](https://github.com/nocobase/nocobase/pull/6106)) by @katherinehhh

## [v1.4.28](https://github.com/nocobase/nocobase/compare/v1.4.27...v1.4.28) - 2025-01-21

### 🐛 修復

- **[client]** 关系欄位設定的預設值沒有更新 ([#6103](https://github.com/nocobase/nocobase/pull/6103)) by @chenos

- **[操作：批量編輯]** 移除批量編輯表单中的表单資料模板配置项 ([#6098](https://github.com/nocobase/nocobase/pull/6098)) by @katherinehhh

- **[驗證码]** 修復提供商 ID 可以被修改的问题 ([#6097](https://github.com/nocobase/nocobase/pull/6097)) by @mytharcher

## [v1.4.27](https://github.com/nocobase/nocobase/compare/v1.4.26...v1.4.27) - 2025-01-18

### 🐛 修復

- **[client]** 修復在嵌入頁面中，彈出視窗中的区块資料為空的问题 ([#6086](https://github.com/nocobase/nocobase/pull/6086)) by @zhangzhonghe

- **[工作流]** 修復在准备階段的排程未能執行的问题 ([#6087](https://github.com/nocobase/nocobase/pull/6087)) by @mytharcher

## [v1.4.26](https://github.com/nocobase/nocobase/compare/v1.4.25...v1.4.26) - 2025-01-16

### 🚀 最佳化

- **[client]** 支持给 SQL 資料表新增描述 ([#6081](https://github.com/nocobase/nocobase/pull/6081)) by @2013xile

- **[resourcer]** 支持 API 請求中传入空物件作为 values 的值 ([#6070](https://github.com/nocobase/nocobase/pull/6070)) by @mytharcher

### 🐛 修復

- **[本機化]** 译文為空時，點擊“刪除译文按钮”不請求介面 ([#6078](https://github.com/nocobase/nocobase/pull/6078)) by @2013xile

## [v1.4.25](https://github.com/nocobase/nocobase/compare/v1.4.24...v1.4.25) - 2025-01-15

### 🚀 最佳化

- **[client]** 改進檔案儲存擴充 ([#6071](https://github.com/nocobase/nocobase/pull/6071)) by @chenos

- **[工作流]** 修復定時任務重複配置欄位元件的问题 ([#6067](https://github.com/nocobase/nocobase/pull/6067)) by @mytharcher

### 🐛 修復

- **[行動裝置]** 修復行動裝置底部按钮被遮挡的问题 ([#6068](https://github.com/nocobase/nocobase/pull/6068)) by @zhangzhonghe

- **[工作流：自訂操作事件]** 修復自訂操作事件中对資料的查詢請求 by @mytharcher

- **[備份管理器]** 修復 collection-fdw 外掛未开启時可能出现的備份报错 by @gchust

- **[部門]** 修復部門表無法觸發自訂工作流的问题 by @mytharcher

## [v1.4.24](https://github.com/nocobase/nocobase/compare/v1.4.23...v1.4.24) - 2025-01-14

### 🚀 最佳化

- **[client]** 日期選擇器元件输入框只读 ([#6061](https://github.com/nocobase/nocobase/pull/6061)) by @Cyx649312038

### 🐛 修復

- **[client]**
  - 修復表格区块載入時误載入彈出視窗区块中的关系欄位 ([#6060](https://github.com/nocobase/nocobase/pull/6060)) by @katherinehhh

  - 去掉詳情区块中子表格右侧空隙 ([#6049](https://github.com/nocobase/nocobase/pull/6049)) by @katherinehhh

  - 整數欄位在阅读模式下設定的格式也会影响編輯模式 ([#6050](https://github.com/nocobase/nocobase/pull/6050)) by @katherinehhh

  - 修復 表格樣式问题，調整表头单元格樣式 ([#6052](https://github.com/nocobase/nocobase/pull/6052)) by @katherinehhh

- **[database]** 修復排序欄位从主鍵初始化问题 ([#6059](https://github.com/nocobase/nocobase/pull/6059)) by @chareice

- **[資料可视化]** 在圖表查詢中使用彙總函式且沒有設定维度的時候去除 `LIMIT` 语句 ([#6062](https://github.com/nocobase/nocobase/pull/6062)) by @2013xile

- **[備份管理器]** 修復使用者仅登入子應用后無法下載備份檔案的问题 by @gchust

## [v1.4.23](https://github.com/nocobase/nocobase/compare/v1.4.22...v1.4.23) - 2025-01-13

### 🐛 修復

- **[client]** 修復在表格中固定操作列不生效的问题 ([#6048](https://github.com/nocobase/nocobase/pull/6048)) by @zhangzhonghe

- **[使用者]** 在使用者管理中给使用者設定密碼的時候關閉瀏覽器自動填充 ([#6041](https://github.com/nocobase/nocobase/pull/6041)) by @2013xile

- **[工作流]** 修復基于資料表欄位的定時任務在啟動后不執行的问题 ([#6042](https://github.com/nocobase/nocobase/pull/6042)) by @mytharcher

## [v1.4.22](https://github.com/nocobase/nocobase/compare/v1.4.21...v1.4.22) - 2025-01-10

### 🚀 最佳化

- **[evaluators]** 升級 formula.js 程式庫的版本至 4.4.9 ([#6037](https://github.com/nocobase/nocobase/pull/6037)) by @mytharcher

- **[工作流]** 修復工作流外掛的日誌 API ([#6036](https://github.com/nocobase/nocobase/pull/6036)) by @mytharcher

### 🐛 修復

- **[工作流]** 为避免重複觸發增加防御性邏輯 ([#6022](https://github.com/nocobase/nocobase/pull/6022)) by @mytharcher

## [v1.4.21](https://github.com/nocobase/nocobase/compare/v1.4.20...v1.4.21) - 2025-01-10

### 🚀 最佳化

- **[client]** 詳情区块联动規則支持隱藏并保留值 ([#6031](https://github.com/nocobase/nocobase/pull/6031)) by @katherinehhh

### 🐛 修復

- **[client]**
  - 修復 icon 檔案路徑未加 public path 的问题 ([#6034](https://github.com/nocobase/nocobase/pull/6034)) by @chenos

  - 修復在表单联动規則中，如果依赖了子表格中的欄位值，而导致的联动規則失效的问题 ([#5876](https://github.com/nocobase/nocobase/pull/5876)) by @zhangzhonghe

  - 修復子詳情中的“目前記錄”變數的欄位不正確的问题 ([#6030](https://github.com/nocobase/nocobase/pull/6030)) by @zhangzhonghe

- **[備份管理器]** 修復環境變數 API_BASE_PATH 不为 /api 時下載備份失敗的问题 by @gchust

## [v1.4.20](https://github.com/nocobase/nocobase/compare/v1.4.19...v1.4.20) - 2025-01-09

### 🎉 新特性

- **[client]** 新增 app.getHref() 方法 ([#6019](https://github.com/nocobase/nocobase/pull/6019)) by @chenos

### 🚀 最佳化

- **[client]**
  - 支持绑定工作流時进行排序 ([#6017](https://github.com/nocobase/nocobase/pull/6017)) by @mytharcher

  - 将运算引擎的說明檔案連結修改为指向檔案站 ([#6021](https://github.com/nocobase/nocobase/pull/6021)) by @mytharcher

  - 下拉多選元件支持 maxTagCount: 'responsive' ([#6007](https://github.com/nocobase/nocobase/pull/6007)) by @katherinehhh

  - 篩選区块中時间範圍的結束時分秒預設到 23:59:59 ([#6012](https://github.com/nocobase/nocobase/pull/6012)) by @katherinehhh

- **[操作：批量編輯]** 批量編輯中提交按钮移除欄位赋值和联动規則配置项 ([#6008](https://github.com/nocobase/nocobase/pull/6008)) by @katherinehhh

### 🐛 修復

- **[client]**
  - 修復 富文本欄位設定必填后，填写資料刪除后，必填無效 ([#6006](https://github.com/nocobase/nocobase/pull/6006)) by @katherinehhh

  - 修復 操作列按钮隱藏時沒有左對齊的问题 ([#6014](https://github.com/nocobase/nocobase/pull/6014)) by @katherinehhh

  - 修復 在 REST API 配置頁面點擊 Collections 標籤导致 Create Collections 按钮例外的问题 ([#5992](https://github.com/nocobase/nocobase/pull/5992)) by @katherinehhh

  - 修復一对多关联的 targetKey 無法選擇 NanoID 欄位 ([#5999](https://github.com/nocobase/nocobase/pull/5999)) by @katherinehhh

  - 修復紧凑模式下配置按钮错位问题 ([#6001](https://github.com/nocobase/nocobase/pull/6001)) by @katherinehhh

  - 修復清單元件樣式 ([#5998](https://github.com/nocobase/nocobase/pull/5998)) by @mytharcher

  - 修復客戶端請求中携带的 headers 被覆盖的问题 ([#6009](https://github.com/nocobase/nocobase/pull/6009)) by @2013xile

  - 修復外鍵、目标資料表識別欄位 和源資料表識別欄位 不支持中文检索的问题 ([#5997](https://github.com/nocobase/nocobase/pull/5997)) by @katherinehhh

- **[操作：匯入記錄]** 修復無法匯入使用不同 target key 的多对多关联的问题 ([#6024](https://github.com/nocobase/nocobase/pull/6024)) by @chareice

- **[区块：地图]** 詳情区块中的地图欄位，应顯示地图 ([#6010](https://github.com/nocobase/nocobase/pull/6010)) by @katherinehhh

- **[嵌入 NocoBase]** Embed 的 token 与 auth 存在冲突 by @chenos

## [v1.4.19](https://github.com/nocobase/nocobase/compare/v1.4.18...v1.4.19) - 2025-01-06

### 🐛 修復

- **[client]** 修 复 篩選表单/篩選操作中日期範圍選擇器設定 showTime=true 時未顯示時间 ([#5994](https://github.com/nocobase/nocobase/pull/5994)) by @katherinehhh

## [v1.4.18](https://github.com/nocobase/nocobase/compare/v1.4.17...v1.4.18) - 2025-01-06

### 🚀 最佳化

- **[工作流：測試工具套件]** 修復測試表中日期欄位的精度 ([#5983](https://github.com/nocobase/nocobase/pull/5983)) by @mytharcher

### 🐛 修復

- **[client]**
  - 修復 資料区块在子頁面中設定全高時出现捲動条 ([#5989](https://github.com/nocobase/nocobase/pull/5989)) by @katherinehhh

  - 修復 表格操作列按钮隱藏時沒有左對齊 ([#5987](https://github.com/nocobase/nocobase/pull/5987)) by @katherinehhh

  - 修復 資料表管理 無法同時刪除系統欄位和普通欄位 ([#5988](https://github.com/nocobase/nocobase/pull/5988)) by @katherinehhh

  - 修復「URL 查詢參數」變數在行動裝置使用無效的问题 ([#5968](https://github.com/nocobase/nocobase/pull/5968)) by @Cyx649312038

- **[server]** 修復还原備份時可能出现的應用崩溃问题 ([#5981](https://github.com/nocobase/nocobase/pull/5981)) by @gchust

- **[行動裝置]** 修復行動裝置底部按钮被遮挡的问题 ([#5991](https://github.com/nocobase/nocobase/pull/5991)) by @zhangzhonghe

- **[資料可视化]** 修復在子頁面的圖表中使用“上级彈出視窗變數”時，重新整理頁面后變數失效的问题 ([#5984](https://github.com/nocobase/nocobase/pull/5984)) by @2013xile

- **[区块：看板]** 修復看板未載入資料表的父表欄位 ([#5985](https://github.com/nocobase/nocobase/pull/5985)) by @katherinehhh

## [v1.4.17](https://github.com/nocobase/nocobase/compare/v1.4.16...v1.4.17) - 2024-12-31

### 🎉 新特性

- **[client]** 支持多对多（陣列）欄位使用“表格中選取的記錄”變數 ([#5974](https://github.com/nocobase/nocobase/pull/5974)) by @2013xile

### 🚀 最佳化

- **[資料源：主資料程式庫]** 新增名称冲突校验，防止使用者建立与系統 Collection 同名的 Collection ([#5962](https://github.com/nocobase/nocobase/pull/5962)) by @chareice

- **[工作流]** 避免日期範圍變數在除了篩選元件中被误用 ([#5954](https://github.com/nocobase/nocobase/pull/5954)) by @mytharcher

### 🐛 修復

- **[database]**
  - 修復 filterByTk 带 filter 參數無法刪除資料的问题 ([#5976](https://github.com/nocobase/nocobase/pull/5976)) by @chareice

  - repository 的 firstOrCreate 和 updateOrCreate 方法缺失 context ([#5973](https://github.com/nocobase/nocobase/pull/5973)) by @chenos

- **[client]**
  - 修復表单中新增对一关系欄位時控制台报错 ([#5975](https://github.com/nocobase/nocobase/pull/5975)) by @katherinehhh

  - 修復 子表格中通過多对一欄位赋值時，刪除行記錄后再次選擇資料未成功赋值的问题 ([#5958](https://github.com/nocobase/nocobase/pull/5958)) by @katherinehhh

  - 修復因資料套件含 children 命名的欄位，而导致表格区块报错的问题 ([#5951](https://github.com/nocobase/nocobase/pull/5951)) by @zhangzhonghe

- **[資料源：主資料程式庫]** 修復舊版 unixTimestamp 欄位的支持问题 ([#5967](https://github.com/nocobase/nocobase/pull/5967)) by @chareice

- **[工作流]** 修復关系欄位子詳情区块在人工节点介面配置中报错 ([#5953](https://github.com/nocobase/nocobase/pull/5953)) by @mytharcher

## [v1.4.16](https://github.com/nocobase/nocobase/compare/v1.4.15...v1.4.16) - 2024-12-26

### 🐛 修復

- **[client]** 修復時间戳欄位精度转换问题 ([#5931](https://github.com/nocobase/nocobase/pull/5931)) by @chenos

- **[操作：複製記錄]** 修復詳情和表单区块中，一对一关系欄位未顯示配置的关系表欄位 ([#5921](https://github.com/nocobase/nocobase/pull/5921)) by @katherinehhh

- **[備份管理器]** 修復 mysqldump 版本小於8時備份失敗的问题 by @gchust

## [v1.4.15](https://github.com/nocobase/nocobase/compare/v1.4.14...v1.4.15) - 2024-12-24

### 🐛 修復

- **[server]** 啟用外掛時未自動建表 ([#5939](https://github.com/nocobase/nocobase/pull/5939)) by @chenos

- **[client]** 修復 联动規則中属性欄位搜尋無法符合正確資料 ([#5925](https://github.com/nocobase/nocobase/pull/5925)) by @katherinehhh

- **[工作流]**
  - 修復定時任務使用無時区欄位存在錯誤的问题 ([#5938](https://github.com/nocobase/nocobase/pull/5938)) by @mytharcher

  - 修復日期範圍變數翻译 ([#5919](https://github.com/nocobase/nocobase/pull/5919)) by @mytharcher

## [v1.4.14](https://github.com/nocobase/nocobase/compare/v1.4.13...v1.4.14) - 2024-12-21

### 🐛 修復

- **[資料可视化]** 修復在圖表查詢中使用嵌套的多对多关系进行篩選時的报错。 ([#5917](https://github.com/nocobase/nocobase/pull/5917)) by @2013xile

- **[工作流：彙總查詢节点]** 修復由于事务造成的統計节点结果錯誤问题 ([#5916](https://github.com/nocobase/nocobase/pull/5916)) by @mytharcher

## [v1.4.13](https://github.com/nocobase/nocobase/compare/v1.4.12...v1.4.13) - 2024-12-19

### 🚀 最佳化

- **[資料表: SQL]** 禁止在 SQL 中使用危险关鍵字和函式。 ([#5913](https://github.com/nocobase/nocobase/pull/5913)) by @2013xile

- **[主題編輯器]** 最佳化使用者资料編輯和密碼修改的 API 校验邏輯 ([#5912](https://github.com/nocobase/nocobase/pull/5912)) by @2013xile

### 🐛 修復

- **[資料源：主資料程式庫]** 修復外鍵載入问题 ([#5903](https://github.com/nocobase/nocobase/pull/5903)) by @chareice

- **[資料表: SQL]** 修復 SQL 資料表更新后欄位消失的问题。 ([#5909](https://github.com/nocobase/nocobase/pull/5909)) by @chareice

- **[備份管理器]** 修復 Windows 平台備份还原失敗的问题 by @gchust

## [v1.4.11](https://github.com/nocobase/nocobase/compare/v1.4.10...v1.4.11) - 2024-12-18

### 🚀 最佳化

- **[client]** 使更多的元件支持“省略超出長度的內容” 配置项 ([#5888](https://github.com/nocobase/nocobase/pull/5888)) by @zhangzhonghe

- **[database]** 关系 repository 支持 firstOrCreate & updateOrCreate ([#5894](https://github.com/nocobase/nocobase/pull/5894)) by @chareice

### 🐛 修復

- **[client]**
  - 修復 外部資料源区块的複製操作請求模版沒有 x-data-source 參數 ([#5882](https://github.com/nocobase/nocobase/pull/5882)) by @katherinehhh

  - 修復 外掛中的表格出现横向捲動条 ([#5899](https://github.com/nocobase/nocobase/pull/5899)) by @katherinehhh

  - 修復关系欄位的下拉選項中，有時会出现多余的 “N/A” 選項的问题 ([#5878](https://github.com/nocobase/nocobase/pull/5878)) by @zhangzhonghe

  - 修復 PG 视图建立錯誤，解決跨 schema 選擇问题 ([#5881](https://github.com/nocobase/nocobase/pull/5881)) by @katherinehhh

  - 修復：表单区块分組在水平布局下樣式例外 ([#5884](https://github.com/nocobase/nocobase/pull/5884)) by @katherinehhh

- **[使用者]**
  - 修復使用者管理中新增或修改使用者后表单沒有被重設的问题 。 ([#5875](https://github.com/nocobase/nocobase/pull/5875)) by @2013xile

  - 修復使用者管理頁面翻页或修改分页數量后，編輯使用者资料并提交，分页設定会被重設的问题。 ([#5893](https://github.com/nocobase/nocobase/pull/5893)) by @2013xile

- **[資料源管理]** 修復外部資料源 Collection 的篩選问题 ([#5890](https://github.com/nocobase/nocobase/pull/5890)) by @chareice

- **[公開表单]** 修復全局切换主題导致公開表单預覽页主題被影响的问题 ([#5883](https://github.com/nocobase/nocobase/pull/5883)) by @katherinehhh

## [v1.4.10](https://github.com/nocobase/nocobase/compare/v1.4.9...v1.4.10) - 2024-12-12

### 🎉 新特性

- **[操作：自訂請求]** 支持在自訂請求按钮中使用“目前表单”變數 ([#5871](https://github.com/nocobase/nocobase/pull/5871)) by @zhangzhonghe

### 🚀 最佳化

- **[資料可视化]** 支持在圖表的查詢配置中使用外鍵 ([#5869](https://github.com/nocobase/nocobase/pull/5869)) by @2013xile

### 🐛 修復

- **[client]** 修復关联檔案表，使用資料選擇器時在配置模式下顯示檔案表区块，非配置模式下未顯示的问题 ([#5874](https://github.com/nocobase/nocobase/pull/5874)) by @katherinehhh

- **[權限控制]** 修復配置權限之后複製記錄相关问题 ([#5839](https://github.com/nocobase/nocobase/pull/5839)) by @chareice

- **[工作流]** 修復自動刪除執行記錄時事务逾時的问题 ([#5870](https://github.com/nocobase/nocobase/pull/5870)) by @mytharcher

## [v1.4.9](https://github.com/nocobase/nocobase/compare/v1.4.8...v1.4.9) - 2024-12-12

### 🐛 修復

- **[sdk]** 移除預設 locale ([#5867](https://github.com/nocobase/nocobase/pull/5867)) by @chenos

- **[client]**
  - 修復資料範圍中，選擇嵌套的关系欄位變數，變數值為空的问题 ([#5866](https://github.com/nocobase/nocobase/pull/5866)) by @zhangzhonghe

  - 修復 列数少時右固定列捲動条出现 ([#5864](https://github.com/nocobase/nocobase/pull/5864)) by @katherinehhh

  - 修復篩選元件樣式错位问题 ([#5851](https://github.com/nocobase/nocobase/pull/5851)) by @mytharcher

- **[備份管理器]** 修復自訂網域名稱的子應用下載備份檔案失敗的问题 by @gchust

## [v1.4.8](https://github.com/nocobase/nocobase/compare/v1.4.7...v1.4.8) - 2024-12-10

### 🐛 修復

- **[client]**
  - 修復 关系欄位 record picker 中配置的篩選表单出现資料模板缺陷 ([#5837](https://github.com/nocobase/nocobase/pull/5837)) by @katherinehhh

  - 修復 Markdown string template 关系變數沒有按需載入的问题（外部資料源） ([#5791](https://github.com/nocobase/nocobase/pull/5791)) by @katherinehhh

- **[使用者資料同步]** 同步資料時跳過不支持的資料類型，而不是直接报错。 ([#5835](https://github.com/nocobase/nocobase/pull/5835)) by @chenzhizdt

- **[備份管理器]**
  - 修復備份檔案较大時下載視窗弹出过慢的问题 by @gchust

  - 修復備份还原子應用時会引起所有應用重新啟動的问题 by @gchust

## [v1.4.7](https://github.com/nocobase/nocobase/compare/v1.4.6...v1.4.7) - 2024-12-09

### 🐛 修復

- **[行動裝置]** 修復行動裝置背景色问题，导致看起来区块之间沒有间隙 ([#5809](https://github.com/nocobase/nocobase/pull/5809)) by @katherinehhh

## [v1.4.6](https://github.com/nocobase/nocobase/compare/v1.4.5...v1.4.6) - 2024-12-08

### 🐛 修復

- **[操作：匯入記錄]** 修復关联表格匯入的问题 ([#5833](https://github.com/nocobase/nocobase/pull/5833)) by @chareice

- **[權限控制]** 修復 ACL 中使用 fields 查詢关系的问题 ([#5832](https://github.com/nocobase/nocobase/pull/5832)) by @chareice

## [v1.4.5](https://github.com/nocobase/nocobase/compare/v1.4.4...v1.4.5) - 2024-12-08

### 🐛 修復

- **[權限控制]** 使用者角色不对時重新整理頁面 ([#5821](https://github.com/nocobase/nocobase/pull/5821)) by @chenos

## [v1.4.4](https://github.com/nocobase/nocobase/compare/v1.4.3...v1.4.4) - 2024-12-08

### 🐛 修復

- **[client]**
  - 修復表格区块中外部資料源欄位清單沒有顯示 ([#5825](https://github.com/nocobase/nocobase/pull/5825)) by @katherinehhh

  - 修復表单配置欄位继承欄位的顯示问题 ([#5822](https://github.com/nocobase/nocobase/pull/5822)) by @katherinehhh

  - 修復表继承缺陷：欄位清單未顯示继承表欄位且在資料表中無法重写继承欄位 ([#5800](https://github.com/nocobase/nocobase/pull/5800)) by @katherinehhh

- **[資料可视化]** 修復在 MySQL 中格式化带時区的日期欄位的问题 ([#5829](https://github.com/nocobase/nocobase/pull/5829)) by @2013xile

- **[工作流]**
  - 修復由于事务引起的外部資料源資料表同步事件觸發錯誤 ([#5818](https://github.com/nocobase/nocobase/pull/5818)) by @mytharcher

  - 修復定時任務時间欄位配置中缺少的日期類型 ([#5816](https://github.com/nocobase/nocobase/pull/5816)) by @mytharcher

- **[資料表欄位：多对多 (陣列)]** 修復更新对一关联表中多对多（陣列）欄位不生效的问题 ([#5820](https://github.com/nocobase/nocobase/pull/5820)) by @2013xile

- **[日历]**
  - 修復日历點擊空白日期時报错的问题 ([#5803](https://github.com/nocobase/nocobase/pull/5803)) by @katherinehhh

  - 修復關閉通過“日历区块”開啟的彈出視窗，导致所有彈出視窗都關閉的问题 ([#5793](https://github.com/nocobase/nocobase/pull/5793)) by @zhangzhonghe

- **[公開表单]** 修復子應用中公開表 QC code 扫码開啟路徑不正確 ([#5799](https://github.com/nocobase/nocobase/pull/5799)) by @katherinehhh

## [v1.4.3](https://github.com/nocobase/nocobase/compare/v1.4.2...v1.4.3) - 2024-12-05

### 🚀 最佳化

- **[test]** 支持測試用例中登入方法套件含角色名称 ([#5794](https://github.com/nocobase/nocobase/pull/5794)) by @mytharcher

- **[通知：站内信]** 更新站内信詳情連結的標題 ([#5742](https://github.com/nocobase/nocobase/pull/5742)) by @sheldon66

### 🐛 修復

- **[client]**
  - 修復無角色使用者登入报错后，點擊“登入其他账号”按钮時，token未清除的问题 ([#5790](https://github.com/nocobase/nocobase/pull/5790)) by @2013xile

  - 静默請求時丢失請求头資訊 ([#5795](https://github.com/nocobase/nocobase/pull/5795)) by @chenos

  - 使用者無角色時頁面空白 ([#5797](https://github.com/nocobase/nocobase/pull/5797)) by @chenos

  - 修復紧凑主題下子表格 size 为 small 時出现捲動条 ([#5796](https://github.com/nocobase/nocobase/pull/5796)) by @katherinehhh

## [v1.4.2](https://github.com/nocobase/nocobase/compare/v1.4.1...v1.4.2) - 2024-12-04

### 🐛 修復

- **[工作流]** 修復非同步工作流在工作流清單中未展示欄位識別 ([#5787](https://github.com/nocobase/nocobase/pull/5787)) by @mytharcher

## [v1.4.1](https://github.com/nocobase/nocobase/compare/v1.4.0...v1.4.1) - 2024-12-04

### 🚀 最佳化

- **[cli]** 最佳化 pkg 命令 ([#5785](https://github.com/nocobase/nocobase/pull/5785)) by @chenos

### 🐛 修復

- **[行動裝置]** 修復 行動裝置篩選操作缺少日期输入框 ([#5786](https://github.com/nocobase/nocobase/pull/5786)) by @katherinehhh

## [v1.4.0](https://github.com/nocobase/nocobase/compare/v1.3.53...v1.4.0) - 2024-12-03

## 🎉 主要新特性

### 簡化外掛的新增和更新流程

![20241201170853](https://static-docs.nocobase.com/20241201170853.png)

- 外掛清單直接读取本機目錄
- 合併外掛新增和更新流程
- 介面支持批量啟用外掛
- 簡化商业外掛下載和升級流程

参考檔案：

- [發布日誌 / 簡化外掛的新增和更新流程](https://www.nocobase.com/cn/blog/simplify-the-process-of-adding-and-updating-plugins)

### 通知

![20241201171806](https://static-docs.nocobase.com/20241201171806.png)

- 站内信：支持使用者在 NocoBase 應用内实時接收訊息通知；
- 电子邮件：通過电子邮件渠道傳送通知，目前只支持 SMTP 傳輸方式；
- 企微通知：通過企业微信渠道傳送通知。

参考檔案：

- [通知管理](https://docs-cn.nocobase.com/handbook/notification-manager)

### 使用者資料同步

![20241201172843](https://static-docs.nocobase.com/20241201172843.png)

参考檔案：

- [使用者資料同步](https://docs-cn.nocobase.com/handbook/user-data-sync)

### 備份管理器

![20241201170237](https://static-docs.nocobase.com/20241201170237.png)

参考檔案：

- [備份管理器](https://docs-cn.nocobase.com/handbook/backups)

### 公開表单

对外分享公開表单，向匿名使用者收集資訊。

![20241201165614](https://static-docs.nocobase.com/20241201165614.png)

参考檔案：

- [公開表单](https://docs-cn.nocobase.com/handbook/public-forms)

### 資料源：人大金仓（KingbaseES）

使用人大金仓（KingbaseES）資料程式庫作为資料源，可以作为主資料程式庫，也可以作为外部資料程式庫使用。

![20241024121815](https://static-docs.nocobase.com/20241024121815.png)

参考檔案：

- [資料源 - 人大金仓（KingbaseES）](https://docs-cn.nocobase.com/handbook/data-source-kingbase)

### 資料源：外部 Oracle

使用外部的 Oracle 資料程式庫作为資料源。

![701f8271f153d417e6f25c8ba74c931d.png](https://static-docs.nocobase.com/701f8271f153d417e6f25c8ba74c931d.png)

参考檔案：

- [資料源：外部 Oracle](https://docs-cn.nocobase.com/handbook/data-source-external-oracle)

### 資料表欄位：附件（URL）

支持 URL 格式的附件

![e8772bec3d4b1771c1b21d087c9a4185.png](https://static-docs.nocobase.com/e8772bec3d4b1771c1b21d087c9a4185.png)

参考檔案：

- [資料表欄位：附件（URL）](https://docs-cn.nocobase.com/handbook/field-attachment-url)

### 欄位元件：掩码

![20241201165938](https://static-docs.nocobase.com/20241201165938.png)

参考檔案：

- [欄位元件：掩码](https://docs-cn.nocobase.com/handbook/field-component-mask)

### 工作流：JavaScript

JavaScript 节点允許使用者在工作流中執行一段自訂的服務端 JavaScript 腳本。腳本中可以使用流程上游的變數作为參數，并且可以将腳本的回傳值提供给下游节点使用。

![20241202203655](https://static-docs.nocobase.com/20241202203655.png)

参考檔案：

- [工作流 - JavaScript](https://docs-cn.nocobase.com/handbook/workflow-javascript)

### 資料可视化：ECharts

新增 ECharts 的圖表的支持，支持漏斗图、雷达图等更多图形，并提供更友好的图形配置项。

![data-visualization-echarts](https://static-docs.nocobase.com/202410091022965.png)

参考檔案：

- [資料可视化：ECharts](https://docs-cn.nocobase.com/handbook/data-visualization-echarts)

### 区块：分步表单

![a503e153e8d714b9ca56f512142aeef1.png](https://static-docs.nocobase.com/a503e153e8d714b9ca56f512142aeef1.png)

参考檔案：

- [分步表单](https://docs-cn.nocobase.com/handbook/block-multi-step-from)

### 区块：操作面板

用于放置各种快捷操作，目前支持：

- 連結
- 扫二维码
- 彈出視窗
- 自訂請求

支持栅格和清單两种布局

![48bd2e280aa887f3e5bd43d6c79d6b46.png](https://static-docs.nocobase.com/48bd2e280aa887f3e5bd43d6c79d6b46.png)

参考檔案：

- [操作面板](https://docs-cn.nocobase.com/handbook/block-action-panel)

## [v1.3.55](https://github.com/nocobase/nocobase/compare/v1.3.54...v1.3.55) - 2024-12-03

### 🚀 最佳化

- **[client]** 区块初始化器使用更符合類型含义的图标 ([#5757](https://github.com/nocobase/nocobase/pull/5757)) by @mytharcher

### 🐛 修復

- **[client]**
  - 修復图标变更后导致的 E2E 用例執行失敗 ([#5768](https://github.com/nocobase/nocobase/pull/5768)) by @mytharcher

  - 修復 select 資料為空時应顯示空白 ([#5762](https://github.com/nocobase/nocobase/pull/5762)) by @katherinehhh

- **[database]** 修復带外鍵更新关系欄位的问题 ([#5754](https://github.com/nocobase/nocobase/pull/5754)) by @chareice

- **[資料源管理]** 修復 source key 顯示不正確 ([#5771](https://github.com/nocobase/nocobase/pull/5771)) by @katherinehhh

- **[工作流：自訂操作事件]**
  - 允許所有角色都可觸發外部資料源資料表上的自訂操作事件 by @mytharcher

  - 修復自訂操作事件預設資料源 by @mytharcher

  - 修復自訂操作事件資料源不符合的錯誤 by @mytharcher

  - 修復自訂操作事件在关系区块無法觸發的问题 by @mytharcher

## [v1.3.53](https://github.com/nocobase/nocobase/compare/v1.3.52...v1.3.53) - 2024-11-28

### 🚀 最佳化

- **[client]**
  - 匯出必要的 hook ([#5702](https://github.com/nocobase/nocobase/pull/5702)) by @mytharcher

  - 中国行政区欄位外掛从内置外掛中移除 ([#5693](https://github.com/nocobase/nocobase/pull/5693)) by @katherinehhh

- **[工作流：操作前事件]** 移除攔截器的警告日誌 by @mytharcher

### 🐛 修復

- **[cli]** Daemon 模式不刪除 sock 檔案 ([#5750](https://github.com/nocobase/nocobase/pull/5750)) by @chenos

- **[client]**
  - 修復多个关系欄位关联同一张表時，設定关系表欄位時互相影响的问题 ([#5744](https://github.com/nocobase/nocobase/pull/5744)) by @katherinehhh

  - 修復 子表格勾选框內容未對齊问题 ([#5735](https://github.com/nocobase/nocobase/pull/5735)) by @katherinehhh

  - 修復 資料選擇器未顯示外鍵欄位 ([#5734](https://github.com/nocobase/nocobase/pull/5734)) by @katherinehhh

  - 改進 子表格中驗證資訊的反馈顯示方式 ([#5700](https://github.com/nocobase/nocobase/pull/5700)) by @katherinehhh

- **[server]** 按依赖順序載入外掛 ([#5706](https://github.com/nocobase/nocobase/pull/5706)) by @chenos

- **[区块：地图]** 修復 Google Map 切换縮放等级時报错的问题 ([#5722](https://github.com/nocobase/nocobase/pull/5722)) by @katherinehhh

- **[資料源：主資料程式庫]** 修復视图 Collection 欄位获取原始欄位名的问题 ([#5729](https://github.com/nocobase/nocobase/pull/5729)) by @chareice

- **[檔案管理器]** 当 Endpoint 不為空時，forcePathStyle 为 true ([#5712](https://github.com/nocobase/nocobase/pull/5712)) by @chenos

## [v1.3.52](https://github.com/nocobase/nocobase/compare/v1.3.51...v1.3.52) - 2024-11-21

### 🚀 最佳化

- **[工作流]**
  - 去除工作流查詢节点的分页条数限制 ([#5694](https://github.com/nocobase/nocobase/pull/5694)) by @mytharcher

  - 關閉工作流与執行計畫之间的级联刪除選項 ([#5666](https://github.com/nocobase/nocobase/pull/5666)) by @mytharcher

- **[資料源：REST API]** 最佳化 REST API 外掛相关文案 by @katherinehhh

## [v1.3.51](https://github.com/nocobase/nocobase/compare/v1.3.50-beta...v1.3.51) - 2024-11-19

### 🐛 修復

- **[client]**
  - 修復 欄位權限判断被关系欄位上下文影响 ([#5672](https://github.com/nocobase/nocobase/pull/5672)) by @katherinehhh

  - 修復 联动規則赋空值儲存后变为靜態值空 ([#5667](https://github.com/nocobase/nocobase/pull/5667)) by @katherinehhh

- **[資料表欄位：多对多 (陣列)]** 修復在获取含有多对多（陣列）欄位的关联表記錄時报错的问题 ([#5661](https://github.com/nocobase/nocobase/pull/5661)) by @2013xile

- **[区块：甘特图]** 修復甘特图新增区块時模板清單为日历区块的模板 ([#5673](https://github.com/nocobase/nocobase/pull/5673)) by @katherinehhh

- **[資料可视化]** 修復双轴图中資料转换沒有对 tooltip 生效的问题 ([#5649](https://github.com/nocobase/nocobase/pull/5649)) by @2013xile

## [v1.3.50-beta](https://github.com/nocobase/nocobase/compare/v1.3.49-beta...v1.3.50-beta) - 2024-11-14

### 🐛 修復

- **[client]** 修復联动規則標題編輯時無法清空的问题 ([#5644](https://github.com/nocobase/nocobase/pull/5644)) by @katherinehhh

- **[评论]** 修復评论区块設定資料範圍不生效问题 by @katherinehhh

## [v1.3.49-beta](https://github.com/nocobase/nocobase/compare/v1.3.48-beta...v1.3.49-beta) - 2024-11-13

### 🚀 最佳化

- **[client]** 一对一欄位和多对多（陣列）欄位支持選擇檔案表 ([#5637](https://github.com/nocobase/nocobase/pull/5637)) by @mytharcher

- **[evaluators]** 将运算节点的預設計算引擎更换为 Formula.js ([#5626](https://github.com/nocobase/nocobase/pull/5626)) by @mytharcher

### 🐛 修復

- **[client]** 修復篩選按钮重設后標題還原为預設名称的问题 ([#5635](https://github.com/nocobase/nocobase/pull/5635)) by @katherinehhh

- **[操作：匯入記錄]** 修復無法通過 id 欄位匯入多对多关联資料的问题 ([#5623](https://github.com/nocobase/nocobase/pull/5623)) by @chareice

## [v1.3.48-beta](https://github.com/nocobase/nocobase/compare/v1.3.47-beta...v1.3.48-beta) - 2024-11-11

### 🚀 最佳化

- **[client]** 支持隱藏選單项 ([#5624](https://github.com/nocobase/nocobase/pull/5624)) by @chenos

- **[server]** 增加 DB_SQL_BENCHMARK 環境變數 ([#5615](https://github.com/nocobase/nocobase/pull/5615)) by @chareice

### 🐛 修復

- **[client]** 支持一对多关系使用檔案表 ([#5619](https://github.com/nocobase/nocobase/pull/5619)) by @mytharcher

- **[操作：匯入記錄]** 修復無法通過 id 欄位匯入多对多关联資料的问题 ([#5623](https://github.com/nocobase/nocobase/pull/5623)) by @chareice

## [v1.3.47-beta](https://github.com/nocobase/nocobase/compare/v1.3.46-beta...v1.3.47-beta) - 2024-11-08

### 🚀 最佳化

- **[使用者認證]** 最佳化登入、註冊的錯誤提示 ([#5612](https://github.com/nocobase/nocobase/pull/5612)) by @2013xile

### 🐛 修復

- **[client]**
  - 修復子表格中的預設值问题 ([#5607](https://github.com/nocobase/nocobase/pull/5607)) by @zhangzhonghe

  - 修復 关系欄位標題欄位为string 類型時应支持模糊查詢 ([#5611](https://github.com/nocobase/nocobase/pull/5611)) by @katherinehhh

- **[使用者認證]** 修復使用者使用非密碼認證器登入時無法修改密碼的问题 ([#5609](https://github.com/nocobase/nocobase/pull/5609)) by @2013xile

## [v1.3.45-beta](https://github.com/nocobase/nocobase/compare/v1.3.44-beta...v1.3.45-beta) - 2024-11-06

### 🐛 修復

- **[client]** 表格中关系表欄位權限为该关系欄位的權限 ([#5569](https://github.com/nocobase/nocobase/pull/5569)) by @katherinehhh

- **[操作：匯出記錄]** 修復匯出过程中的多语言问题 ([#5591](https://github.com/nocobase/nocobase/pull/5591)) by @chareice

- **[操作：匯入記錄]** 修復無法匯入多对一关联的问题 ([#5417](https://github.com/nocobase/nocobase/pull/5417)) by @chareice

## [v1.3.44-beta](https://github.com/nocobase/nocobase/compare/v1.3.43-beta...v1.3.44-beta) - 2024-11-05

### 🎉 新特性

- **[認證：OIDC]** 新增「啟用 RP-initiated logout」選項 by @2013xile

### 🐛 修復

- **[client]** 修復 关系欄位下拉選項中設定單選欄位为標題欄位時篩選不生效的问题 ([#5581](https://github.com/nocobase/nocobase/pull/5581)) by @katherinehhh

## [v1.3.43-beta](https://github.com/nocobase/nocobase/compare/v1.3.42-beta...v1.3.43-beta) - 2024-11-05

### 🚀 最佳化

- **[client]** 數字精确度支持配置 8 位数 ([#5552](https://github.com/nocobase/nocobase/pull/5552)) by @chenos

### 🐛 修復

- **[client]** 修復联动樣式在表单里不更新。 ([#5539](https://github.com/nocobase/nocobase/pull/5539)) by @sheldon66

- **[認證：API 密钥]** 修復 API keys 設定頁面的 URL 路徑 ([#5562](https://github.com/nocobase/nocobase/pull/5562)) by @2013xile

- **[行動裝置]** 修復預覽圖片被頁面覆盖的问题 ([#5535](https://github.com/nocobase/nocobase/pull/5535)) by @zhangzhonghe

- **[区块：地图]** 子詳情中地图欄位，渲染地图不正確，應該顯示坐标字元/詳情区块，沒有值的欄位，会顯示上一条資料的值 ([#5526](https://github.com/nocobase/nocobase/pull/5526)) by @katherinehhh

- **[資料表：树]** 修復更新路徑表時的报错 ([#5551](https://github.com/nocobase/nocobase/pull/5551)) by @2013xile

## [v1.3.42-beta](https://github.com/nocobase/nocobase/compare/v1.3.41-beta...v1.3.42-beta) - 2024-10-28

### 🐛 修復

- **[資料表：树]** 修復解除关联子节点，节点路徑沒有更新的问题 ([#5522](https://github.com/nocobase/nocobase/pull/5522)) by @2013xile

## [v1.3.41-beta](https://github.com/nocobase/nocobase/compare/v1.3.40-beta...v1.3.41-beta) - 2024-10-27

### 🚀 最佳化

- **[權限控制]** 最佳化權限系統中的大表查詢效能 ([#5496](https://github.com/nocobase/nocobase/pull/5496)) by @chareice

## [v1.3.40-beta](https://github.com/nocobase/nocobase/compare/v1.3.39-beta...v1.3.40-beta) - 2024-10-25

### 🎉 新特性

- **[認證：OIDC]** 新增“跳過 SSL 驗證“選項 by @2013xile

### 🚀 最佳化

- **[client]** 勾选欄位未勾选時顯示停用的未勾选框 ([#5503](https://github.com/nocobase/nocobase/pull/5503)) by @katherinehhh

### 🐛 修復

- **[database]** 修復字元串操作符”套件含“和”不套件含“沒有正確處理 `null` 值的问题 ([#5509](https://github.com/nocobase/nocobase/pull/5509)) by @2013xile

- **[client]** 修復联动規則中使用「URL參數變數」作條件判断無效 ([#5504](https://github.com/nocobase/nocobase/pull/5504)) by @katherinehhh

- **[区块：地图]** 修復高德地图多次呼叫 `load` 方法，导致多张地图存在時，部分地图展示报错的问题 ([#5490](https://github.com/nocobase/nocobase/pull/5490)) by @Cyx649312038

## [v1.3.39-beta](https://github.com/nocobase/nocobase/compare/v1.3.38-beta...v1.3.39-beta) - 2024-10-24

### 🐛 修復

- **[client]** 修復彈出視窗中無法新增篩選区块的问题 ([#5502](https://github.com/nocobase/nocobase/pull/5502)) by @zhangzhonghe

## [v1.3.38-beta](https://github.com/nocobase/nocobase/compare/v1.3.37-beta...v1.3.38-beta) - 2024-10-24

### 🐛 修復

- **[client]**
  - 使用簡單分页的資料表在清單区块上分页例外 ([#5500](https://github.com/nocobase/nocobase/pull/5500)) by @katherinehhh

  - 在非配置狀態下，編輯表单应只顯示本表区块 ([#5499](https://github.com/nocobase/nocobase/pull/5499)) by @katherinehhh

- **[工作流：HTTP 請求节点]** 修復變數文本输入框中在貼上時可能产生非標準空格导致服務端邏輯錯誤的问题 ([#5497](https://github.com/nocobase/nocobase/pull/5497)) by @mytharcher

- **[部門]** 修復在所属部門角色下外部資料源權限判断不正確的问题 by @2013xile

## [v1.3.37-beta](https://github.com/nocobase/nocobase/compare/v1.3.36-beta...v1.3.37-beta) - 2024-10-23

### 🚀 最佳化

- **[client]** 調整绑定工作流配置面板中的提示文案 ([#5494](https://github.com/nocobase/nocobase/pull/5494)) by @mytharcher

### 🐛 修復

- **[檔案管理器]** 修復檔案表在关联区块内無法上傳和刪除記錄的问题 ([#5493](https://github.com/nocobase/nocobase/pull/5493)) by @mytharcher

## [v1.3.36-beta](https://github.com/nocobase/nocobase/compare/v1.3.35-beta...v1.3.36-beta) - 2024-10-22

### 🐛 修復

- **[資料表：树]** 修復继承的树表沒有自動建立路徑表的问题 ([#5486](https://github.com/nocobase/nocobase/pull/5486)) by @2013xile

- **[日历]** 当表格有資料時分页器應該顯示 ([#5480](https://github.com/nocobase/nocobase/pull/5480)) by @katherinehhh

- **[檔案管理器]** 修復由于上傳規則 hook 改动导致檔案無法上傳的问题 ([#5460](https://github.com/nocobase/nocobase/pull/5460)) by @mytharcher

- **[資料表欄位：公式]** 修復 多层子表格嵌套時，公式計算结果的錯誤 ([#5469](https://github.com/nocobase/nocobase/pull/5469)) by @gu-zhichao

## [v1.3.35-beta](https://github.com/nocobase/nocobase/compare/v1.3.34-beta...v1.3.35-beta) - 2024-10-21

### 🚀 最佳化

- **[工作流：邮件傳送节点]** 为邮件节点的表单项增加占位提示內容 ([#5470](https://github.com/nocobase/nocobase/pull/5470)) by @mytharcher

## [v1.3.34-beta](https://github.com/nocobase/nocobase/compare/v1.3.33-beta...v1.3.34-beta) - 2024-10-21

### 🎉 新特性

- **[test]** 篩選表单中的关系欄位支持配置是否多選 ([#5451](https://github.com/nocobase/nocobase/pull/5451)) by @zhangzhonghe

- **[client]** 新增一个名为“上级物件”的變數 ([#5449](https://github.com/nocobase/nocobase/pull/5449)) by @zhangzhonghe
参考檔案：[上级物件](https://docs-cn.nocobase.com/handbook/ui/variables#%E4%B8%8A%E7%BA%A7%E5%AF%B9%E8%B1%A1)
### 🐛 修復

- **[client]**
  - 修復 URL 查詢參數變數不会被解析的问题 ([#5454](https://github.com/nocobase/nocobase/pull/5454)) by @zhangzhonghe

  - 多层关系下的子表格中关系欄位設定資料範圍后，選擇关系資料后其他行記錄被清空 ([#5441](https://github.com/nocobase/nocobase/pull/5441)) by @katherinehhh

  - 修復表格行選取時的背景顏色 ([#5445](https://github.com/nocobase/nocobase/pull/5445)) by @mytharcher

- **[区块：地图]** 表格中的地图欄位不應該有縮放等级配置项 ([#5457](https://github.com/nocobase/nocobase/pull/5457)) by @katherinehhh

- **[檔案管理器]** 屏蔽阅读模式下附件欄位对儲存規則不必要的查詢 ([#5447](https://github.com/nocobase/nocobase/pull/5447)) by @mytharcher

- **[資料源：主資料程式庫]** 修復由于更换元件导致的 E2E 測試不通過 ([#5437](https://github.com/nocobase/nocobase/pull/5437)) by @mytharcher

## [v1.3.33-beta](https://github.com/nocobase/nocobase/compare/v1.3.32-beta...v1.3.33-beta) - 2024-10-16

### 🚀 最佳化

- **[工作流]** 对更新資料节点的批量模式增加关于关系欄位的提示 ([#5426](https://github.com/nocobase/nocobase/pull/5426)) by @mytharcher

### 🐛 修復

- **[client]**
  - 修復个人资料配置彈出視窗被子頁面遮挡住的问题 ([#5409](https://github.com/nocobase/nocobase/pull/5409)) by @zhangzhonghe

  - 工作流节点變數不顯示继承表欄位 ([#5415](https://github.com/nocobase/nocobase/pull/5415)) by @chenos

  - 使用篩選区块篩選表格資料時，清空篩選資料查詢資料分页器沒有跟着調整 ([#5411](https://github.com/nocobase/nocobase/pull/5411)) by @katherinehhh

- **[檔案管理器]** 移除檔案表選擇儲存空间時仅載入 20 个的限制 ([#5430](https://github.com/nocobase/nocobase/pull/5430)) by @mytharcher

- **[操作：複製記錄]** 修復批量編輯彈出視窗不顯示內容的问题 ([#5412](https://github.com/nocobase/nocobase/pull/5412)) by @zhangzhonghe

- **[資料可视化]** 修復圖表篩選区块中不顯示預設值的问题 ([#5405](https://github.com/nocobase/nocobase/pull/5405)) by @zhangzhonghe

## [v1.3.32-beta](https://github.com/nocobase/nocobase/compare/v1.3.31-beta...v1.3.32-beta) - 2024-10-13

### 🐛 修復

- **[client]** 关系欄位設定必填，資料範圍中設定變數后，選取值却报欄位必填不通過 ([#5399](https://github.com/nocobase/nocobase/pull/5399)) by @katherinehhh

## [v1.3.31-beta](https://github.com/nocobase/nocobase/compare/v1.3.30-beta...v1.3.31-beta) - 2024-10-11

### 🐛 修復

- **[client]** 修復在篩選表单中使用行政区划欄位無法正確篩選出值的问题 ([#5390](https://github.com/nocobase/nocobase/pull/5390)) by @zhangzhonghe

- **[操作：匯入記錄]** 修復匯入 wps 檔案报错的问题 ([#5397](https://github.com/nocobase/nocobase/pull/5397)) by @chareice

## [v1.3.30-beta](https://github.com/nocobase/nocobase/compare/v1.3.29-beta...v1.3.30-beta) - 2024-10-11

### 🐛 修復

- **[client]**
  - 修復在行動裝置中，顯示檔案表关系欄位時报渲染錯誤的问题 ([#5387](https://github.com/nocobase/nocobase/pull/5387)) by @zhangzhonghe

  - 修復建立区块選單無法載入更多資料表的问题 ([#5388](https://github.com/nocobase/nocobase/pull/5388)) by @zhangzhonghe

- **[工作流：自訂操作事件]**
  - 修復 自訂工作流事件提交成功后跳转不生效 by @katherinehhh

  - 自訂工作流事件提交成功后跳转不生效 by @katherinehhh

## [v1.3.29-beta](https://github.com/nocobase/nocobase/compare/v1.3.28-beta...v1.3.29-beta) - 2024-10-10

### 🚀 最佳化

- **[client]** 建立表单中也不停用日期變數 ([#5376](https://github.com/nocobase/nocobase/pull/5376)) by @zhangzhonghe

### 🐛 修復

- **[工作流：SQL 节点]** 修復在 SQL 节点中呼叫儲存过程沒有返回结果時导致錯誤的问题 ([#5385](https://github.com/nocobase/nocobase/pull/5385)) by @mytharcher

- **[工作流]** 修復基于時间欄位的定時任務导致报错的问题，并支持其他資料程式庫資料源 ([#5364](https://github.com/nocobase/nocobase/pull/5364)) by @mytharcher

## [v1.3.28-beta](https://github.com/nocobase/nocobase/compare/v1.3.27-beta...v1.3.28-beta) - 2024-10-09

### 🚀 最佳化

- **[client]** 将 cdn 連結儲存为本機资源，以防止在内网部署時請求外部资源 ([#5375](https://github.com/nocobase/nocobase/pull/5375)) by @zhangzhonghe

### 🐛 修復

- **[client]**
  - 修復在“使用者和權限”配置页開啟的彈出視窗被其它彈出視窗遮挡的问题 ([#5373](https://github.com/nocobase/nocobase/pull/5373)) by @zhangzhonghe

  - 修復在子頁面中刪除 tab 页后，再次開啟后未生效的问题 ([#5362](https://github.com/nocobase/nocobase/pull/5362)) by @zhangzhonghe

  - 修復继承表关系欄位無法正常使用變數的问题 ([#5346](https://github.com/nocobase/nocobase/pull/5346)) by @zhangzhonghe

  - 修復欄位配置中目前資料表欄位与关系表欄位互相影响缺陷 ([#5343](https://github.com/nocobase/nocobase/pull/5343)) by @katherinehhh

- **[操作：匯入記錄]** 修復匯入大日期结果不正確的问题 ([#5356](https://github.com/nocobase/nocobase/pull/5356)) by @chareice

- **[工作流]** 修復新增、更新节点中配置关系欄位赋值時切换元件导致的頁面崩溃 ([#5366](https://github.com/nocobase/nocobase/pull/5366)) by @mytharcher

- **[区块：甘特图]** 修復在甘特图中開啟彈出視窗，然后再關閉，导致子頁面也被關閉的问题 ([#5370](https://github.com/nocobase/nocobase/pull/5370)) by @zhangzhonghe

## [v1.3.27-beta](https://github.com/nocobase/nocobase/compare/v1.3.26-beta...v1.3.27-beta) - 2024-09-30

### 🐛 修復

- **[client]** 修復變數“表格中選取的記錄” ([#5337](https://github.com/nocobase/nocobase/pull/5337)) by @zhangzhonghe

- **[工作流：自訂操作事件]** 修復自訂操作事件在关系区块中不觸發的问题 by @mytharcher

## [v1.3.26-beta](https://github.com/nocobase/nocobase/compare/v1.3.25-beta...v1.3.26-beta) - 2024-09-29

### 🚀 最佳化

- **[client]** 隱藏行動裝置的捲動条 ([#5339](https://github.com/nocobase/nocobase/pull/5339)) by @zhangzhonghe

### 🐛 修復

- **[client]**
  - 修復在嵌入頁面中無法開啟子頁面的问题 ([#5335](https://github.com/nocobase/nocobase/pull/5335)) by @zhangzhonghe

  - 修復彈出視窗被遮挡的问题 ([#5338](https://github.com/nocobase/nocobase/pull/5338)) by @zhangzhonghe

  - 修復行動裝置子頁面中，使用資料模板建立区块時，樣式例外的问题 ([#5340](https://github.com/nocobase/nocobase/pull/5340)) by @zhangzhonghe

  - 修復通過頁面選單關閉子頁面時，不重新整理頁面区块資料的问题 ([#5331](https://github.com/nocobase/nocobase/pull/5331)) by @zhangzhonghe

- **[操作：匯出記錄]** 修復 decimal 類型欄位的匯出格式 ([#5316](https://github.com/nocobase/nocobase/pull/5316)) by @chareice

- **[区块：看板]** 修復在嵌入頁面中，點擊看板卡片后，無法開啟彈出視窗的问题 ([#5326](https://github.com/nocobase/nocobase/pull/5326)) by @zhangzhonghe

## [v1.3.25-beta](https://github.com/nocobase/nocobase/compare/v1.3.24-beta...v1.3.25-beta) - 2024-09-25

### 🚀 最佳化

- **[client]** 增加日语本機化翻译 ([#5292](https://github.com/nocobase/nocobase/pull/5292)) by @Albert-mah

- **[工作流]** 增加对未註冊的节点類型导致錯誤的追蹤报错 ([#5319](https://github.com/nocobase/nocobase/pull/5319)) by @mytharcher

### 🐛 修復

- **[client]** 修復變數中沒有顯示完整欄位的问题 ([#5310](https://github.com/nocobase/nocobase/pull/5310)) by @zhangzhonghe

- **[工作流]** 修復資料表事件中发生改变的欄位被刪除后报错的问题 ([#5318](https://github.com/nocobase/nocobase/pull/5318)) by @mytharcher

- **[操作：匯出記錄]** 修復匯出操作時，关联表中的欄位未執行interface渲染邏輯 ([#5296](https://github.com/nocobase/nocobase/pull/5296)) by @gchust

## [v1.3.24-beta](https://github.com/nocobase/nocobase/compare/v1.3.23-beta...v1.3.24-beta) - 2024-09-23

### 🐛 修復

- **[client]**
  - markdown 的handlebars 模板使用#each 渲染陣列資料時資料沒有正常顯示 ([#5305](https://github.com/nocobase/nocobase/pull/5305)) by @katherinehhh

  - 外部資料程式庫資料源表格列头不支持排序的问题 ([#5293](https://github.com/nocobase/nocobase/pull/5293)) by @katherinehhh

- **[資料可视化]** 修復圖表区块在暗黑主題下的樣式问题 ([#5302](https://github.com/nocobase/nocobase/pull/5302)) by @2013xile

## [v1.3.23-beta](https://github.com/nocobase/nocobase/compare/v1.3.22-beta...v1.3.23-beta) - 2024-09-19

### 🚀 最佳化

- **[使用者]** 最佳化使用者管理表格的渲染速度 ([#5276](https://github.com/nocobase/nocobase/pull/5276)) by @2013xile

- **[部門]** 最佳化部門管理中的使用者表格的渲染速度 by @2013xile

### 🐛 修復

- **[client]**
  - 修復使用者和權限設定頁面中`通用操作權限表格`的`rowKey`不正確问题 ([#5287](https://github.com/nocobase/nocobase/pull/5287)) by @gchust

  - 修復在篩選表单中，为日期欄位設定日期變數后，导致的篩選结果不正確的问题 ([#5257](https://github.com/nocobase/nocobase/pull/5257)) by @zhangzhonghe

  - 表格沒有資料時且設定了区块高度時無法設定列宽 ([#5256](https://github.com/nocobase/nocobase/pull/5256)) by @katherinehhh

  - 修復表格区块在一開始出现空白行的问题 ([#5284](https://github.com/nocobase/nocobase/pull/5284)) by @zhangzhonghe

- **[create-nocobase-app]** 修復在新增自動編碼欄位時，配置編碼規則的彈出視窗缺少提交按钮的问题 ([#5281](https://github.com/nocobase/nocobase/pull/5281)) by @zhangzhonghe

- **[database]** 匯入支持勾选欄位 ([#4992](https://github.com/nocobase/nocobase/pull/4992)) by @chareice

- **[evaluators]** 修復 Math.js 計算输出矩阵類型导致的问题 ([#5270](https://github.com/nocobase/nocobase/pull/5270)) by @mytharcher

- **[日历]** 刪除日程彈出視窗選項不能選擇 ([#5274](https://github.com/nocobase/nocobase/pull/5274)) by @katherinehhh

- **[操作：匯出記錄]** 修復在匯出操作中，生成資料表格時，缺少上下文的问题 ([#5286](https://github.com/nocobase/nocobase/pull/5286)) by @gchust

## [v1.3.22-beta](https://github.com/nocobase/nocobase/compare/v1.3.21-beta...v1.3.22-beta) - 2024-09-12

### 🎉 新特性

- **[操作：自訂請求]** 自訂請求按钮的配置中，支持使用 API token 變數 ([#5263](https://github.com/nocobase/nocobase/pull/5263)) by @zhangzhonghe
参考檔案：[自訂請求-變數](https://docs-cn.nocobase.com/handbook/action-custom-request#%E5%8F%98%E9%87%8F)
### 🚀 最佳化

- **[資料表欄位：Markdown(Vditor)]** 在外部資料源中选欄位 UI 的時支持 Vidtor ([#5246](https://github.com/nocobase/nocobase/pull/5246)) by @katherinehhh

### 🐛 修復

- **[日历]** 日历区块結束日期跨月時無法正確顯示的问题 ([#5239](https://github.com/nocobase/nocobase/pull/5239)) by @katherinehhh

## [v1.3.21-beta](https://github.com/nocobase/nocobase/compare/v1.3.20-beta...v1.3.21-beta) - 2024-09-10

### 🐛 修復

- **[client]** 修復在使用联动規則時报错的问题（通過 create-nocobase-app 安裝的 NocoBase） ([#5249](https://github.com/nocobase/nocobase/pull/5249)) by @zhangzhonghe

## [v1.3.20-beta](https://github.com/nocobase/nocobase/compare/v1.3.19-beta...v1.3.20-beta) - 2024-09-10

### 🚀 最佳化

- **[client]** 資料区块中支持顯示更深层级的关系欄位 ([#5243](https://github.com/nocobase/nocobase/pull/5243)) by @zhangzhonghe

### 🐛 修復

- **[client]**
  - 修改選單標題時沒有实時生效 ([#5207](https://github.com/nocobase/nocobase/pull/5207)) by @katherinehhh

  - 支持 Handlebars 模板中关系欄位的预載入 ([#5236](https://github.com/nocobase/nocobase/pull/5236)) by @katherinehhh

- **[資料可视化]** 修復存在多个資料源時，圖表的資料源上下文不正確的问题 ([#5237](https://github.com/nocobase/nocobase/pull/5237)) by @2013xile

## [v1.3.19-beta](https://github.com/nocobase/nocobase/compare/v1.3.18-beta...v1.3.19-beta) - 2024-09-08

### 🐛 修復

- **[client]** 修復因彈出視窗与 Link 按钮一起使用，所导致的 URL 例外的问题 ([#5219](https://github.com/nocobase/nocobase/pull/5219)) by @zhangzhonghe

## [v1.3.18-beta](https://github.com/nocobase/nocobase/compare/v1.3.17-beta...v1.3.18-beta) - 2024-09-08

### 🐛 修復

- **[資料表欄位：多对多 (陣列)]** 修復刪除套件含多对多（陣列）欄位的資料表時出现的錯誤 ([#5231](https://github.com/nocobase/nocobase/pull/5231)) by @2013xile

## [v1.3.17-beta](https://github.com/nocobase/nocobase/compare/v1.3.16-beta...v1.3.17-beta) - 2024-09-07

### 🎉 新特性

- **[client]** 支持在子表单和子表格中配置联动規則。 ([#5159](https://github.com/nocobase/nocobase/pull/5159)) by @zhangzhonghe

### 🚀 最佳化

- **[client]**
  - 顯示時间時預設時间为 00:00:00 ([#5226](https://github.com/nocobase/nocobase/pull/5226)) by @chenos

  - 外掛依赖版本不一致時也可以啟用外掛 ([#5225](https://github.com/nocobase/nocobase/pull/5225)) by @chenos

- **[server]** 提供更友好的應用级錯誤提示 ([#5220](https://github.com/nocobase/nocobase/pull/5220)) by @chenos

### 🐛 修復

- **[client]** 修復在詳情区块中出现的 “Maximum call stack size exceeded” 錯誤 ([#5228](https://github.com/nocobase/nocobase/pull/5228)) by @zhangzhonghe

- **[資料表欄位：多对多 (陣列)]** 修復将 `uid` 類型的欄位設定为多对多（陣列）欄位的目标鍵時出现的报错 ([#5229](https://github.com/nocobase/nocobase/pull/5229)) by @2013xile

- **[UI schema 儲存服務]** 修復 member 角色點擊按钮报無權限的问题 ([#5206](https://github.com/nocobase/nocobase/pull/5206)) by @zhangzhonghe

- **[工作流]** 修復建立工作流后類型列展示錯誤文字的问题 ([#5222](https://github.com/nocobase/nocobase/pull/5222)) by @mytharcher

- **[使用者]** 移除在使用者管理中編輯使用者资料時的手機号格式驗證 ([#5221](https://github.com/nocobase/nocobase/pull/5221)) by @2013xile

## [v1.3.16-beta](https://github.com/nocobase/nocobase/compare/v1.3.15-beta...v1.3.16-beta) - 2024-09-06

### 🚀 最佳化

- **[client]**
  - 有UI配置權限但沒有資料表檢視權限時新增占位 ([#5208](https://github.com/nocobase/nocobase/pull/5208)) by @katherinehhh

  - 当缺少 logo 時，顯示系統標題。 ([#5175](https://github.com/nocobase/nocobase/pull/5175)) by @maoyutofu

- **[使用者認證]** 系統標題支持换行 ([#5211](https://github.com/nocobase/nocobase/pull/5211)) by @chenos

- **[工作流：SQL 节点]** 将 SQL 操作节点的结果資料结构調整为仅套件含資料部分。 ([#5189](https://github.com/nocobase/nocobase/pull/5189)) by @mytharcher
Reference: [SQL 操作](https://docs-cn.nocobase.com/handbook/workflow/nodes/sql)
- **[權限控制]** 使 `Users & Permissions` 配置页的 `Permissions` Tab 面板可擴充。 ([#5216](https://github.com/nocobase/nocobase/pull/5216)) by @zhangzhonghe
Reference: [开发指南](https://docs-cn.nocobase.com/handbook/acl#%E5%BC%80%E5%8F%91%E6%8C%87%E5%8D%97)
- **[操作：批量編輯]** 批量更新、批量編輯的 文案 ，“所有” 改成 “全表” ([#5200](https://github.com/nocobase/nocobase/pull/5200)) by @katherinehhh

### 🐛 修復

- **[client]**
  - 修復联动規則中切换赋值類型時元件顯示錯誤 ([#5180](https://github.com/nocobase/nocobase/pull/5180)) by @katherinehhh

  - 修復資料範圍中使用變數报错的问题。 ([#5195](https://github.com/nocobase/nocobase/pull/5195)) by @zhangzhonghe

  - 自訂請求按钮的請求后重新整理資料設定不生效 ([#5188](https://github.com/nocobase/nocobase/pull/5188)) by @katherinehhh

- **[資料可视化]** 修復彙總選項欄位時，获取结果不正確的问题 ([#5214](https://github.com/nocobase/nocobase/pull/5214)) by @2013xile

- **[資料源管理]** 修復`使用者和權限`設定頁面中資料源表格`rowKey`不正確问题 ([#5215](https://github.com/nocobase/nocobase/pull/5215)) by @gchust

- **[工作流：HTTP 請求节点]** 修復請求节点參數使用非字元串變數時的问题。 ([#5204](https://github.com/nocobase/nocobase/pull/5204)) by @mytharcher

- **[資料表欄位：公式]** 修復公式欄位時间類型測試用例 ([#5197](https://github.com/nocobase/nocobase/pull/5197)) by @katherinehhh

- **[應用的備份与还原（废弃）]** 修復測試用例报错 ([#5201](https://github.com/nocobase/nocobase/pull/5201)) by @chenos

- **[資料源：REST API]**
  - rest api 資料表 識別不可編輯 by @katherinehhh

  - Rest api  多语言調整 by @katherinehhh

## [v1.3.15-beta](https://github.com/nocobase/nocobase/compare/v1.3.14-beta...v1.3.15-beta) - 2024-09-04

### 🐛 修復

- **[工作流]** 修復工作流變數中缺少部分欄位可選的问题。 ([#5187](https://github.com/nocobase/nocobase/pull/5187)) by @mytharcher

- **[資料表欄位：Markdown(Vditor)]** 修復  markdown(Vditor) 欄位沒有正確显資料（快取） ([#5176](https://github.com/nocobase/nocobase/pull/5176)) by @katherinehhh

## [v1.3.14-beta](https://github.com/nocobase/nocobase/compare/v1.3.13-beta...v1.3.14-beta) - 2024-09-03

### 🎉 新特性

- **[client]** 支持在篩選表单中配置对多关系目标表中的欄位。 ([#5178](https://github.com/nocobase/nocobase/pull/5178)) by @zhangzhonghe

### 🚀 最佳化

- **[操作：自訂請求]** 去掉新增資料表单自訂請求按钮的联动規則 ([#5179](https://github.com/nocobase/nocobase/pull/5179)) by @katherinehhh

### 🐛 修復

- **[資料表欄位：公式]** 公式欄位使用日期欄位時頁面报错 ([#5168](https://github.com/nocobase/nocobase/pull/5168)) by @katherinehhh

## [v1.3.13-beta](https://github.com/nocobase/nocobase/compare/v1.3.12-beta...v1.3.13-beta) - 2024-09-03

### 🐛 修復

- **[操作：匯出記錄]** 修復匯出关系資料不正確的问题 ([#5170](https://github.com/nocobase/nocobase/pull/5170)) by @chareice
