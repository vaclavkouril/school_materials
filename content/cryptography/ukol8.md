# 8.13
> Show that if an efficiently computable one-to-one function f has a hard-
core predicate, then f is one-way.

Hardcore-predikát $hc(x)$ pro $f$ je pokud se dá v poly-čase spočítat z $x$, ale když máme $f(x)$, tak nemáme algoritmus hádající $hc(x)$ lépe než náhodným tipem, tedy
$$
\Pr[A(1^n,f(x)) =hc(x))] \leq \frac{1}{2} + negl(n),
$$
kde pravděpodobnost je přes náhodné $x$ a náhodnost $A$.

Předpokládejme, že $f$ není one-way. Tedy existuje efektivní algoritmus $I$ a nezanedbatelná funkce $\alpha(n)$, že
$$
\Pr[I(f(x))=x] \geq \alpha(n).
$$
Mějme tedy nějaký $hc$ pro $f$ a sestrojíme algoritmus $D(y)$ hádající $hc(x)$ z daného $y= f(x)$.
1. Spočteme $x' = I(y)$,
2. Pokud $f(x') = y$, tak vrátíme $hc(x')$
3. Jinak zvolíme uniformě náhodně mezi 1 a 0.

Pokud $I(y)$ vrátí $x$ správně s nezanedbatelnou pravděpodobností $\alpha(n),$ pokud se inverze nepovede tak jsme stále u tipování jak $hc(x)$ vyjde
$$
\Pr[D(f(x)) = hc(x)] \geq \alpha(n) + (1-\alpha(n))\cdot \frac{1}{2} = \frac{1}{2} + \frac{\alpha(n)}{2}.
$$
A tím pádem jsme porušili podmínku na hardcore-predikát, takže spor.


--- 
# 8.14

$G: n \rightarrow 2n$
$G(k) = G_{0}(k) ||G_{1}(k))$.
## CONSTRUCTION 8.20
Let $G$ be a pseudorandom generator with expansion factor $\ell(n)=2 n$, and define $G_{0}, G_{1}$ as above. For $k \in\{0,1\}^{n}$, define the function $F_{k}:\{0,1\}^{n} \rightarrow\{0,1\}^{n}$ as:
$$
F_{k}\left(x_{1} x_{2} \cdots x_{n}\right)=G_{x_{n}}\left(\cdots\left(G_{x_{2}}\left(G_{x_{1}}(k)\right)\right) \cdots\right)
$$

> Show that if **Construction 8.20** is modified in the natural way so that $F_k(x)$ is defined for every nonempty string $x$ of length at most $n$, then the construction is no longer a pseudorandom function.

Povolujeme tedy $0 \leq |x| \leq n$. Přirozenou definici beru jako $F_{k} (x)$ hodnotu vrcholu po cestě $x$, tedy $|x| = m,\, G_{x_{m}}(G_{x_{m-1}}(\cdots G_{x_{2}}(G_{x_{1}}(k))))$. Takže vidíme ve stromu všechny uzly a ne jen listy. 

Útočník $D$ má nějaké orákulum $O$, které buď vrací jako $F_{k}$, nebo uniformě náhodně. 
1. $D$ zvolí $x = 0$ a zeptá se na 
$$
O(x) = y, \qquad O(x0) = y_{0}, \qquad O(x1) = y_{1}.
$$
2. $D$ porovná $y 0$ s $G_{0}(y)$ a $y 1$ s $G_{1}(y)$.
3. Pokud se obě rovnají tak odpovíme $1$ (tzn. myslíme si že je to $F_{k}$) a jinak 0

##### Analýza
- Pokud $O = F_{k}$, tak vždy odpovíme správně, protože všechny hodnoty pocházejí z jednoho stromu.
- Pokud $O = R$, tak chyba může vzniknout jen při náhodné kolizi, že se $y 0$ s $G_{0}(y)$ budou rovnat a i $y 1$ s $G_{1}(y)$ se budou rovnat. A to se stane jen tak, že z unifomně náhodné distribuce na $n$ bitech se vyberou právě 2 konkrétní posloupnosti: $2^{-2n}$.
Dohromady tedy
$$
|\Pr[D^{F_{k}} = 1] - \Pr[D^R = 1] | = 1 - 2^{-2n},
$$
což je zanedbatelně jistý odhad.
