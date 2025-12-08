#booleovská_funkce 

*Definice:* Booleovská funkce $f(x_{1},x_{2},\dots,x_{n})$ je pozitivní v $x_{i}$, pokud 
$$
\forall x_{1},\dots,x_{i-1},x_{i+1},\dots,x_{n}: f(x_{1},\dots,x_{i-1}, 0, x_{i+1},\dots,x_{n}) \leq f(x_{1},\dots,x_{i-1}, 0, x_{i+1},\dots,x_{n}).
$$
*Příklad:* Funkce $f(x,y) = x \lor \neg y$ je pozitivní v $x$.

O funkci řekneme, že je negativní v $x_{i}$, když 
$$
\forall x_{1},\dots,x_{i-1},x_{i+1},\dots,x_{n}: f(x_{1},\dots,x_{i-1}, 0, x_{i+1},\dots,x_{n}) \geq f(x_{1},\dots,x_{i-1}, 0, x_{i+1},\dots,x_{n}).
$$

Říkáme, že funkce $f$ je pozitivní, pokud je pozitivní v každé proměnné. Obdobně $f$ je negativní, pokud je negativní v každé proměnné. O funkci řekneme, že je _unate_ pokud je pozitivní, nebo negativní v každé proměnné.

---
*Pozorování 1:* Pokud $CNF$ neobsahuje žádný negativní literál proměnné $x_{i}$, pak je pozitivní v $x_{i}$

#implikant 

*Pozorování 2:* Pokud $f$ je pozitivní v $x_{i}$ a $C$ je primární implikant $f$, tak neobsahuje $\bar{x_{i}}$.
*Důkaz:* Pro spor předpokládejme, že $C = A \lor \bar{x_{i}}$ je primární implikant $f$, pak z toho že je to implikant máme, že pokud ho nastavíme na 0, tak i $f$ je pak 0. Tedy pokud si přeházíme proměnné, tak 
$$
\forall i \in [i-1] x_{i}\in A,\forall x_{i+1},x_{i+2},\dots x_{n}: f(\underbrace{\underbrace{x_{1},\dots, x_{i-1}}_{\text{nastavené z }A =0},1}_{C=0}, x_{i+1},\dots,x_{n}) = 0.
$$
Z předpokladů máme, že $f$ je pozitivní v $x_{i}$ a tedy
$$
f(x_{1},\dots,x_{i-1}, 0, x_{i+1},\dots,x_{n}) = 0,
$$
tedy $A \lor x_{i}$ je také implikant, protože nastavení proměnných $A$ a $x_{i}$ na nulu nastaví $f$ na nulu. My ale můžeme udělat rezoluční krok na $A \lor \bar{x_{i}}$ a $A \lor x_{i}$ a dostaneme implikant $A$ a to je spor s primárností implikantu $C$, protože mu můžeme odebrat jeden literál a je stále implikantem.

*Pozorování 3:* Pozitivní CNF reprezentující $f$ musí obsahovat kanonickou CNF funkce $f$ jako pod-CNF. (Tedy až na absorbce je pozitivní CNF kanonická pro $f$)

---

Rozpoznání, zda je $f$ dána nějakou CNF pozitivní v $x_{i}$ je $co-NP$ complete.

*Důkaz:* Mějme pro spor poly-čas algoritmus $A$ na rozpoznání zda CNF $F$ je pozitivní v $x_{i}$. Pokud prohodíme $x_{i}$ za $\bar{x_{i}}$, tak máme $A'$ na negativní detekci $x_{i}$. Pokud spustíme $A$ a odpoví ANO, spustíme $A'$ a ten taky odpoví ANO, tak máme rovnost pro $x_{i}$ a tedy $f$ na ní nezávisí, pokud spustíme test na všech proměnných a pokud u všech vyjde, že to nezávisí na dané proměnné, tak máme jen dvě funkce. Tedy jsem schopni poly-rychle rozhodnout, zda je CNF bez splňujícího modelu, protože vyjde-li konstantní 0, tak to odpovídá tomu, že neexistuje řešení, jinak máme buď 1, že modely jsou vše a nebo proměnné na kterých záleží a dá se najít certifikát.