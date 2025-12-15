#prahové_funkce

*Definice:* Booleovská funkce $f(x_{1},\dots,x_{n})$ se nazývá prahová (lineárně seprabilní) pokud $\exists$ čísla $v_{1},\dots,v_{n}, p\in \mathbb{R}$ (váhy a práh) taková, že
$$
f(x_{1},\dots,x_{n}) = 0 \iff \sum_{i=1}^n v_{i}x_{i} \leq p.
$$
Hyperrovina $\sum_{i=1}^n v_{i}x_{i} = p$ se nazývá separátor funkce $f$ a $(n+1)$-tice $(v_{1},\dots ,v_{n}, p)$ se nazývá (separující) struktura funkce $f$.

Geometricky hyperrovina odděluji true body od false bodů.

*Příklad:* $f(x,y,z) = (x \bar{y}) \lor z$ je prahová funkce pro strukturu například $(1,-1,2,0),(1,-2,3,0),(5,-5,0,3)$ (lze dokázat, že máme nekonečně mnoho struktur).

$g(x,y) = xy \lor \bar{x} \bar{y}$ není prahová, protože nemáme jak v $\mathbb{R}^2$ oddělit $\{(0,0), (1,1)\}$ od $\{ (0,1), (1,0) \}$.

---
*Aplikace:* Máme hodně akcionářů, každý akcionář $i$ má $v_{i} \in \mathbb{N}$ hlasů a usnesení projde s alespoň $p$ hlasy, tedy
$$
\text{usneseni projde} \iff f(x_{1},\dots, x_{n}) = 1 \iff \sum v_{i}x_{i} \geq p \iff \sum v_{i}x_{i} > p \text{ (pro definici)}
$$

*Příklad:* $v_{1} = v_{2}= v_{3} = 50, v_{4}=48, p= 99$, pak je hlasování $v_{4}$ irelevantní a to plyne z definice.

---
# Prahovost a regularita
*Věta 1:* Nechť $f(x_{1},\dots x_{n})$ je prahová funkce se strukturou $(v_{1},\dots,v_{n},p)$ a nechť $1 \le i,j \le n$ libovolné, potom
$$
v_{i} \leq v_{j} \implies x_{i} \preceq_{f} x_{j}.
$$
Pro $x_{i} \sim_{f} x_{j}$ můžou $v_{i} \ne v_{j}$ a tedy nemáme ekvivalenci.

*Důkaz věty 1:* Nechť $X = (x_{1},\dots,x_{n})$, kde $x_{i} = x_{j} = 0$, pak 
$$
\sum_{k=1}^n v_{k} + v_{i} \leq \sum_{k=1}^n v_{k} + v_{j} \implies f(X \cup e_{i}) \le f(X \cup e_{j}).
$$
*Důsledek věty 1:*
1. $v_{i} =v_{j} = x_{i} \sim x_{j}$,
2. Každá pozitivní prahová funkce je regulární (umíme porovnat dle vah a věty 1)

---
# Rozpoznání pozitivních prahových funkcí
#monotonni_funkce 

*Věta 2:* Každá prahová funkce je unate. Přesně pokud $f(x_{1},\dots,x_{n})$ je prahová se strukturou $(v_{1},\dots,v_{n},p)$, pak
1. Pokud $v_{1} > 0$, tak je $f$ pozitivní v $x_{i}$, pokud je $f$ pozitivní v $x_{i}$ a $f$ závisí na $x_{i}$, tak $v_{i} > 0$. 
2. Pokud $v_{i} < 0$, tak je $f$ negativní v $x_{i}$, pokud je $f$ negativní v $x_{i}$ a $f$ závisí na $x_{i}$, tak $v_{i} <0$.
3. Pokud $v_{i} = 0$, tak $f$ nezávisí na $x_{i}$.

*Důkaz věty 2:*
1. zjevná, protože přehozením jedničky nemůžeme dojít k false, protože pozitivní váha jen přidá k sumě. 
2. pokud je takové $f$ negativní v $x_{i}$ tak z 0 na 1 umíme jen odebrat možné true výsledky a tedy to odpovídá negativnosti.
3. můžeme jakkoliv ohodnotit a tedy to není relevantní k vyhodnocení true/false celé funkce.

*Věta 3:* Mějme $f(x_{1},\dots,x_{n})$ prahovou se strukturou $(v_{1},\dots,v_{n},p)$, kde $v_{j} \geq 0$ pro $j = 1,\dots,k$ a $v_{j}<0$ pro $j=k+1,\dots, n$. Pak funkce $g$ definovaná předpisem $g(x_{1},\dots,x_{n}) = f(x_{1},\dots,x_{k}, \bar{x}_{k+1}, \dots,\bar{x}_{n})$ je pozitivní prahová funkce se strukturou $\left( v_{1},\dots,v_{k}, - v_{k+1},\dots,-v_{n}, p - \sum_{i = k+1}^n v_{i} \right)$ (věta platí jako ekvivalence)

