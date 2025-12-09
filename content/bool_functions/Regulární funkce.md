#monotonni_funkce 

*Definice:* Proměnná $x_{i}$ je silnější než $x_{j}$ v $f$, když $\forall x_{1},\dots,x_{i},x_{i+1},\dots,x_{j},\dots,x_{n}$
$$
f(x_{1},\dots,1,x_{i+1},\dots,x_{j-1},0,x_{j+1},\dots,x_{n}) \geq f(x_{1},\dots,0,x_{i+1},\dots,x_{j-1},1,x_{j+1},\dots,x_{n}).
$$
Značení:
- $x_{i} \succeq_{f} x_{j}$, pro $x_{i}$ silnější než $x_{j}$.
- $x_{i} \succ_{f} x_{j}$ znamená $x_{i} \succeq_{f} x_{j}$ a $x_{i} \npreceq_{f} x_{j}$, dělá rozdíly mezi třídami ekvivalence
- $x_{i} \sim x_{j}$ znamená $x_{i} \succeq_{f} x_{j}$ a $x_{i} \preceq_{f} x_{j}$. To nám dává symetrie.

*Příklad:* $f(x_{1},x_{2},x_{3},x_{4}) = (x_{1} \lor x_2) \land (x_{2}\lor x_{3}) \land (x_{3}\lor x_{4})$, máme $f(1,0,x_{3},x_{4}) = x_{3}$ a $f(0,1,x_{3},x_{4}) = x_{3} \lor x_{4}$, vychází $x_{3}\lor x_{4} \geq x_{3}$, takže $x_{1} \preceq_{f} x_{2}$ a symetrií $x_{4} \preceq_{f} x_{3}$. Ale třeba
$$
\begin{align*}
f(x_{1},1,0,x_{4}) &= x_{4}, \\
f(x_{1},0,1,x_{4}) &= x_{1},
\end{align*}
$$
a ty jsou neporovnatelné.

Definujme $x_{i}\succeq_{f}x_{j}$ pro všechny booleovské funkce $f$.

*Tvrzení:* $\succeq_{f}$ je kvaziuspořádání (reflexivní, tranzitivní) na každé $f$.

*Důkaz:* Chceme vlastně dokázat, že když $x_{i} \succeq_{f}x_j$ a $x_{j} \succeq_{f}x_k$, tak $x_{i} \succeq_{f}x_k$.
Uvažujme co se děje s hodnotami na $i,j,k$ indexu pro všechny vektory jinde a uvažme nejdříve $x_{j} = 0$, pak máme
$$
f(\dots\underset{i}{1} \dots \underset{j}{0} \dots \underset{k}{0})\stackrel{x_{i} \succeq x_{j}}{\geq} f(\dots 0 \dots 1 \dots 0 \dots) \stackrel{x_{j} \succeq x_{k}}{\geq} f(\dots 0 \dots 0 \dots 1 \dots),
$$
a pro $x_{j} = 1$
$$
f(\dots \underset{i}{1} \dots \underset{j}{1} \dots \underset{k}{0} \dots)\stackrel{x_{j} \succeq x_{k}}{\geq} f(\dots 1 \dots 0 \dots 1 \dots) \stackrel{x_{i} \succeq x_{j}}{\geq} f(\dots 0 \dots 1 \dots 1 \dots).
$$
Dohromady tedy platí, že i pro všechna $x_{j}$ máme $x_{i} \succeq_{f} x_{k}$.

---
#regulární_funkce

*Definice:* Pozitivní booleovská funkce $f$ je _regulární_ když $\preceq_{f}$ je kompletní relace (všechny dvojice proměnných jsou porovnatelné)

*Pozorování:* Mějme $B,C$ CNF formule primárních implikátů nějaké $f$, pak
$$
B \le C \iff \text{každá klauzule } C \text{ musí být absorbovaná nějakou z }B
$$
To platí, protože pokud je $B = 1$, tak $C$ jsou jen nadmnožiny, takže jsou vždy také $1$ a pokud máme neabsorbovanou klauzuli, tak udělejme tu neabsorbovatelnou 0 a zbytek $1$, pak by $C=0$ a $B=1$ a spor.

