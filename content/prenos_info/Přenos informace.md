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
### *Věta (Shannonova, 1):* Uvažujme binární symetrický kanál s pravděpodobností chyby $p \in [0,1 / 2)$. $\forall R< 1-H(p),\forall \varepsilon \in (0,1), \forall n$ dostatečně velké, tak platí $\exists C \subseteq \{ 0,1 \}^n, |C|= 2^{Rn}$ takový, že dekódování pro každé slovo $\leq \varepsilon$.
##### *Pomocná věta (Chernoff):* Nechť $0<p<1$ a $0<\alpha<1$. Pak $\exists c_{p,\alpha}>0$ t.ž. pro $\forall n\geq1$, a posloupnost $X_{1},\dots,X_{n}$ nezávislých náhodných proměnných $X_{i}=\begin{cases} 1 \text{ s pravděp. } p. \\ 0 \text{ s pravděp. } 1-p. \end{cases}$ $\Pr\left[ |\sum X_{i} - np| \geq \alpha n \right] \leq 2 \cdot e^{-c_{p,\alpha}\cdot n}$
##### *Lemma:* $\forall n,r \geq 1$, definujeme $Vol_{n,r}=|Ball_{n,r}(0^n)| = \sum_{i=0}^r  \binom ni$. Pak $Vol_{n,r}<2^{H(r/n)\cdot n}$, pro $r <\frac{n}{2}$.
$$
Ball_{n,r}(x) = \{ z \in \{ 0,1 \}^n, \Delta_{Ham}(x,z) \leq r \}
$$
*Důkaz Lemma:* 



*Důkaz Shannonovy věty:*
$$
\begin{split}
\Pr_{C,x,\mathcal{e}}[\text{chybné dek. } x] \leq \Pr_{C,x,\mathcal{e}}[\text{chyba }\mathcal{e} \geq (p+\alpha)n]+ \\ + \Pr_{C,x,\mathcal{e}}[\exists x' \in C, x'\ne x, \Delta_{\text{Ham}}(x',x+\mathcal{e}) \leq(p+\alpha)n]
\end{split}
$$
Zvolme $\alpha$ t.ž. $H(p+\alpha)+R <1$, $H(p)+R<1$. Dle Chernoffovy věty je 
$$
\Pr_{C,x,\mathcal{e}}[\text{chyba }\mathcal{e} \geq (p+\alpha)n] \leq 2 \cdot e^{-c_{p,\alpha}n}.
$$
U druhého členu si po řadě navolíme
1. $m \in \{ 0,1 \}^{Rn}$ náhodně
2. $C(m)\in \{ 0,1 \}^n$ náhodně
3. $\underbrace{E_{1},\dots,E_{n}}_{\mathcal{e}}\in \{ 0,1 \}$ náhodně (indikátory chyby)
4. $\forall m'\ne m: C(m')\in \{ 0,1 \}^n$ náhodně

a teď můžeme odhadnout $\Pr_{C,x,\mathcal{e}}[\exists x' \in C, x'\ne x, \Delta_{\text{Ham}}(x',x+\mathcal{e}) \leq(p+\alpha)n]$ ($r=(\alpha+p)n$)
$$
\begin{split}
\leq (2^{Rn}-1) \cdot \frac{|Ball_{n,r}(x+\mathcal{e})|}{2^n} \stackrel{\text{Lemma}}{\leq} 2^{Rn} \cdot \frac{2^{H(p+\alpha)n}}{2^n}\leq \\
\leq 2^{[R+H(p+\alpha) - 1]n} \leq 2^{-cn},\quad c>0.
\end{split}
$$
a pro dostatečně velké $n$ nám odhady dávají šanci dekódování chybně $<\frac{\epsilon}{2}$ (exponenciálně klesá chyba). 

Tedy důsledkem je $\exists C \subseteq \{ 0,1 \}^n: \Pr_{x,\mathcal e} [\text{chybné dek.} x] \leq \frac{\varepsilon}{2}$. A tedy pomocí Markovovy nerovnosti
$$
|\{ x\in C; \Pr_{\mathcal{e}}[\text{chybné dek. }x]>\varepsilon \}|\leq \frac{|C|}{2}
$$
a taková $x$ s vyšší pravděpodobností chyby dekódování vyhodíme a máme $C' \subseteq C \setminus \{ x\in C; \Pr_{\mathcal{e}}[\text{chybné dek. }x \}$ a $|C'|=2^{R(n-1)}$, kde potenciálně ta $-1$ tam nemusí být. 

---
### *Věta (Shannonova, 2):* Nechť $0<p<1, \delta\in (0,1):$ $R>1-H(p)$. Pak $\forall n$ dostatečně velké $\forall C\subseteq \{ 0,1 \}^n, |C|=2^{Rn}$, průměrná chyba dekódování $\geq 1-\delta$.
*Důkaz:* Přeskočen...

---
# Konstrukce dobrého kódu
Zajímá nás vlastně parametr minimální vzdálenosti
$$
d= \min_{{x,x'\in C}\\ x\ne x'} \Delta_{Ham} (x,x').
$$
Vzheldem k trojúhelníkové nerovnosti máme
$$
\left. \begin{array}{l}
  \Delta_{Ham} (x,y) = \frac{d-1}{2} \\
  \Delta_{Ham} (x',y) = \frac{d-1}{2}
\end{array} \right\} = \Delta_{Ham}(x',x) \leq d-1
$$
a tedy počet chyb $\leq\frac{d-1}{2}$ dekódujeme správně.

Naším cílem je pro dané $n,k [=Rn]$ maximalizovat $d$. Ale Shannonova věta č.2, tak 
$$
\frac{k}{n}\leq 1-H\left( \frac{d-1}{2n} \right)
 \implies t=pn=\left( \frac{d-1}{2} \right)n.
$$
A budeme značit kód pomocí $(n,k,d)$ , kde je to kód v prostoru $\Sigma^n$ velikosti $|\Sigma|^k$ s minimální vzdáleností $d$.

---
## Paritní kód
$x\in \{ 0,1 \}^k\to x,\Sigma_{\text{mod }2} x_{i}$, pak $(k+1,k,2)$.

---
## Hammingův kód
$k= 2^\ell - \ell -1, n=2^\ell -1$ a pak $(2^\ell -1,2^\ell-\ell -1, 3)$ pro konstrukci mějme $k$ $\ell$-bitových vektorů s alespoň $2$ jedničkami a $p_{i} := \sum_{i\text{-tý}} x_{j}$ bit $j$-tého vektoru je $1$.

Je to $3$ protože umíme opravit jednu chybu: mějme $x_{1}\dots x_{k}p_i \dots p_{\ell}$ a chyby jsou na dvou možných místech
- v části $x_{1},\dots,x_{k}\implies$ aspoň 2 paritní bity jsou špatně.
- v části $p_{1}\dots p_{\ell}$ nesedí jeden paritní bit.

a dekódujeme dle přepočtu $p_{i}$.