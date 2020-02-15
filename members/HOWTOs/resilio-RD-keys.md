# Resilio Sync 只讀密鑰列表

只讀密鑰 | repo 名稱 | 簡單說明
---------|-----------|---------
B3MN3OQ4XOVLGOOORSRTRTOEEOAFBRAAD | [main](https://github.com/rebuild-roc/main) | 總體規劃與項目協調
BKGGWQNWXTLDDC4N4FNCO56HAOI2U2X6N | [missions](https://github.com/rebuild-roc/missions) | 江湖追殺令

## 注：

1. Resilio Sync 以前的名稱是 BitTorrent Sync，現網址為
    <https://www.resilio.com>。
    打開該網址後，在 "Products" 菜單中點擊
    "[Sync Home](https://www.resilio.com/individuals/)"，
    在刷新後的網頁中尋找適合於您的平臺的軟件版本。
2. 在 Linux 系統中不需要安裝。將其壓縮包（文件名形如
    `resilio-sync_x64.tar.gz`）下載後，用指令
    ```
    $ tar -xzvf resilio-sync_x64.tar.gz
    ```
    可以釋放出可執行文件 `rslsync`。把後者放置到一個合適的固定目錄中，在命令行
    中切換到該目錄後，執行
    ```
    $ torsocks -i ./rslsync
    ```
    即可啟動該軟件。在此提醒：**預先要運行 Tor 或
    [Tor 瀏覽器](https://www.torproject.org/download)**，這樣，上述指令就可以
    將 Resilio Sync 的網絡活動保護在 Tor 網絡中，從而可以實現匿蹤。
3. 在 Resilio Sync 運行過程中，用瀏覽器打開網址 <http://127.0.0.1:8888>
    就可以設置 Resilio Sync 了。因為我們是用 `torsocks` 啟動的，所以，在
    Resilio Sync 的設置中，將代理 (proxy) 的設置空置即可。可以選擇
    "Use UPnP port mapping"（使用 UPnP 端口映射）。其他設置不是特別重要，根據
    自己的考慮設置即可。
4. 設置好以後，就可以添加只讀密鑰下載對應的 repo 了。
