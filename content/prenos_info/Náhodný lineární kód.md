# Náhodný lineární kód
- Zvolíme náhodně $G$ velikosti $k\times n$,
- $C=\{ xG\mid x\in \{ 0,1 \}^k \}$ všechny vztahy $y\in C, y\ne 0^n,$ $\Delta_{\text{Ham}}(y)>d$,
- pro pevné $x\in \{ 0,1 \}^k$ máme $\Pr_{G}[\underbrace{xG}_{y} \text{ má váhu } \leq d]\leq \frac{Vol_{2}(n,d)}{2^n}$. 
- $p=\frac{d}{n}$ a tedy $Vol_{2}(n,d)\leq 2^{(1-H(d/n))n}\leq 2^{-H(d/n)n}$. 
- A potřebujeme $2^k\cdot 2^{-H(d/n)n}<1$ a tedy $k\leq H\left( \frac{d}{n} \right)n$.
- Pokud $k$ je takové, tak máme $[n,k,\delta n]_{2}$ kód.

### *Tvrzení:* Pokud $d$ je takové, že $2^k< \frac{2^n}{\text{Vol}_{2}(n,d)} \cdot \frac{1}{2}$, pak náhodná $G$ generuje s velkou pravděpodobností ($p\in(0, 1/2), d=pn$) $[n,k,d]_{2}$ kód.
*Důkaz:* TODO:

---
# Hammingova mez
$[n,k,pn]_{2}$ kód má $k< \left( 1-H\left( \frac{p}{2} \right) \right)n (+\log n)$. Protože $\text{Vol}_{2}\left( n, \frac{pn}{2} \right) \ge \frac{2^{H(p/2)n}}{(n+1)}$ a tedy
$$
2^k \leq \frac{2^n \cdot n}{2^{H(p/2)n}}
$$
$$
k\leq \left( 1-H\left(  \frac{p}{2}  \right) \right)n + \log n
$$