## PCP věta: $NP = PCP_{1,1/2}[O(\log n), O(1)]$
Sestrojíme si graf $G_{\varphi}$, vrchol je přijímající výpočet, nějaká dvojice $(R,Q)$, kde
- $R$ je řetězec náhodných bitů verifieru.
- $Q$ odpovědi na dotazy verifieru na důkaz

$$
(R,Q)\in V(G_{\varphi}) \iff V \text{ přijímá } (R,Q)
$$

graf je poly velký protože logaritmicky mnoho voleb R.

Hrana $(R_{1},Q_{1})(R_{2},Q_{2})$ když jsou konzistentní (pokud čtou stejný bit důkazu tak musí mít stejnou hodnotu)

Kliky jsou konfigurace jenž si neodporují, přijímají a mohou tedy být z jednoho důkazu $\Pi$.

Pokud $\varphi \in SAT$ tak existuje důkaz $\Pi$, že přijímáme pro všechny volby $R$, tedy vezmeme $Q$ dané tímto $\Pi$ a dostaneme $(R,Q_{R})$, kde $R$ jsou všechna a tvoří kliku velikosti $2^{r(n)}$.

Pokud $\varphi \not\in SAT$ pak $clique(G_{\varphi})\leq \frac{1}{2} 2^{r(n)}$. Kdyby existovala větší klika, její vrcholy by byli konzistentní. Z jejich odpovědí jde složit $\Pi$, který by verifier přijal s více než $\frac{1}{2}$ náhodných $R$ a to by porušilo definici pro $PCP_{1,1 /2}$

Pro $r(n)\cdot k$ paralelně opakujme PCP gap check tak aby to kleslo na $s^k$ a pak
1. $\varphi\in SAT \implies clique(G_{\varphi}) = 2^{r(n)k}$
2. $\varphi\not\in SAT \implies clique(G_{\varphi}) =2^{-k} 2^{r(n)k}$

A máme mnohem větší mezeru.

$N=n^c$ je velikost grafu a pak CLIQUE nelze aproximovat v $N^{1-\varepsilon}$