# [使用 TeX 代碼編制數學公式時的注意事項](https://github.com/rebuild-roc/main/blob/master/members/HOWTOs/math.md)

[戡亂復國](mailto:rebld-roc@protonmail.com)

<br />
<br />

如果要在文章中用到數學公式，不建議使用 MathML 代碼，原因有二：
* 所得到的數學公式不美觀；
* 代碼冗長，不容易記，易讀性差，不容易排除排版錯誤。

而 TeX/LaTeX 編制數學公式的特點正好與以上兩點相反。

[GitHub](https://github.com) 對 TeX 數學公式代碼的支持是通過
[MathJax](https://mathjax.org) 來實現的，而 [GitLab](https://gitlab.com)
以及基於 GitLab 技術的各個源代碼託管網站則是利用
[KaTeX](https://katex.org) 來實現對 TeX 數學公式的支持，我們的備用網站
<http://git.idk.i2p> （以下簡稱之爲 idk）就是基於 GitLab 技術而運行的。
以下三類參與者可以不必關注本文：
* 不使用 idk （或其他基於 GitLab 技術的代碼託管網站）託管項目的；
* 不使用數學公式的；
* 把 GitHub 上的倉庫和 idk （或其他基於 GitLab 技術的代碼託管網站）上的倉庫
   (repository) 對應於不同的本地倉庫者。



## 本地倉庫的配置

如果以上三個條件都違反了，也就是說，以下三個條件同時成立：
* 使用 idk （或其他基於 GitLab 技術的代碼託管網站）託管項目；
* 在上述託管項目的文檔中使用數學公式；
* 把 GitHub 上的倉庫和 idk （或其他基於 GitLab 技術的代碼託管網站）上的倉庫
   (repository) 對應於同一個本地倉庫，

則可以借鑑以下方法配置本地倉庫。

假設我們在本地倉庫中把 GitHub 上的對應倉庫命名爲 `github`,
把 idk 上的對應倉庫命名爲 `idk`, 那麼， `github` 中的某個分支 `bbb`
（例如 `master` 或 `draft` 或 `devel` 之類的分支名稱）
對應於您的本地倉庫中的分支 `bbb`,
而 `idk` 上的分支 `bbb` （和 `github` 中的分支 `bbb`
對應，只是在公式的代碼上有所區別）對應於您本地倉庫中的分支 `idk-bbb`.
在上述情景下，您本地倉庫的文件 `.git/config` 中應當有如下幾塊內容：

一是關於 `github` 的
```
[remote "github"]
        url = https://github.com/xxx/yyy.git
        fetch = +refs/heads/*:refs/remotes/github/*
        tagopt = --tags
```
其中 `xxx` 是您在 GitHub 上的用戶名，而 `yyy` 則是 `github` 所對應的倉庫名。

二是關於 `idk` 的
```
[remote "idk"]
        url = http://git.idk.i2p/xxx/yyy
        fetch = +refs/heads/idk-*:refs/remotes/idk/*
        tagOpt = --tags
        proxy = http://10.0.2.2:4444
```
其中 `xxx` 是您在 <http://git.idk.i2p> 上的用戶名，而 `yyy` 則是
`idk` 所對應的倉庫名。

三是關於本地分支 `ghb-bbb` 的
```
[branch "ghb-bbb"]
        remote = github
        merge = refs/heads/bbb
```
以及關於本地分支 `idk-bbb` 的
```
[branch "idk-bbb"]
        remote = idk
        merge = refs/heads/bbb
```

四是關於本地倉庫上傳時的行爲的
```
[push]
        default = upstream
```

需要注意：
* 以上幾塊代碼相互之間的次序不重要，也不一定是相互緊鄰的；
* 每一個代碼塊中縮進的行都是用製表符（`Tab`）縮進的。



## GitHub 和 GitLab 對 TeX 數學公式代碼的不同要求

可以分別參考

<https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions>

和

<https://docs.gitlab.com/ee/user/markdown.html#math>

以及其中的鏈接。
至於如何用 TeX/LaTeX 排版數學公式，現在有大量的資料可以查閱。
如果手頭上沒有現成的，可以到網上搜索一些簡介文章速成，或者到
<https://tug.org> 上尋找合適的文檔系統地學習。
**僅就排版數學公式而言，速成即可。**
