*Definice:* Párování v grafu $G$ je $M \subseteq E(G)$ takové, že pro každý vrchol existuje maximálně jedna hrana v $M$ jíž je součástí. 
**Perfektní párování** je takové $M$, že pro každý vrchol existuje právě jedna hrana jenž náleží.
*Definice:* Vzhledem k párování $M$ v grafu $G$ mluvíme o **volném vrcholu** jako o $v \in V(G)$, pro které neexistuje hrana v $M$, která by ji obsahovala.

---
# Tutteova věta
Definice: **Tutteova podmínka** je $\forall S \subseteq V(G): odd(G-S) \leq |S|$, kde $odd(G)$ je počet lichých komponent grafu.

*Věta:* (Tutteova) Graf $G$ má perfektní párování $\iff$ platí Tutteova podmínka.
*Důkaz:* $(\Rightarrow)$ obměnou, nechť neplatí Tutteova podmínka.
Máme tedy nějaké $S\subseteq V(G): odd(G-S) >|S|$ a pro spor předpokládáme, že máme perfektní párování na $G$, ale můžeme si všimnout, že každá lichá komponenta musí spárovat jeden lichý vrchol s nějakým vrcholem s $S$, jenže těch je méně než lichých komponent a tedy spor.

*Věta:* (Petersonova) Pro každý $3$-regulární a $2$-souvislý graf má perfektní párování. 
- $3$-regulární a $2$-souvislý graf je stejně vrcholově i hranově souvislý zároveň, mohli bychom ho také nazvat bez mostů a artikulací.
*Důkaz:* Nechť $G$ je $3$-regulární a $2$-souvislý graf, pak díky Tutteově větě převedeme problém na vyšetření Tutteovy podmínky. 

Mějme danou $S \subseteq V$, pak
1. Každá komponenta $G-S$ je spojena alespoň dvěma hranami s $S$
2. Ukážeme, že každá lichá komponenta $G-S$ je dokonce spojena lichým počtem hran s $S$, nazveme takovou komponentu $L$:
$$
\begin{align}
\sum_{x \in V(L)} \deg_{G}(x)
\stackrel{3-reg.}{=} 3\underbrace{|V(L)|}_{\text{liché}} &= \overbrace{2(\text{počet hran vedoucích uvnitř } L)}^{\text{sudé}} + \\ & \quad + (\text{hrany vedoucí mimo }L)
\end{align}
$$
Kombinací obou bodů tedy zjišťujeme, že každá lichá komponenta $G-S$ je s $S$ spojena alespoň $3$ hranami. Z toho nám pro $p$ označující počet hran mezi $S$ a lichými komponentami vychází zároveň:
- $p \geq 3 \cdot odd(G-s)$
- $p \leq 3 \cdot |S|$ z $3$-regularity 
a platí tedy $odd(G-S) \leq S$ a tedy i Tutteova podmínka a máme existenci perfektního párování zaručenu.
---
# Edmonsův algoritmus
Vstupem je graf $G$ a jeho libovolné párování $M$, třeba prázdné pro inicializaci. Výstupem je párování $M′$, které je alespoň o $1$ větší, než $M$, případně $M$ pokud bylo maximální.
- zkonstruujeme maximální možný **Edmondsův les** vzhledem k aktuálnímu $M$ tím, že z volných vrcholů pustíme _BFS_ a střídavě přidáváme vrcholy
    - hranám, které se v lese neobjeví, se říká kompost a nebudou pro nás důležité
- pokud existuje hrana mezi (potenciálně různými) sudými hladinami různých stromů, pak máme volnou střídavou cestu, kterou zalterujeme a jsme hotovi (párování je o $1$ větší)
- pokud existuje hrana mezi (potenciálně různými) sudými hladinami jednoho stromu, máme květ $C$ – ten zkontrahujeme a rekurzivně se zavoláme
    - vrátí-li $M′=M$, pak nic dalšího neděláme
    - vratí-li nějaké větší párování, tak z něho zkonstruujeme párování v $G$
- neexistuje-li hrana mezi sudými hladinami, pak $M′=M$

*Tvrzení*: Edmondsův algoritmus spuštěný na $G$ a $M$ doběhne v čase $O(n⋅(n+m))$ a najde párování $M′$ alespoň o $1$ hranu větší než $M$, případně oznámí, že $M$ je největší $\implies$ nejlepší párování lze nalézt v čase $O(n^2(n+m))$.