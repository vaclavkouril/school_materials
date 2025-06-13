*Definice:* Metrický prostor je $(X, d)$, kde $X$ je množina a $d: X \times X \to \mathbb{R}$ funkce pro kterou platí
1. $\forall x,y \in X: d(x,y) >0, \quad d(x,y) = 0 \iff x=y$,
2. $\forall x,y\in X: d(x,y) = d(y,x)$,
3. $\forall x,y,z \in X: d(x,z) \leq d(x,y) + d(y,z)$.
*Příklady:* Eukleidovský metrický prostor $\mathbb{E}_{n}$ je $(\mathbb{R}, d)$, kde $d$ je definované
$$
d((x_{1},\dots,x_{n}), (y_{1},\dots,y_{n})) = \sqrt{ \sum_{i=1}^d (x_{i} - y_{i})^2}.
$$
*Definice:* Podprostor $(Y,\hat{d})$ prostoru $(X,d)$ je $Y \subseteq X$ a $\forall x,y \in Y: \hat d(x,y) = d(x,y)$.

*Definice:* Zobrazení $f: (X,d) \to (Y,d')$  je **spojité**, pokud 
$$
\forall x,y \in X, \forall \epsilon >0, \exists\delta>0: d(x,y) < \delta \Rightarrow d'(f(x), f(y)) < \epsilon.
$$
*Definice:* Posloupnost $(x_{n})_{n}$ v metrickém prostoru $(X,d)$ **konverguje** k $x$ právě tehdy, když
$$
\forall \epsilon > 0, \exists n_{0} \in \mathbb{N}, \forall n\in \mathbb{N}, n \geq n_{0}: d(x_{n},x) < \epsilon.
$$
---
# Otevřené a uzavřené množiny
*Definice:* Nechť $(X,d)$ je metrický prostor, $x \in X$, pak okolí je množina
$$
B(x,\epsilon) = \{ y \in X \mid d(x,y) < \epsilon \}.
$$
Takovému okolí se říká otevřená koule s poloměrem $\epsilon$ okolo $x$. 

*Definice:* Množina $U$ je otevřená pokud je okolím každého svého bodu. 
*Definice:* Množina $V$ je uzavřená, pokud $\forall(x_{n})_{n} \subseteq V$ je konvergentní v $X$ a $\lim_{ n } x_{n} \in V$. 

*Definice:* Mějme metrický prostor $(X,d)$ a množinu $A \subseteq X, x \in X$, pak vzdálenost bodu $x$ od množiny $A$ je 
$$
d(x,A) = \inf \{ d(x,a) \mid a \in A \}.
$$
*Definice:* Uzávěrem množiny $A$ je $\overline{A} = \{ x \mid d(x,A) = 0 \}$.