# Obvody logaritmické hloubky, Booleovské formule

Zdrojové stránky: ![[page-23.png]], ![[page-24.png]], ![[page-25.png]], ![[page-26.png]]

## Třída $NC^1$

$NC^1$ jsou booleovské obvody:

- polynomiální velikosti,
- hloubky $O(\log n)$,
- s binárními hradly $\wedge,\vee,\neg$.

Booleovské formule jsou stromové obvody. Protože strom nemá sdílení mezivýsledků, formule je restriktivnější než obecný obvod.

## Příklad: binární sčítání v $NC^1$

Mějme dvě binární čísla

$$
x,y\in\\{0,1\\}^n.
$$

Pro carry se v poznámkách zavádí výraz $c_{ij}$: pozice $j$ vytvoří carry, který projde až na pozici $i$.

Typicky:

$$
c_{ij}=(x_j\wedge y_j)\wedge\bigwedge_{\ell=i}^{j-1}(x_\ell\vee y_\ell).
$$

Potom carry do pozice $i$ je

$$
c_i=\bigvee_{j=i+1}^{n}c_{ij}.
$$

Výstupní bit je

$$
z_i=x_i\oplus y_i\oplus c_i.
$$

Protože AND a OR přes mnoho vstupů lze vyvážit do hloubky $O(\log n)$, je binární sčítání ve třídě $NC^1$.

## Součet více čísel

Pro součet tří čísel se používá carry-save idea. Z bitů $a_i,b_i,c_i$ vytvoříme dva výstupní bity:

$$
e_i=a_i\oplus b_i\oplus c_i,
$$

$$
f_{i-1}=[a_i+b_i+c_i\geq 2].
$$

Tím se součet tří čísel převede na součet dvou čísel. Opakováním lze sečíst mnoho čísel v logaritmické hloubce.

Důsledky uvedené v poznámkách:

- $x+y\in NC^1$,
- $x\cdot y\in NC^1$,
- $MAJ\in NC^1$.

## Formule a aritmetické výrazy

Poznámky přecházejí k formulím nad okruhem

$$
(R,+,\cdot).
$$

Formule je strom s operacemi $+$ a $\cdot$. Hodnota formule se dá vyhodnocovat registrovým programem. To vede k Ben-Or-Cleveově generalizaci a k Barringtonově větě.
