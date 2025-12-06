#proměnná #literál 
*Definice:* Booleovská proměnná je veličina nabývající hodnot z $\{ 0,1 \}$.
*Definice:* Literál je proměnná $x$ nebo její negace $\neg x$.

---
#logické_operátory
- Konjunkce: $x \land y$ pravda, když jsou oba pravda.
- Disjunkce: $x \lor y$ pravda, když alespoň jeden je pravda.
- Negace: $\neg x$
---
#formule
*Definice:* (Booleovská) Formule je složena z literálů, logických operátorů mezi nimi a závorek.
*Příklad:*
$$
(x\land y) \lor (\neg y \land z)
$$
---
#booleovská_funkce
*Definice:* Booleovská funkce na $n$ proměnných je funkce $f:\{ 0,1 \}^n \to \{ 0,1 \}$. $T(f)$ je značení pro body zobrazené na $1$ a obdobně $F(f)$ pro body na $0$.

Je jich $2^{2^n}$.

---
#dnf #cnf 
*Definice:* Disjunktivní normální (DNF) forma je formule tvaru $C_{1}\lor C_{2} \lor \dots \lor C_{k}$,, kde $C_{i}$ je konjunkce literálů.

*Definice:* Konjunktivní normální forma $CNF$ je formule tvaru $C_{1} \land \ldots \land C_{k}$, kde $C_{i}$ jsou klauzule, tedy disjunkce literálů.

Kanonická CNF je formule složená z konjunkce primárních implikantů.

---
#implikant
*Definice:* Konjunkce literálů $C$ je implikant funkce $f$ pokud $C \Rightarrow f$, $f \models C$, tedy když $C$ je pravda tak i $f$ je pravda.
Primární implikant - implikant, který nelze zjednodušit (odstraněním literálu) a stále by zůstal implikantem
*Příklad:* $f(x,y) = x \lor y$ implikantem jsou $x,y, x\land y$

*Pozorování:* 
1. Mějme implikant $C$ funkce $f$, která je reprezentovaná CNF $F$, tak
$$
F \equiv F \land C.
$$
2. Mějme CNF $F$ a její implikanty $C_{1} \leq C_{2}$ pak
$$
F \land C_{1} \land C_{2} \equiv F \land C_{1}.
$$
3. Mějme klauzule $C_{1},C_{2}$ s přesně jedním pár komplementárních literálů $C_{1} = A \lor l, C_{2} = B \lor \neg l$, pak $\mathrm{Res}(C_{1},C_{2}) = A \lor B$ a pokud $C_{1},C_{2}$ jsou implikanti $f$, tak $\mathrm{Res}(C_{1},C_{2})$ je také implikantem $f.$
Bytí implikantem znamená také, pokud vynutím implikant být $0$, tak i $f$ je $0$. O $\mathrm{Res}(C_{1},C_{2})$ to platí, protože pokud by $\mathrm{Res}(C_{1},C_{2})$ nebyl implikantem, tak $A, B$ jsou $0$ ale $l$ nebo $\neg l$ je jedno z nich $0$, tedy by pak mělo být $0$ i $C_{1}$ nebo $C_{2}$, ale to je spor s předpokladem, že $C_{1},C_{2}$ jsou implikanty.
---
#konsekvent
*Definice:* Konjunkce literálů $D$ je konsekvent funkce $f$, pokud $f \implies D$, tady je-li $f$ pravda, tak i $D$ musí být pravda.
*Příklady:*
- $f(x,y)= x \land y$ jsou konsekventy $x,y, x\lor y, x\land y$
- $g(x,y) = x \lor y$ je konsekvent jen $x\lor y$
