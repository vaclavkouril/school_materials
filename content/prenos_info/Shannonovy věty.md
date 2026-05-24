### *Věta (Shannonova, 1):* Uvažujme binární symetrický kanál s pravděpodobností chyby $p \in [0,1 / 2)$. $\forall R< 1-H(p),\forall \varepsilon \in (0,1), \forall n$ dostatečně velké, tak platí $\exists C \subseteq \{ 0,1 \}^n, |C|= 2^{Rn}$ takový, že dekódování pro každé slovo $\leq \varepsilon$.
---
##### *Pomocná věta (Chernoff):* Nechť $0<p<1$ a $0<\alpha<1$. Pak $\exists c_{p,\alpha}>0$ t.ž. pro $\forall n\geq1$, a posloupnost $X_{1},\dots,X_{n}$ nezávislých náhodných proměnných $X_{i}=\begin{cases} 1 \text{ s pravděp. } p. \\ 0 \text{ s pravděp. } 1-p. \end{cases}$ $\Pr\left[ |\sum X_{i} - np| \geq \alpha n \right] \leq 2 \cdot e^{-c_{p,\alpha}\cdot n}$
- $\sum X_{i}$ jsou "nasčítané chyby"
- $np$ je očekávaný počet chyb

---
##### *Lemma 1:* $\forall n,r \geq 1$, definujeme $Vol_{n,r}=|Ball_{n,r}(0^n)| = \sum_{i=0}^r  \binom ni$. Pak $Vol_{n,r}\leq 2^{H(r/n)\cdot n}$, pro $r <\frac{n}{2}$.
$$
Ball_{n,r}(x) = \{ z \in \{ 0,1 \}^n, \Delta_{Ham}(x,z) \leq r \}
$$
*Důkaz Lemma:* 
$$
\text{Vol}_2(n,r) = \sum_{i=0}^{r} \binom{n}{i}
$$
Protože $r\leq n/2$, tak $\frac{r}{n}\leq \frac{1}{2}$ a navíc můžeme aplikovat binomickou větu
$$
1 = \left(\frac{r}{n} + \left(1-\frac{r}{n}\right)\right)^n = \sum_{i=0}^{n} \binom{n}{i} \left(\frac{r}{n}\right)^i \left(1-\frac{r}{n}\right)^{n-i}.
$$
Tedy platí
$$
\sum_{i=0}^{r} \binom{n}{i} \left(\frac{r}{n}\right)^i \left(1-\frac{r}{n}\right)^{n-i} \leq 1.
$$
Navíc máme pro $i < r: \left(\frac{r}{n}\right)^i \left(1-\frac{r}{n}\right)^{n-i} \geq \left(\frac{r}{n}\right)^r \left(1-\frac{r}{n}\right)^{n-r}$, protože se liší o faktor $\left(\frac{1- \frac rn}{\frac rn}\right)^{r-i}\geq 1$. 

Dostáváme dohromady tedy
$$
\begin{align*}
1 &\geq \sum_{i=0}^{r} \binom{n}{i} \left(\frac{r}{n}\right)^i \left(1-\frac{r}{n}\right)^{n-i} \geq \sum_{i=0}^{r} \binom{n}{i} \left(\frac{r}{n}\right)^r \left(1-\frac{r}{n}\right)^{n-r} \\
1 &\geq \text{Vol}_2(n,r) \left(\frac{r}{n}\right)^r \left(1-\frac{r}{n}\right)^{n-r} \\
\frac{1}{\left(\frac{r}{n}\right)^r \left(1-\frac{r}{n}\right)^{n-r}} &\geq \text{Vol}_2(n,r) \\
2^{-r \log(r/n) - (n-r)\log(1-(r/n))} &\geq  \text{Vol}_2(n,r) \\
2^{n(-r/n \log(r/n) - (1-(r/n))\log(1-(r/n)))} &\geq  \text{Vol}_2(n,r) \\

2^{H(r/n)n} &\geq  \text{Vol}_2(n,r).
\end{align*}
$$
---

