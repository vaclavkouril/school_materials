# Definice
$(a,b)$-strom pro $a\geq {2}, b \geq 2a -1$ je několika cestný strom splňující 
1. Kořen má $2$ až $b$ dětí, kromě toho když je to i list, ostatní uzly mají mezi $a$ až $b$ ($a-1$ až $b-1$ klíči) dětmi (listy -external nodes jsou bez dat)
2. Všechny external nodes jsou ve stejné hloubce.

*Lemma:* $(a,b)$-strom s $n$ klíči má hloubku mezi $\log_{b} (n+1)$ a $1+\log_{a} \left( \frac{n+1}{2} \right)$.

*Důkaz:* Minimum klíčů je ve stromu, kde každý uzel má $a$ klíčů a kořen má $1$ a $h$ má $0$, protože external nodes jsou bez klíčů, $i$-tá úroveň má $2a$ tedy máme
$$
\overbrace{1}^\text{0.vrstva} + \overbrace{2}^\text{1.vrstva}\cdot\underbrace{ (a-1)}_{\text{počet klíčů v uzlu}} \cdot \sum_{i=1}^{h-1} a^{i-1} = 1+2(a-1) \frac{a^{h-1}-1}{a-1} = 2a^{h-1} -1.
$$
Tedy $n \geq 2a^{h-1}-1$, tedy $h \leq \log_{a} \frac{n+1}{2}$.

Pro horní hranici mějme vyplněno pomocí $b$ všechny vrstvy, až na tu v $h$ s external uzly
$$
\sum_{i=0}^{h-1} b^i(b-1) = (b-1)\frac{b^h-1}{b-1} = b^h-1.
$$
Tedy $n \leq b^h -1 \implies h \geq \log_{b} (n+1)$.

Výška stromu je $\Omega(\log_{b} n)$ a $O(\log_{a} n)$.

---
## Find
Hledání projde v nejhorším případě $O(\log n / \log a)$ vrstev a v každé prohledává v $\log b$ binárně uzlem cestu, tedy pokud je $b$ polynomiálně v $a$, tak $\Theta(\log n)$ vychází vyhledávání, což je optimální, protože pro porovnání je třeba vždy vzít nový z $\log n$ bitů. 
## Insert
Hledáme $x$ a pokud najdeme external node, tak pokud má poslední internal node $< b-1$ klíčů tak konstantně vložíme, jinak musíme udělat Split.

Pro **Split** rozdělíme uzel zhruba na poloviny a prostřední prvek dáme do rodiče, tak aby mohl ukazovat na 2 nové vrcholy, překontrolujeme počet klíčů v rodiči a potenciálně takhle probubláme až ke kořeni v nejhorším dělíme kořen na dva uzly a vložíme kořen nový a maximálně zvýšíme výšku stromu o $1$.

Když rozdělíme $b$ klíčů (přetekl nám počet), tak máme $1$ o patro výše a uzly velikosti $\left\lfloor  \frac{b-1}{2}  \right\rfloor, \lceil \frac{b-1}{2} \rceil$, protože $b \geq 2a-1$, tak $\lfloor \frac{b-1}{2} \rfloor \geq a-1$ klíčů, tedy oba plní definici pro vnitřní uzel $(a,b)$-stromu

Na každé vrstvě navštívíme $\Theta(1)$ uzlů, a na každém uzlu trávíme $O(b)$.
## Delete
Pokud mažeme klíč z jiné než $h-1$ hladiny, tak vezmeme minimum pravého podstromu daného prvku jenž už na $h-1$ je, přesuneme hodnotu za mazanou a mažeme na $h-1$ hladině klíč.

Smažeme $x$ klíč na $h-1$ hladině a při podtečení ($< a-1$) tak převedeme klíč od bratra (BÚNO pravého) pokud má více než $a-1$ klíčů. 

Tedy máme uzel $v$ s $a-2$ klíči a bratr $r$ s $p$ klíčem v rodiči, který je odděluje, vezmeme minimum z $r$ dáme ho za $p$ a $p$ přidáme do $v$ a napravo od něj přepojíme pointer z $r$ na podstrom které minimum odlišovalo.

Pokud nemáme bratra vlevo ani vpravo s moc klíči, tak máme aspoň jednoho bratra s $a-1$ klíči a spojíme je a přidáme i $p$ z rodiče, tedy máme uzel s $(a-1)+(a-2) +1 = 2a -2$ klíči což není nikdy více než $b-1$. Ale podtečení se smazání $p$ v rodiči může propagovat výše.

Podtečením kořene se sníží hloubka stromu. 

