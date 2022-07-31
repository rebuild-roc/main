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
[KaTeX]()
來實現對 TeX 數學公式的支持，我們的備用網站 <http://git.idk.i2p>
（以下簡稱之爲 idk）就是基於 GitLab 技術而運行的。
以下兩類參與者可以不必關注本文：
* 不使用 idk 託管項目的；
* 不使用數學公式的。
