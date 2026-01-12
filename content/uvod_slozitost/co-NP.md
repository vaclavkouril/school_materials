*Definice:* 
$$
co-NP = \{ A \mid \overline{A} \in NP \}
$$
Jazyk $A$ patří do $co-NP$ právě, tehdy když existuje polynomiální verifikátor $V$, pro který platí
$$
A = \{ x \mid (\forall y\in \{ 0,1 \}^*)[V(x,y) \text{ přijme}] \}
$$
*Věta:* Jazyk $A$ je $co-NP$ úplný právě tehdy když $\overline{A}$ je $NP$-úplný.

*Důkaz:* Plyne z toho, že 
$$
A \leq_{m}^P B \implies \overline{A} \leq_{m}^P \overline{B}. 
$$
---
*Věta:* Pokud nějaký $NP$-úplný problém $A$ patří do $co-NP$, pak $NP = co-NP$

*Důkaz:* Protože $A\in co-NP$, pak $\overline{A} \in NP$, uvážíme-li $B\in NP$, pak z $NP$ úplnosti $A$ plyne $B \leq_{m}^P A \implies \overline{B} \leq_{m}^P \overline{A} \implies B \in co-NP$ a tedy $NP \subseteq co-NP$ a symetricky i $co-NP \subseteq NP$.