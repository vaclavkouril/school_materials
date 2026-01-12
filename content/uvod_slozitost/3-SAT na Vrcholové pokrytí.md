Problém vrcholového pokrytí je $G$ a $k \geq 0$, zda existuje vrcholové pokrytí velikosti nejvýše $k$, tedy $S \subseteq V(G), |S| = k$ t.ž. $\forall e \in E(G): S \cap e \neq \emptyset$.

*Věta:* 3-SAT je polynomiálně převoditelný na Vrcholové pokrytí.

*Důkaz:* Mějme $x_{1},\dots,x_{n}, C_{1},\dots,C_{m}$ $n$-proměnných a $m$-klauzulí s právě 3 literály v každé klauzuli.

$\forall x_{i}, i=1,\dots,n$ přidáme dva vrcholy $x_{i},\neg x_{i}$ a hranu $\{ x_{i}, \neg x_{i} \}$. Pak přidáme trojúhelníky $C_{j} = \{ u_{j},v_{j}, w_{j} \}$ a přidáme do $V(G) \cup \{ u_{j},v_{j}, w_{j} \}$ a hrany mezi nimi, navíc mějme $u_{j} = l_{1}, v_{j}=l_{2}, w_{j}=l_{3}$ a hrany $\{ u_{j},l_{1} \}, \{ v_{j},l_{2} \}, \{ w_{j}, l_{3} \}$. Určeme $k := 2m +n$, protože $1$ vrchol, za každou hranu $\{ x,\neg x \}$ a $2$ vrcholy za každý trojúhelník (těch je $m$) a tedy musí vrcholové pokrytí obsahovat alespoň $2m+n$ vrcholů. 

Tvrdíme, že $G$ má vrcholové pokrytí velikosti $k=2m+n$ $\iff$ má původní $\varphi$ model.

($\implies$) Mějme takové pokrytí $S, |S|=2m+n$, pak je každá hrana $\{x_{i},\neg x_{i}\}, i=1,\dots,n$ pokryta právě jedním vrcholem. Definujme ohodnocení $a$ tak, že $\forall i = 1,\dots,n$ má hodnotu
$$
a(x_{i}) = \begin{cases}
1 &x\in S  \\
0 &x \not\in S
\end{cases}
$$
pokud by zároveň byli v $S$ $x_{i}$ i $\neg x_{i}$ tak to není pokrytí, protože nezbude na trojúhelníky. 

Mějme klauzuli $C_{j}$ a nechť $C_{j} = (l_{1} \lor l_{2} \lor l_{3})$ a $S$ obsahuje 2 vrcholy trojúhelníku $\{ u_{j}, v_{j}, w_{j} \}$, tak jeden není $S$, nechť $u_{j} \not\in S$, pak hrana $\{u_{j},l_{1}\}$ dává, že $l_{1} \in S, a(l_{1}) = 1$ a tedy $C_{j}$ je splněna ohodnocením $a$ a tedy i $a$ splňuje každou $C_{j} \in \varphi$ a je to model.

($\impliedby$) Mějme ohodnocení $a$ a definujme $S$ takto:
1. Pro každé $i=1,\dots, n$ přidáme do $S$ $x_i$, když $a(x_{i})= 1$, jinak přidáme $\neg x_{i}$.
2. Pro každý trojúhelník $\{ u_{j},v_{j},w_{j} \}, j =1,\dots,m$, tak jeden z $l_{1},l_{2},l_{3}$ je splněný pomocí $a$, nechť je to $l_{1}$, pak je $\{ u_{j},l_{1} \}$ pokryta a zbývají ostatní, tak přidáme $v_{j},w_{j}$ do $S$.

Tedy máme $|S|=2m+n$, které je vrcholové pokrytí.

---
# 3-SAT je NP-úplný
*Tvrzení:* $SAT \leq_{m}^P 3-SAT$

*Důkaz:* $C_{j}$ s velikostí menší $3$ dopadujeme a ty $3$ velikosti necháme být.

Zajímají nás $|C_{j}| > 3$, přidáme si proměnné, že vytáhneme první 2 literály přidáme je s novou proměnnou $\lor y$ a do staré klauzule dáme $\lor \neg y$ ohodnocení jsou stále splnitelná.  Iterujeme dokud taková zbývají a to je max $m \cdot n$ krát. 