# Množiny
*Definice:* Množina nechť je základním objektem teorie množin (uvažujme Zermleovu a Fraenkenovu teorii).
Jazykem dané teorie množin rozumíme symboly:
1. proměnné pro množiny
2. binární predikátový symbol rovnosti $=$
3. binární predikátový symbol náležení $\in$
4. symboly logiky jako $\neg$ negace, $\land$ konjunkce, $\lor$ disjunkce, $\to$ implikace, $\leftrightarrow$ ekvivalence
5. kvantifikátory $\forall$ obecný a $\exists$ existenční
6. pomocné další symboly jako třeba závorky

Základní jazyk také rozšíříme o symboly $\subseteq, \subset$. Říkáme, že množina $x$ je *podmnožinou* $y$ a píšeme $x \subseteq y$, platí-li $(\forall a)(a \in x \to a \in y)$. Říkáme o $x$, že je *vlastní podmnožinou* y a píšeme $x \subset y$, je-li $x\subseteq y$ a $x \neq y$. Symboly zveme inkluzemi.

**Potenční množinu**, jenž jest složena ze všech podmnožin dané množiny $a$, zavádíme jako
$$
\mathscr{P}(a) = 2^a = \{ x: x \subseteq a \}.
$$

**Suma** na množině $a$ je definovaná výrazem
$$
\bigcup a = \{ x: (\exists y)(x\in y \land y \in a) \}.
$$
# Třídy
Každá formule $\varphi(x)$ určuje soubor všech množin $x$, pro které platí, značme ho výrazem
$$
\{ x : \varphi(x) \}.
$$
Takovému zápisu za předpokladu, že $\varphi(x)$ je formule jazyka teorie množin, říkáme ***třídový term***.
Tento soubor zveme **třídou**, určenou formulí $\varphi(x)$.
Máme navíc dva typy tříd:
1. množina, tedy platí-li formule
$$
(\forall x)(x\in z \leftrightarrow \varphi(x)) 
$$
	pro nějakou formuli $z$
2. jinak ji říkáme **vlastní třídou**

**Univerzální třídu** značíme $V$.

*Definice:* Kartézský součin tříd $A,B$ je třída
$$
A \times B = \{ \langle a,b\rangle: a\in A \land b \in B \} = \{ x: (\exists a)(\exists b)(x = \langle a,b \rangle \land a \in A \land b \in B ) \}.
$$

*Lemma:* Pro libovolné množiny $x,y$ je $x \times y$ také množina.
*Důkaz:* Vzhledem k tomu, že se dá jednoduše ověřit platnost
$$
(A \subseteq A_{1} \land B \subseteq B_{1}) \to (A\times B \subseteq A_{1}\times B_{1}),
$$
tak berouc $z = x \cup y$ je pravdou $x \times y \subseteq z \times z$. Dle schématu vydělení stačí dokázat $z \times z$ je množinou. A tedy vezměme libovolný prvek $\langle u,v \rangle z \times z$, tedy $u,v \in z$. Potom
$$
\{ u \} \subseteq z, \quad \{ u,v \} \subseteq z,
$$
a proto máme $\{ u \} \subseteq \mathscr{P}(z)$, $\{ u,v \} \subseteq \mathscr{P}(z)$. 
Opakováním naší úvahy dostáváme $\{ \{ u \}, \{ u,v \}\} = \langle u,v \rangle \subseteq \mathscr{P}(z)$, odkud nám z definice potenční množiny plyne $\langle u,v \rangle \in \mathscr{P}(\mathscr{P}(z))$. A máme tedy, že 
$$
z \times z \subseteq \mathscr{P}(\mathscr{P}(z)),
$$
a dle axiomu potence víme o pravé straně inkluze množina. Proto $z \times z$ a tedy i $x \times y$ je také množina.

# Relace
*Definice:* Třída $R$ je relace, je-li $R \subseteq V \times V$. Píšeme $\langle x,y \rangle \in R$ jako $xRy$. 
	Navíc je-li $R \subseteq V^n$ pro $n \ge 2$, říkáme, že $R$ je $n$-ární relace.

*Definice:* binární relace mezi množinami $X,Y$ je  množina $R \subseteq X\times Y$.
*Příklady relací:* 
-  $\emptyset\dots$ prázdná
- $X \times Y\dots$ univerzální
- $\Delta_{X} = \{ (x,x) \ | \ x\in X \}\dots$ diagonální
- $R^{-1}: \{ (y,x)\ | \  (x,y)\in R \}\dots$ inverzní
- $x(R  \circ S)z \equiv \exists y\in Y: xRy \land ySz$

*Definice:* Třída 
$$
\text{Dom}(X) = \{ u: (\exists v)(\langle u,v \rangle) \in X \}
$$
se nazývá **definiční obor** třídy $X$. Třída 
$$
\text{Rng}(X) = \{ v: (\exists u)(\langle u,v \rangle) \in X \}
$$
se nazývá **obor hodnot** třídy $X$.

Zjevně pro libovolnou relaci $X$ platí
$$
X \subseteq \text{Dom}(X) \times \text{Rng}(X).
$$

