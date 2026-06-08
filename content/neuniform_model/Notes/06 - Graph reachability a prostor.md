# Graph reachability a prostor

Zdrojové stránky: ![[../Assets/pages/page-28.png]], ![[../Assets/pages/page-29.png]]

## Graph reachability

Vstup:

- graf $G$,
- vrcholy $s,t\in V(G)$.

Cíl:

Rozhodnout, zda vede z $s$ cesta do $t$.

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

`[sporné čtení konstanty]`.

Otázka:

Lze počítat graph reachability v čase polynomiálním a prostoru

$$
O(\sqrt n)?
$$

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

Možnost: komprese. Problém: $w$ nemusí být komprimovatelný.
