# README

本目錄下存放供參與者使用和參考的各類腳本，包括 shell 腳本，GNU make 腳本等多種。

* [README.md](README.md)：本文件。
* [Makefile](Makefile)：指向本倉庫根目錄下的 Makefile，用於維護
    本倉庫。
* [open-firewall](open-firewall)：設置 Linux 系統防火牆的 bash
    腳本，把 Linux 系統中所有的防火牆規則和用戶建立的鏈 (chain) 全部清空，使該
    系統對互聯網不設防。

    本腳本主要用於調試互聯網（例如，本目錄下的
    [single-vm-firewall](members/scripts/single-vm-firewall)
    就會首先調用本腳本），**單獨使用是非常危險的！**
* [single-vm-firewall](single-vm-firewall)：設置 Linux 系統
    防火牆的 bash 腳本，主要用戶虛擬機（如[《如何建立和配置安全的工作環境
    (II)》](members/HOWTOs/single-vm.md)中所描述的那樣），也可以用於任何 Linux
    主機。防火牆規則概覽：
    * 只放行對特定域名服務器的訪問；
    * 對網關只放行翻牆軟件的偵聽端口；
    * 對迴繞設備 `lo` 的 IPv4 地址 `127.0.0.1` 完全開放；
    * 由以上訪問引發的數據包予以放行。
