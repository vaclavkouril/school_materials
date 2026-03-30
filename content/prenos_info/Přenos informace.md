# Přenos informace po nespolehlivém kanálu
Mějme náhodnou proměnnou $X\in \{ 0,1 \}$ a její hodnotu neseme přes kanál s šumem za vzniku $Y$ náhodné proměnné. Značme
- $p_{0}$ jako pravděpodobnost chyby u přenosu znaku $0$,
- $p_{1}$ je pravděpodobnosti chyby u $1$.

Uvažujme **binární symetrický kanál** s $p=p_{1}=p_{2}$, s $X_{1}X_{2}X_{3}\dots$ jako pravděpodobnost chyby nezávislý. Předpoklad o nezávislosti není realistický, jen ho pak aproximujeme v praxi, třeba zpřeházením datových bloků.

Pro takový kanál máme $p\in [0,1/2)$.

---
# Zabezpečení proti chybám
Mějme příklad, kde
- $0\to000$,
- $1\to 111$.

Pro dekódování použijme majoritu. 
$$
\Pr[\text{chyba v trojici}] = p^3 + \binom{3}{2}p^2(1-p) = 3p^2 - 2p^3 = 0.000298 = p'
$$

A mějme $p=0.01$ a pro $X_{1}\dots X_{n}$ s $k\to n$. Pro $k=n=100$ při nekódování mám
$$
\Pr[\text{přenos bez chyby}]=(1-0.01)^{100} = 0.37\dots \approx \frac{1}{e}.
$$
a pro $k=100$ u kódování výše $n=300$, tak
$$
\Pr[\text{přenos bez chyby}] = (1-p')^{100} \geq 0.97.
$$
---
# Míra efektivity
Mějme **rate**
$$
R = \frac{k}{n} \in [0,1],
$$
který se snažíme maximalizovat.

*Definice:* Mějme $X$ náhodnou proměnnou, kterou posíláme a $Y$ náhodnou proměnnou, kterou dostáváme, pak **Kapacita kanálu** je
$$
C=\max_{X} I(X:Y).
$$
Pro $I(X:Y) = H(Y)-H(Y\mid X)$ a $H(Y)\leq 1$ a $H(Y\mid X)$ je "entropie šumu", protože
$$
H(Y\mid X) = p(x=0) \cdot H(p) + p(x=1) \cdot H(p) = H(p)
$$
a tedy $I(X:Y) \leq 1- H(p)$.

---
# Přenos slov
Mějme $m \in \{ 0,1 \}^k\to \{ 0,1 \}^n$ a pro $C\subseteq \{ 0,1 \}^n$ pro $C=\{ C_{m}, m\in \{ 0,1 \}^k \}$ a funkce bude následovná:
$$
m \to C_{m} \to C'_{m} \to m' 
$$
a chceme $m=m'$. A vlastně chceme aby kódová slova byla "daleko od sebe". Jedna z možností dekódování je pokud dostaneme $C'$, tak dekódujeme na nejbližší validní kódové slovo. 

Vzdálenost je myšlena pro $x,y\in \{ 0,1 \}^*$
$$
\Delta_{Ham} (x,y) = |\{ i; x_{i} \neq y_{i} \}|.
$$
---
### *Věta (Shannonova):* Uvažujme binární symetrický kanál s pravděpodobností chyby $p \in [0,1 / 2)$. $\forall R< 1-H(p),\forall \varepsilon \in (0,1), \forall n$ dostatečně velké, tak platí $\exists C \subseteq \{ 0,1 \}^n, |C|= 2^{Rn}$ takový, že dekódování pro každé slovo $\leq \varepsilon$.
*Důkaz:* 
