# $m$-převoditelnost
*Definice:* Jazyk $B$ je $m$-převoditelný na jazyk $A$ ($B \leq_{m} A$), právě když existuje totální (algoritmicky) vyčíslitelná funkce $f$ splňující
$$
(\forall x \in \Sigma^*)[x\in B \iff f(x)\in A]
$$
Zjevně je to kvazi uspořádání, tedy je reflexivní a tranzitivní protože složení totálně vyčíslitelných funkcí zachovává totální vyčíslitelnost.

Totální = bijekce, vyčíslitelná je (částečná) $f: \Sigma^* \to \Sigma^*$ pokud je turingovsky vyčíslitelná, tedy máme TS $M$ a $f_{M} :\Sigma^* \to \Sigma^*$ nechť je funkce kterou počítá a $dom(f)$ jsou $w\in\Sigma^*$, kde $M(w)\downarrow$ a $f_{M}(w)$ je to co je na výstupní pásce, když $M(w)$ zastaví.

 
Tranzitivita pro jazyky $A,B,C$ a $A\leq_{m}B,B\leq_{m}C$, tak i $A\leq_{m}C$.

*Důkaz:* $A\leq_{m}B$ pomocí $g$, $B\leq_{m}C$ pomocí $h$, tak $f(x) = h(g(x))$ pro $\forall x\in \Sigma^*$ platí
$$
x\in A \iff g(x) \in B \iff h(g(x)) \in C \iff f(x) \in C.
$$

*Lemma:* Nechť $A,B$ jazyky a $B \leq_{m} A$, pak
1. $A$ je rozhodnutelný $\implies$ $B$ je rozhodnutelný,
2. $A$ je částečně rozhodnutelný $\implies$ $B$ je částečně rozhodnutelný.

*Důkaz:* Mějme $M_{A}$ rozhodující $A$ a $M_{B}$ zkonstruujeme tak, ze pokud přijme $M_{A}(f(x))$ tak taky přijme, jinak ne. Stejné i pro částečnou rozhodnutelnost. 

*Důsledek:*
1. $B$ je nerozhodnutelný $\implies$ $A$ je nerozhodnutelný,
2. $B$ je částečně nerozhodnutelný $\implies$ $A$ je částečně nerozhodnutelný.

---
# $m$-úplnost
*Definice:* Jazyk $A$ je $m$-úplný, pokud
1. $A$ je částečně rozhodnutelný,
2. $\forall B$ částečně rozhodnutelné platí $B \leq_{m} A$.

*Věta:* $L_{u}$ je $m$-úplný.

*Důkaz:* $M_{\mathcal{U}}$ existuje, takže je to částečně rozhodnutelný jazyk. Mějme libovolný částečně rozhodnutelný jazyk $A$, ten je přijímaný $TS$ $M$, funkce $f(x) = \langle M,x\rangle$ je totální algoritmicky vyčíslitelná a platí
$$
x\in A \iff x \in L(M) \iff \langle M, x \rangle \in L_{u} \iff f(x) \in L_{u}.
$$
---
# Riceova věta
*Věta:* Nechť $C$ je (nějaká) třída částečně rozhodnutelných jazyků a definujme
$$
L_{C} = \{ \langle M \rangle \mid L(M) \in C \}
$$
jazyk $L_{C}$ je rozhodnutelný, právě když je $C$ **triviální**, tedy buď je prázdná, nebo obsahuje všechny částečně rozhodnutelné jazyky.  

*Důkaz:* Předpokládejme, že třída $C$ obsahuje jazyky jen nad abecedou $\Sigma$, kde $\Sigma$ je zároveň užita pro kódování TS a ostatních objektů. Je-li $C$ prázdná, tak $L_{C}=\emptyset$, obsahuje-li všechny jazyky pak $L_{C} = \Sigma^*$ (protože vše je kódováno v $\Sigma$ a obsahuje vše) oba případy jsou zjevně rozhodnutelné.

Teď naopak vezměme předpoklad netriviální $C$, pak ukážeme platnost
$$
\begin{align}
L_{u} &\leq_{m} L_{C} \text{, pokud } C \text{ neobsahuje prázdný jazyk}  \\
L_{u} &\leq_{m} \overline{L_{C}} \text{, pokud } C \text{ obsahuje prázdný jazyk}
\end{align}
$$
pro obé ale dostaneme nerozhodnutelný jazyk dle *důsledku lemma* výše a toho, že rozhodnutelnost je uzavřená na doplněk.

Předpokládejme nejprve, že $C$ je bez prázdného jazyka. Mějme libovolný $L \neq \emptyset$ z $C$ a k němu TS $N$, že $L = L(N)$. Chceme $f(\langle M, x\rangle) = \langle M' \rangle$ pro kterou platí 
$$
L(M') = \begin{cases}
L(N) &\text{když } x \in L(M)  \\
\emptyset &\text{když } x \not \in L(M)
\end{cases}
$$
pro takovou funkci pak platí 
$$
x \in L(M) \iff L(M') \in C \iff f(\langle M,x \rangle) = \langle M' \rangle \in L_{C},
$$
výpočet $M'$ na $y$ vypadá takto:
1. Pustíme $M(x)$ a když odmítne, tak odmítneme. 
2. Simulujeme $N(y)$ a když přijme, tak přijmeme, jinak odmítneme.

Takový algoritmus může vzniknout přímo z kódů $M,N,x$, tedy je to totálně vyčíslitelná funkce a definovaná pro každý vstup.  Navíc nám vychází
1. $x \in L(M) \implies L(M') = L(N) \in C \implies \langle M' \rangle \in L_{C}$,
2. $x \not \in L(M) \implies L(M') = \emptyset \not \in C \implies \langle M' \rangle \not \in L_{C}$

Tedy máme přímo $L_{u} \leq_{m} L_{C}$.

Předpokládáme-li $\emptyset \in C$, tak mějme $L \in \overline{L_{C}}$ s TS $N$, který zjevně $L \neq \emptyset$ a aplikujeme stejnou funkci jako v předchozím argumentu a dostaneme $L_{u} \leq \overline{L_{C}}$. 