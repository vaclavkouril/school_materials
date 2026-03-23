# Polynomiální hierarchie
*Definice:* Pro třídu jazyků $\mathscr{C}$ definujeme $\text{co-}\mathscr{C}$ jako 
$$
\text{co-}\mathscr{C} = \{ \overline{L} \mid L \in \mathscr{C} \}, \text{pro } \overline{L} = \Sigma^* \setminus L.
$$
*Definice:* Třídy jazyků $\Sigma_{0}, \Sigma_{1},\Sigma_{2},\dots$, $\Pi_{0},\Pi_{1},\Pi_{2},\dots$, $\Delta_{0},\Delta_{1},\Delta_{2},\dots$ definujme přepisem
- $\mathcal{P} = \Sigma_{0} = \Pi_{0} = \Delta_{0}$,
- $\forall k\geq{0}: \Sigma_{k+1} = NP(\Sigma_{k})$,
- $\forall k\geq 0:\Pi_{k+1} = \text{co-}NP(\Sigma_{k})$,
- $\forall k\geq 0: \Delta_{k+1} = P(\Sigma_{k})$.

*Definice:* Strukturou, které říkáme **Polynomiální hierarchie**, rozumíme $\mathcal{PH}= \bigcup_{k=0}^\infty \Sigma_{k}$.
- $\Sigma_{1} = NP(\mathcal{P}) =\mathcal{NP}$, 
- $\Sigma_{2} = NP(\mathcal{NP})$
- Pokud $\mathcal{P} = \mathcal{NP}$, pak $\mathcal{PH}$ kolabuje a $\mathcal{PH}= \mathcal{P}$.

### *Věta:* $\mathcal{PH} \subseteq PSPACE$
*Důkaz:* Indukce na $k$, kde pro $k=0$ máme $\Sigma_{0} = \mathcal{P} \subseteq PSPACE$.

Předpokládejme, že $\Sigma_{k} \subseteq PSPACE$, pak máme $\Sigma_{k+1} \stackrel{\text{def.}}{=} NP(\Sigma_{k}) \stackrel{}{\subseteq} PSPACE(\Sigma_{k}) \stackrel{\text{IP}}{\subseteq} PSPACE(PSPACE) \stackrel{\text{?}}{=} PSPACE$, stačí tedy dokázat $PSPACE(PSPACE) \subseteq PSPACE$, protože druhá strana je triviální.

Mějme $B\in PSPACE(PSPACE)$, tedy pro něj existuje DTS $M$ s orákulem $A$, který ho v polynomiálním prostoru rozhoduje $B = L(M,A)$, protože $A\in NSPACE$, tak pro něj existuje DTS $M'$, který $A$ rozhoduje v polynomiálním prostoru. Zkonstruujme $M''$ s $L(M'') = B$, který
1. Simuluje $M$ dokud nedojde na $\text{DOTAZ}$.
2. Simuluje se $M'$ v poly-prostoru a vydá odpověď na $\text{DOTAZ}$, jako $\text{Ano}$/$\text{Ne}$. (smaže se páska)
3. Pokračujeme v simulaci $M$ s dotazy na simulované orákulum dokud přijme/odmítne.

$M$ z definice pracuje v polynomiálním prostoru, stejně jako $M'$, takže $M''$ rozhoduje jazyk $B$ v polynomiálním prostoru, protože i kdyby $M$ více než polynomiálně-krát vyvolalo $\text{DOTAZ}$ tak to nevadí, protože se vždy na oracle pásce jen znovu spustí $M'$, takže se jen znovu užívá stejného polynomiálně velkého prostoru.

Dostáváme tedy, že $\forall A \in PSPACE(PSPACE): A \in PSPACE$, takže platí indukční krok.

---
### *Věta:* $\mathcal{PH} = \bigcup_{k=0}^\infty \Sigma_{k} = \bigcup_{k=0}^\infty \Pi_{k} = \bigcup_{k=0}^\infty \Delta_{k}$.
*Důkaz:*

---
# Úplnost
*Věta:* (A) $L \in co-NP$, (B) $L\in NPÚ \implies co-NP = NP$.

*Důkaz:* Mějme $L' \in NP$ libovolný. Z (B) dostáváme existenci DTS $M$ transduceru, který v polynomiálním čase pro vstup $x$ rozhodne
$$
x\in L' \iff M(x)\in L, \quad x \in \overline{L'} \iff M(x) \in \overline{L}.
$$
Zároveň z (A) dostáváme existenci NTS akceptoru $N$ pracujícího v polynomiálním čase a rozpoznávající jazyk $\overline{L} = L(N)$.

Zřetězíme-li $M,N$, tak vznikne NTS $T$ takový, že
$$
\overline{L'} = L(T) \implies \overline{L'} \in NP \implies L' \in co-NP.
$$
Navíc tuto konstrukci můžeme zobecnit pro $\forall k: \Sigma_{k}, \Pi_{k},\Delta_{k}$ a máme $\Sigma_{k} \cup \Pi_{k} \subseteq \Delta_{k+1}$.