#cnf
*Věta:* Nechť $f(x_{1},\dots, x_{n})$ je pozitivní booleovská funkce a nechť $F$ je kanonické CNF od $f,$ napišme $F = (A \lor x_{i} \lor x_{j}) \land (B \lor x_{i}) \land (C \lor x_{j}) \land D$, kde $A,B,C,D$ jsou bez $x_{i},x_{j}$ a jsou CNF na ostatních proměnných, pak 
$$
x_{i} \succeq_{f} x_{j} \iff B \leq C.
$$

Pro libovolné CNF můžeme vzhledem k $x_{i},x_{j}$ rozlišit 4 typu klauzulí a sice ty s oběma, ty s jednou z nich a bez nich. Navíc můžeme díky distributivitě vytknout $x_{i},x_{j}$ a tím máme CNF ve kterém najdeme taková $A,B,C,D$.

*Důkaz:* Mějme $x_{i} = x_{1}$ a $x_{j} = x_{2}$, to můžeme, protože můžeme prohazovat pozice proměnných vstupu.  Pak z definic máme
$$
\begin{align*}
f(1,0,Y) &= C(Y) \land D(Y), \\
f(0,1,Y) &= B(Y) \land D(Y),
\end{align*}

$$
takže $x_{i} \succeq_{f} x_{j} \iff B(Y) \land D(Y) \leq C(Y) \land D(Y)$ a to musíme dokázat, že je ekvivalentní $C(Y) \le B(Y)$.
- $\impliedby$ je zjevné, protože pokud $D(Y) =1$, tak je to stejné jako předpoklad $C(Y) \le B(Y)$ a pokud $D(Y) = 0$, tak se to $B(Y) \land D(Y) \leq C(Y) \land D(Y)$ rovná a je to tedy také splněno.
- $\implies$ nechť $Q$ je klauzule v $C$ $\Rightarrow$ $Q \lor x_{j}$ je klauzule v $F$ $\Rightarrow$ $Q \lor x_{j}$ je primární implikát $f.$ Použijme pozorování pro $B(Y) \land D(Y) \leq C(Y) \land D(Y)$ a tedy $Q$ musí být absorbováno něčím v $B \land D$. Pokud by bylo $Q$ absorbováno nějakým $\bar{Q}$ (pak by $\text{Literaly}(\bar{Q}) \subseteq \text{Literaly}(Q)$) v $D$, protože $\bar{Q}$ absorbuje i $Q \lor x_{j}$ a pak by $Q \lor x_{j}$ nebylo primární implikát. Tedy je absorbován klauzulí v $B$, ale tam nemůžeme absorbovat $Q \lor x_{j}$, tedy je stále primární implikát. Takže pak dle toho, že $D$ nic nemění na absorbcích mezi $B$ a $C$ a máme $B(Y) \land D(Y) \leq C(Y) \land D(Y) \implies C(Y) \le B(Y)$.
---
# Rozpoznávání regulárních funkcí
#### Algoritmus 1
Z věty máme jak pro dané $x_{i},x_{j}$ otestovat jejich vzájemnou sílu. Předpokládejme že $F$ má $n$ proměnných a $m$ klauzulí. V čase $O(mn)$ umíme otestovat, zda je daná klauzule z $B$ v $C$ a tedy v $O(m^2 n)$ umíme otestovat sílu pro dané $x_{i}, x_{j}$. Pro všechny páry máme $O(m^2n^3)$ pro zjištění, zda je funkce regulární.
#### Algoritmus 2
 Jednoduché zrychlení by bylo použití $O(n \cdot \log n)$ třídícího algoritmu, kde jen míso porovnání v $O(1)$ máme v čase $O(m^2 n)$ a pokud dojdeme k neporovnatelným tak skončíme a tedy $O(m^2n^2 \log n)$.
#### Algoritmus 3
*Definice:* Mějme $F = (A \lor x_{i} \lor x_{j}) \land (B \lor x_{i}) \land (C \lor x_{j}) \land D$, kde $A,B,C,D$ jsou bez $x_{i},x_{j}$ a $F$ je kanonická CNF pozitivní funkce $f$. Definujme $n \times n$ matici $W$ pomocí
$$
W[k,d] = \# \text{ klauzulí s přesně } d \text{ literály v }F \text{ které obsahují } x_{k}.
$$
Označme řádky $W$ pomocí $R_{1},R_{2},\dots,R_{n}$.

