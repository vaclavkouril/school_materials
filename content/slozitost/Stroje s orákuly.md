# Deterministický Turingův stroj s orákulem
*Definice:* Deterministický Turingův stroj (DTS) s orákulem $A$, kde $A$ je jazyk se liší od standardního DTS tím, že má navíc jednu pracovní **oracle pásku** a stavy $\text{DOTAZ},\text{Ano},\text{Ne}$, kde
- na oracle pásku může v jednom kroku zapsat jen jednu buňku,
- oracle páska a její obsah se počítá do pracovního prostoru stroje,
- DTS pokud se dostane do stavu $\text{DOTAZ}$, tak se v následujícím kroku přesune do stavu
	1. $\text{Ano}$ - pokud slovo na oracle pásce $\in A$,
	2. $\text{Ne}$ - pokud slovo na oracle pásce $\not\in A$.
- Při $\text{Ano}$ i $\text{Ne}$ smaže celou pásku v jednom kroku.

Jazyk přijímaný DTS $M$ s orákulem $A$ značíme pomocí
$$
L(M,A).
$$
## Turingovská převoditelnost
*Definice:* Mějme jazyky $L_{1},L_{2}$, o $L_{1}$ řekneme, že je **deterministicky turingovsky převoditelný** na $L_{2}$ v polynomiálním čase, pokud existuje orákulový DTS $M$ takový, že
$$
L_{1} = L(M,L_{2}), \text{značme } L_{1} \leq_{T} L_{2}.
$$
Příklad:
- $A \in \mathcal{P}\implies A \leq_{T} \emptyset$

*Definice:* Nechť $A$ je jazyk $\implies P(A) = \{ B \mid B\leq_{T}A \}$.

*Definice:* Nechť $\mathscr{C}$ je třída jazyků $\implies P(\mathscr{C}) = \{ B \mid \exists A \in \mathscr{C}: B\leq_{T} A \}$.

Příklady:
- $P(\emptyset)=\mathcal{P}$
- $P(\mathcal{P})=\mathcal{P}$
	- $P(\mathcal{P}) \supseteq \mathcal{P}$ je triviální,
	- $P(\mathcal{P})\subseteq \mathcal{P}$, protože $B\in P(\mathcal{P})\Rightarrow \exists A \in \mathcal{P}: B \leq_{T} A\Rightarrow \exists M$ DTS s orákulem $A$ rozpoznávající $B$ v polynomiálním čase. 
	- Díky tomu, že $A \in \mathcal{P}$, tak $\exists M'$ DTS s $L(M')=A$ rozpoznávající v polynomiálním čase.
	- Můžeme vyrobit $M''$, který simuluje $M$ a pokaždé, když se $M$ dostane do $\text{DOTAZ}$, tak odpoví dle simulace $M'$ na daném vstupu.
	- $M''$ běží v polynomiálním čase, protože $M$ běží v polynomiálním čase a spustí tedy poly-čas běžící $M'$ maximálně taky polynomiálně-krát, tedy jsme stále v $\mathcal{P}$.
---
# Nedeterministické Turingovy stroje s orákuly
*Definice:* Stejná jako u DTS, jen se vymění DTS za NTS.
 
## Nedeterministická Turingovská převoditelnost
*Definice:* Mějme jazyky $L_{1},L_{2}$, pak $L_{1}$ je nedeterministicky Turingovsky převoditelný na $L_{2}$ v polynomiálním čase, když existuje NTS $M$ s orákulem $L_{2}$ rozhodující jazyk $L_{1}$, tedy
$$
L_{1}= L(M,L_{2}) \text{, znače } L_{1} \leq_{NP} L_{2}.
$$
*Definice:* Když $A$ je jazyk, tak 
$$
NP(A) = \{ B \mid B \leq_{NP}A \}.
$$
*Definice:* Když $\mathscr{C}$ je třída jazyků, tak
$$
NP(\mathscr{C}) = \{ B \mid \exists A\in \mathscr{C}: B \leq_{NP} A \}.
$$
Obdobně zavádíme $PSPACE(A),LOG(A),NEXT(A),\dots$ s rozdílem u $PSPACE(A)$, že se nemluví o převoditelnosti v polynomiálním čase, ale prostoru.

Víme, že platí $\mathcal{P} \subseteq \mathcal{NP} \subseteq PSPACE$, které jsou zachovány i pro stejné orákulum, tedy
$$
P(A) \subseteq NP(A) \subseteq PSPACE(A).
$$
Příklady:
- $NP(\mathcal{P}) = \mathcal{NP}$
- $NP(\mathcal{NP}) \supseteq \mathcal{NP}$, neumíme "$\subseteq$", protože pokud $M$ má orákulum $A$, které má NTS $M'$ s $L(M')=A$, tak neumíme polynomiální konstrukci, protože nevím odkud z listů stromu výpočtu $L(M')$ se napojit a pokračovat při výpočtu $M$. 

![np(np).excalidraw](np(np).excalidraw.svg)