*Důkaz Shannonovy věty:* Vlastně konstruujeme náhodný kód, tak aby v koulích průměru $(p+\alpha)n$ nebyly kolize.
$$
\begin{split}
\Pr_{C,x,\mathcal{e}}[\text{chybné dek. } x] \leq \Pr_{C,x,\mathcal{e}}[\text{chyba }\mathcal{e} \geq (p+\alpha)n]+ \\ + \Pr_{C,x,\mathcal{e}}[\exists x' \in C, x'\ne x, \Delta_{\text{Ham}}(x',x+\mathcal{e}) \leq(p+\alpha)n]
\end{split}
$$
Zvolme $\alpha$ t.ž. $H(p+\alpha)+R <1$, víme, že $H(p)+R<1$ tedy takové $\alpha$ existuje. Dle Chernoffovy věty je 
$$
\Pr_{C,x,\mathcal{e}}[\text{chyba }\mathcal{e} \geq (p+\alpha)n] \leq 2 \cdot e^{-c_{p,\alpha}n}.
$$
U druhého členu si po řadě navolíme
1. $m \in \{ 0,1 \}^{Rn}$ náhodně
2. $C(m)\in \{ 0,1 \}^n$ náhodně
3. $\underbrace{E_{1},\dots,E_{n}}_{\mathcal{e}}\in \{ 0,1 \}$ náhodně (indikátory chyby)
4. $\forall m'\ne m: C(m')\in \{ 0,1 \}^n$ náhodně

a teď můžeme odhadnout $\Pr_{C,x,\mathcal{e}}[\exists x' \in C, x'\ne x, \Delta_{\text{Ham}}(x',x+\mathcal{e}) \leq (p+\alpha)n]$ (kde $r=(\alpha+p)n$)
$$
\begin{split}
\leq (2^{Rn}-1) \cdot \frac{|Ball_{n,r}(x+\mathcal{e})|}{2^n} \stackrel{\text{Lemma 1}}{\leq} 2^{Rn} \cdot \frac{2^{H(p+\alpha)n}}{2^n}\leq \\
\leq 2^{[R+H(p+\alpha) - 1]n} \leq 2^{-cn},\quad c>0.
\end{split}
$$
a pro dostatečně velké $n$ nám odhady dávají šanci dekódování chybně $<\varepsilon$ (exponenciálně klesá chyba). 

Tedy důsledkem je $\exists C \subseteq \{ 0,1 \}^n: \Pr_{x,\mathcal e} [\text{chybné dek.} x] \leq \varepsilon$. A pomocí Markovovy nerovnosti
$$
|\{ x\in C; \Pr_{\mathcal{e}}[\text{chybné dek. }x]> 2\varepsilon \}|\leq \frac{|C|}{2}
$$
a taková $x$ s vyšší pravděpodobností chyby dekódování vyhodíme a máme $C' \subseteq C \setminus \{ x\in C; \Pr_{\mathcal{e}}[\text{chybné dek. }x \}$ a $|C'|=2^{R(n-1)}$, kde potenciálně ta $-1$ tam nemusí být. 

---
### *Věta (Shannonova, 2):* Nechť $0<p<1, \delta\in (0,1):$ $R>1-H(p)$. Pak $\forall n$ dostatečně velké $\forall C\subseteq \{ 0,1 \}^n, |C|=2^{Rn}$, průměrná chyba dekódování $\geq 1-\delta$.
*Důkaz:* Mějme rozdělení prostoru $D_{x} = \{ y \in \{ 0,1 \}^n;y \text{ dekóduje }x \}$ a $|\dot{\bigcup} D_{x}|\leq 2^{n}$, $x\ne x'\implies D_{x} \cap D_{x'}=\emptyset$. Zajímá nás 
$$
x + e \text{ správně dekóduje} \iff x+e \in D_{x}.
$$

Vybereme si $\alpha>0$ tak aby $R > 1-H(p)+\alpha \log \frac{1-p}{p}$ a můžeme rozdělit chyby na velké a malé
$$
\begin{split}
\Pr[x + e \text{ správně dekóduje}] \leq \\
\leq \Pr[x +e \in D_{x} \land |e| \in [(p-\alpha)n,(p+\alpha)n]] +\\
+ \Pr[x +e \in D_{x} \land |e| \not\in [(p-\alpha)n,(p+\alpha)n]]
\end{split}
$$
Z Chernoffovy nerovnosti víme
$$
\Pr[x +e \in D_{x} \land |e| \not\in [(p-\alpha)n,(p+\alpha)n]] \leq 2 \cdot e^{c_{p,\alpha}\cdot n}.
$$
Tvrdíme, že 
$$
\Pr[x +e \in D_{x} \land |e| \in [(p-\alpha)n,(p+\alpha)n]] \leq \sum_{x\in C,e, |e|\in[(p-\alpha)n,(p+\alpha)n],x+e \in D_{x}} \Pr[\text{výběr přesně }x \& e]
$$
kde výběr pevného $x$ je s pravděpodobností $2^{-Rn}$ a pro $e$ máme $p^{(p-\alpha)n}$, že se stane error na přesně daných místech a $(1-p)^{(1-p+\alpha)n}$, že se error na vybraných místech nevybere. Navíc voleb $x+e$ je $2^n$, protože to jsou prvky prostoru kódových slov, dohromady tedy máme odhad
$$
\leq 2^n 2^{-Rn} \cdot p^{(p-\alpha)n} \cdot (1-p)^{(1-p+\alpha)n} = 2^n 2^{-Rn} p^{pn}p^{-\alpha n} (1-p)^{(1-p)n} (1-p)^{\alpha n}, 
$$
kde
$$
[p^p (1-p)^{(1-p)}]^n = [2^{-H(p)}]^n,\quad [p^p (1-p)^{(1-p)}]^n = 2^{(-\alpha \log n + \alpha \log 1-p)n}.
$$
Dostáváme
$$
2^{n(1-R - H(p) + \alpha \log \frac{1-p}{p})}.
$$
Protože $R >1-H(p) + \alpha \log \frac{1-p}{p}$ tak je $(1-R - H(p) + \alpha \log \frac{1-p}{p}) <0$ a tedy jde pravděpodobnost k $0$ a tedy
$$
\Pr[x + e \text{ správně dekóduje}] \leq \delta.
$$
