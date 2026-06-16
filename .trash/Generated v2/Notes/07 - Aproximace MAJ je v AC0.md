# Aproximace $MAJ$ je v $AC^0$

Zdrojové stránky: ![[page-11.png]], ![[page-12.png]]

## Aproximační majorita

Definujme částečnou funkci

$$
AMAJ(x)=
\begin{cases}
0, & \sum_i x_i\leq n/4,\\
1, & \sum_i x_i\geq 3n/4.
\end{cases}
$$

Na vstupy s počtem jedniček mezi $n/4$ a $3n/4$ nemáme požadavek.

Tvrzení:

$$
AMAJ\in AC^0.
$$

## Náhodný test jedním bitem

Vybereme náhodně index $i$ a vrátíme $x_i$.

Pokud

$$
\sum_i x_i\leq n/4,
$$

pak

$$
\Pr[x_i=1]\leq 1/4.
$$

Pokud

$$
\sum_i x_i\geq 3n/4,
$$

pak

$$
\Pr[x_i=1]\geq 3/4.
$$

Jeden náhodný bit tedy rozlišuje případy jen s konstantní pravděpodobností.

## Zesílení pravděpodobnosti v konstantní hloubce

Poznámky používají vrstvy AND/OR z nezávislých kopií:

- $C_0(x)=x_i$ pro náhodné $i$,
- $C_1(x)=\bigwedge$ z $O(\log n)$ nezávislých kopií $C_0$,
- $C_2(x)=\bigvee$ z polynomiálně mnoha kopií $C_1$,
- $C_3(x)=\bigwedge$ z polynomiálně mnoha kopií $C_2$.

Smysl:

- v případě málo jedniček je velmi nepravděpodobné, že AND z mnoha vzorků dá $1$,
- v případě hodně jedniček existuje s vysokou pravděpodobností mnoho úspěšných bloků,
- OR a další AND zesílí spolehlivost na všech vstupech.

Výsledkem je náhodný $AC^0$ obvod, který pro každý pevný vstup selže s velmi malou pravděpodobností.

Union bound přes všech $2^n$ vstupů ukáže, že existuje jedna pevná volba náhodných indexů, která funguje pro všechny vstupy.

Tedy existuje deterministický $AC^0$ obvod pro $AMAJ$.
