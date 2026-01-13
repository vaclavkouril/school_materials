# Definice
*Definice:* Mějme TS $T$ a funkci $f: \mathbb{N} \to \mathbb{N}$ definovaná pro každý vstup, řekneme, že 
- $M$ **pracuje v čase** $f(n)$, pokud výpočet nad libovolným vstupem $x$ délky $n$ skončí po provedení nejvýše $f(n)$ kroků.
- $M$ **pracuje v prostoru** $f(n)$, pokud výpočet nad libovolným vstupem $x$ délky $n$ skončí a využije nejvýše $f(n)$ buněk pásky.

*Definice:* Nechť $f: \mathbb{N}\to \mathbb{N}$ je funkce, pak definujeme třídy:
- $TIME(f(n))$ jazyky přijímané TS, které pracují v čase $O(f(n))$,
- $SPACE(f(n))$ jazyky přijímané TS, které pracují v prostoru $O(f(n))$.

*Věta:* $TIME(f(n))\subseteq SPACE(f(n))$ pro každou funkce $f:\mathbb{N} \to \mathbb{N}$.

*Důkaz:* Stroj v jednom kroku pohne hlavou jen o jednu buňku vpravo nebo vlevo a tedy v každém kroku použije nejvýše jednu buňku navíc.

*Definice:*
- Třída problémů řešitelných v poly čase je $P = \bigcup_{k\in \mathbb{N}} TIME(n^k).$
- Třída problémů řešitelných v poly prostoru je $PSPACE = \bigcup_{k\in \mathbb{N}} SPACE(n^k).$
- Třída problémů řešitelných v exponenciálním čase je $EXPTIME = \bigcup_{k\in \mathbb{N}} TIME(2^{n^k}).$
## Složitost na RAM-u
Instrukce [[RAM]] mají různé ceny a $l(n)$ určuje cenu uložení čísla $n$ do registru:
- $LOAD(C,r_{i}): r_{i} \leftarrow C$, cena je $1$
- $ADD(r_{i},r_{j},r_{k}): r_{k} \leftarrow [r_{i}]+[r_{j}]$, cena je $l([r_{i}]) + l([r_{j}])$
- $SUB(r_{i},r_{j},r_{k}): r_{k} \leftarrow \max([r_{i}]-[r_{j}],0)$, cena je $l([r_{i}]) + l([r_{j}])$
- $COPY([r_{i}],r_{j}): r_{j} \leftarrow [[r_{i}]]$,  cena je $l([r_{i}]) + l([[r_{j}]])$
- $COPY(r_{i},[r_{j}]): r_{[r_j]} \leftarrow [r_{i}]$  cena je $l([r_{i}]) + l([r_{j}])$
- $JNZ(r_{i},I_{z}):\text{if } [r_{i}] \text{ then goto } z$  cena je $l([r_{i}])$
- $READ(r_{i}): r_{i} \leftarrow \text{input}$, cena je $l(input)$
- $PRINT(r_{i}): \text{output } \leftarrow [r_{i}]$, cena je $l([r_{i}])$

a $l(n)$ bereme zpravidla buď jako konstantu, nebo logaritmická, tedy počtem bitů hodnoty $n$, 
$$
l(n) = \begin{cases}
\lceil \log(n+1) \rceil &\quad n \geq 2 \\
1 &\quad n < 2 
\end{cases}
$$
*Definice:* Nechť $f: \mathbb{N}\to \mathbb{N}$ je funkce, 
- RAM $R$ pracuje v čase $f(n)$m pokud pro každý vstup $x$ ceny $n$ je součet cen instrukcí nejvýše $f(n)$.
- RAM $R$

*Věta:* Nechť $L$ je jazyk rozhodnutelný RAMem $R$ v čase $f(n)$. Pak je rozhodnutelný v TS $M$ v čase
- pro konstantní $l(n)$ s $O(f^2(n))$
- pro logaritmickou $l(n)$ s $O(f^3(n))$

*Lemma:* Je-li $M$ více páskový TS s během v čase $O(f(n))$, tak jednopáskový běží v čase $O(f^2(n))$

Obě tvrzení plynou z konstrukce redukcí a zjevně $P$ pro poly čas řešitelné problémy nad TS a RAM je stejná $P$

## Verifikátory
*Definice:* **Verifikátorem** pro jazyk $A$ je algoritmus $V$, pro který platí, že
$$
A=\{ x \mid (\exists y)[V(x,y) \text{ přijme}] \}.
$$
Časová složitost $A$ bereme pouze vzhledem k $|x|$. 

$y$ zveme certifikátem $x$. Polynomiální verifikátor pracuje v čase $O(|x|^k)$ pro nějaké $k \in \mathbb{N}$ tedy i přečte jen poly dlouhý prefix $y$ a polynomiální certifikát má délku poly v čase $|x|$.

