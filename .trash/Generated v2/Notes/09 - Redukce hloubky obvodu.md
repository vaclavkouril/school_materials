# Redukce hloubky obvodu

Zdrojové stránky: ![[page-12.png]], ![[page-13.png]], ![[page-14.png]], ![[page-15.png]], ![[page-16.png]], ![[page-17.png]], ![[page-18.png]], ![[page-19.png]]

## Cíl

Chceme $ACC^0$ obvod polynomiální velikosti a konstantní hloubky převést na obvod tvaru

$$
SYM\circ AND,
$$

kde:

- nahoře je jedna symetrická funkce,
- dole jsou konjunkce nad nejvýše $\log^{O(1)}n$ proměnnými,
- fan-in horního hradla je $2^{\log^{O(1)}n}$.

Toto je Briegel-Tarui / Yao-Tarui typ redukce hloubky.

## Rozklad modulo $m$

Mějme

$$
m=p_1^{a_1}p_2^{a_2}\cdots p_k^{a_k}.
$$

Pak

$$
m\mid \sum_i x_i
\iff
\forall j:\ p_j^{a_j}\mid \sum_i x_i.
$$

Tedy $MOD_m$ lze vyjádřit pomocí konstantně mnoha testů modulo prvočíselné mocniny.

Důkaz:

- směr $\Rightarrow$ je triviální,
- směr $\Leftarrow$: pokud všechny prvočíselné mocniny z rozkladu $m$ dělí součet, pak jejich nejmenší společný násobek, tedy $m$, dělí součet.

Po této úpravě lze obvod rozvrstvit tak, aby každá vrstva obsahovala jen jeden typ hradel, například:

1. $\neg$ nebo $\lor$,
2. $MOD_p$ pro pevné $p$ v dané vrstvě.

Hloubka zůstane konstantní a velikost polynomiální.

## Nahrazení hradel polynomy

Negace:

$$
\neg y_i\mapsto 1-y_i.
$$

OR se aproximuje náhodným polynomem, například nad $GF(2)$:

$$
r_{OR}(y_1,\dots,y_\ell)
=
1-\prod_{i=1}^{t}\left(1-\sum_{j=1}^{\ell}a_{ij}y_j\right),
$$

kde $a_{ij}$ jsou náhodné koeficienty.

Modulo hradlo:

$$
MOD_p(y_1,\dots,y_\ell)
\mapsto
\left(\sum_{i=1}^{\ell}y_i\right)^{p-1}\pmod p.
$$

Důvod je malá Fermatova věta:

$$
a^{p-1}=1\quad\text{pro }a\neq 0,
$$

zatímco $0^{p-1}=0$.

## Zesílení přes většinu

Po nahrazení hradel polynomy dostaneme náhodný obvod $C''$. Pro pevný vstup $x$:

$$
\Pr[C''(x)\neq C(x)]\leq \frac1{64}.
$$

Vezmeme $n$ nezávislých kopií $C''$ a nahoře dáme $MAJ$. Výsledek označme $C^{(3)}$.

Aby se většina spletla, musí se splést alespoň $n/2$ kopií. Proto

$$
\Pr[C^{(3)}(x)\neq C(x)]
\leq
\binom{n}{n/2}\left(\frac1{64}\right)^{n/2}.
$$

Odhad:

$$
\binom{n}{n/2}\leq 2^n,
$$

$$
\left(\frac1{64}\right)^{n/2}=\frac1{8^n}.
$$

Tedy

$$
\Pr[C^{(3)}(x)\neq C(x)]\leq \frac1{4^n}.
$$

Union bound přes všech $2^n$ vstupů dává

$$
\Pr[\exists x:\ C^{(3)}(x)\neq C(x)]
\leq 2^n\cdot \frac1{4^n}=\frac1{2^n}<1.
$$

Proto existuje fixace náhodných koeficientů, pro kterou $C^{(3)}$ počítá $C$ správně na všech vstupech.

## Problém spojení modulárních vrstev

Máme podobvody reprezentované polynomy modulo $p$.

Horní $MAJ$ nebo $SYM$ ale potřebuje znát skutečný počet jedniček, ne pouze součet modulo $p$.

Pokud sečteme hodnoty modulo $p$, může dojít ke ztrátě informace. Například při $p=2$:

$$
1+1\equiv 0\pmod 2.
$$

To znamená, že součet modulo $p$ nerozliší počet $0$ od počtu $p$.

Proto nestačí jednoduchá substituce polynomů do horní symetrické funkce.

## Speciální polynomy $P_k$

Potřebujeme polynom $P_k$ takový, že pro každý $x$:

$$
x\equiv 0\pmod p\implies P_k(x)\equiv 0\pmod {p^k},
$$

$$
x\equiv 1\pmod p\implies P_k(x)\equiv 1\pmod {p^k}.
$$

Základní polynom:

$$
P_2(x)=3x^2-2x^3.
$$

Pokud $x\equiv 0\pmod p$, pak $x=cp$ a $x^2,x^3$ jsou dělitelné $p^2$. Tedy

$$
P_2(x)\equiv 0\pmod {p^2}.
$$

Pokud $x\equiv 1\pmod p$, pišme $x=1+t$, kde $p\mid t$. Pak

$$
P_2(1+t)=3(1+t)^2-2(1+t)^3=1-3t^2-2t^3.
$$

Členy $t^2,t^3$ jsou dělitelné $p^2$, takže

$$
P_2(x)\equiv 1\pmod {p^2}.
$$

Iterace:

$$
P_{2^i}(x)=P_2(P_{2^{i-1}}(x)).
$$

Indukcí dostaneme:

$$
x\equiv 0\pmod p\implies P_{2^i}(x)\equiv 0\pmod {p^{2^i}},
$$

$$
x\equiv 1\pmod p\implies P_{2^i}(x)\equiv 1\pmod {p^{2^i}}.
$$

Pro obecné $k$ vezmeme $j$ takové, že

$$
2^{j-1}<k\leq 2^j,
$$

a definujeme

$$
P_k=P_{2^j}.
$$

## Jak $P_k$ pomůže

Nechť podobvody dávají bity

$$
b_1(x),\dots,b_M(x)\in\\{0,1\\}.
$$

Polynomy $r_i(x)$ je počítají modulo $p$:

$$
r_i(x)\equiv b_i(x)\pmod p.
$$

Položme

$$
R_i(x)=P_k(r_i(x)).
$$

Pak

$$
R_i(x)\equiv b_i(x)\pmod {p^k}.
$$

Sečteme:

$$
R(x)=\sum_{i=1}^M R_i(x).
$$

Potom

$$
R(x)\equiv \sum_{i=1}^M b_i(x)\pmod {p^k}.
$$

Zvolíme $k$ tak, aby

$$
p^k>M.
$$

Protože skutečný počet jedniček leží mezi $0$ a $M$, je jednoznačně určen svým zbytkem modulo $p^k$.

Tím lze horní symetrickou funkci spojit s modulárními polynomy.

## Roznásobení na AND hradla

Každý polynom nízkého stupně lze rozepsat jako součet monomů

$$
\sum_I c_I\prod_{j\in I}x_j.
$$

Monom

$$
\prod_{j\in I}x_j
$$

je konjunkce proměnných, tedy spodní AND hradlo. Stupeň polynomu určuje fan-in těchto AND hradel.

Po postupném kolapsu vrstev dostaneme obvod tvaru

$$
SYM\circ AND
$$

s fan-inem nahoře

$$
2^{\log^{O(1)}n}
$$

a spodními AND hradly nad

$$
\log^{O(1)}n
$$

proměnnými.
