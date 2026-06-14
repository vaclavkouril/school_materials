# Graph reachability
Vstup:
- graf $G$,
- vrcholy $s,t\in V(G)$.

Cílem je rozhodnout, zda vede z $s$ cesta do $t$.

Základní algoritmy:
- Dijkstrův algoritmus,
- BFS,
- DFS,
- ...

Všechny potřebují prostor $\Omega(n)$.
## Savitchův algoritmus
Rekurzivní procedura:
```text
Reach(s,t,k):
    if k <= 1 return [(s,t) in E(G)];
    for u in V(G) do
        if Reach(s,u,k/2) & Reach(u,t,k/2)
            then return true;
    return false;
```

Idea: cesta délky nejvýše $k$ z $s$ do $t$ existuje právě tehdy, když existuje prostřední vrchol $u$, takže vede cesta délky nejvýše $k/2$ ze $s$ do $u$ a cesta délky nejvýše $k/2$ z $u$ do $t$.

Hloubka rekurze je $\log n$ a v každé úrovni stačí pamatovat aktuální vrchol a parametry rekurze.

Odhady:
- hloubka rekurze: $\log n$,
- stav rekurze: asi $2n$ nebo $O(\log n)$ bitů podle kódování,
- čas: $n^{\log n}$,
- prostor: $\log n \cdot O(\log n)=O(\log^2 n)$.

Důsledek:
$$
DSPACE(\log n) \subseteq NSPACE(\log n) \subseteq DSPACE(\log^2 n).
$$
Obecně:
$$
DSPACE(s) \subseteq NSPACE(s) \subseteq DSPACE(s^2).
$$
## Polynomiální algoritmy pro reachability
Poznámka v rukopisu: nejlepší polynomiální algoritmus používá prostor přibližně
$$
O\left(\frac{n}{2^{\sqrt{\log n}}}\right)
$$
---
## Katalytický výpočet

Model:
- klasická pracovní paměť je malá,
- existuje velká „katalytická paměť“ $w$,
- její obsah může být během výpočtu měněn,
- na konci výpočtu musí být obnoven původní obsah.

Schéma:
```text
pracovní paměť + katalytická paměť w
```

Poznámka:

Lze libovolně zapisovat na tento další prostor, ale počáteční obsah je nutné vrátit.

Možnost: komprese. Problém: $w$ nemusí být komprimovatelný, protože to může být náhodný (kolmogorovsky) obsah.

---
Mějme 
- start $s$ jako jeden z vrcholů a $c$ jako cíl
- $O(\log n)$ paměti
- $n^{O(1)}$ katalytické paměti

Mějme $G=(V,E)$, kde $V= \{ v_{1},\dots,v_{n} \}$ a definujeme tabulku 
$$
D[t,i] = 1 \iff \exists \text{cesta } s\leadsto v_{i}\text{ délky}\leq t.
$$
Pro $t=0$ máme $D[0,s]=1; i\ne s: D[0,i]=0$ a pro $t>0$ máme
$$
D[t,i] = D[t-1,i] \lor \bigvee_{v_{i}v_{j}\in E} D[t-1,j].
$$
Cesta má v takovém grafu maximálně délku $n-1$ a tedy existuje cesta, když $D[n,t]=1$.

Klasický DP, by potřeboval $n^2$ velkou tabulku, ale my ji uložíme do katalytické paměti a pracovní paměť drží jen $t,i,j$, upravíme si DP, aby počítal cesty a nebyl jen binární.

Uděláme
0. zapamatujeme si stav $stav := D[n,c]$
1. $t'=n,n-1,\dots,1:D[t,i]-= D[t'-1,i] + \sum_{j\in \{ 1,\dots,n \},v_{j}v_{i}\in E} D[t'-1,j]$
2. $D[1,s]++$
3. $t=1,\dots,n: D[t,i] += D[t-1,i] + \sum_{j\in \{ 1,\dots,n \},v_{j}v_{i}\in E} D[t-1,j]$
4. Zjistíme zda $D[n,c] - stav>0$ a to bude odpověď
5. opakujeme 1. krok
6. $D[1,s]--$
7. opakujeme 3. krok
8. vrátíme zda byl rozdíl mezi stavy