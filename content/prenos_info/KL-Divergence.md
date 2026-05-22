 # KL-Divergence
Mějme náhodné proměnné s stejnou range $X,Y$ a mějme $p(x) = \Pr[X=x]$, $q(x)=\Pr[Y=x]$. 

*Definice:* KL-divergence mezi náhodnými proměnnými $X,Y$ se stejným prostorem obrazů je
$$
D(X || Y) = D(p||q) = \sum_{x} p(x)\log \frac{p(x)}{q(x)}.
$$
Definice se dá přepsat:
$$
 \underbrace{\sum_{x} p(x) \log \frac{1}{q(x)}}_{\text{cena navíc při použití komprese na }q \text{ při distribuci }p} - \underbrace{\sum_{x} p(x) \log \frac{1}{p(x)}}_{H(X)}
$$

Konvence:
- $0\cdot \log\frac{{0}}{q}= 0$,
- $0\cdot \log \frac{0}{0} = 0$,
- $p \cdot \log \frac{p}{0} = \infty$.

Tedy $D(X||Y)$ může být $\infty$. Navíc pokud $p=q \implies D(X||Y)=0$. Nesymetrická zjevně.

Definujme
$$
p(x,y)=\Pr[X=x \land Y=y], \quad q(x,y) = p(x)p(y)
$$
pak (toto je *ta* KL-divergence)
$$
D(p(x,y)||q(x,y)) = I(X:Y).
$$
*Důkaz:* Přepíšeme $I(X:Y) = \sum_{x}p(x) \log \frac{1}{p(x)} - \sum_{x,y} p(x,y) \log \frac{1}{p(x \mid y)}$, tedy máme
$$
I(X:Y) = \sum_{x,y} p(x,y) \log \frac{p(x\mid y)}{p(x)}
$$
zlomek v logaritmu můžeme pře-násobit $p(y)$ a máme
$$
\sum_{x,y} p(x,y) \log \frac{p(x,y)}{p(x)p(y)}
$$
a to je přesně $D(p(x,y)||q(x,y))$, protože z definice máme
$$
D(p(x,y)||q(x,y)) = \sum_{x,y}  p(x,y) \log \frac{p(x,y)}{q(x,y)} = \sum_{x,y}  p(x,y) \log \frac{p(x,y)}{p(x)p(y)} = I(X:Y).
$$

---
#### *Lemma (Jensenova nerovnost)*
Mějme $f:\mathbb{R}\to \mathbb{R}$, ta je konvexní na intervalu $(a,b)$ pokud platí $\forall \alpha \in(0,1): f(\alpha x_{1} + (1-\alpha)x_{2}) \leq \alpha f(x_{1}) + (1-\alpha)f(x_{2})$, striktně konvexní pokud $<$.

$-\log$ je striktně konvexní funkce a $\log$ je konkávní.

*Jensenova nerovnost:* Nechť $f:\mathbb{R}\to \mathbb{R}$ je konvexní na $(a,b)$, $X$ náhodná proměnná s $rng(X) \subseteq (a,b)$, pak 
$$
\mathbb{E}[f(X)] \geq f(\mathbb{E}[X]).
$$
Předpokládejme konečnost $|X|$.

*Důkaz:* Indukce na velikosti $|X|$, pak pro $|X|=2$ máme dva body $x_{1},x_{2}$ a $p(x_{1}), p(x_{2})=1-p(x_{1})$ a máme
$$
\alpha f(x_{1}) + (1-\alpha)f(x_{2}) \geq f(\alpha x_{1} + (1-\alpha)x_{2})
$$
přesně definice konvexity.

Mějme $n=|X|$ s body $x_{1},\dots,x_{n}$ s odpovídajícími pravděpodobnostmi. Máme 
$$
\mathbb{E}[f(X)] = \sum_{i=1}^n p_{i}f(x_{i}) = p_{n} f(x_{n}) + \sum_{i=1}^{n-1} p_{i}f(x_{i})
$$
a máme vlastně $\sum_{i=1}^{n-1} p_{i} = 1-p_{n}$, pak definujme nové pravděpodobnosti $p'_{i} = \frac{p_{i}}{1-p_{n}}$ a dosaďme
$$
\mathbb{E}[f(X)] = p_{n} f(x_{n}) + (1-p_{n}) \cdot \sum_{i=1}^{n-1} p'_{i}f(x_{i})
$$
pak dle indukčního předpokladu pro $n-1$ máme
$$
\mathbb{E}[f(X)] \geq p_{n} f(x_{n}) + (1-p_{n}) \cdot f\left(  \sum_{i=1}^{n-1} p'_{i}x_{i} \right)
$$
a dle konvexity máme
$$
\mathbb{E}[f(X)] \geq f\left( p_{n}x_{n} + (1-p_{n}) \sum_{i=1}^{n-1} p'_{i} x_{i} \right) = f\left( \sum_{i=1}^n p_{i}x_{i} \right).
$$
---
### *Věta:* $\forall p,q: D(p||q)\geq {0}$ a $p=q \iff D(p||q)=0$.
Pro důkaz mějme $A = \{ x, p(x)>0 \}$ a pak můžeme upravit výraz
$$
-D(p||q) = -\sum_{x \in A} p(x) \log \frac{p(x)}{q(x)} =\sum_{x \in A} p(x) \log \frac{q(x)}{p(x)}
$$
teď zvolme $c(x) = \frac{q(x)}{p(x)}$, to je dle konvence nejvýše $\infty$ a pak $f(x) = \log(c(x))$ a na $f$ aplikujme [*Lemma (Jensenova nerovnost)*](#*Lemma%20(Jensenova%20nerovnost)*) a sice
$$
\sum_{x \in A} p(x) f(x) \stackrel{\text{Jensen}}\leq \log \sum_{x \in A} p(x) c(x) = \log \sum_{x \in A} p(x) \frac{q(x)}{p(x)}.
$$
Protože $p(x)$ se jednoduše pokrátí a i kdyby $q$ mělo jinou doménu od $p$, tak stále je to jen suma pravděpodobností a ta je omezena $1$:
$$
-D(p||q) \leq \log 1 = 0,
$$
takže $D(p||q)\geq{0}$.

Pokud $p=q$, tak stačí přepsat z definice
$$
D(p||q) = \sum_{x,p(x)>0} p(x) \log \frac{p(x)}{q(x)} = \sum_{x,p(x)>0} p(x) \log \frac{p(x)}{p(x)} = \sum_{x,p(x)>0} p(x) \log 1 = 0.
$$