V nejhorším případě $\Theta(1)$ návštěv uzlů v jedné vrstvě, $O(b)$ času na uzel a pak ještě hledání, tedy $O(b \log_{a} n)$.

---
# Věta o amortizovaném počtu změn uzlů pro Insert a Delete v $(a,2a)$-stromech
*Pozorování:* $m$ Insertů na prázdném $(a,b)$-stromě provede $O(m)$ změn uzlů.

*Důkaz:* Insert až $O(\log m)$ štěpení. Každé stěpení se ale nestane vždy, protože vždy se přidá nový uzel a 2 změny v dalších uzlech. Na konci máme $\in O(m)$ počet uzlů a každé štěpení přidá aspoň jeden uzel tak počet štěpení je $\in O(m)$.

### *Věta:* $m$ operací Insert a Delete na $(a,2a)$-stromě provede $O(n+m)$ změn uzlů.
$n$ je počet uzlů na začátku.

*Důkaz:* Amortizovaná cena $O(1)$ změn na operaci. Mějme
$$
\Phi = \sum_{v \in V(T)} \phi(v)
$$
vezměme potenciál dle počtu klíčů $k$:
$$
\begin{array}{c:c:c:c:c:c}
   k & a-2 & a-1 & a & a+1 & \dots&2a-2 &2a-1 &2a \\ \hline
   \phi(k) & 2 & 1 & 0 & 0 & 0& 0 & 2 & 4
\end{array}
$$
chceme totiž splnit
- štěpení/spojení $1+ \Delta \Phi \geq 0$,
- Insert/Delete $1+ \Delta \Phi \leq c \in O(1)$,
- $|\phi(k) - \phi (k-1)| \leq c \in O(1)$, splněno pro $c=2$.

Chceme ověřit štěpení
$$
\phi(2a) \geq \phi(a) + \phi(a-1) + \overbrace{ c}^\text{přidání do otce} + 1
$$
tedy vlastně chceme aby potenciál $\phi(2a)$ před štěpením zaplatil za celé stěpení (pravá strana), kde $c =2$
$$
4 \geq 0 + 1 + 2 +1.
$$
Spojení chceme obdobně
$$
\phi(a-2) + \phi(a-1) \geq \phi(2a-2) + c + 1
$$
vychází
$$
2 + 1 \geq 0 + 2+1
$$
mimochodem tady by to pro $b=2a-1$ nevyšlo.

Insert a delete přidají odeberou prvky s $O(1)$ složitostí  a pak se dějí nějaké rozdělení případně spojení
## Co je jiného na $(a,2a -1)$-stromech
Když máme $(a,2a-1)$-strom tak se dá vymyslet posloupnost s velmi častými štěpeními a merge.

Vložíme klíč do podstromu $v$, tak aby $v$ měl $2a-1$ klíčů a tedy overflow a provede se split. Po splitu máme $a-1$ v každém dítěti a jeden klíč do rodiče. Smažeme z jednoho ze dvou nových uzlů, tedy $a-2$ a underflow a bratr $a-1$ nemůže půjčit, tedy se mergenou a to můžeme opakovat navždy.

---
# Výhody
- Cache friendly, aby se uzel vešel do bloku, který se nacpe do cache.
- Split a merge zasahují jen konstatní počet uzlů
- Může se jednoduše paralelizovat
- Vhodné pro velké množství dat
- Variabilita pro databázové struktury pro ukládání dat v listech
---
# Nevýhody
- Horší implementace
- Velké konstanty

---
# Paralelizace
Mějme top-down implementaci s $b\geq2a$ , kde se po cestě u insertu splituji nodes s $b-1$ klíči, což sice může přidat vrchol rodiči, ale ten má méně než $b-1$ protože jsme ho navštívili dříve. Delete zase při průchodu zajišťuje, aby nodes neměli jen $a-1$ klíčů pomocí půjček od bratrů nebo merge, kde opěr máme dost klíčů, protože jsme tam byli dříve. 

Při Insert tak zamykáme rodiče a uzel ve kterém jsme, splitneme pokud je to nutné, pak odemkneme rodiče, zamkneme dítě ve kterém pokračujeme dokud se nedostaneme na místo.

Pro Delete zamykáme rodiče aktuální uzel a pak zámky seřadíme zleva doprava na jedné hloubce. Řešením by mohlo být zamykat dříve než aktuální uzel ještě jeho levého bratra.

Dalším problémem Delete je pokud mažeme někde vysoko, tak můžeme zamykat na dlouho daný uzel než najdeme klíč, kterým ho máme nahradit. To se dá vyřešit nezamykáním, ale prozatimní označení klíče jako smazaného než najdeme jeho náhradníka v podstromu.