# Gramatiky
*Definice:* Gramatika $G =(V,T,P,S)$, kde 
- $V$ je konečná neprázdná množina neterminálů
- $T$ je konečná neprázdná množina terminálů
- $S \in V$ je počáteční symbol
- konečné množiny **pravidel** $P$ reprezentují rekurzivní definici jazyka. Každé pravidlo má tvar:
$$
\beta A\gamma \to \omega, A \in V, \beta,\omega,\gamma \in(V \cup T)^*.
$$
*Definice:* Pro gramatiku $G=(V,T,P,S)$ máme přepsání $\alpha \Rightarrow \omega$, jestliže existuje nějaké podslovo, dovolující využít přepisové pravidlo a přepsat $\alpha$ na $\omega$. 
*Definice:* Pro gramatiku $G=(V,T,P,S)$ máme derivaci $\alpha \Rightarrow^* \omega$ existuje-li posloupnost přepsání. 

*Definice:* Jazyk $L(G)$ generovaný gramatikou $G = (V,T,P,S)$ je množina neterminální řetězců, pro které existuje derivace ze startovního neterminálu
$$
L(G) = \{ w \in T^* \mid S \Rightarrow^* w \}.
$$

Gramatiky rozdělujeme do několika typů dle přijímaných jazyků, nás zajímá dělení:
0. Gramatika typu 0 - rekurzivně spočetné jazyky $L_{0}$, kde pravidla jsou v obecné formě jako v definici
1. Gramatika typu 1 - kontextové gramatiky, $L_1$, kde máme pravidla pouze ve tvaru
$$
\begin{align}
A \in V, \gamma,\beta \in (V \cup T)^*, \omega \in (V \cup T)^+: \gamma A\beta \to\gamma\omega\beta, \\
S \to \epsilon \text{, kde toto je jediný výskyt $S$ na pravé straně}.
\end{align}
$$
2. Gramatika typu 2 - bezkontextové gramatiky - $L_{2}$, kde máme pravidla pouze ve tvaru
$$
A\in V, \omega \in (V \cup T)^*: A\to \omega.
$$
3. Gramatika typu 3 - **regulární**/pravá lineární je, regulární jazyky $L_{3}$, kde se omezujeme jen na pravidla tvaru
$$
A,B\in V, \omega \in T^*: A\to\omega B, A\to B.
$$
--- 
# Regulární výrazy
*Definice:* Třída regulární výrazů $\mathrm{RegE}(\Sigma)$, kde $\Sigma$ je abeceda, tedy množina symbolů, je induktivně definován. Zavádíme také $L(\alpha)$ jako hodnotu regulárního výrazu $\alpha$ (jeho jazyk). Základními prvky indukce jsou
- $\epsilon$ - prázdný řetězec, $L(\epsilon) = \{ \epsilon \}$,
- $\emptyset$ - prázdný výraz, $L(\emptyset) = \emptyset$,
- $a$ - znak $a \in \Sigma$, $L(a) = \{ a \}$.
Indukcí definujeme operace
- $\alpha + \beta$ - OR, $L(\alpha + \beta) = L(\alpha) \cup L(\beta)$,
- $\alpha\beta$ - zřetězení, $L(\alpha\beta) = L(\alpha)L(\beta)$,
- $\alpha^*$ - Kleene star, $L(\alpha^*) = L(\alpha)^*$,
- $(\alpha)$ - $L( (\alpha) ) = L(\alpha)$.
Priorita operací je po řadě iterace $*$, zřetězení, sjednocení $+$. Třída $\mathrm{RegE}(\Sigma)$ je nejmenší třída uzavřená na všechny operace.

---
# NFA, DFA
*Definice:* Deterministický konečný automat DFA je $A = (Q,\Sigma,\delta, q_{0}, F)$, kde
- $Q$ je množina stavů,
- $\Sigma$ je množina vstupních symbolů,
- $\delta: Q \times \Sigma \to Q$ je přechodvá funkce,
- $q_{0} \in Q$ je počáteční stav,
- $F \subseteq Q$ jsou přijímající stavy.
Jazykem přijímaným $A$ je
$$
L(A) = \{ w\in \Sigma^* \mid \delta*(q_{0}, w) \in F \}.
$$
*Definice:* $\epsilon$-Nedeterministický konečný automat $\epsilon$-NFA je $A = (Q,\Sigma,\delta, q_{0}, F)$, kde
- $Q$ je množina stavů
- $\Sigma$ je množina vstupních symbolů
- $\delta: Q \times (\Sigma \cup \{  \epsilon \}) \to \mathscr{P}(Q)$ je přechodvá funkce
- $q_{0} \in Q$ je počáteční stav
- $F \subseteq Q$ jsou přijímající stavy.

*Tvrzení:* NFA je ekvivalentní DFA.
Jeden se dá na druhý převést $DFA \to NFA$, je rovnou hotové. Na $NFA$ uděláme $\epsilon$-closure na stavech, tyto množiny stavů budou nové stavy DFA a přechody odpovídající se berou podle původních NFA. Samozřejmě pokud byl nějaký původní stav přijímající tak i $\epsilon$-closure daného stavu je přijímáno. 
