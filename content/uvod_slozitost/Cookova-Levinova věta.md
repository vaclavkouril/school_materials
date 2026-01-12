Problém splnitelnosti (SAT) je zjevně v $NP$, protože jako certifikát můžeme použít pravdivé ohodnocení proměnných.

*Věta:* (Cook-Levinova) SAT patří do $P \iff P= NP$

---
# Polynomiální převoditelnost
*Definice:* Jazyk $B$ je polynomiálně převoditelný na jazyk $A$, ($B \leq_m^{P} A$), právě když existuje polynomiálně algoritmicky vyčíslitelná funkce $f$ (existuje pro ni TS $M$ počítající $f$ v čase $P$), že
$$
(\forall x \in \Sigma^*)[x \in A \iff f(x)\in B].
$$
*Lemma:* Pokud $A\in P, B \leq_{m}^PA$, pak $B \in P$.

*Důkaz:* Mějme $M_{A}$ rozhodující $L(M_{A}) =A$ v poly čase, pak $M_{B}$ se vstupem $x$:
1. $y \leftarrow f(x)$
2. Pustíme $M_{a}(y)$ a přijmeme dle něho.

*Lemma:* Pokud $A \in NP, B \leq_{m}^P A$, pak $B \in NP$

*Důkaz:* Konstrukce $V_{B}$ se vstupem $x$ a certifikátem $y$
1. $z \leftarrow f(x)$
2. Pustíme $V_{A}(z,y)$ a přijmi dle něho.

---
# NP těžkost
*Definice:* Jazyk $B$ je
- $NP$-těžký pokud $\forall A\in NP: A \leq_{m}^P B$,
- $NP$-úplný je-li v $NP$ a $NP$-těžký.