# P/poly, NP/poly, EXP/poly a coNEXP

## Věta: $P/poly = PSIZE$
Věta:
$$
P/poly = PSIZE.
$$
Tedy jazyky počitatelné s polynomiálními radami jsou právě jazyky počitatelné posloupností obvodů polynomiální velikosti.

Důkaz „$\supseteq$“: Je-li $L \in PSIZE$, existuje posloupnost obvodů $\{C_n\}_{n\geq 1}$ počítající $L \cap \{0,1\}^{n}$ a
$$
|C_n| = poly(n).
$$
Radící funkce $g(n)$ je binární zakódování popisu obvodu $C_n$.

Pak $L \in P/poly$:
- rada je $g(n)=$ binárně zakódovaný popis obvodu $C_{n}$,
- algoritmus na vstupu $x$ dostane $g(|x|)$,
- z $g(|x|)$ zrekonstruuje $C_{|x|}$,
- vyhodnotí $C_{|x|}$ na vstupu $x$,
- běží v čase polynomiálním v $|C_{|x|}|=poly(|x|)$.

Důkaz „$\subseteq$“: Je-li $L \in P/poly$, máme poly-časový algoritmus a radící funkci $g(n)$.

Na vstupu $x$ algoritmus používá radu $g(|x|)$ aby rozhodl, že $x\in L$. 

Pro pevnou délku $n$ lze jeho výpočet simulovat polynomiálně velkým obvodem, kde vstup $x$ je proměnný a rada $g(n)$ je zadrátovaná jako konstanta (jako v Cook-Levinově větě).

- Dostaneme tabulku výpočtu (Kachlíkování)
- Hodnota každého políčka lze spočítat konstantně velkým obvodem ze tří předešlých políček
- výstup lze spočítat v $poly(n)$ velkým obvodem $C_{|x|}$
- $\to$ dostaneme obvody $C_1,C_2,\dots$ a tedy $L\in PSIZE$.
---
## $NP/poly$
$NP/poly$ se poznamenává jako „neuniformní NP“.

Definice:$L \in NP/poly$, pokud existuje radící funkce $g : \mathbb{N} \to \{0,1\}^{*}$ s polynomiální délkou a nedeterministický algoritmus $A$ pracující v polynomiálním čase takový, že
$$
\forall x \qquad x\in L \iff A \text{ přijímá } (x,g(|x|)).
$$
## Nedeterministické obvody
Nedeterministický obvod $C$ má vstup $x \in \{0,1\}^{n}, \qquad y \in \{0,1\}^{p(n)}.$

Říkáme, že $C$ přijímá $x$, pokud existuje $y$ takové, že
$$
C(x,y)=1.
$$
Věta:
$$
L\in NP/poly \iff L \text{ je počitatelný nedeterministickými obvody polynomiální velikosti.}
$$
Důkaz: obdobný předchozí větě.

---
## $EXP/poly$
Definice: $L \in EXP/poly$ pokud existuje radící funkce $g : \mathbb{N} \to \{0,1\}^{*},  |g(n)|=poly(n)$, a algoritmus běžící v čase $2^{n^k}$ pro nějakou konstantu $k$, t. ž.
$$
\forall x \qquad x\in L \iff A \text{ přijme } (x,g(|x|)).
$$
Lemma:
$$
EXP \subseteq P/poly \Rightarrow EXP/poly \subseteq P/poly.
$$
Důkaz: Protože  $L \in EXP/poly$, tak $x\in L \iff M(x,h(|x|))=1$ a $h(|x|)\leq n^c$, mějme pomocný jazyk $B=\{ (x,a) \mid M(x,a) =1\}$, protože $M$ běží v exponenciálním čase, tak $B\in EXP$ a dle předpokladu $B\in P/poly$ a máme pro $B$ poly-velkou rodinu obvodů $D_{N}$ rozhodující $B$ na vstupech délky $N$. 

