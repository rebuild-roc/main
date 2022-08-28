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
* 不同時使用 idk （或其他基於 GitLab 技術的代碼託管網站）和 GitHub
   兩個網站託管項目的（兩網站的項目有相同的內容）；
* 不使用數學公式的；
* 把 GitHub 上的倉庫和 idk （或其他基於 GitLab 技術的代碼託管網站）上的倉庫
   (repository) 對應於不同的本地倉庫者。



## 本地倉庫的配置

如果以上三個條件都違反了，也就是說，以下三個條件同時成立：
* 同時使用 idk （或其他基於 GitLab 技術的代碼託管網站）和 GitHub
   兩個網站託管相同內容的項目；
* 在上述託管項目的文檔中使用數學公式；
* 把 GitHub 上的倉庫和 idk （或其他基於 GitLab 技術的代碼託管網站）上的倉庫
   (repository) 對應於同一個本地倉庫，

則可以借鑑以下方法配置本地倉庫。

假設我們在本地倉庫中把 GitHub 上的對應倉庫命名爲 `github` ，
把 idk 上的對應倉庫命名爲 `idk` ，那麼， `github` 中的某個分支 `bbb`
（例如 `master` 或 `draft` 或 `devel` 之類的分支名稱）
對應於您的本地倉庫中的分支 `ghb-bbb` ，
而 `idk` 上的分支 `bbb` （和 `github` 中的分支 `bbb`
對應，只是在公式的代碼上有所區別）對應於您本地倉庫中的分支 `idk-bbb` 。
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
        fetch = +refs/heads/*:refs/remotes/idk/*
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
* 以上幾塊配置代碼相互之間的次序不重要，可以但也不一定是相互緊鄰的；
* 每一個代碼塊中縮進的行都是用製表符（`Tab`）縮進的。



## 分支的維護策略

假設本地倉庫中的分支 `ghb-bbb` 和 `idk-bbb` 如上一節所述，假設到了 commit
`A` 這兩個分支還是一致的（也就是沒有出現數學公式），而且分支 `ghb-bbb` 和
`idk-bbb` 這兩個分支同時指向 commit `A`，如下圖所示：
```

---A    ghb-bbb  idk-bbb

```
**注：** 類似於上圖的分支圖可以通過命令行
```
$ git log --oneline --graph --all -decorate --date-oder
```
得到，只是在繪製時我們把上述命令的輸出橫着畫，並有所簡化而已。
在命令行代碼中，起始的符號 “`$`”
為命令提示符，由操作系統給出而且其具體形式變化萬千，用戶不需要從鍵盤輸入。
當我們給出一個命令行時，用戶從提示符後面的第一個非空白字符開始輸入，
直到輸入完畢後，再按下回車鍵 (Return 或 Enter 鍵) 即可。

接下來我們打算編輯其中某個文件，使之含有數學公式。
這就意味着 `ghb-bbb` 和 `idk-bbb` 將要出現分岔。
在以下示例中，我們使用了第三個分支 `topic`。原則上可以直接對分支 `idk-bbb`
進行變化，然後合併到 `ghb-bbb` 中，再對其中新增的數學表達式作相應的修改。
在這種做法中，只要把下面示例中的分支 `topic` 等同為 `idk-bbb` 即可，
不過我們不推薦直接在分支 `idk-bbb` 中進行修改這種做法（尤其是 `idk-bbb`
為 `idk-master` 或 `idk-draft` 這類主要分支時）。
使用第三個分支 `topic` 的做法如下。

1. 我們先找第三個分支，假設它叫 `topic`。這裡有兩種選擇：第一種是本來就存在
   `topic` 這個分支，那麼我們用命令行
   ```
   $ git checkout topic
   $ git merge idk-bbb
   ```
   切換到這個分支並且已經合併了 `idk-bbb` 這個分支；另一種選擇是本來不存在
   `topic` 這個分支，那麼我們在 `idk-bbb` 這個分支（現在它指向 commit `A`）
   中用命令行
   ```
   $ git checkout -b topic
   ```
   創建並切換到 `topic` 這個新的分支。不管以上哪種選擇，現在的狀況是
   ```

   ---A    ghb-bbb  idk-bbb  topic <- HEAD

   ```
   或者
   ```

   -----B    topic <- HEAD
       /
   ---A      ghb-bbb  idk-bbb

   ```
   其中後一種情況出現在 `topic` 為舊有分支而且不能直接推進到 `idk-bbb` 的情形。
2. 在分支 `topic` （現在指向 commit `B`）中編輯應該出現數學表達式的文件，
   數學表達式的編輯要按照 GitLab 的要求去做（見下一節所給參考文獻，
   因爲排版問題，我們不便於在這裏展示具體例子）。
   編輯完成後提交，使分支 `topic` 指向 commit `C`，如下圖所示：
   ```

   -----B--C    topic <- HEAD
       /
   ---A         ghb-bbb  idk-bbb

   ```
3. 為了清晰和便於日後維護，我們用
   ```
   $ git checkout idk-bbb
   $ git merge --no-ff topic
   $ git checkout ghb-bbb
   $ git merge topic
   ```
   把 commit `C` 合併到分支 `idk-bbb` 和 `ghb-bbb` 中，其結果如下：
   ```

   -----B--C        topic  ghb-bbb <- HEAD
       /    \
   ---A------C'     idk-bbb

   ```
4. 接下來，我們要按照 GitHub 的要求編輯數學表達式。如上圖所示，我們現在處於
   `ghb-bbb` 這個分支中，所以直接編輯步驟 2 中所編輯的那些文件，把其中類似於
   ```
   $`a+b=c`$
   ```
   這樣的表達式改為
   ```
   $a+b=c$
   ```
   把類似於
   ```
   ```math
   E=m c^2
   \```
   ```
   這樣的表達式（上述代碼中最後一行起始的“`\`”不應當存在，這是為了避免 Markdown
   系統識別混亂而特意加上去的）相應地改為
   ```
   $$E=m c^2$$
   ```
   修改完成後，用
   ```
   $ git commit -a
   ```
   提交，結果如下圖所示：
   ```
             --C"      ghb-bbb <- HEAD
            /
   -----B--C           topic
       /    \
   ---A------C'        idk-bbb

   ```
5. 以後再編輯文件時，我們先切換回分支 `topic`，如果有數學表達式則按照 GitLab
   的要求去做，假設多次提交之後的結果如下圖所示：
   ```
             --C"                 ghb-bbb
            /
   -----B--C-----D--- ... ---E    topic <- HEAD
       /    \
   ---A------C'                   idk-bbb

   ```
   之後，用
   ```
   $ git checkout idk-bbb
   $ git merge idk-bbb
   $ git checkout ghb-bbb
   $ git merge topic
   ```
   分別合併到分支 `idk-bbb` 和 `ghb-bbb` 中。
   如果合併過程沒有導致衝突 (conflicts)，則結果如下：
   ```
             --C"-----------------E"   ghb-bbb <- HEAD
            /                 /
   -----B--C-----D--- ... ---E         topic
       /    \                 \
   ---A------C'----------------E'      idk-bbb

   ```
   若有衝突，則處理完衝突之後再提交，其結果仍然如上圖所示。
6. 如果在步驟 5 中 commits `D` 到 `E` 之間沒有新的數學表達式產生，
   則以上結果就可以了；否則就要在分支 `ghb-bbb` 中對新增加的數學表達式按照
   GitHub 的要求進行修改（可以參考步驟 4 中的例子），修改完成後提交，
   其結果如下：
   ```
             --C"-----------------E"---F      ghb-bbb <- HEAD
            /                 /
   -----B--C-----D--- ... ---E                topic
       /    \                 \
   ---A------C'----------------E'             idk-bbb

   ```
7. 若有必要，則用下述命令推送到 GitHub 和 `idk` 的遠端倉庫中：
   ```
   $ make push
   ```
   其中要用到本倉庫中的腳本 `Makefile`。
   當然，這一步也可以暫時不做，留待後續版本出現後再一起推送。
8. 以後再有版本變化可參考上述步驟 5 到 7 的過程。



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