### Elementární vlastnosti relací:
Říkáme, že relace $R$ je na třídě $A$
1. *reflexivní*, jestliže pro libovolný prvek $x\in A$ platí $\langle x,x \rangle \in R$
2. *anti-reflexivní*, jestliže pro žádný prvek $x\in A$ neplatí $\langle x,x \rangle \in R$
3. *symetrická*, jestliže pro libovolné $x,y\in A$ platí $\langle x,y \rangle \in R \to \langle y,x\rangle \in R$
4. *slabě antisymetrická*, jestliže pro libovolné $x,y\in A$ platí $\left(\langle x,y \rangle \in R \land \langle y,x\rangle \in R\right) \to x=y$
5. *slabě antisymetrická*, jestliže pro libovolné $x,y\in A$ platí $\langle x,y \rangle \in R \to \langle y,x\rangle \notin R$
6. *trichotomická*, jestliže pro libovolné $x,y\in A$ platí $\langle x,y \rangle \in R \lor \langle y,x \rangle \in R \lor x=y$
7. *tranzitivní*, jestliže pro libovolné $x,y,z\in A$ platí $\left(\langle x,y \rangle \in R \land \langle y,z \rangle \in R \right) \to \langle x,z \rangle \in R$

# Ekvivalence
*Definice:* Relace $R$ na $X$ je ekvivalence $\equiv R$ je tranzitivní, symetrická a reflexivní.
*Definice:* Třída ekvivalence $R$ prvku $x$ je $\{ y\in X  \ | \ \langle x,y \rangle \in R \}$, třídu značíme $R[x]$.

Rozkladové třídy jsou právě třídy ekvivalence na ekvivalenci $R$.
![[Excalidraw/ekvival_tridy.svg|right|200]]
# Částečná uspořádání
*Definice:* Uspořádání je relací $R$ na třídě $A$, je-li $R$ reflexivní, antisymetrické a tranzitivní.
Máme několik poddruhů:
1. lineární $\leq$: $\forall x,y\in A: x\leq y \lor y \leq x$ 
2. částečné uspořádání je uspořádání nelineární![[Excalidraw/hasseuv_diagram.svg|100|right]]
3. ostré: mějme $\le$ uspořádání, platí-li $\forall x,y \in A: x < y \equiv x \le y \land x \neq y$

*Definice:* Mějme třídu $A$, uspořádání $\le$ na této třídě a mějme $X\subseteq A$. O prvku $a \in A$ říkáme, že je
1. *majoranta* nebo *horní mez* třídy $X$, jestliže $(\forall x\in X)(x\le a)$,
2. *maximální prvek* třídy $X$, je-li $a\in X$ a $(\forall x\in X)(\neg a<x)$,
3. *největší prvek* třídy $X$, je-li $a$ *majoranta* $X$ a $a \in X$.
4. *supremum* třídy $X$, je-li $a$ nejmenší prvek třídy všech majorant třídy $X$.
5. *minoranta* nebo *dolní mez* třídy $X$, jestliže $(\forall x\in X)(x\ge a)$,
6. *minimální prvek* třídy $X$, je-li $a\in X$ a $(\forall x\in X)(\neg a>x)$,
7. *nejmenší prvek* třídy $X$, je-li $a$ *minoranta* $X$ a $a \in X$.
8. *infimum* třídy $X$, je-li $a$ největší prvek třídy všech minorant třídy $X$.

*Definice:* Mějme částečně uspořádanou množinu $(X, \le)$, pro ni definujeme
- Řetězec $A \subseteq X$ platí-li $\forall a,b \in A: (a \le b) \lor (b\le a)$, tedy jsou porovnatelné
	- značíme $\omega(X,\le)$ jako délku nejdelšího řetězce
- Antiřetězec $A \subseteq X$ je množina, kde žádné dva prvky nejsou porovnatelné (nezávislá množina)
	- $\alpha(X,\le)$ je délka největšího antiřetězce

*Věta:* (O dlouhém a širokém) Pro každou (konečnou) částečně uspořádanou množinu $(X,\le)$ platí 
$$
|X| \le \alpha(X,\le)\cdot\omega(X,\le).
$$
*Důkaz:* Iterativně prozkoumáme celou množinu $X$ a sice tak, že v prvním kroku vezmeme minimální prvky do množiny $M_{1} = \{ x \in X \ |\ x \text{ je minimální v} \le \}$. Zavedeme si $X_{1} = X \setminus M_{1}$.

Pokračujeme až máme posloupnost $M_{1}, M_{2}, \dots, M_{k}$, kde $k \le \omega(X,\le)$, protože výběrem vždy minimálních prvků v $X_{i-1}$, existuje posloupnost výběrů, že $\forall a_{i} \in M_{i}, \exists a_{i+1} \in M_{i-1}: a_{i-1} \le a_{i}$. Kdyby takový prvek neměl existovat tak nalezneme spor s volbou minimálního prvku při konstrukci. 

Zároveň platí $\forall i\in \{ 1,2,\dots,k \}:|M_{i}| \leq \alpha(X,\le)$, protože každá $M_{i}$ je nezávislá množina, tedy její prvky mezi sebou nejsou porovnatelné, jinak bychom našli spor s minimalitou volby. 

Kombinací odhadů nám vychází
$$
|X| = \sum_{i=1}^k |M_{i}| \le \alpha(X,\le)\cdot\omega(X,\le).
$$
