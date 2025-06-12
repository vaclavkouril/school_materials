*Definice:* 
1. $\Omega$ je množina elementárních jevů
2. $F \subseteq \mathscr{P}(\Omega)$ je prostorem jevů, pokud
	1. $\emptyset, \Omega \in F$
	2. $A \in F \implies A^c = \Omega \setminus A \in F$
	3. $A_{1},A_{2},\dots \in F \implies \bigcup A_{i} \in F$
3. $P: F \to [0,1]$ je pravděpodobnost pokud
	1. $P(\Omega)=1$
	2. Pro po svou disjunktní jevy $P\left( \bigcup A_{i} \right)= \sum P(A_{i})$
*Příklady:* Diskrétní, spojitý, geometrický

---
# Základní pravidla pro počítání s pravděpodobností 
- $P(A)+P(A^c)=1$
- $A \subseteq B  ⟹  P(B \setminus A)=P(B)- P(A) \implies P(A) \leq P(B)$
- $P(A\cup B)=P(A)+P(B)- P(A \cap B)$
- $P(A_1\cup A_{2} \cup \dots )\leq \sum_{i}P(A_i)$

---
# Nezávislost náhodných jevů
*Definice:* Jevy $A,B \in F$ jsou nezávislé pokud $P(A \cap B) = P(A) \cdot P(B)$.

Jevy v množině $M$ jsou nezávislé, pokud platí $\forall N \subseteq M$ konečnou platí $P\left( \bigcap N \right) = \prod_{n \in N} P(n)$.

*Definice:* Pro $A,B \in F, P(B) > 0$ definujeme podmíněnou pravděpodobnost $A$ při $B$ jako
$$
P(A \mid B) = \frac{P(A \cap B)}{P(B)}.
$$
Zjevně tedy platí $P(A \cap B) = P(A \mid B) P(B) = P(B \mid A)P(A)$.

Také platí 
$$
\begin{align}
P(A_{1} \cap A_{2}\cap \dots\cap A_{n}) = P(A_{1})P(A_{2} \mid A_{1})P(A_{3} \mid A_{2} \cap \\ A_{1})\dots P(A_{n} \mid \bigcap_{i=1}^{n-1} A_{i}).
\end{align}
$$
*Věta*: (O úplné pravděpodobnosti) Mějme $B_{1},B_{2},\dots$ jako rozklad $\Omega$, pak $P(A) = \sum_{i} P(A|B_{i}) P(B_{i})$.

*Bayesův vzorec:* Mějme $B_{1}, B_{2},\dots$ rozklad $\Omega$ pak
$$
P(B_{j} \mid A) = \frac{P(B_{j}) \cdot P(A|B_{j})}{\sum_{i} P(B_{i}) \cdot P(A|B_{i})}.
$$