*Definice:* $NP$ je třída jazyků, které mají polynomiální verifikátory.
## Alternativní definice NP
Mějme [NTS](Univerzální%20Turingův%20stroj.md##Nedeterministický%20TS) $N$ a nechť $f:\mathbb{N} \to \mathbb{N}$ je funkce a 
- $M$ **pracuje v čase** $f(n)$, pokud **každý výpočet** nad libovolným vstupem $x$ délky $n$ skončí po provedení nejvýše $f(n)$ kroků.
- $M$ **pracuje v prostoru** $f(n)$, pokud **každý výpočet** nad libovolným vstupem $x$ délky $n$ skončí a využije nejvýše $f(n)$ buněk pásky.

Intuitivně tedy práce v čase omezuje hloubku stromu výpočtu a prostor říká, že v každém uzlu je méně než $f(n)$ paměti využito.


*Definice:* Nechť $f: \mathbb{N}\to \mathbb{N}$ je funkce, pak definujeme třídy:
- $NTIME(f(n))$ jazyky přijímané NTS, které pracují v čase $O(f(n))$,
- $NSPACE(f(n))$ jazyky přijímané NTS, které pracují v prostoru $O(f(n))$.

*Věta:* Pro každou funkci platí $f: \mathbb{N} \to \mathbb{N}$ platí
- $TIME(f(n)) \subseteq NTIME(f(n))$
- $SPACE(f(n)) \subseteq NSPACE(f(n))$

*Věta:* (**Alternativní definice $NP$**) 
$$
NP = \bigcup_{k\in \mathbb{N}} NTIME(n^k)
$$

*Důkaz:* ($NP \subseteq  \bigcup_{k\in \mathbb{N}} NTIME(n^k)$) Nechť $L \in NP$ a tedy máme poly verifikátor $V(x,y)$ pro $L$ a konstruujme NTS $N$ přijímající $L$ v poly čase. Mějme $N$ se vstupem $x$:
1. Simulujeme $V(x, \_)$
2. Nedeterministicky zvolme znaky $y$, když je $V$ potřebuje přečíst
3. Když $V$ přijme, tak přijmeme taky, jinak odmítneme.

Platí tedy 
$$
\begin{align*}
x \in L &\iff (\exists y) [V(x,y) \text{ přijme}] \\
&\iff \text{nějaký výpočet } N(x) \text{ přijme} \\
&\iff x \in L(N)
\end{align*}
$$
a tedy $N$ přijímá $L$ v poly čase.

($NP \supseteq  \bigcup_{k\in \mathbb{N}} NTIME(n^k)$) Nechť $L$ je přijímán NTS $N$ a pracuje v poly čase $p(n)$, označme $r := \max_{q \in Q,\sigma \in \Sigma} |\delta(q,\sigma)|$, tedy maximální počet větvení. $r \leq |Q| \cdot |\Sigma| \cdot 3$ a je to konstanta.

Výpočet $N$ se vstupem $x$ lze popsat řetězcem $y \in \{ 1,\dots,r \}^{p(|x|)}$ a $y_{i}$ přirozeně značí větev zvolenou v kroku $i, i=1,\dots,p(|x|)$ a takové $y$ je certifikátem.

Můžeme tedy mít $V(x,y)$ pro $L$:
1. Simulujeme $N(x)$ s větvením dle $y$
2. Pokud větev přijme tak přijmeme, jinak odmítneme
$$
\begin{align*}
x \in L &\iff \text{nějaký výpočet } N(x) \text{ přijme} \\
&\iff (\exists y)[|y| \leq p(|x|) \text{ a simuluje } N(x) \text{ s větvením dle } v \text{ přijme}] \\
&\iff (\exists y)[|y| \leq p(|x|) \land V(x,y) \text{ přijme}]
\end{align*}
$$
---
# $NTIME(f(n))\subseteq SPACE(f(n))$
*Důkaz:* Nechť $L$ je přijímán NTS $N$ v čase $g(n) =O(f(n))$, předpokládejme, že $N =(Q,\Sigma,\delta,q_{0}, F)$ a označme $r := \max_{q \in Q,\sigma \in \Sigma} |\delta(q,\sigma)|$ konstantní větvící faktor, protože $r \leq |Q| \cdot |\Sigma| \cdot 3$. A tedy popíšeme výpočet $N(x)$ pomocí 
$$
y \in \{ 1,\dots,r \}^{g(|x|)}
$$
zjevně $y_{i}$ je zvolená větev v $i$-tém kroku. Popíšeme TS $M$, který rozhoduje $L$ v $O(f(n))$, tedy $M$ nad vstupem $x$:
1. $k \leftarrow 1$
2. Opakujme
	1. Pro všechna $y\in \{ 1,\dots,r \}^k$ simulujme $M(x)$ s větvením dle $y$ a pokud přijme tak přijmeme.
	2. $k \leftarrow k+1$
3. Dokud všechny simulace $M(x)$ větvící dle $y$ odmítly, pak odmítneme.

$N$ pracuje v čase $g(n) = O(f(n))$ a každý výpočet $N(x)$ skončí do $g(n)$ kroků a tedy $M(x)$ skončí výpočet s $k \leq g(|x|)$. A prostor:
- $O(g(n)) = O(f(n))$ je potřeba k uložení $y$
- Prostoru $O(g(n)) = O(f(n))$ je potřeba k simulaci $N(x)$ dle $y$
- Dohromady $M(x)$ pracuje v prostoru $O(f(n))$ 

$L = L(M)$ protože, když $N(x)$ přijme tak simulace přijme s nějakým $y, |y| \leq g(|x|)$ a tedy i $M(x)$ přijme. Pokud nemá $N(x)$ příjímající odpověď, tak pro hodnotu $k = g(|x|)$ simulace s každým $y$ odmítne a tedy i $M(x)$ odmítne

*Důsledek:* $NP \subseteq PSPACE$

---
# Věta o vztahu prostoru a času
Pro TS má sub-lineární paměť smysl jen v případě read-only pásky vstupu a pomocných pásek výpočtu s read-write a write-only výstupní páskou s pohybem jen doprava a prostor je jen použitý prostor výpočetních pomocných pásek.

*Věta:* Pro všechna $f(n) \geq \log n$ a každý jazyk $L$ platí
$$
\forall L \in NSPACE(f(n)) \implies (\exists c_{L} \in \mathbb{N})[L\in TIME(2^{c_{L}f(n)}) ]
$$

*Důsledek:* Je-li $f$ funkce s $f(n) \geq \log n$ a je-li $g(n) = o(f(n))$, pak
$$
NSPACE(f(n)) \subseteq TIME(2^{g(n)}).
$$
*Idea:* $L$ je přijat NTS $N$ v prostoru $O(f(n))$, pro vstup $x$ definujeme graf konfigurací $G_{N,x}$ a $x\in L \iff G_{N,x}$ obsahuje cestu z počáteční konfigurace do nějaké přijímající.

*Důkaz:* Definujme $C^x_{0}$ jako počáteční konfiguraci NTS $N$ v prostoru $f(n)$ a $C_{F}$ přijímající konfiguraci BÚNO je jediná. Graf $G_{N,x} = (V,E)$, kde vrcholy reprezentují možné konfigurace výpočtů $M(x)$ a $(C_{1},C_{2})\in E$ je-li možné přejít z $C_{1}$ do $C_{2}$ pomocí $\delta$. Tedy
$$
N(x) \text{ přijme} \iff G_{N,x} \text{ má cestu mezi } C^x_{0} \text{ a } C_{F}.
$$
Předpokládejme, že $N$ má jednu vstupní pásku a jednu pracovní pásku.

*Lemma:* Uvažme funkci $f(n) \geq \log n$ a NTS $N = (Q, \Sigma,\delta,q_{0},F)$, který pracuje v prostoru $f(n)$, nechť $x$ je vstup délky $n$ a nechť $G_{N,x}$ je odpovídající graf konfigurací. Pak $|2^{c_{N} f(n)}|$ pro nějakou konstantu $c_{N} \in \mathbb{N}$.

*Důkaz lemma:* 
$$
|V| \leq \overbrace{|Q|}^\text{možné stavy} \cdot \overbrace{n}^\text{hlava na vstupní pásce} \cdot \overbrace{f(n)}^\text{hlava na pracovní pásce}  \cdot \overbrace{|\Sigma|^{f(n)}}^\text{slovo na pracovní pásce}
$$
$$
\begin{align*}
|V| &\leq 2^{\log |Q|} \cdot2^{\log n}\cdot2^{\log f(n)} \cdot2^{f(n) \log |\Sigma|} \\
&= 2^{{\log |Q|} + {\log n}+ {\log f(n)} + {f(n) \log |\Sigma|}} \\
&\leq 2^{f(n)({\log |Q|} + 1 + 1+ {\log |\Sigma|})} \quad f(n) \geq \log n
\end{align*}
$$
položíme-li $c_{N} = 2 + {\log |Q|}+ {\log |\Sigma|}$, pak 
$$
|V| \leq 2^{f(n)c_{N}}. \qquad\square
$$
Teď můžeme složit $M$ na vstupu $x$
1. Sestavme $C^x_{0}$ výpočtu $N(x)$
2. Projděme $G(N,x)$ pomocí DFS počínaje v $C_{0}^x$
3. Nalezne-li DFS $C_{F}$ tak přijměme, jinak odmítneme.

Stačí graf generovat dynamicky dle toho v jaké konfiguraci zrovna jsme a dle seznamu sousedů $C$ a tedy $M$ nepotřebuje znát $f(|x|)$.
 
DFS lze v poly čase na RAM i TS a $M$ pracuje v poly čase vůči $|V|$ v čase 
$$
O(|V|^k) \leq O(2^{k c_{M} f(n)}) = O(2^{c_{L}f(n)})
$$
pro nějaké $k \geq 1, c_{L} \ge k c_{M}$.

*Důsledek:* $NL = NSPACE(\log n)$, $P = \bigcup_{k\in \mathbb{N}} TIME(n^k)$
$$
NL\subseteq P
$$
protože 
$$
L \in TIME(2^{c_{L}\log n}) = TIME(n^{c_{L}}) \subseteq P.
$$
*Důsledek:* $NPSPACE = \bigcup_{k\in \mathbb{N}} NSPACE(n^k), EXPTIME = \bigcup_{k\in \mathbb{N}} TIME(2^{n^k})$ máme
$$
NPSPACE \subseteq EXPTIME
$$
protože pro $L \in NPSPACE \implies L\in NSPACE(n^k)$ pro $k \in \mathbb{N}$ máme
$$
L\in TIME(2^{c_{L}n^k}) \subseteq TIME(2^{n^{k+1}}) \subseteq EXPTIME.
$$
---
# Savičova věta
*Věta:* Pro každé $f(n) \geq \log n$ platí 
$$
NSPACE(f(n)) \subseteq SPACE(f^2(n)).
$$

*Důsledek:* $PSPACE = NPSPACE$.

*Idea:* Pořídíme si graf konfigurací a budeme v něm hledat, ale nemůžeme použít DFS/BFS, protože oba jsou polynomiální v $|V|$, ta je ale exponenciální, tedy vezmeme $C^x_{0}, C_{F}$ a pokusíme se rekurzivně zeptat, zda se dá najít cesta, že vyzkoušíme $O(f(n))$ mezi vrcholů v půlce cesty, a tu zase vydělíme, tedy sice bude algoritmus $O(|V|^{\log |V|})$ ale nevyužije moc paměti. Budeme také muset spočíst $f(n)$, abychom věděli jak dlouhá cesta maximálně může být, což je pro algoritmicky nevyčíslitelné funkce netriviální.

*Důkaz:* Mějme NTS $N$ rozhodující jazyk $L$ a vstup $x$, funkci $f(n) \geq \log n$, omezující prostor $N$, vyrobme $G_{N,x}$ graf konfigurací. Chceme najít cestu mezi $C_{0}^x$ a $C_{F}$ mezi $2^{c_{M}f(n)}$ konfiguracemi, tak si pořídíme funkci:

$Reachable(C_{0},C_{1}, k)$:
1. Je-li $C_{0} = C_{1} \lor (C_{0},C_{1})\in E$ přijmeme
2. Je-li $k=0$ odmítneme
3. Pro všechna $C_{m}$ po jednom vyzkoušíme $Reachable(C_{1},C_{m},k-1) \land Reachable(C_{m},C_{2},k-1)$ a odpoví-li oba kladně tak přijmeme.

Algoritmus v každý moment má jen $O(f(n))$ hloubku rekurze a v každé úrovni rekurze si potřebuje pamatovat jen $O(f(n))$ paměti pro $C_{1},C_{2}, C_{m}$ a vždy při znovu vybrání jiného $C_{m}$ může to předešlé zapomenout. Celkem je tedy prostor $O(f^2(n))$.

Potřebujeme ale ještě ošetřit algoritmicky nevyčíslitelná $f(n)$, protože jinak nemůžeme zavolat $Reachable(C_{0}^x, C_{F}, c_{M}f(n))$, takže finální TS $M$ na vstup $x$ vypadá následovně:
1. $i \leftarrow 1$
2. Když $Reachable(C_{0}^x,C_{F}, c_{M} \cdot i)$ pak přijmeme
3. Pro každou konfiguraci $C$ využívající prostor $i+1$ uděláme
	1. Když je $Reachable(C_{0}^x,C, c_{M} \cdot i)$ tak
	2. $i\leftarrow i+1$
	3. $goto$ **2.**
4. odmítneme

Kroky v zanořeném cykly se vlastně ptají, zda zvětšení paměti přidá něco k potenciální cestě a v ten moment, co přidání paměti nepřidá nic do cesty, tak jsme prošli celý strom výpočtu v $O(f^2(n))$ paměti a tedy je to celé TS $M$ rozhodující $L$, který spadá do $SPACE(f^2(n))$.