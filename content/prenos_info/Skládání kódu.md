$[n,k,d]_{q}$ pro binární kódy
- $d=n:C_{1}=\{ 0^n,1^n \}$
- $d=\frac{2n}{3}: C_{2}=\{0^n,0^{n/3}1^{2n/3}, 1^{2n/3}0^{n/3}\}$.

U binárního kódu máme $d< (\frac{1}{2}-\varepsilon)n$

TODO:

Dekódování
- Každý vnitřní symbol
- Dekódování vnějšího kódu

Aby dekódování selhalo, tak musíme mít více chyb než $\frac{D-1}{2} \cdot \frac{d-1}{2}$, první člen za vnější dekódování a druhý za vnitřní znaky, tedy $\approx \frac{dD}{4}$. Dokonce můžeme opravit i $\frac{dD-1}{2}$ chyb.

---
# Náhodný lineární kód
Zvolíme náhodně $G$ velikosti $k\times n$, $C=\{ xG\mid x\in \{ 0,1 \}^k \}$ všechny vztahy $y\in C, y\ne 0^n,$ $\Delta_{\text{Ham}}(y)>d$, pro pevné $x\in \{ 0,1 \}^k$ máme $\Pr_{G}[\underbrace{xG}_{y} \text{ má váhu } \leq d]\leq \frac{Vol_{2}(n,d)}{2^n}$. $p=\frac{d}{n}$ a tedy $Vol_{2}(n,d)\leq 2^{(1-H(d/n))n}\leq 2^{-H(d/n)n}$. A potřebujeme $2^k\cdot 2^{-H(d/n)n}<1$ a tedy $k\leq H\left( \frac{d}{n} \right)n$.