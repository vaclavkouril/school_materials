# Entropie náhodné proměnné
*Definice:* Entropie (expectation of information) je funkce $H(X)$ pro $X$ náhodnou proměnnou, že
$$
H(X) = \sum_{x\in X} \Pr[X=x] \cdot \overbrace{(- \log \Pr[X=x])}^{\text{informace}} = \mathbb{E}[I(X)] = \sum_{x\in \Omega} p(x) \log \frac{1}{p(x)},
$$
kde $x \in X$ je myšleno, že $x$ validním vstupem pro $X$.

- Problémem u $\sum_{x} p(x) \log \frac{1}{p(x)}$ je možnost $p(x)=0$ a $\log(0)$ i $\log\left( \frac{1}{p(x)} \right)$ nejsou definované, tedy užíváme konvence $0 \cdot \log \frac{1}{0}=0$.
- Kvůli ne-negativitě informace, máme $H(X) \geq0$.

## Příklady entropie pro distribuce
### Uniformní distribuce
Mějme $X$ uniformně na $\{ 0,1 \}^n, n \in \mathbb{N}$, pak $p(x) = \Pr[X=x]=2^{-n}$, pak
$$
H(X) = \sum_{x \in X} \Pr[X=x] \cdot (- \log \Pr[X=x]) = \sum_{x \in X} 2^{-n} \cdot \log 2^n \cdot 1 = n2^{-n} \cdot \sum_{x \in X} 1 = n
$$
### Neuniformní distribuce
Mějme $X$ náhodnou veličinu na $\{ 0,1 \}^n$ s 
$$
\Pr[X= 0^n] = \frac{1}{2}, \quad \forall x \in \{ 0,1 \}^n \setminus \{ 0^n \}: \Pr[X=x] = \frac{1}{2 \cdot (2^n - 1)}.
$$
Pak máme 
$$
\begin{split}
H(X) = \frac{1}{2}\cdot 1 + \sum_{x \ne 0^n } \frac{1}{2 \cdot (2^n - 1)} \cdot \log (2 \cdot (2^n - 1)) \\
= \frac{1}{2} + \sum_{x\ne 0} \frac{1}{2 \cdot (2^n - 1)} \cdot \log(2^{n+1} - 2) \approx\\
\approx \frac{1}{2} + \frac{1}{2} \cdot (n+1) \approx \frac{n}{2} + 1.

\end{split}
$$  
---
$H(X)\leq \log |\text{image}(X)|$
*Důkaz:*



---
# Společná entropie
*Definice:* Pro dvě náhodné proměnné $X,Y$ máme společnou entropii 
$$
H(X,Y) = \sum_{x \in X, y \in Y} p(x,y) \cdot \log \frac{1}{p(x,y)}.
$$
## Příklady
- Mějme nezávislé uniformně náhodné proměnné $X,Y$ na $\{ 0,1 \}^n$, pak $H(X,Y)=2n$.
- Mějme $a,b,c \in \{ 0,1 \}^{n/ 2 }$ s $X = ab, Y=bc$, pak $H(X) = n = H(Y)$, ale $H(X,Y) = 3n /2$.


---
$\forall X,Y: H(X),H(Y)\leq H(X,Y) \leq H(X) + H(Y)$
*Důkaz:* 

---
# Podmíněná entropie
*Definice:* Podmíněná entropie $Y$ na $X$ je 
$$
\begin{split}
H(Y \mid X) = \sum_{x \in X, p(x) \ne 0} p(x) \cdot H(Y \mid X=x) =
\\ = \sum_{x\in X, p(x) \ne 0} p(x) \sum_{y\in Y} p(y\mid x) \log \frac{1}{p(y \mid x))} = \\
= \sum_{x\in X, y\in Y, p(x) \ne 0} p(x) p(y\mid x) \log \frac{1}{p(y \mid x))} = \\
= \sum_{x\in X, y\in Y, p(x) \ne 0} p(x,y) \cdot  \log \frac{1}{p(y \mid x))}
\end{split}
$$
---
# Chain rule
*Věta:* $\forall X,Y: H(X,Y) = H(X) + H(Y\mid X)$

*Důkaz:*
$$
\begin{align}
H(X,Y) &= \sum_{x\in X} \sum_{y \in Y} p(x,y) \cdot \log \frac{1}{p(x,y)} \\
&= \sum_{x\in X} \sum_{y \in Y} p(x,y) \cdot \log \frac{1}{p(x) \cdot p(y \mid x)} \\
&= \sum_{x\in X}\sum_{y \in Y} p(x,y) \cdot \left(\log \frac{1}{p(x)} + \log \frac{1}{p(y \mid x)}\right)  \\
&=  \sum_{x\in X} \overbrace{\left( \sum_{y \in Y} p(x,y) \right)}^{p(x)} \cdot \log \frac{1}{p(x)} + \overbrace{\sum_{x\in X} \sum_{y \in Y} p(x) \cdot p(y\mid x) \cdot \log \frac{1}{p(y\mid x)}}^{\text{nedefinováno pro } x = 0}  \\
&= H(X) + \sum_{x\in X, y \in Y, p(x) \ne 0} p(x) \cdot p(y\mid x) \cdot \log \frac{1}{p(y\mid x)} \\
&= H(X) + H(Y\mid X).
\end{align}
$$
---
# Rozšíření
$H(X,Y\mid Z) = \mathbb{E}_{z \in Z} [H(X,Y\mid Z=z)]$, $H(X,Y \mid Z) = H(X \mid Z) + H(Y\mid X,Z)$, pak máme generalizaci
$$
H(X,Y,Z) = H(X) + H(Y \mid X) + H(Z\mid X,Y).
$$
