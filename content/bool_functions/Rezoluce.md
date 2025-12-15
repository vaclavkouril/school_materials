#rezoluce #cnf #implikant 

*Definice:* Mějme množinovou reprezentaci CNF formule, _rezoluční metoda_ je algoritmus
1. Udělejme všechny absorbce.
2. Když $\exists C_{1},C_{2}$ takové že $\mathrm{Res}(C_{1},C_{2})$ není absorbovaná, pak přidejme $\mathrm{Res}(C_{1},C_{2})$ do CNF formule a jinak skončíme.

---

*Věta:* (O úplnosti rezoluce) Pro libovolnou CNF $F$ reprezentující booleovskou funkci $f$ algoritmus rezoluční metoda (RM) vydá kanonickou CNF funkce $f$.

_Slabší tvrzení z logiky je o nesplnitelných CNF, kdy vždy najdeme $\square$, ale to je jen kanonická formule pro takovou CNF._

*Důkaz:* Konečnost algoritmu je zaručena, protože počet různých klauzulí je díky konečnému počtu proměnných konečný. Když přidáváme klauzuli, tak ji vždy přidáme jednou, protože pokud bychom chtěli podruhé tak by byla absorbovatelná jejím minulým výskytem. (Absorbce je tranzitivní)

Korektnost algoritmu: předpokládejme výstup $F = C_{1} \land C_{2} \land \dots \land C_{l}$, po skončení algoritmu a předpokládejme $\exists P$ prime implikant, že $\forall i: P \ne C_{i}$ (protože je $P$ prime, tak $C_{i} \subset P$ se nemůže stát). Definujme 
$$
\begin{align*}
X = \{ Q \mid \, & P \subseteq Q \tag{1}\\
&\forall k: C_{k} \not \subseteq Q \tag{2}\ \}
\end{align*}
$$
Vzhledem k tomu, že $P \in X$, tak $X$ je neprázdná a označme $P^*$ jako nejdelší klauzuli v $X$.

Rozdělme $P^*$ dle počtu proměnných:
1. $|P^*|=n$, kde $n$ je počet všech proměnných. Pak $\forall k: C_{k}$ mají konflikt s $P^*$ a tedy pak
	1. nastavíme-li $P^* = 0 \implies \forall k: C_{k} = 1 \implies f = 1$,
	2. ale zároveň také $P^* = 0 \implies P=0 \implies f = 0$, protože $P$ je také prime implikát,
	
	dohromady máme tedy spor.
1. $|P^*| < n$ a tedy $\exists x$, které není v $P^*$. O obou $P^* \lor x, P^* \lor \overline{x}$ víme, že nejsou v $X$ a tedy z výběru $P^*$ není problém s pravidlem $(1)$, takže musí být problém s pravidlem $(2)$ a tedy $\exists i,j$, že jsou $C_{i}, C_{j}$ podmnožinami. 
	1. $C_{i} \subseteq P^* \lor x$ a tedy obsahuje $x$ a podmnožinu $P^*$,
	2. $C_{j} \subseteq P^* \lor \overline{x}$ a tedy obsahuje $\overline {x}$ a podmnožinu $P^*$.
	
	ale to znamená, že $C_{i}, C_{j}$ jsou rezolvovatelné přes $x$ a $\mathrm{Res}(C_{i}, C_{j}) \subseteq P^*$ a tedy není absorbovatelný nějakým $C_{k}$. Ale to je spor se skončením algoritmu, protože ten by našel v další iteraci rezoluci přes $x$.

---
*Čas algoritmu:* Každá iterace je zhruba kubická, ale můžeme relativně jednoduše konstruovat CNF formule s exponenciálním počtem prime implikátů a tedy máme hodně iterací. Konstruovat je můžeme třeba  

*Pozorování:* Pokud $P \ne NP$, tak rezoluční metoda nemůže běžet v polynomiálním čase.

Je to kvůli tomu, že bychom měli řešení SAT, protože nesplnitelná formule má někde v rezoluci naleznutelný spor (jako kanonickou formuli $\square$) a o SATu víme, že je v $NP$.

Pro $2$-CNF můžeme omezit počet různých klauzulí pro $n$ na vstupu na $n^2$ a máme poly-čas algoritmus.