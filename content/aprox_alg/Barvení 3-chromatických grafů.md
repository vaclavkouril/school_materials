# Barvení 3-chromatických grafů pomocí $O(n^{1 / 2})$ barev
- Dokud existuje vrchol $v$ s $deg(v)\geq \sqrt{ n }$ tak vezmeme $N(v)$
- protože je to 3-obarvitelný $G\implies N(v)$ je bipartitní, nastavíme $2$ nové barvy sousedství a $N(v)$ smažeme z grafu
- Když už $\Delta\leq \sqrt{ n }$, tak hladově obarvi zbytek.

Vrcholů s $\sqrt{ n }$ stupněm můžeme ale mít jen $\leq \sqrt{ n }$ kroků, kde každý využije maximálně $2$ barvy a na zbytek použijeme maximálně $\sqrt{ n }+1$ barev, tedy dohromady
$$
\# \text{barev} \in O(\sqrt{ n }).
$$