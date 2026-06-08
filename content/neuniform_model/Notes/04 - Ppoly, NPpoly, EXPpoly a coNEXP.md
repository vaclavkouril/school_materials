# P/poly, NP/poly, EXP/poly a coNEXP

Zdrojové stránky: ![[../Assets/pages/page-21.png]], ![[../Assets/pages/page-22.png]], ![[../Assets/pages/page-23.png]]

## Věta: $P/poly = PSIZE$

Věta:

$$
P/poly = PSIZE.
$$

Tedy jazyky počitatelné polynomiálními radami jsou právě jazyky počitatelné posloupností obvodů polynomiální velikosti.

Důkaz „$\supseteq$“:

Je-li $L \in PSIZE$, existuje posloupnost obvodů $\{C_n\}_{n\geq 1}$ počítající $L \cap \{0,1\}^{n}$ a

$$
|C_n| = poly(n).
$$

Radící funkce $g(n)$ je binární zakódování popisu obvodu $C_n$.

Pak $L \in P/poly$:

- rada je $g(n)$,
- algoritmus na vstupu $x$ dostane $g(|x|)$,
- z $g(|x|)$ zrekonstruuje $C_{|x|}$,
- vyhodnotí $C_{|x|}$ na vstupu $x$,
- běží v čase polynomiálním v $|C_{|x|}|=poly(|x|)$.

Důkaz „$\subseteq$“:

Je-li $L \in P/poly$, máme poly-časový algoritmus a radící funkci $g(n)$.

Na vstupu $x$ algoritmus používá radu $g(|x|)$. Pro pevnou délku $n$ lze jeho výpočet simulovat polynomiálně velkým obvodem, kde vstup $x$ je proměnný a rada $g(n)$ je zadrátovaná jako konstanta.

Výsledek: dostaneme obvody $C_1,C_2,\dots$ a tedy $L\in PSIZE$.

## $NP/poly$

$NP/poly$ se poznamenává jako „neuniformní NP“.

Definice:

$$
L \in NP/poly
$$

pokud existuje radící funkce

$$
g : \mathbb{N} \to \{0,1\}^{*}
$$

s polynomiální délkou a nedeterministický algoritmus $A$ pracující v polynomiálním čase takový, že

$$
\forall x \qquad x\in L \iff A \text{ přijímá } (x,g(|x|)).
$$

## Nedeterministické obvody

Nedeterministický obvod $C$ má vstup

$$
x \in \{0,1\}^{n}, \qquad y \in \{0,1\}^{p(n)}.
$$

Říkáme, že $C$ přijímá $x$, pokud existuje $y$ takové, že

$$
C(x,y)=1.
$$

Věta:

$$
L\in NP/poly \iff L \text{ je počitatelný nedeterministickými obvody polynomiální velikosti.}
$$

Důkaz: obdobný předchozí větě.

## $EXP/poly$

Definice:

$$
L \in EXP/poly
$$

pokud existuje radící funkce

$$
g : \mathbb{N} \to \{0,1\}^{*}, \qquad |g(n)|=poly(n),
$$

a algoritmus běžící v čase $2^{n^k}$ pro nějakou konstantu $k$, t. ž.

$$
\forall x \qquad x\in L \iff A \text{ přijme } (x,g(|x|)).
$$

Lemma v poznámkách:

$$
EXP \subseteq P/poly \Rightarrow EXP/poly \subseteq P/poly.
$$

Z toho plyne:

$$
EXP/poly = P/poly
$$

za předpokladu $EXP\subseteq P/poly$.

Závěr poznámek: nevíme, zda $EXP/poly \neq P/poly$, ani zda $EXP \subseteq P/poly$.

## $NEXP/poly$ a $coNEXP/poly$

Definice analogicky pro $NEXP/poly$ a $coNEXP/poly$.

Poznámky uvádějí:

$$
coNEXP/poly \subseteq NEXP/poly
$$

a následně větu:

$$
coNEXP \subseteq NEXP/poly.
$$

Důsledek:

$$
coNEXP/poly = NEXP/poly.
$$

Důkazový náčrt:

Pro $L\in coNEXP$ existuje nedeterministický algoritmus $B$, který v čase $2^{n^{O(1)}}$ přijímá právě doplněk $L$:

$$
\forall x \qquad x\notin L \iff B \text{ přijímá } x.
$$

Radící funkce $g(n)$ je binární zakódování množiny $L\cap \{0,1\}^{n}$, tedy truth-table délky $2^n$.

Algoritmus $A$ na vstupu $x,g(|x|)$:

1. položí $n=|x|$,
2. uhodne index řetězce délky $n$,
3. simuluje algoritmus $B$ na řetězci,
4. pokud uhodnutý řetězec svědčí proti správnosti zakódované tabulky, odmítne/přijme podle poznámek.

Idea: správnost rady lze verifikovat nedeterministicky v exponenciálním čase.

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

Pak $L'\in NP$, tedy za předpokladu $NP=coNP$ máme $\overline{L'}\in NP$.

Z toho konstruujeme nedeterministický algoritmus pro $\overline L$:

Na vstupu $x$ vyrobí $x\#0^{2^{n^k}}$ a spustí algoritmus pro $\overline{L'}$.

Běží v exponenciálním čase, tedy $\overline L\in NEXP$.

Obrácená implikace podle poznámek: $NEXP=coNEXP \Rightarrow coNP=NP$ není známo a je považována za nepravděpodobnou.
