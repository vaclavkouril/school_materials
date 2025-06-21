*Definice:* Turingův stroj je $T = (Q,\Sigma,\Gamma,\delta,q_{0},B,F)$, kde
- $Q$ je množina stavů,
- $\Sigma$ je množina vstupních symbolů,
- $\Gamma \supseteq \Sigma$ je množina symbolů pásky, $Q \cap\Gamma = \emptyset$,
- $\delta: (Q\setminus F) \times \Gamma \to Q \times \Gamma \times \{ L,R \}$ je přechodvá funkce,
- $q_{0} \in Q$ je počáteční stav,
- $B \in \Gamma \setminus \Sigma$ je symbol pro prázdnou buňku,
- $F \subseteq Q$ jsou přijímající stavy.
Jazyky přijímané Turingovými stroji jsou **rekurzivně spočetné jazyky**, odpovídající gramatikám [typu 0](Regulární%20jazyky#Gramatiky).

---
# Algoritmicky nerozhodnutelné problémy
*Definice:* Rozhodnutelný problém je množina vstupů na které existuje odpověď ANO/NE.

*Definice:* Problém je algoritmicky rozhodnutelný pokud existuje Turingův stroj takový, že pro každý vstup zastaví a přijme právě když odpovědí na problém formulovaný vstupem je ANO.

Problémy na sebe můžeme redukovat obdobně jako v kapitole [Třídy složitosti](Třídy%20složitosti.md).

*Tvrzení:* Problém zastavení je nerozhodnutelný.
*Definice:* Instancí problému je dvojice $M,w$, Turingův stroj a jeho vstup a chceme rozhodnou, zda existuje algoritmus $Halt(M,w)$, který vydá $1$ právě když $M$ zastaví na vstupu $w$.

*Důkaz:* Redukujeme $Halt(M,w)$ na $L_{d}$, tedy diagonální jazyk. 

**Diagonální jazyk** $L_{d}$ je jazyk $w \in \{ 0,1 \}^*$, takový že Turingův stroj reprezentovaný slovem $w$ nepřijímá slovo $w$. Předpokládejme $L_{d} = L(M_{d})$, pak si vyrobíme tabulku, kde se ptáme "Přijímá $M_{i}$ vstupní slovo $w_{j}$" (od toho diagonála) a mějme tedy $w_{d}$ a $M_{d}$. 
Je $w_{d} \in L_{d}$?
- Pokud ano, tak $M_{d}$ nemá přijímat $w_{d}$ a tedy není součástí jazyka $L_{d} \implies$ spor.
- Pokud ne, tak $M_{d}$ přijímá $w_{d}$ a tedy patří do $L_{d} \implies$ spor. 

Teď k redukci, předpokládejme že máme algoritmus na $Halt$, modifikujeme ho na $Halt_{no}(w), w\in \{ 0,1 \}^*$, tedy odpovídáme na to zda $M$ nepřijímá slovo $w$, pak $Halt(Halt_{no}(w), Halt_{no}(w))$ je ekvivalentní diagonálnímu jazyku a tedy je to nespočetné. 