*Věta (O matici $W$):* Mějme pozitivní booleovskou funkci $f$ s maticí $W$ definovanou výše:
1. $x_{i} \sim_{f} x_{k} \implies R_{i} = R_{j}$,
2. $x_{i} \succ_{f} x_{j} \implies R_{i} >_{L} R_{j}$ (lexikograficky).

*Algoritmus:*
1. Zkonstruujeme $W$ (v čase $O(n^2)$ inicializace a $O(nm)$ k aktualizaci hodnot $W$)
2. Lexikograficky setřídíme řádky $W$: $R_{1} \geq_{L} R_{2} \geq_{L}\dots \geq_{L} R_{n}$ v čase $O(n^2)$ Radix-sortem
3. Rozběhneme metodu testu síly na $n-1$ párů v pořadí odpovídajícímu pořadí řádek (v čase $O(n^2m^2)$). Pak máme 2 možnosti:
	1. Dostaneme $x_{1} \succ_f x_{2} \succ_{f} \dots \succ_{f} x_{n}\implies R_{1} \geq_{L} R_{2} \geq_{L}\dots \geq_{L} R_{n}$ a pak máme regulární funkci.
	2. Dostaneme, že nějaké z $x_{i}$ se nedá porovnat s $x_{i+1}$ a tedy to není regulární.
V poslední části nemůžeme dostat $x_{i} \prec_{f} x_{j}$ protože to by bylo v rozporu s větou výše. 

*Poznámka:* Test síly mezi $x_{i}$ a $x_{j}$ se dá implementací s vhodnou datovou strukturou zlepšit časovou složitost na $O(mn)$ a tedy se zlepší běh algoritmů o faktor $m$.

*Důkaz věty o matici $W$:* Mějme $F = (A \lor x_{i} \lor x_{j}) \land (B \lor x_{i}) \land (C \lor x_{j}) \land D$.
1. Pro $x_{i} \sim_{f} x_{k}$, pak $C \leq B$ a $B \leq C$ implikuje, že $B$ a $C$ jsou identické (obsahují stejnou množinu klauzulí). Když $P\in B$ je absorbovaná pomocí $Q \in C$ a ta je absorbovaná $P' \in B$, tak $P =Q =P'$ musí platit, jinak $B$ není irredundantní. Tedy $B =C$ a $\implies R_{i} = R_{j}$.
2. Pro $x_{i} \succ_{f} x_{j}$ máme $B < C$ a tedy nemohou být identické. Definujme 
	$$
	\begin{align}
    B(d) &= \{ P \mid |P| = d \text{ a } \bigvee_{i\in P} x_{i} \in B \} \quad \text{ klauzule } B \text{ velikosti } d  \\
    C(d) &= \{ Q \mid |Q| = d \text{ a } \bigvee_{i\in Q} x_{i} \in C\}
    \end{align}
	$$
	$B \ne C$ znamená, že $\exists m$ nejmenší index takový, že $B(m) \ne C(m)$. Ukážeme, že $C(m) \subsetneqq B(m)$. Mějme arbitrární $Q \in C(m)$, pak $\exists P  \in B$, že $P \subseteq Q$ (aby ji absorbovala). Když $|P| < |Q|$, pak $P \in B(d)$ pro $d<m$ a tedy $P \in C(d)$ (protože $m$ je nejmenší kde se liší) a to by znamenalo, že jedna klauzule $C$ absorbuje druhou a to se nemůže stát z předpokladu, že je v prime $F$ (tam jsou jen primární implikáty). Takže $|P| = |Q|$ a jeden absorbuje druhý, tedy $P =Q$ a $Q \in B(m)$ a tedy $C(m) \subsetneqq B(m)$ platí. Pak 
	$$
	\begin{align}
     C(d) = B(c) \text{ pro } d<m &\implies W[i,d] = W[j,d] \text{ pro } d<m \\ 
     C(m) \subsetneqq B(m) &\implies |C(m)| < |B(m)| \implies W[i,m] > W[j,m] \implies R_{i} >_{L} R_{j}.
     \end{align}
	$$
---
*Návodný příklad:* 
Mějme 1 prezidenta $p$, 5 senátorů $s_{1},\dots,s_{5}$ a 9 poslanců (representatives) $r_{1},\dots, r_{9}.$
Zákon projde pokud
1. Prezident a většina senátoru a většina poslanců je pro.
2. Prezident je proti, ale $\geq 2/3$ senátorů jsou pro a $\geq 2 / 3$ poslanců je pro.

