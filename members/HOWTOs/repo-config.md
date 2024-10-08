# 如何創建和配置自己的本地及遠端 Repo

[戡亂復國](mailto:rebld-roc@protonmail.com)

**內容提要：**
本文主要介紹如何通過自己的本地主機在 [GitHub](https://github.com) 和/或
[GitLab](https://gitlab.com) 上創建和管理 repo。

## 一、名詞解釋：repo

本節是為不熟悉版本控制系統（特別是 [git](https://git-scm.com/)）的用戶寫的，熟悉
的用戶可以略過。

我們所說的 repo，是 repository 的縮略語，字面意思是「倉庫」，或者再準確點，為
「源代碼倉庫」或「源文件倉庫」。這是版本控制軟件 [git](https://git-scm.com/)
所用的一個術語，指的是該軟件所管理的一個獨立單元，該單元表現為一個目錄
(directory，在 Windows 系統中叫做文件夾，folder）——以下假設該目錄的名稱為
`my_src`， 在它裡面有一系列的文件和子目錄，構成一個完整的源代碼樹（source tree,
或者叫源文件樹），樹的頂端就是目錄 `my_src`。（「樹」是數學以及計算機科學中的
一個概念，有一點不同於我們日常生活中的樹，它是倒置的，根在上方，枝葉向下生長。）
目錄 `my_src` 有一個隱藏的子目錄
`.git`，這就是 git 用以控制和管理整個源代碼樹 `my_src` 的信息中心。在整個源文件
樹 `my_src` 中， `.git` 以外的區域由用戶控制，由 git 管理並參與控制；而 `.git`
這個子目錄則由 git 來控制和管理。這就是一個 repo 的結構，我們通常就用這個結構的
頂端目錄（在本例中就是目錄 `my_src`）來指代整個 repo。

我們可以把一個 repo 比喻為一個平行宇宙，這個平行宇宙中的各個分支有一個共同的
起源——一無所有的空宇宙，然後就分解為一系列的分支 (branch)，每一個分支都有自己的
歷史，都可以獨立地發展和變化，但是也可以彼此之間相互合併 (merge)，也可以從某個
已經存在的分支產生新的分支，還可以把某個分支移植/嫁接 (rebase) 到另一個分支上，
等等。用戶每次只能工作於一個特定的分支上，對其中的文件進行修改、創建、刪除、更名
等操作。當操作進行到一定階段，用戶可以向 repo 提交 (commit)，這就像一個人在成長
過程中留下一張全息照片一樣，以後用戶可以切換回提交過的狀態（沒有被提交的操作不能
復原）。用戶還可以刪除某個分支。一個分支一旦被刪除，其中未被合併到其他分支的那些提交就會消失，再也不能復原。

以上描述的是 git 的版本控制的一些核心功能。git 還能與遠程另一個倉庫互動，這就
構成了一個分布式的版本控制系統，其中部分操作正是下面我們要介紹的。

**由於 git 能夠構成一個分布式版本控制系統，互聯網用戶相互協作就變得很容易；
而且，除非中共把所有用戶一一找到並把他們的倉庫都刪除，否則，這些倉庫所含內容
隨時可以蔓延到全世界。**
也就是說，中共想在互聯網上刪帖、焚書，git 會讓它難以得逞。這是我們要使用 git
的原因。而 [GitHub](https://github.com) 和 [GitLab](https://gitlab.com) 相當於是
兩個信息集散中心，提供場所讓需要協作的用戶可以彼此找到、相互交換信息；同時也是
展示中心，讓更多的不參與協作的用戶可以瀏覽或使用我們的勞動成果。

## 二、創建 repo 前的準備工作

鑑於我們所從事的工作的危險性，在創建一個 repo （無論是本地的還是網上的）之前，
必須具備以下條件——

第一，必須搭建好自己的**工作環境**。這個工作環境的主要功能有三個：
1. 從事[平亂行動](../../principles/outline.md)所需要的具體工作，例如撰寫文章或
  編制軟件源代碼、管理這些文章或源代碼（也就是 repo）、與
  [GitHub](https://github.com)
  和/或 [GitLab](https://gitlab.com) 上的對應 repo 交換數據、通過 GitHub 和/或
  GitLab 與其他參與者協同工作，等等；
2. 在從事上述工作的過程中，我們的工作環境還負責隱藏我們的網址，讓中共難以追查；
3. 在不從事上述工作時，隱藏我們的工作成果和活動痕跡，使得中共當局即使上門搜查
  也難以獲得直接證據（中共當局使用酷刑或者威脅親屬則另當別論）。

參照[編程隨想](https://program-think.blogspot.com)的經驗和指導，我設計了兩種
工作環境供大家參考，分別在[《如何建立和配置安全的工作環境 (I)》](vm-sys.md)
和[《如何建立和配置安全的工作環境 (II)》](single-vm.md)中加以介紹。

能夠實現上述第 1 項和第 3 項功能的那臺計算機（可以是實體計算機，也可以是虛擬機）
叫做**工作平臺**，它是我們所說的工作環境的一個組成部分。下面所說的全部操作都要在
這個工作平臺中進行。

第二，在工作平臺中利用 [Tor 瀏覽器](https://www.torproject.org/download)或者
[I2P](https://geti2p.net) 註冊一個 email 賬號。需要注意以下幾點：
1. Email 服務商不在中共控制之下，而且不要求您向它提供電話號碼，更不要求提供
  支付賬號；
2. Email 服務商提供 Web 服務（也就是，用戶可以通過瀏覽器管理和發送 email，而不是
  通過 email 客戶端軟件），而且對 Tor 瀏覽器或者 I2P 要寬容，同時還要支持 HTTPS
  或同等功能的端到端通訊加密（這一條現在基本都滿足）；
3. Email 服務商最好能夠將用戶留存在服務器上的信件加密保存。

只要滿足前兩個條件就已經可以接受了，而且前兩個條件也是我們選擇 email 服務商的
必要條件。我個人推薦兩個 email 服務商，歡迎大家繼續推薦其他的：
* 第一家是 <https://ctemplar.com>，它滿足上述三個條件；
* 第二家是匿蹤軟件 [I2P](https://geti2p.net) 所提供的內建的 email 信箱，它也
  滿足上述三個條件（但是不需要用到 Tor），而且它絕對不會受到中共的脅迫而關閉
  用戶賬號或者交出用戶數據——因為它是一個分布式的軟件，不存在運營商，也沒有人
  知道用戶的信件存儲在何處。它的缺點是，接收 I2P 網絡以外的 email 比較慢，而且
  容量很小，此外，其收發郵件的界面比較簡陋，以至於偶爾做個複雜動作還需要點
  SMTP 等相關方面的專業知識。

第三，利用 Tor 瀏覽器在 [GitHub](https://github.com) 和/或
[GitLab](https://gitlab.com) 上註冊一個賬戶。在當前階段，前者是必須的，後者是
可選的。但是，沒有人知道中共會怎樣因應我們的平亂行動，也沒有人知道 GitHub
會如何回應，所以，建議大家在上述兩個網站上都註冊賬號。

在註冊過程中，需要向 GitHub 和/或 GitLab 提供 email 信箱，這是我們前面要求註冊
email 賬號的原因。另外，如果有一天平亂行動在 GitHub 和 GitLab 上都被封閉了，那
我們還可以通過 email 相互聯繫，並制定下一步的對策。

第四，參與者需要在自己的工作平臺上生成至少一套 openPGP 密鑰對（包括一個公開密鑰
和一個私人密鑰）。生成 openPGP 密鑰對的常用軟件就是
[gnupg](https://gnupg.org/)，這在各個 Linux 發行版中都是標準配備的軟件，具體操作
過程另有[專門討論](gpg.md)。在生成 openPGP 密鑰對的過程中會用到一個關聯的 email
地址，這就是前面所註冊並提交給 GitHub 的那個。生成之後，請將此密鑰對中的公開密鑰
和與之關聯的 email 地址以及 GitHub 中的用戶名一併提交到本 repo 中，具體手續
另有[專文講述](README.md)。

在平亂行動中，openPGP 密鑰對有如下用途：
1. **openPGP 密鑰對中的私人密鑰是我們認定一個參與者的唯一憑據**。一個參與者不會
  與我們面對面接觸，其代號、email 地址以及 GitHub 或 GitLab 中的賬號都可以隨時
  改變，唯一不可隨意改變的就是他/她的 openPGP 主密鑰對。（一個參與者可以生成很多
  個 openPGP 密鑰對並把這些密鑰對中的公開密鑰提交上來，要求該參與者指定一個為
  主密鑰，其他密鑰由主密鑰認證，主密鑰不可隨意更改，其他密鑰更改後只要由主密鑰
  認證即可。）
2. 參與者發布重要信息，或者需要證明一個參與者是其本人時，都需要該參與者用他/她
  事先約定好用途的 openPGP 密鑰作數位簽名。一句話，參與者所提交的 openPGP 密鑰
  就是他/她的私章，事先約定好每個密鑰的用途，需要的時候就按該約定簽署。所以，
  **參與者有責任保護好自己的每一個私人密鑰。**
3. GitHub 和 GitLab 以及 [git](https://git-scm.com/) 也都需要用戶指定自己的
  openPGP 公開密鑰。

由於前兩條約定，參與者提交給我們的 openPGP 密鑰一定會成為中共當局竭力掌握的
數據，一者可以據此指控參與者，二者可以利用所掌握的私人密鑰冒充參與者破壞整個
平亂行動。因此，這些 openPGP 密鑰只能保存在工作平臺的加密盤中。[1][2]


## 三、本地 repo 的配置和管理

我們這裡所討論的本地 repo，都是和平亂行動有關的，所以，
* 它必須和 GitHub 和/或 GitLab 上的一個 repo 對應，並與之相互交換數據。我們把
  GitHub 和/或 GitLab 上的這個對應 repo 叫做本地 repo 的**遠端 repo** (remote
  repo)；
* 本地 repo 一旦被中共當局獲得，有可能會被中共濫用為指控參與者的「罪證」，所以，
  本地 repo 必須在工作平臺中維護，而且要存儲在加密盤中。[1][2]

GitHub 和 GitLab 這類網站的主要引擎就是版本控制軟件 git，但是還有其他一些引擎。
這兩個網站的使用難度比較大（至少需要具備使用 git 的基礎），託管在它們那裡的
repo 如何管理，本文不打算討論。即便 git 這個軟件本身的使用也很複雜，所以，下面
我們沒法泛泛或者全面地討論本地 repo 的配置和管理，只能採用場景式的描述直接給出
操作指令而不做過多解釋，讀者可以藉此、並結合網上的各種教程舉一反三。

### 3.1 建立和設置一個本地 repo

假設我們所要建立的本地 repo 的目錄名為 `my_src`。這個本地 repo 是獨立存在的，
也就是說，它有沒有一個遠端 repo 都無所謂，現在這件事情不在考慮之列。

在這裡，`my_src` 可以是一個單純的目錄名，也可以是一個目錄的路徑，也就是形如
`foo/foofoo/fooo/foooo` 這個樣子的相對路徑，或者形如
`/foo/foofoo/fooo/foooo` 這個樣子的絕對路徑。

#### 3.1.1 初始化 `my_src`

如果目錄 `my_src` 不存在，我們先要用
```
$ mkdir my_src
```
創建它；如果存在，這一步就可以省略了。之後，
```
$ cd my_src
$ git init
```
初始化就完成了。

如果目錄 `my_src` 本來就存在而且裡面還有文件和/或子目錄，上述初始化手續都是
可以的。即便 `my_src` 已經被初始化過了，上述初始化手續都不會有害（但應當
避免）。

#### 3.1.2 如何知道一個目錄 `my_src` 是否被 git 初始化了？

我們這裡只談論通常的情況，一些高等的手法在此不談。

如果目錄 `my_src` 下面沒有子目錄 `.git`，那它肯定未被 git （以通常手段）初始化
為一個 repo；若有，也未必。在後一種情形下，可以如下檢驗：
```
$ cd my_src
$ git status
```
如果返回的信息說這不是一個 repo 之類的，就說明 `my_src` 沒有初始化過，或者沒有
被正確地初始化，總之不是一個合格的 repo。
可以這樣說，要證實 `my_src` 是一個合格的 repo 並不容易，但要證偽它則相對容易。


#### 3.1.3 設置 git 的忽略名單

假設本地 repo （其目錄名為 `my_src`）已經完成了初始化，方法見 3.1.1。

以下，除了絕對路徑，其他路徑都是相對於 `my_src` 的相對路徑。

每一個 repo 都有它自己的忽略名單，進入這個名單的文件將不受 git 監控。所謂「不受
監控」是說，一個文件如果被創建、被刪除、被修改，git 既不會給用戶作提示（例如用戶
使用指令 `git status` 時），也不會自動提交該文件（例如用戶使用指令
`git commit -a` 時）。

為一個 repo 設置忽略名單的方式有兩種。一種是把被忽略的文件或子目錄之名單放置在
文件 `.git/info/exclude` 中，另一種方式是把被忽略的文件或子目錄之名單放置在文件
`.gitignore` 中。這兩種方式的格式是一樣的（下面會略作講解），其差別在於，當
`my_src` 被克隆為另一個 repo 時，文件 `.gitignore` 會被當作普通文件克隆過
去（條件是該文件被提交過），而文件 `.git/info/exclude` 則不會被克隆過去。
換句話說，這兩種方式的差別表現為被克隆之後的忽略名單是否可傳遞。

因為 `.git/info/exclude` 和 `.gitignore` 的格式要求是一樣的，我們只說前者的格式
和要求。
1. `.git/info/exclude` 中的一行若以字符 `#` 開始，則該行為注釋 (comment)，即，
  這一行對 git 而言如同不存在——不能匹配任何文件或子目錄。以下所說都是非注釋行。
2. 字符 `*` 為通配符，既可以匹配文件名和目錄名中的任意多個字符，也可以匹配不到
  任何字符，例如，`*.o` 可以匹配任何以 `.o` 結尾的文件名和子目錄名，包括名為
  `.o` 的文件或子目錄。
3. 字符 `?` 為通配符，可以匹配文件名和目錄名中的一個任意字符，例如，`?*~` 可以
  匹配的文件名和目錄名必須以字符 `~` 結尾，但是它前面必須由 `?` 匹配另外一個
  字符（可以是 `~` 也可以不是 `~`），而 `*` 可以匹配任意多個字符，也可以匹配
  不到任何字符。舉例來說，`?*~` 可以匹配文件或子目錄 `b~` 和 `~~`（這兩個例子
  中，`*` 匹配不到任何字符），可以匹配文件或子目錄 `bla-foo~` 等等（此時 `?`
  匹配到 `b`，而 `*` 匹配到 `la-foo`），而名為 `~` 的文件或子目錄則不被匹配，因
  為 `?` 必須要匹配一個字符。所以，使用編輯器 vim 的朋友就應該把 `?*~` 這一行
  添加到 `.git/info/exclude` 中，因為 vim 在改寫了一個文本文件 `foo` 之後，會把
  `foo` 中的舊內容（最後一次存盤之前的內容）存放在備份文件 `foo~` 中。
4. 表達式 `[oadf]` 可以匹配 `o` 或 `a` 或 `d` 或 `f` 這些字符中的任何一個，而且
  只能匹配一個字符。當然，這種表達式的長度可以不是 4，例如，`*.[oa]`
  可以匹配後綴為 `.o` 和 `.a` 的文件或子目錄（包括名為 `.o` 或 `.a` 的文件或
  子目錄）。這對於 C 語言程序員很有用，因為，對於一個行事規範的 C 語言程序員
  來說，後綴為 `o` 和 `a` 的文件都是編譯器產生的。
5. 表達式 `[0-3]` 等同於 `[0123]`，可以匹配 `0`，`1`，`2` 和 `3` 中的任何一個
  字符（而且只能匹配一個字符），類似地，表達式 `[2-7]` 等同於 `[234567]`，等等。
  同樣道理，`[a-z]` 可以匹配任何一個（而且只能是一個）小寫的英文字母，而 `[e-q]`
  則匹配 `e` 到 `q` （按照字母順序）中的任何一個（而且只能是一個）字母。對於大寫
  字母，也有類似的規則。

6. 可以將以上規則組合成較為複雜的形式，例如 `c[0-9][0-9]` 可以匹配 `c00`，
  `c01`，……，`c99` 中的任何一個。
7. 如果一個目錄名被匹配，該目錄中的所有文件都被匹配。例如，我們把 `tmp` 寫入
  `.git/info/exclude`，則目錄 `tmp`，`foo/tmp` 以及 `foo/fooo/tmp` 等等下面的
  所有文件都被匹配。
8. 不同於 `*`，`?`，`[` 和 `]` 以及中括號中的 `-` 這些特殊字符，阿拉伯數字、大小
  寫英文字符、`+` 以及連字符 `-` 和句點 `.` 等只匹配該字符自身。對於阿拉伯數字
  和大小寫英文字母以外的字符，參看 Unix/Linux 系統（或者 POSIX）的文件命名規則。
9. 被匹配的文件不受 git 監控，但是，被提交過的文件例外。
10. 一個匹配項可以獨占一行，也可以將幾個匹配項放置在同一行中，彼此之間用空格
  隔開。

#### 3.1.4 設置用戶名和 email 以及數位簽名密鑰

仍然假設 repo 的目錄名為 `my_src`，而且已經完成了初始化。首先把工作目錄切換到
`my_src`，指令為
```
$ cd my_src
```

**在一個 repo 中，git 以用戶名標記誰作了修改、誰作了提交。**
因為平亂行動是一個團隊合作項目，會有不同的人作各種修改並提交到各自的本地 repo
中，然後以 GitHub 或 GitLab 為中介相互交換數據，最後這些修改就被散播到所有的
參與者的遠端 repo 及其本地 repo 中，所以，您必須給自己設置一個用戶名，以便大家
用以識別您。

這個用戶名可以是中文的，也可以是英文或其他語種的，可以是您的 GitHub 用戶名，也
可以是您撰寫文章的筆名，或二者的結合，等等等等。但是，因為平亂行動面臨着中共當局
的追查，這個用戶名不可以暴露您的真實身份——除非您立意實名反共。例如，以「戡亂
復國」為 repo 的用戶名，就可以這麼做：
```
$ git config user.name 戡亂復國
```
如果以 "Rebuilding ROC (戡亂復國)" 為用戶名，則執行如下指令：
```
$ git config user.name "Rebuilding ROC (戡亂復國)"
```

對於 email 設置，建議您採用提交給 GitHub 的公開的 email。以我本人為例，就這樣
設置：
```
$ git config user.email rebld-roc@protonmail.com
```
要注意：GitHub 和 GitLab 都支持多個 email 地址，而且還支持私密 email 地址（即
GitHub 或 GitLab 知道但不會公布給其他用戶的您的 email 地址）。如果您存在這種
情形，則不能把那裡的私密 email 地址用於這裡，否則在 GitHub 和/或 GitLab 中保持
私密變得沒有意義；如果您在 GitHub 和/或 GitLab 中有多個公開的 email 地址，則慎重
選擇一個用於此處。

最後，我們來設置本地 repo 所用的署名所需的 openPGP 密鑰。如果您向 repo 中提交
修改時使用該密鑰作了數位簽名，則別人可以據此確信這個修改的確是由您提交的、而不是
其他人冒名提交的。這個密鑰應當是前面第二節中所確立的一個密鑰，而且生成此密鑰時
所關聯的 email 地址與上面為 `my_src` 所設置的 email 地址一致為最好。

因為按照我們的要求[1][2]，上述密鑰和 `my_src` 都保存在工作平臺中，所以，您可以
通過指令
```
$ gpg -K
```
查找到這個密鑰。以我本人為例，上述指令會顯示出相關的信息如下：
```
sec   rsa4096 2020-01-22 [SC]
      2403FA48459184CBAC3B19335497541008807CA8
uid           [ultimate] Rebuilding ROC (戡亂復國) <rebld-roc@protonmail.com>
ssb   rsa4096 2020-01-22 [E]
```
我們就以其中第二行（即密鑰的**指紋**，fingerprint）內最右面的八個十六進制數字
`08807CA8` 為該密鑰的標識，為了明確告訴 `gpg` 只從密鑰指紋中查找，我們給它標記
上十六進制數字的標識`0x`，於是就這樣來設置 `my_src` 所使用的簽署密鑰：
```
$ git config user.signingKey 0x08807CA8
```

至此，我們查看一下 `my_src` 的設置：
```
$ git config --local --list
```
這一指令返回的結果是
```
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
user.name=Rebuilding ROC (戡亂復國)
user.email=rebld-roc@protonmail.com
user.signingkey=0x08807CA8
```
其中最後三行就是我們上面設置的結果。

**在此特別提醒：以上關於用戶名、email 和署名密鑰的設置，必須是局域設置，也就是
說，只對一個特定的 repo 起作用——再直白點，這些信息存儲在被設置 repo 的文件
`.git/config` 中，而不是 Linux 用戶的整體設置——直白地說，上述信息不能存儲在
Linux 用戶主目錄下的配置文件 `.gitconfig` 中。否則，一旦中共當局接觸到您的
工作平臺，配置文件 `~/.gitconfig` 中的用戶名、email 和署名密鑰就會暴露您是
平亂行動參與者的事實。**
那麼，應當怎樣檢驗 `git` 用戶名、email 和署名密鑰不在整體設置中呢？有兩種方法：
一種是用文本編輯器直接打開文件 `~/.gitconfig` 看其中有沒有這三項致命信息；另一種
方法是查看指令
```
$ git config --global --list
```
的返回結果，看其中有沒有致命信息。一旦發現存在致命信息，刪除的辦法是用指令
```
$ git config --global --unset user.name
$ git config --global --unset user.email
$ git config --global --unset user.signingKey
```
分別刪除 `git` 用戶名、email 和署名密鑰。

實際上，用文本編輯器打開文件
`~/.gitconfig` 並把相應的敏感信息整行整行地刪除也能達到同樣效果，但是，**因為
很多文本編輯器會把修改前的文件內容保存到一個備份文件中，我們不建議直接編輯配置
文件 `~/.gitconfig`，除非您對文本編輯器的行為非常熟悉。**


#### 3.1.5 為 git 設置別名

我們經常會遇到某些很長的 git 指令，例如
```
$ git log --oneline --decorate --graph --all --date-order --show-signaure
```
用於查看本地 repo 的全景式的簡約展示。把這個指令用一個別名 `ls` 來代替就可以
偷懶。為此，我們在目錄 `my_src` 下執行一個一次性的指令
```
$ git config alias.ls "log --oneline --decorate --graph --all --date-order --show-signature"
```
就可以定義這樣一個別名。以後，在目錄 `my_src` 下執行
```
$ git ls
```
其效果和
```
$ git log --oneline --decorate --graph --all --date-order --show-signaure
```
是一樣的。

以上定義的別名 `ls` 只適用於 `my_src` 這一個 repo。如果打算這個別名對每一個本地
repo 都使用，一個辦法是在每個 repo 中分別定義別名 `ls`，另一個辦法是定義一個全局
的別名，方法就是在定義時給 `git config` 增加一個選項 `--global`，即
```
$ git config --global alias.ls "log --oneline --decorate --graph --all --date-order --show-signature"
```
這個指令只需要執行一次，就不需要在每個 repo 中都分別定義了。當帶有選項
`--global` 時，`git` 把別名 `ls` 的定義寫入用戶主目錄下的文件
`.gitconfig` 中，如果沒有選項 `--global`，則別名 `ls` 的定義被 `git` 寫入
`my_src` 下的（此處假設定義別名 `ls` 時的工作目錄為 `my_src`）文件
`.git/config` 中。文件 `~/.gitconfig` 中的設置適用於 Linux 用戶的所有的 repo，
而文件 `my_src/.git/config` 中的設置僅適用於 `my_src` 這一個 repo。

根據類似的思路，您可以把一些常用的 `git` 長指令設置為較短的別名。

**基於安全考慮，我們儘量不要作全局設置。**
因為本地 repo 及其局部設置最後都要隱藏在加密盤中。

### 3.2 本地 repo 的日常管理

經過 3.1 中的那些操作之後，`my_src` 還只是一個空的 repo。我們需要向它提交一些
文件，然後修改這些文件，或刪除某些文件，或者更改某個文件的文件名，之後再次提交，
並且把這個過程不斷重複，則 `my_src` 就會成為一個真正意義上的倉庫。

關於這些操作，
請參看 git 的常規教程，例如其官方網站上所給的文檔，或者查閱 `git` 的聯機手冊。


## 四、本地 repo 與 GitHub 或 GitLab 上的遠端 repo 交換數據

設想我們現在有一個本地 repo（其路徑為 `my_src`），其中已經有一些提交，不再是
空的。假設這個 repo 在 GitHub 上不存在對應的遠端 repo，我們想把它推送到 GitHub
上，然後把 GitHub 上的遠端 repo 設置為公開的，從而使其他 GitHub 用戶可以看到它，
乃至可以與您合作。

不管 `my_scr` 這個本地 repo 是在本地從無到有一點點建起來的，還是從其他地方克隆
過來的（方法建第五節），向 GitHub 推送的方法是一樣的。類似方法也可以用於向
GitLab 推送。

### 4.1 建立遠端 repo

假設您在 GitHub 上沒有對應於 `my_scr` 的 repo，現在要把後者推送到您在 GitHub
的賬號下，在那裡建立 `my_src` 的一個遠端 repo。假設您在 GitHub 上的用戶名為
`username`，您打算把 GitHub 上即將建立的遠端 repo 命名為 `my_remote`，然後在
`my_src` 中用代號 `github` 來指代這個名為 `my_remote` 的遠端 repo。

在正式操作之前，除了保證本地的 `my_src` 不空之外，需要您的整個工作環境（參看
[1][2]）已經運作正常。建立遠端 repo 的步驟如下。
1. 用 `cd` 命令切換工作目錄到 `my_scr`，如下：
    ```
    $ cd my_src
    ```
2. 為 `my_src` 設置其遠端 repo。如前所述，您打算把 `my_src` 在 GitHub 上的遠端
    repo 命名為 `my_remote`，使之位於您在 GitHub 的賬號 `username` 名下（當該
    遠端 repo 存在時，其網址將是 <https://github.com/username/my_remote>），並在
    本地的 `my_src` 中用代號 `github` 指代這個遠端 repo。設置指令為
    ```
    $ git remote add --tags github https://github.com/username/my_remote.git
    ```
    **從此之後，在本地 repo `my_src` 中就可以用 github 來指代這個遠端 repo
    了。**
    當然，您可以不用 github 這個代號，而改為別的，例如 foo 等等，這只要把上述
    命令改為
    `git remote add --tags foo https://github.com/username/my_remote.git`
    即可。

    如果您在 GitLab 上也有一個賬號 `username`，也要把該賬號下的 `my_remote`
    設置為 `my_src` 的遠端 repo，並且用 gitlab 來指代後者，則設置指令為
    ```
    $ git remote add --tags gitlab https://gitlab.com/username/my_remote.git
    ```
3. 假設 `my_src` 這個 repo 中除了默認分支 `master` 外，還有分支 `draft`，
    `branch1`，`branch2` 等等。現在 GitHub 上的遠端 repo `my_remote` 還不存在，
    需要您[登錄到 GitHub](https://github.com/login) 的賬號 `username` 上，在其中
    創建一個新的 repo （不熟悉 GitHub 操作的讀者可以在登錄後直接打開
    https://github.com/new 這個網頁），把我們要建的 repo 名稱 `my_repo` 填寫到
    網頁上 "Repository name" 下面的空白處，如下圖所示。

    ![在 GitHub 上創建新倉庫](create-repo-github.png)

    在 "Description (optional)" 下面的空白處可以填寫關於這個 repo 的簡單描述，
    也可以不寫而留待將來修改。再下面的 "Public" 和 "Private" 是二選一的，默認
    選擇 "Public" 表示該 repo 的內容可以被任何人（包括不登錄 GitHub 的用戶）看
    到，而 "Private" 則表示其內容只有您或您允許的人才可以看到。因為我們需要一個
    空的 repo 以便把工作平臺上的 `my_src` 的內容推送進來，所以**上圖中最後一行
    "Initialize this repository with a README （添加文件 README 之後初始化本
    repo）左邊的勾選框一定要空着，不要勾選它。**

    在同一個網頁中，再向下一行（已經超出了上圖的範圍，見下圖）有
    "Add .gitignore: None" 和 "Add a license: None"，保持這兩處不變。然後點擊
    它們下面一行中的綠色按鈕 "Create repository"，一般說來就會成功地創建出空白
    的 repo `my_remote`。

    ![在 GitHub 上創建新倉庫](create-repo-github-1.png)

    **如果是往 GitLab 上推送，這一步不需要做。**

4. 之後，在您的工作平臺上，還是在目錄 `my_src` 上，開始把 `my_src` 的內容推送
    到上面一步所建立的遠端 repo https://github.com/username/my_remote 中去。
    假設您打算把本地的分支 `master` 和 `draft` 以及 `branch1` 推送到上述遠端
    repo 中，而本地分支 `branch2` 等等不予推送，則執行指令
    ```
    $ torsocks -i git push -u github master draft branch1
    ```
    屆時 GitHub 會要求您提供用戶名和密碼（或者您預先在 GitHub 上設置好以 SSH
    密鑰認證）。只要您提交的用戶名 `username` 和密碼都是正確的，網絡通訊有沒有
    錯誤，推送就會成功。成功後，互聯網上所有用戶都可以通過網址
    https://github.com/username/my_remote 查看您所推送上去的內容，而且 GitHub
    用戶願意的話，可以通過 GitHub 和您展開合作。

    上述命令實際上是兩條指令合成的，一條是 `torsocks -i` 加一個正常指令，而這個
    正常指令就是 `git push -u github master draft branch1`。真正要推送並建立遠端
    repo 的就是後面這條指令，但是它會暴露您的 IP 地址，於是中共當局尋蹤而至，於
    是後面的事情就不堪設想了。現在把這條正常命令跟在 `torsocks -i` 之後，是要讓
    `torsocks` 把這條正常命令通過 Tor 網絡傳送到 GitHub 上，於是中共當局就無法
    追蹤到您了。在這裡，`torsocks` 的選項 `-i` 要求使用一條獨立的 Tor 管道，以免
    中共當局通過您對 Tor 網絡的其他用途把您找到——比如您在 YouTube 上有一個實名的
    賬號，現在也用 Tor 連接着，而中共當局用黑客手段或流氓政治手段從 YouTube 拿到
    了您的信息，那就可以找到您了（這方面的注意事項
    請閱讀[編程隨想](https://program-think.blogspot.com)的相關文章）——給
    `torsocks` 加上 `-i` 選項可以把您到 GitHub 的 Tor 管道變成一個專用的管道，讓
    中共無法拼湊線索。

    這也是我在文獻 [1] 和 [2] 中主張把
    [Tor 瀏覽器](https://www.torproject.org)安置在工作平臺中的原因之一。這樣做
    有兩重保險：第一，因為工作平臺是專門從事危險操作的場所，只要您遵守操作規範，
    所有能夠暴露您身份的那些翻牆動作（例如連接 YouTube）都不會發生在您的工作平臺
    中；第二，`torsocks -i` 的選項 `-i` 又增加了一重保險。如果 Tor 瀏覽器不在
    工作平臺中，則上述第一重保險很容易被破壞。

    但是，上述的第二重保險也很容易由於操作失誤而遭到破壞——例如，您忘記使用
    `torsocks -i` 命令，而直接使用 `git push` 命令——這時候，如果工作環境工作
    正常，直接使用 `git push` 命令會失敗，可是，如果整個工作環境出現了紕漏，竟然
    成功地連接上了 GitHub，而您又渾然不知地提供了用戶名和密碼使得推送成功，而
    中共當局居然黑進了 GitHub 拿到了您的登錄信息，那麼事情就不是請您喝茶這麼
    簡單了。所以，**推送這一步操作才是危險所在，必須慎之又慎。**

    類似地，用指令
    ```
    $ torsocks -i git push -u gitlab master draft branch1
    ```
    可以推送到 GitLab 上創建一個名為 `my_remote` 的遠端 repo，其中含有分支
    `master`、`draft` 和 `branch1`。
    **不過，這樣創建在 GitLab 上的遠端 repo 是一個私密的 (private) repo，只有
    您自己在登錄 GitLab 的情況下才能看到其中內容。要想讓任何人都能看到（不管是否
    登錄 GitLab），還需要您登錄到 GitLab 上把它改為公開的 repo。**

**上述操作都是一次性的。**


### 4.2 向遠端 repo 推送和從遠端 repo 下拉

假設非空的本地 repo `my_src` 已經設置了遠端 repo，具體例子參看 4.1 中的
`git remote` 命令的使用。我們仍然以 4.1 中的情景為例，假設 `my_src` 有兩個遠端
repos，代號分別是 `github` 和 `gitlab`，則命令
```
$ torsocks -i git push github master draft branch1
$ torsocks -i git push gitlab master draft branch1
```
會把本地地分支 `master`、`draft` 和 `branch1` 上推到 GitHub 以及 GitLab
上的兩個遠端 repos 中。類似地，命令
```
$ torsocks -i git fetch  github master draft branch1
```
會把代號為 `github` 的遠端 repo 中的分支 `master`、`draft` 和 `branch1` 下載到
本地 repo 中。這些遠程分支被下載到本地之後，就被分別命名為 `github/master`，
`github/draft` 和 `github/branch1`。

**注意：**
為了不讓中共當局追查到您的 IP 地址，在上述的推送和下拉過程中我們都通過命令
`torsocks` 進行。如果把上面給的指令中的 `torsocks -i` 去掉，一旦和 GitHub 或
GitLab 連接成功，中共當局找上門來的風險就會存在。請您仔細閱讀 4.1 中的相關說明。
所以，對於上推和下拉操作需要慎之又慎，一次錯誤都不能犯。然而人總是會犯錯的，
為減少犯錯的概率，我們把上推和下拉的指令放置在本 repo 的腳本
[`Makefile`](../../Makefile) 中，這樣，當我們需要上推時，只要把工作目錄切換到
本地 repo 的根目錄 `my_src` 下，然後執行
```
$ make push
```
即可；當我們需要下拉時，只要在切換完目錄後執行
```
$ make fetch
```
即可。



## 五、克隆一個 repo 到本地

在第四節中我們都是假定有一個不空的本地 repo，如何讓它和您在 GitHub 和/或 GitLab
上的遠端 repo 進行數據同步。在這一節，我們考慮兩種情形：
* 您有一個不空的本地 repo ——因為 Linux 系統是多用戶系統，這個 repo 可能不屬於
    您，也可以屬於您。無論哪種情形，都要假設您有足夠的權限進入該 repo 的目錄及其
    所有的子目錄，並且能夠讀取其中的內容。現在您打算把這個 repo 克隆為您自己的
    repo。
* 您打算把 GitHub 上某個不空的 repo （它不一定屬於您）克隆到本地，在克隆之前
    本地並不存在一個對應的 repo。

### 5.1 把一個本地 repo 克隆為另一個本地 repo

這裡是地一種情形：假設您有一個不空的本地 repo，它的路徑名是
`src_repo`，它可能屬於您也可能不屬於您，不管怎樣，我們都要假設您有足夠的權限進入
目錄 `src_repo` 及其所有的子目錄，並且有權讀取其中各個文件的內容。現在您打算把
這個 repo 克隆為您自己的 repo，克隆後的路徑為 `dest_repo`。這個指令很簡單：
```
$ git clone src_repo dest_repo
```
成功後您會看到克隆出來的 repo `dest_repo`，它以 `src_repo` 為遠端 repo，代號為
`origin`。

### 5.2 把 GitHub 或 GitLab 上的一個 repo 克隆為本地 repo

我們這裡所假設的情形是：您打算把 GitHub 上某個不空的 repo （它不一定屬於您）
`https://github.com/test/HelloWorld` 克隆到本地，在克隆之前，本地並不存在一個
對應的 repo。其步驟如下。

1. 用瀏覽器打開上述網址（如果上述網址中的內容是中共不喜歡的，就應該在
[Tor 瀏覽器](https://www.torproject.org)中打開），點擊網頁中綠色的 "Clone or
download" 按鈕，如圖所示。

    !["Clone or download" 按鈕](clone-butt.png)

2. 在彈出的小對話框中有該 repo 的真實網址，即下圖中的
`https://github.com/test/HellowWorld.git`。點擊它右邊的“複製”圖標就可以把這個
網址複製到剪貼板 (clipboard) 中。也可以把上述網址用通常的選擇-複製方法來達到
同樣的目的。

    ![把網址複製到剪貼板中](copy-repo-URL.png)

3. 在命令行中，把上述網址粘貼到指令 `git clone` 的後面。以上圖中的地址為例，這樣
    做的最終結果是得到如下指令：
    ```
    $ git clone https://github.com/test/HelloWorld
    ```

上述指令成功後，就可以得到一個名為 `HellowWorld` 的本地 repo，其遠端 repo
就是 GitHub 上的 `test/HelloWorld.git`。

現在，克隆所得的本地 repo 中已經自動配置好了遠端 repo，以後就可以從它的遠端 repo
下載數據；如果您知道遠端 repo 的屬主 `test` 的密碼（一般說來，這不可能），您還
可以把本地 repo 的數據推送到上述遠端 repo 中，方法和第四節中的方法相同。

對於 GitLab 上的 repo，其克隆方法完全類似。


## 參考文獻

[1] [《如何建立和配置安全的工作環境 (I)》](vm-sys.md)。

[2] [《如何建立和配置安全的工作環境 (II)》](single-vm.md)。
