# 稅制：在消費側徵稅更有利於民眾福祉

[戡亂復國](mailto:rebld-roc@protonmail.com)

## 稅前利潤率與稅後利潤率

政府針對一宗交易所徵收的稅費可以粗略地分為消費側的徵稅和供給側的徵稅。消費側的徵稅由買家支付，供給側的徵稅則由賣家支付。從道理上說，在一宗交易中，政府應當只能在消費側徵稅和供給側徵稅中選擇其一，但是中共治下的稅制紊亂、名目繁多，實際上消費側的徵稅和供給側的徵稅往往同時存在。我們在本文中分開討論消費側徵稅和供給側徵稅這兩種方式，看這兩種方式哪一種更有利於民眾。

基於這一目的，我們在一宗交易中，將會把針對該交易的稅收從成本中排除除去。也就是說，在一宗交易中，商品或服務的成本不包括針對這次交易的稅收。但是，該商品或服務在較以前所包含的各種稅收是記入成本的。例如，假設一宗交易賣出的是商品，那麼賣出商品的可能是生產商，也可能是經銷商或零售商，我們一概以買家稱呼該商品的出售者。在這種情形中，買家生產該商品或進貨時所繳付的各種稅金就會計入本宗交易的商品成本中，但是在本宗交易發生時所繳付的稅金則不在成本之列。

在中共治下，賣家在開業過程中還要行賄、向黑社會繳納保護費等，在這裡一併計入成本中。

在一宗既定的交易中，設售出的商品或服務在出貨時的成本為 $c$, 價格為 $p$,
賣家的稅後利潤率為 $r_{\rm prof}$.  設稅率為 $r_{\rm tax}$, 則相應的稅金為
$p r_{\rm tax}$.

如果稅金由賣方支付，則有
```math
p = p r_{\rm tax} + c + c r_{\rm prof}\, ,
```
於是得到賣家的稅後利潤率
```math
r_{\rm prof} = \frac{p}{c} (1 - r_{\rm tax}) - 1 \, .
```
在這宗交易中，
```math
r = \frac{p}{c} - 1
```
是買家所負擔的溢價率.  所以, 賣家的稅後利潤率與買家所負擔的溢價率之間的關係是
```math
r_{\rm prof} = r (1 - r_{\rm tax}) - r_{\rm tax} \, , \qquad r = \frac{r_{\rm prof} + r_{\rm tax}}{1 - r_{\rm tax}} \, .
```
在這種供給側徵稅的情況下，一旦稅率 $r_{\rm tax} \geqslant 1$, 買家的稅後利潤率就只能是 $r_{\rm prof} \leqslant -1$, 也就是虧損率超過 100%.
只要稅率 $r_{\rm tax} < 1$, 理論上賣家總是可以通過提高售價把稅金轉嫁到買家身上，從而實現正的利潤率。

如果稅金由買家支付，則有
```math
p = c + c r_{\rm prof} \, ,
```
而買家所負擔的溢價率為
```math
r' = \frac{p + p r_{\rm tax}}{c} - 1 = \frac{p}{c} (1 + r_{\rm tax}) - 1 \, .
```
由上述兩個等式得到
```math
r' = (1 + r_{\rm prof})(1 + r_{\rm tax}) - 1 \, ,
```
從而有
```math
r' = r_{\rm prof} + r_{\rm tax} + r_{\rm prof} \, r_{\rm tax} \, , \qquad r_{\rm prof} = \frac{r' - r_{\rm tax}}{1 + r_{\rm tax}} \, .
```
在這種消費側的徵稅方式中，理論上稅率是沒有限制的，無論徵收多高，賣方都可以實現盈利。

當稅率 $r_{\rm tax}$ 和賣方的稅後利潤率 $r_{\rm prof}$ 保持不變時, 我們來比較一下 $r$ 和 $r'$ 的大小。如果 $|r_{\rm tax}|$ 很小，我們可以通過泰勒展開得到
```math
\begin{alignat}{1}
  r - r'
  &= \frac{r_{\rm prof} + r_{\rm tax}}{1 - r_{\rm tax}}
  - (r_{\rm prof} + r_{\rm tax} + r_{\rm prof} \, r_{\rm tax})
  \nonumber \\
  &= (r_{\rm prof} + r_{\rm tax})
    \bigg( 1 + r_{\rm tax} + \frac{1}{2} \, r_{\rm tax}^{2} + \cdots \bigg)
  - (r_{\rm prof} + r_{\rm tax} + r_{\rm prof} \, r_{\rm tax})
  \nonumber \\
  &= r_{\rm tax}^{2}
  + \frac{1}{2} \, r_{\rm prof} r_{\rm tax}^{2}
  + \cdots
  \, ,
\end{alignat}
```
可見 $r > r'$ (除非 $r_{\rm tax} < 0$ 而且補貼的額度非常高).
事實上, 如果嚴格地推算, 則
```math
\begin{alignat}{1}
  r - r'
  &= \frac{
        r_{\rm prof}
        + r_{\rm tax}
        - (r_{\rm prof} + r_{\rm tax})(1 - r_{\rm tax})
        - r_{\rm prof} \, r_{\rm tax} \, (1 - r_{\rm tax})
      }{1 - r_{\rm tax}}
  \nonumber \\
  &= \frac{
        (r_{\rm prof} + r_{\rm tax}) \, r_{\rm tax}
        - r_{\rm prof} \, r_{\rm tax} \, (1 - r_{\rm tax})
      }{1 - r_{\rm tax}}
\end{alignat}
```
給出
```math
\begin{alignat}{1}
  r - r'
  &= \frac{
        (1 + r_{\rm prof}) \, r_{\rm tax}^{2}
      }{1 - r_{\rm tax}}
  \, .
\end{alignat}
```
可見, 除非商家或廠家瘋了不想賺錢, 或者由於得到了補貼而讓利, 總之, 除非
$r_{\rm prof} \leqslant -1$, 否則一定有 $r > r'$.
不難理解, 當 $r_{\rm prof} = 0$ 時, 商家或廠家就是在白送商品給賣方;
當 $r_{\rm prof} < -1$ 時, 商家或廠家就是在倒貼錢送商品. 在正常情況下, 這些行為都是不可能發生的 (在初創品牌時期可能會出現這樣的事情). 這就是說, **在常態的市場行為中, 政府從買方一側徵稅對買方和賣方都有好處.**


## 消費側徵稅的好處

我們仍然要說，在同一宗交易中，既向賣方徵稅又向買方徵稅的做法只有流氓政權才會採取。假如只向其中一方徵稅，那麼，如上面所討論的，在同樣的稅率下，向買方徵稅實際上更有利於買方和賣方。這種做法唯一不利的一方是徵稅的政府。但是，根據現代的政治學理念，這是好事。

在全社會的交易中，只向一側徵稅有利於通過稅收反映 GDP。如果兩側徵稅，或者有些交易向買方徵稅，另外一些交易向賣方徵稅，則稅收水平與 GDP 就失去了相關性。

向賣方徵稅會不容易控制逃稅漏稅。向買方收稅則相對容易控制：
* 買方的購買憑證與繳稅憑證合二為一，買方逃稅則同時也就失去了購買憑證；
* 稅金雖然是向買方徵收的，但卻由賣方代收，如果賣方幫助買方逃稅，則查實之後由賣方補償；
* 消費側徵稅的稅率空間是從負無窮到正無窮，負的稅率意味著補貼，正的稅率則是抑制消費，這麼大的稅率空間更有利於對全社會消費熱點的精準引控。