*Tvrzení:* $NP \neq co-NP$, pak by $\Sigma_{1} \cup \Pi_{1} \subsetneqq \Delta_{2}$.

*Důkaz:* Mějme $L = \{ (\mathcal{F}_{1}, \mathcal{F}_{2}) \mid \mathcal{F}_{1} \in SAT, \mathcal{F}_{2} \in UNSAT \}$, $\mathcal{F}_{1},\mathcal{F}_{2}$ jsou úplné jazyky pro $NP,co-NP$, pak
1. $L\not\in NP$ pro spor předpokládejme opak, tedy $L' = \{ (1, \mathcal{F}_{2}) \mid \mathcal{F}_{2} \in UNSAT \} \in NP$, víme, že $L'$ je $co-NP$ úplný a tedy $NP = co-NP$ a tedy spor.
2. $L\not\in co-NP$ sporem mějme $L'=\{ (\mathcal{F}_{1}, 0)\mid \mathcal{F}_{1} \in SAT \} \in co-NP$, pak máme $L\in\Delta_{2} = P(NP) = P(co-NP)$ protože nám stačí orákulum  na $SAT$, z $NP$.
![linsatlinunsat](linsatlinunsat.svg)
---
# Věta o vztazích mezi $\Sigma_{k},\Pi_{k},\Delta_{k}$
### *Lemma 1:* $\mathcal{C}$ je libovolná třída jazyků z $\mathcal{PH}$ (tedy z $\Sigma_{k},\Pi_{k},\Delta_{k}$) pak $\forall A: A\in \mathcal{C} \iff A^* \in \mathcal{C}$, kde $A^* = \{ x\mid \exists n, \exists y_{1}\in A, \exists y_{2}\in A\dots \exists y_{n}\in A: x = (y_{1},y_{2},\dots,y_{n}) \}$.
Implicitně předpokládáme, že $(y_{1},y_{2},\dots,y_{n})$ nejsou v abecedě $A$, (tedy že oddělovače nejsou součástí abecedy jazyka $A$). 

*Důkaz:* $A^* \in \mathcal{C} \implies A\in \mathcal{C}$, protože $A \subseteq A^*$ pro $n=1$.

$A\in \mathcal{C} \implies A^* \in \mathcal{C}$ dokážeme rozborem případů:
1. $\mathcal{C} = \mathcal{P} = \Sigma_{0}=\Pi_{0}=\Delta_{0}=\Delta_{1}$ a máme $A\in \mathcal{P}\implies$ existuje DTS $M$ takový, že $A=L(M)$, na vstup $x=(y_{1},y_{2},\dots,y_{n})$ postupně spustíme $M$ $n$-krát a přijme $x\iff M$ přijal všechna $y_{i}$.
2. $\mathcal{C} = \Delta_{k}, k\geq 1$, tak funguje stejný argument jako pro (1.), pouze $M$ stroj s orákulem na jazyk z $\Sigma_{k-1}$.
3. $\mathcal{C}= \Sigma_{k}, k\geq{1}:A\in \Sigma_{k}\implies$ existence NTS $M:A=L(M,B)$ pro nějaké $B\in \Sigma_{k-1}$. Spustíme $M$ paralelně na všechny $y_{1},y_{2},\dots,y_{n}$ a pokud jeden odmítne tak odmítneme.
4. $\mathcal{C}=\Pi_{k}, k\geq {1}$, mějme $A\in \Pi_{k}$, takže $co-A\in \Sigma_{k}$, pro který existuje NTS $M$ s $co-A=L(M,B),B\in \Sigma_{k-1}$ a dle předešlého kroku máme $co-A^*\in \Sigma_{k}$ a $x=(y_{1},y_{2},\dots,y_{n})\in co-A^* \iff \exists {i}: y_{i}\in co-A$ a pomocí takového můžeme rozhodovat i $\Pi_{k}$.
---
### *Lemma 2:* $\mathcal{C}$ je libovolná třída jazyků a nechť $A,B,C\in \mathcal{C}$. Pak jazyk $D\in \mathcal{C}$, kde $D=\{ (x,y,z)\mid x\in A, y\in B, z\in C\}$.
*Důkaz:* Idea stejná jako u *Lemma 1*, ale museli bychom brát konkrétní případy kombinace trojic.

