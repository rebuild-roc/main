# 參與者的 openPGP 公鑰列表

## 一、各個密鑰文件一覽表

 密鑰 ID |密鑰文件 | GitHub 用戶名 | GitLab 用戶名 | 所有人 | 密鑰所有人的 email | 用途 | 到期日 | 備註
 --------|---------|---------------|---------------|--------|--------------------|------|---------|--
 0x08807CA8 | `rebuild-roc` | [rebuild-roc](https://github.com/rebuild-roc) | [rebuild-roc](https://gitlab.com/rebuild-roc) | 戡亂復國 | rebld-roc@protonmail.com | ESC | 無限期 | 主密鑰

表格說明：
* 密鑰 ID ——統一規定為密鑰指紋中的最後八位十六進制數字，並以 `0x` 作前綴。
* 密鑰文件——本目錄下存放密鑰的文件名。如果上傳至網上各大密鑰服務器而未上傳至
  本倉庫，可填寫「網上抽取」。
* GitHub 用戶名——密鑰所有人在 GitHub 上的用戶名。
* GitLab 用戶名——密鑰所有人在 GitLab 上的用戶名。
* 所有人——填寫密鑰所有人的的代號。如果在 GitHub 和 GitLab 上有不同的代號，以自己
  寫文章署名常用的代號為準。
* 用途——E 表示用於加密, S 表示用於簽署, C 表示用於認證。
* 到期日——該密鑰有效期的截止日，用 YYYY-MM-DD 格式。所有人可以在到期日前延續
  有效期，延續後需要重新輸出公鑰並上傳到本目錄。過期密鑰存放於密鑰服務器的，
  在延期後也需要重新上傳至密鑰服務器。原則上，關於密鑰的任何變動都應該遵循這個
  辦法。
* 備註——需要註明的事項。以下是幾個約定說法：
  * 「主密鑰」是說該密鑰是該所有者的最根本的密鑰，是鑑定其所有人的身份的終極
    憑證，該所有者名下的其他密鑰都要用主密鑰簽署才有效。如果一個用戶只上傳了
    一個密鑰，則該唯一密鑰被默認為主密鑰，而且用於一切需要 openPGP 密鑰的地方。
    主密鑰必須具備簽署功能。
  * 「通信用」是說，給密鑰所有人發送加密 email 時，需要用該密鑰。必須具備加密
    功能。
  * 「git」是用於在 git 中簽署的密鑰。
  * 「私密」是用於成員之間的特殊目的，不對外透露，只與相關成員互相約定。


## 二、各個密鑰的指紋一覽表

 密鑰 ID | 所有者 | 指紋
---------|--------|------
`0x08807CA8` | 戡亂復國 | 2403 FA48 4591 84CB AC3B  1933 5497 5410 0880 7CA8

查看密鑰指紋的辦法就是執行下述命令（其中的 `$` 是命令行提示符，不需要輸入）：
```
     $  gpg --fingerprint 0x08807CA8
```
其中 `0x08807CA8` 就是待查看的密鑰的 ID 的一個示例。以此密鑰為例，上述命令返回
```
pub   rsa4096 2020-01-22 [SC]
      2403 FA48 4591 84CB AC3B  1933 5497 5410 0880 7CA8
uid           [ultimate] to Rebuild ROC (戡亂復國) <rebld-roc@protonmail.com>
uid           [ultimate] Rebuilding ROC (戡亂復國) <rebld-roc@protonmail.com>
sub   rsa4096 2020-01-22 [E]

```
其中第二行顯示的就是該密鑰的指紋。



## 三、輸出公鑰的方法

以 Rebuilding ROC (戡亂復國) 為例，在其工作平臺上執行
```
$ gpg --armor -o rebuild-roc --export 0x08807CA8
```
即可輸出其公鑰 `0x08807CA8` 至文件 `rebuild-roc` 中。在上述指令中，選項
`--armor` 要求輸出的數據都是字符形式的。


## 四、常用的 openPGP 密鑰服務器

因為 GitHub 和 GitLab 都有可能會因為中共當局的壓力而關閉參與者的賬號，所以，建議
每一個參與者把自己的 openPGP 公開密鑰置於本目錄的同時，還要把這些公開密鑰上傳到
互聯網上的各個 openPGP 密鑰服務器。

**無論是把自己的 openPGP 公開密鑰傳送到密鑰服務器上，還是反過來從密鑰服務器上
索取別人的 openPGP 公開密鑰，都不要使用 `gpg` 聯網操作，**
因為稍有不慎就有可能暴露自己的蹤跡，被中共當局找上門來。**安全的方法是通過
[Tor 瀏覽器](https://www.torproject.org)連接密鑰服務器的網頁，通過網頁進行
上傳或下載密鑰的操作。**

我們這裡列一些密鑰服務器的網址。雖然不夠全面，也不可能全面，但是，大多數公開密鑰
服務器之間會互通有無，所以我們這裡列出的服務器（來源：[維基百科
英文版](https://en.wikipedia.org/wiki/Key_server_(cryptographic))）基本上夠用。
當我們需要散播自己的 openPGP 公開密鑰時，只要上傳到這裡所列的服務器就夠了。
* https://keys.openpgp.org/
* https://pgp.mit.edu/
* https://keyring.debian.org/  (?)
* https://keyserver.ubuntu.com/
* https://zimmermann.mayfirst.org/


## 五、怎樣把別人的 openPGP 公開密鑰導入自己的密鑰環

**在操作之前，請仔細閱讀第四節的第二段！**

假設要導入的公開密鑰保存在文件 `pubkey_file` 中，要把它導入自己的公開密鑰環，則
執行指令
```
$ gpg --import pubkey_file

```

基於第四節所說的安全理由，千萬不要使用 `gpg --recv-keys` 這個指令，因為它會
聯網搜索和下載公開密鑰，而這有可能被中共當局抓到線索。
