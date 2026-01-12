Ekvivalentní definice částečně rozhodnutelného jazyka $L$ je:
>Existuje rozhodnutelný jazyk $B$ splňující $L=\{ x \in \Sigma^* \mid (\exists y \in \Sigma^*)[\langle x,y\rangle \in B] \}$.

*Důkaz:* ($\implies$) předpokládejme částečně rozhodnutelný jazyk $L$ s TS $M$, nechť 
$$
B =\{ \langle x,y \rangle \mid (x\in \Sigma^*), (y\in \mathbb{N}) \text{ a } M \text{ přijme v nejvýše } y \text{ krocích} \}
$$
$B$ je rozhodnutelný, protože je omezená simulace $M$ čítačem kroků a tedy vždy zastaví a vydá odpověď. 

($\impliedby$) Mějme $B$ splňující podmínku z věty a vstup $x$ v shortlex pořadí si vygenerujeme všechna $y$ a otestujeme zda $\langle x,y\rangle \in B$ a pokud někde vyjde přijmutí, tak taky přijmeme.
# Uzávěrové vlastnosti
*Věta:* Nechť $L_{1},L_{2}$ jsou jazyky nad abecedou $\Sigma$.
1. Pokud jsou $L_{1},L_{2}$ rozhodnutelné, tak jsou i $L_{1} \cap L_{2},L_{1} \cup L_{2}, L_{1} . L_{2}, L_{1}^*$ rozhodnutelné jazyky.
2. Pokud jsou $L_{1},L_{2}$ částečně rozhodnutelné, tak jsou i $L_{1} \cap L_{2},L_{1} \cup L_{2}, L_{1} . L_{2}, L_{1}^*$ částečně rozhodnutelné jazyky.

*Důkaz:* Důkazy jsou totožné, tak vezmeme $L_{1} = L(M_{1}) \cup L_{2} = L(M_{2})$. Paralelně simulujeme $M_{1},M_{2}$ krok po kroku a přijmeme pokud přijme jeden z $M_{1},M_{2}$

---
# Postova věta
*Věta:* Jazyk $L \subseteq \Sigma^*$ je rozhodnutelný, právě když jsou $L$ i $\overline{L}$ částečně rozhodnutelné.

*Důkaz:* ($\implies$) předpokládejme $L$ rozhodnutelný, pak zjevně i $\overline{L}$ je rozhodnutelný.

($\impliedby$) jsou-li $L$ i $\overline{L}$ částečně rozhodnutelné, tak existují TS $M_{1}, M_{2}$ s $L=L(M_{1})$ a $\overline{L} = L(M_{2})$ a můžeme pustit pro dané $x \in \Sigma^*$ paralelně krok po kroku $M_{1}(x)$ a $M_{2}(x)$ a podle toho, který přijme tak přijme odmítne i celý TS.

*Poznámka:* $DEC$ značí rozhodnutelné problémy na nějakém TS, $PD$ značí částečně rozhodnutelné a Postova věta říká $DEC = PD \cap co-PD$.

---
# Enumerátory
*Definice:* Nechť $L \subseteq \Sigma^*$ je jazyk nad abecedou $\Sigma$. Turingův stroj $E$ je **enumerátor** pro jazyk $L$, pokud ignoruje vstup a během práce vypisuje všechna slova $w \in L$ na speciální výstupní pásku a každé slovo $w \in L$ je někdy během výpočtu vypsáno $E$.

*Věta:* Jazyk $L$ je částečně rozhodnutelný, právě když existuje enumerátor $E$ pro jazyk $L$.  

*Důkaz:* dle ekvivalentí definice částečně rozhodnutelných jazyků mějme $L$ a pro něj platí 
$$
L=\{ x \in \Sigma^* \mid (\exists y \in \Sigma^*)[\langle x,y\rangle \in B] \}
$$
můžeme zkonstruovat $E$:
0. Ignorujeme vstup
1. Pro každé $w \in \Sigma^*$ pokud kóduje $\langle x,y\rangle \in B$ pak $PRINT(x)$

Druhá strana převodu, tedy máme $E$ a chceme TS $M$ mějme algoritmus $M$:
1. Pustíme $E$ na jedné pásce
2. Změní-li se slovo na $E$-pásce tak ho porovnáme se vstupem
3. Pokud se shodne vstup s nějakým ze slov, tak vrátíme Ano.

## Vyčíslitelnost rozhodnutelných jazyků
*Věta:* Jazyk $L$ je uspořádaný, právě tehdy když existuje enumerátor $E$, který slova generuje v shortlex pořadí. 

*Důkaz:* ($\implies$) $L$ je rozhodnutelný, pak můžeme prostě brát $w\in L$ v shortlex uspořádání a rozhodnout zda patří a dle toho $PRINT$.

($\impliedby$) Mějme $E$ se slovy v shortlex pořadí pro $L$, konečné $L$ je triviální a ted předpokládejme nekonečné $L$, popišme $M$:
1. Vezmeme vstup $x\in\Sigma^*$
2. Vypisujeme slova pomocí $E$
3. Pokud $x$ na pásce od $E$, tak přijememe
4. Pokud je obsah pásky $y \succ x$, tak odmítneme.

Z shortlex máme, že každé $x$ má konečně mnoho předchůdců a protože je $L$ nekonečný, tak musí obsahovat takové $y$.