---
*Definice:* Mějme $p(n)$ polynom a nechť $\mathcal{C}$ je třída jazyků, pak definujme
1. $\exists^{p(n)}x:R(x)$ znamená, že $\exists x:(|x|\leq p(n)) \land(x \text{ má vlastnost }R)$,
2. $\forall^{p(n)}x: R(x)$ znamená, že $\forall x: (|x|\leq p(n)) \land (x \text{ má vlastnost }R)$.
3. $A\in \exists \mathcal{C}$ pokud platí $\exists B \in \mathcal{C}, \exists p(n): x \in A \iff \exists^{p|x|} y: \left\langle x,y \right\rangle \in B$, jinými slovy existuje certifikát v polynomiální velikosti vzhledem k vstupu, který nám dovoluje $A$ rozhodovat pomocí jazyku v $\mathcal{C}$.
4. $A\in \forall \mathcal{C}$ pokud platí $\exists B\in \mathcal{C}, \exists p(n): x\in A \iff \forall^{p|x|}y: \left\langle x,y \right\rangle \in B$.

O $\mathcal{C}$ řekneme, že je uzavřená na zdrojování, pokud $\forall A\in \mathcal{C}: B= \{ \left\langle x,y \right\rangle \mid x\in A \} \in \mathcal{C}$, všechny v $\mathcal{PH}$ jsou takto uzavřeny.

---
### *Věta 1.:* Nechť $\mathcal{C}$ je libovolná třída jazyků, pak $A \in \exists C \iff \overline{A}\in \forall C$. Neboli platí, že $co-\exists \mathcal{C}=\forall(co-\mathcal{C})$. Pokud je $\mathcal{C}$ uzavřené na zdrojování, tak $\mathcal{C} \subseteq \exists\mathcal{C}, \mathcal{C} \subseteq \forall\mathcal{C}$.
*Důkaz:* Mějme $A\in \exists \mathcal{C}\implies \exists B\in \mathcal{C}, \exists p(x):x\in A\iff \exists^{p(|x|)} y: \left\langle x,y \right\rangle \in B$ a tedy $x\not\in A\iff \forall^{p(|x|)}y:\left\langle x,y \right\rangle\not \in B$ a to je definice $\overline{A}\in \forall C$, kde to $co-B$ je rozpoznávající.

Protože $\mathcal{C}$ je uzavřené na zdrojování, tak $A\in \mathcal{C}\implies B=\{ \left\langle x,y \right\rangle \mid x\in A \} \in \mathcal{C}$ a to jsou přesně prvky v $\forall \mathcal{C},\exists \mathcal{C}$.

---
### *Věta o vztazích $\mathcal{PH}$* 
1. $\exists P =NP$
2. $\forall P=co-NP$
3. $k>0:\exists\Sigma_{k} = \Sigma_{k}$
4. $k>0:\exists\Pi_{k} = \Pi_{k}$
5. $k>0: \exists \Pi_{k}=\Sigma_{k+1}$
6. $k>0: \forall \Sigma_{k} = \Pi_{k+1}$

*Důkaz:*
- (1.) $\implies$ (2.), protože $co-\mathcal{NP} \stackrel{\text{1.}}{=} co-\exists \mathcal{P} \stackrel{\text{Věta 1.}}{=} \forall(co-\mathcal{P}) = \forall \mathcal{P}$.
- (3.) $\implies$ (4.), protože $\forall\Pi_{k}=\forall (co-\Sigma_{k}) = co-\exists\Sigma_{k} \stackrel{3.}{=} co-\Sigma_{k} = \Pi_{k}$.
- (5.) $\implies$ (6.), protože $\forall \Sigma_{k} = \forall(co-\Pi_{k})=co-\exists\Pi_{k} \stackrel{\text{5.}}{=} co-\Sigma_{k+1}=\Pi_{k+1}$.
- (1. $\subseteq$) Nechť $A\in \exists \mathcal{P} \implies \exists B\in \mathcal{P},\exists p: \exists^{p|x|} y: \left\langle x,y \right\rangle \in B$ a existuje DTS $M$ rozhodující $B$ v polynomiálním čase. Zkonstruujeme NTS $M'$ pracující v polynomiálním čase takový, že $A=L(M')$. $M'$ nad vstupem $x$ přečte $x$ uhodne nedeterministicky $y$ a ověří, že $\left\langle x,y \right\rangle\in L(M)=B$ simulací $M$ a tedy $\exists P \subseteq \mathcal{NP}$.
- (1. $\supseteq$) $A\in \mathcal{NP}\implies \exists \text{ NTS } M$ pracující v polynomiálním čase s $A=L(M)$, definujme $B =\{ \left\langle x,y \right\rangle \mid x \in A, y \text{ je kód přijímacího výpočtu }M(x) \}\implies B\in \mathcal{P}$ a tedy $x\in A\iff \exists^{p|x|}y: \left\langle x,y \right\rangle\in B$.
- (3. $\subseteq$)
- (3. $\supseteq$)
- (5. $\subseteq$)

#### *Důsledky:*
###### Definice $\mathcal{PH}$ pomocí alternujících kvantifikátorů.

###### Kolaps $\mathcal{PH}$ na $k$-té hladině.

##### Buď $\forall k\geq 0: \Sigma_{k} \subsetneqq \Sigma_{k+1}$, nebo se $\mathcal{PH}$ skládá z konečně mnoha tříd.