*Důkaz 3:* $g(x_{1},\dots,x_{n}) = 0 \overset{\text{?}}{\iff} \sum_{i=1}^k v_{i}x_{i} - \sum_{i=k+1}^n v_i x_i \leq p - \sum_{i=k+1}^n v_i$ platí $\iff$ 
$$
f(x_{1},\dots,x_{k}, \bar{x}_{k+1}, \dots,\bar{x}_{n}) = 0 \iff \sum_{i=1}^k v_{i}x_{i} - \sum_{i=k+1}^n v_i (1-x_i) \leq p
$$

*Věta 4:* Nechť $f(x_{1},\dots,x_{n})$ prahová funkce se strukturou $(v_{1},\dots,v_{n},p)$, která je celočíselná, pak $f^d$ je prahová funkce se strukturou $\left( v_{1},\dots,v_{n},\sum_{i=1}^n v_{i} -  p -1\right)$

*Důkaz věty 4:* 
$$
f^d(x) = 0 \iff \bar{f}(\bar{x}) = 0 \iff f(\bar{x}) = 1 \iff \sum_{i=1}^n v_{i}(1-x_{i})> p \iff 
$$
$$
\iff \sum_{i=1}^n v_{i} - \sum_{i=1}^n v_{i} x_{i}> p \iff \sum_{i=1}^n v_{i} x_{i} < \sum_{i=1}^n v_{i} -p \overset{\text{celočíselnost}}{\iff} \sum_{i=1}^n v_{i} x_{i} \leq \sum_{i=1}^n v_{i} -p -1
$$
*Důsledek věty 4:* 
1. $p \leq \sum_{i=1}^n v_{i} -p -1$ ($\iff p \leq \frac{1}{2} (\sum_{i=1}^n v_{i} -1)$) $\implies f^d \leq f$,
2.  $p \geq \sum_{i=1}^n v_{i} -p -1$ ($\iff p \geq \frac{1}{2} (\sum_{i=1}^n v_{i} -1)$) $\implies f \leq f^d$.

*Poznámka:* Celočíselnost není úplně nutná, protože vždy najdeme $\epsilon >0$ takové, aby důkaz prošel pro $\sum_{i=1}^n v_{i} -p -\epsilon$ (false bodů je konečně mnoho a plní-li všechny $<$ tak existuje $\epsilon$ aby byli $\le$). Avšak dá se ukázat, že každá prahová funkce má racionální strukturu a tu můžeme BÚNO přeškálovat.

---
# Charakterizace a rozpoznání prahových funkcí
Mějme $f$ pozitivní prahovou funkci danou kanonickou CNF $F$ a předpokládejme:
1. $x^1,x^2,\dots,x^k$ jsou všechno minimální True pointy $f$ $\stackrel{1-1}{\leftrightarrow}$ klauzule $f^d$,
2. $y^1,y^2,\dots,y^l$ jsou maximální False pointy $f$ $\stackrel{1-1}{\leftrightarrow}$ klauzule $f$,

obojí je z dualizace a Pozorování 1. z [[Dualizace]]. Pak
$$
\sum_{i=1}^n w_{i}x^j_{i} \geq (t+1) \text{ pro } j \in \{ 1,\dots,k \}
$$
$$
\sum_{i=1}^n w_{i}x^j_{i} \leq t \text{ pro } j \in \{ 1,\dots,l \}
$$
pro $w_{1},\dots, w_{n},t \geq 0$.

## Algoritmus rozpoznání prahových funkcí
Potřebujeme pracovat s kanonickou CNF, protože neumíme efektivně rozpoznat, zda je nějaká funkce pozitivní a nemáme rychlou ani redukci z CNF na kanonické.

_Vstup:_ Kanonická CNF $F$ funkce $f$.
1. Transformujme $F$ na pozitivní CNF $F^P$ flipnutim všech negativních literálů.
2. Otestujeme, zda $F^P$ reprezentuje regulární funkci $f^P$ (v $O(m^2n^2)$ pomocí [Algoritmus 3](Regulární%20funkce.md#Rozpoznávání%20regulárních%20funkcí#Algoritmus%203))
	1. Pokud test odpoví Ne $\to$ Ne
	2. Jinak zkonstruujeme $F^D$ ( v $O(m^2n^2)$)
	3. Zkonstruujeme systém nerovností a vyřešíme je pomocí lineárního programování (v poly-čase)
$$
\begin{align*}
w_{1},\dots, w_{n},t &\geq 0 : \\
\sum_{i=1}^n w_{i}x^j_{i} &\geq (t+1) \text{ pro } j \in \{ 1,\dots,k \} \\
\sum_{i=1}^n w_{i}x^j_{i} &\leq t \text{ pro } j \in \{ 1,\dots,l \}
\end{align*}
$$
3. Pokud program nemá řešení, tak Ne
4. Pokud máme řešení $w_{1},\dots,w_{n},t$ tak odpovíme Ano a strukturu $f^P$.