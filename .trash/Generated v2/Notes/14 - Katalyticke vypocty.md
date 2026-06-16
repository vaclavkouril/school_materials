# Katalytické výpočty

Zdrojové stránky: ![[page-28.png]], ![[page-29.png]]

## Motivace: graph reachability a prostor

Problém dosažitelnosti v grafu:

Vstup:

- graf $G$,
- vrcholy $s,t$.

Otázka:

$$
\text{existuje cesta z }s\text{ do }t?
$$

BFS/DFS potřebují lineární prostor pro množinu navštívených vrcholů.

Savitchův algoritmus ukazuje:

$$
NSPACE(\log n)\subseteq DSPACE(\log^2 n).
$$

Rekurzivní procedura:

```text
Reach(s,t,k):
    if k <= 1: test edge s -> t
    for u in V:
        if Reach(s,u,k/2) and Reach(u,t,k/2):
            return true
    return false
```

Hloubka rekurze je $O(\log n)$ a v každé úrovni stačí pamatovat několik vrcholů. Prostor je $O(\log^2 n)$.

## Katalytická paměť

Model katalytického výpočtu:

- máme malou pracovní paměť,
- navíc máme velkou pomocnou paměť $w$,
- obsah $w$ je na začátku libovolný,
- během výpočtu lze do $w$ zapisovat,
- na konci musí být $w$ obnoven do původního stavu.

Tedy $w$ funguje jako katalyzátor: může se dočasně účastnit výpočtu, ale nesmí se spotřebovat ani změnit.

Schéma:

```text
pracovní paměť + katalytická paměť w
```

## Proč je to netriviální

Kdyby pomocná paměť byla nulová nebo známá, lze ji normálně použít jako pracovní prostor.

Tady je ale počáteční obsah $w$ libovolný a může nést cizí data. Algoritmus je musí po skončení přesně obnovit.

Poznámky uvádějí problém komprese:

- kdyby šlo $w$ snadno zkomprimovat, mohli bychom uvolnit místo,
- ale $w$ nemusí být komprimovatelné.

Katalytické výpočty studují, zda i tak lze tento prostor využít pro výpočet.

## Vztah k předchozím tématům

Předchozí část o třech registrech a reverzibilních / invertovatelných programech souvisí s tím, že pomocnou paměť lze změnit, pokud ji později přesně vrátíme.

Typická technika:

1. provedeme výpočet a do pomocné paměti uložíme mezivýsledky,
2. výsledek zkopírujeme do pracovní části,
3. výpočet reverzujeme a pomocnou paměť vrátíme.

To je stejná intuice jako u invertovatelných registrových programů.