Taková volba je vlastně jen booleovská funkce (ten kdo se zdrží jakoby byl proti)
$$
f(p,s_{1},\dots,s_{5},r_{1},\dots,r_{9}) = \begin{cases}
1 &\text{zákon projde} \\
0 &\text{jinak}
\end{cases}
$$
$f$ ke pozitivní funkce, protože pokud má daná proměnná vliv na výsledek, tak jednoznačně pokud je 0 tak i výsledek je 0 a obráceně.
$$
\begin{align}
f(p,s_{1},\dots,s_{5},r_{1},\dots,r_{9}) = (p \land m(s_{1},\dots,s_{5}) \land m(r_{1},\dots,r_{9})) \\ \lor ( \bar{p} \land t(s_{1},\dots,s_{5}) \land t(r_{1},\dots,r_{9}) )
\end{align}
$$
kde $m(x_{1},\dots,x_{m}) = \begin{cases} 1 &\text{pro } \sum x_{i} \geq 1 / 2 n \\ 0&\text{jinak} \end{cases}$ a $t(x_{1},\dots,x_{m}) = \begin{cases} 1 &\text{pro } \sum x_{i} \geq 2 / 3 n \\ 0&\text{jinak} \end{cases}$

Zjevně dle symetrie máme $\forall i,j: s_{i} \sim s_{j}$ a $r_{i} \sim r_{j}$. Pro senátory vypadá majoritní funkce 
$m(s_{1},\dots,s_{5}) = \bigwedge_{i,j,k \text{ různé}} (s_{i} \lor s_{j} \lor s_{k})$ a pro poslance potřebuji všechny pětice.

Pro $t$ potřebujeme $2/ 3$ a vzhledem k tomu, že z 5 stačí dva aby nechtěli abychom to překonali, tak je to $t(s_{1},\dots,s_{5}) = \bigwedge_{i \neq j} (s_{i} \lor s_{j})$ a pro poslance jsou $t$ všechny čtveřice.

Pak pro porovnání $p,s_{1}$ máme
$$
\begin{align*}
f(1,0,\dots)&= m(0,s_{2},\dots,s_{5}) \land m(r_{1},\dots,r_{9})\\
f(0,1,\dots) &= t(1,s_{2},\dots,s_{5}) \land t(r_{1},\dots,r_{9})
\end{align*}
$$
u $m(0,s_{2},\dots,s_{5})$ aby byla 1 potřebujeme v $s_{2},\dots,s_{5}$ najít trojici s 1, a pro $t(1,s_{2},\dots,s_{5})$ se normálně ptáme po čtveřici aby byla 1, ale máme $s_{1} = 1$, takže v $s_{2},\dots,s_{5}$ hledáme trojici s $1$, takže jsou $m,t$ u senátorů v případě porovnání stejné. Zjevně ale majorita je častěji 1 než $t$, takže $t(r_{1},\dots,r_{9}) < m(r_{1},\dots,r_{9})$ a tedy $s_{1} \prec_{f} p$, symetricky $\forall i:s_{i} \prec_{f} p$. 

Navíc stejným argumentem jen s jinými konstantami z konstrukce funkcí plyne i $\forall i: r_{i} \prec_{f} p$.

$s_{i}$ a $r_{j}$ jsou neporovnatelné, protože mějme vektory
$$
\begin{align*}
f(1,\stackrel{s_{1}}{1},1,1,0,0,\stackrel{r_{1}}{0},1,1,1,1,1,1,1,1) &> 
f(1,\stackrel{s_{1}}{0},1,1,0,0,\stackrel{r_{1}}{1},1,1,1,1,1,1,1,1), \\

f(1,\stackrel{s_{1}}{1},1,1,1,1,\stackrel{r_{1}}{0},1,1,1,1,0,0,0,0) &< 
f(1,\stackrel{s_{1}}{0},1,1,1,1,\stackrel{r_{1}}{1},1,1,1,1,0,0,0,0),
\end{align*}
$$
kde platí obě nerovnosti pro různé vektory a tedy nemáme jako ukázat sílu jednoho nad druhým. Tedy mimochodem $f$ není regulární.