Do druhé části vstupu $N=n+|h(n)|$ zadrátujeme konstantu $n$ a dostáváme rodinu $C_{n}$, která rozhoduje $C_{n}(x)=D_{N}(x,h(|x|))$ a dostáváme
$$
C_{n}(x)=1 \iff D_{N}(x,h(|x|)) = 1\iff M(x,h(|x|))=1 \iff x\in L.
$$
$C_{n}$ je polynomiální, protože $|D_{N}|\leq n + n^c$ a tedy $L\in PSIZE$ a to víme, že $PSIZE= P / poly$.

Z toho plyne:
$$
EXP/poly = P/poly
$$
za předpokladu $EXP\subseteq P/poly$.

Závěr poznámek: nevíme, zda $EXP/poly \neq P/poly$, ani zda $EXP \subseteq P/poly$.

---
## $NEXP/poly$ a $coNEXP/poly$
Definice analogicky pro $NEXP/poly$ a $coNEXP/poly$. ($NEXP = \bigcup_{k \in \mathbb{N}} NTIME(2^{n^k})$)
$$
L \in coNEXP/poly \implies \overline L \in NEXP/poly
$$
Věta:
$$
coNEXP \subseteq NEXP/poly.
$$
Důkazový náčrt:

Pro $L\in coNEXP$ existuje nedeterministický algoritmus $B$, který v čase $2^{n^{O(1)}}$ přijímá právě doplněk $L$:
$$
\forall x \qquad x\notin L \iff B \text{ přijímá } x.
$$
Radící funkce $g(n)=|L \cap \{ 0,1 \}^n|$ je binární zakódování, tedy $\leq n+1$ bitů.

Algoritmus $A$ na vstupu $x,g(|x|)$:
1. položí $n=|x|$,
2. uhodne $2^n-g(n)$ různých řetízků délky $n$ a uhádne přijímající výpočty algoritmu $B$ na těchto řetízcích. ($z_{1},\dots,z_{2^n-g(n)}$)
3. Pokud uhodneme správně, přijmeme $x$, jestliže není jedním z uhodnutých řetízků přijímaných algoritmem $B$
4. Jinak odmítneme

$x$ je přijato alg. $A \iff x$ není přijato algoritmem $B$

$A$ běží v čase $2^{n} \cdot 2^{n^{O(k)}} = 2^{n^{O(k)}}$.

Idea: správnost rady lze verifikovat nedeterministicky v exponenciálním čase.

Důsledek:
$$
coNEXP/poly = NEXP/poly.
$$
Platí, protože pro $L\in coNEXP/poly$, je $x\in L \iff (x,h(|x|))\in A$, kde $A\in coNEXP$ a dle věty $A\in NEXP/poly$ tedy existuje algoritmus, který je v $NEXP$ a s poly. radou $b(N)$ rozhodující $A$ na vstupech délky $N$. Tedy máme algoritmus v $NEXP$, který rozhoduje $L$, ale nápověda je $h(n)$ a $b(n)$ najednou.

---
## Padding argument
Věta:
$$
NP=coNP \Rightarrow NEXP=coNEXP.
$$
Důkaz „padding argument“:

Mějme $L\in NEXP$, tedy $L$ je přijímán nedeterministickým algoritmem $A$ v čase $2^{n^k}$.

Definujeme vycpaný jazyk
$$
L' = \{x\#0^{2^{n^k}};\; x\in L\}.
$$
Pak $L'\in NP$, (nafoukneme si velikost vstupu aby výpočet byl vůči délce vstupu efektivní) tedy za předpokladu $NP=coNP$ máme $\overline{L'}\in NP$ a ten je přijímán nějakým $A'$.

Z toho konstruujeme nedeterministický algoritmus pro $\overline L$:
1. Na vstupu $x$ vyrobí $x\#0^{2^{n^k}}$ a spustí algoritmus $A'$
2. Odpovíme dle $A'$.

Běží v exponenciálním čase, tedy $\overline L\in NEXP$.

Obrácená implikace: $NEXP=coNEXP \Rightarrow coNP=NP$ není známo a je považována za nepravděpodobnou.
