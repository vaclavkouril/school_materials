# Vzájemná informace
*Definice:* Řekneme, že $I(X,Y)$ je *vzájemná informace* (kolik zjistím o $X$ znám-li $Y$)($H(X)$ značí [entropii](Entropie.md))
$$
I(X:Y) = H(X) - H(X\mid Y)
$$
- $H(X\mid Y)$ - říká kolik toho nevíme o $X$ z $Y$,
- definice vzájemné informace tedy přesně vyjadřuji kolik toho víme o $X$ máme-li $Y$,
- $I(X:X)=H(X)$,
- $X,Y$ nezávislé, pak $I(X:Y)=0$,
- $X,Y\in \{ 0,1 \}^n, a,b,c\in \{ 0,1 \}^{n / 2}, X=ab,Y=bc$, pak je $I(X:Y)=n - n /2 = n / 2$,
- $X,Y\in \{ 1,\dots,6 \}$ nezávislé a $Z=(X+Y)\mod 6$, pak $H(X)=H(Y)=H(Z)$ a $I(X:Y)=0, I(X:Z)=0, I(X,Y:Z)=H(X,Y) - H(X,Y\mid Z) = H(X)+H(Y)-\log 6 =H(Z)$, protože máme-li nějaké zafixované $Z$ tak existuje $6$ $(x,y)$ dvojic, které ho mohou složit.
### *Věta (Symetrie informace):* $\forall X,Y:I(X:Y) = I(Y:X)$.
*Důkaz:* Mějme $I(X:Y)$, dle chain rule máme $H(X) + H(Y\mid X)=H(X,Y)=H(Y) + H(X\mid Y)$, kde rovnici můžeme přeházet na 
$$
H(X) - H(X\mid Y) = H(Y) - H(Y\mid X)
$$
a tedy, přepíšeme-li dle definice
$$
I(X:Y)= I(Y:X).
$$
---
### Chain rule informace
*Věta:* Mějme náhodné proměnné $X,Y,Z$, pak
$$
I(X:Y\mid Z)= \sum_{z\in Z} \Pr[Z=z] \cdot I(X:Y\mid Z=z)
$$
Chain rule pro vzájemnou informaci:
$$
\begin{align}
I(X_{1},\dots,X_{k} :Y) &= H(X_{1},\dots,X_{k}) - H(X_{1},\dots,X_{k}\mid Y) \\
&= \sum_{i=1}^k H(X_{i}\mid X_{i-1},\dots,X_{1}) - H(X_{i}\mid X_{i-1},\dots,X_{1}, Y)  \\
&=  \sum_{i=1}^k I(X_{i}:Y\mid X_{1},\dots,X_{i-1})
\end{align}
$$
---
### $I(X:Y)\geq{0}$
*Důkaz:* Z definice máme
$$
I(X:Y) =  I(Y:X) = \sum_{y} p(y)  \log\frac{1}{p(y)} - \sum_{x,y}p(x,y) \log\frac{1}{p(y\mid x)}
$$
můžeme přepsat na 
$$
\sum_{x,y} p(x,y) \log\frac{1}{ p(y)} - \sum_{x,y}p(x,y) \log\frac{1}{p(y\mid x)} = \sum_{x,y} p(x,y)\left( \log\left( \frac{1}{p(y)} \right)-\log\left( \frac{1}{p(y\mid x)} \right) \right)
$$
$$
I(X:Y) = \sum_{x\in X,y\in Y, p(x) \neq 0} p(x,y)\log\left( \frac{p(y\mid x)}{p(y)} \right)
$$
protože $p(y\mid x)=\frac{p(x,y)}{p(x)}$ pro $p(x)>0$, tak máme
$$
I(X:Y) = \sum_{x\in X,y\in Y, p(x) \neq 0} p(x,y)\log\left(\frac{p(x,y)}{p(x)p(y)} \right)
$$
a navíc $\log(t) \leq t-1$ pro $(t>0)$ tak definujeme $t:= \frac{p(x)p(y)}{p(x,y)}$, pak 
$$
-\log\left(\frac{p(x)p(y)}{p(x,y)} \right) \geq 1- \frac{p(x)p(y)}{p(x,y)}
$$
tak máme
$$
\log\left(\frac{p(x,y)}{p(x)p(y)} \right) \geq 1- \frac{p(x)p(y)}{p(x,y)}
$$
můžeme dosadit 
$$
I(X:Y)\geq \sum_{x,y} p(x,y) \left( 1-\frac{p(x)p(y)}{p(x,y)} \right) = \sum_{x,y} p(x,y) - p(x)p(y).
$$
Ale víme $\sum_{x,y} p(x,y)= 1$ a taky
$$
\sum_{x,y} p(x)p(y) = \left( \sum_{x}p(x) \right)\left( \sum_{y}p(y) \right) = 1
$$
dohromady tedy
$$
I(X:Y) \geq 1 - 1 =0.
$$


*Důsledek:* $H(X\mid Y)\leq H(X)$