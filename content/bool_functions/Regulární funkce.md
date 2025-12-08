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

*Pozorování:* Mějme $B,C$ CNF formule, pak
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
- $\implies$ nechť $Q$ je klauzule v $C$ $\Rightarrow$ $Q \lor x_{j}$ je klauzule v $F$ $\Rightarrow$ $Q \lor x_{j}$ je primární implikát $f.$ Použijme pozorování pro $B(Y) \land D(Y) \leq C(Y) \land D(Y)$ a tedy $Q$ musí být absorbováno něčím v $B \land D$. Pokud by bylo $Q$ absorbováno nějakým $\bar{Q}$ (pak by $\text{Literaly}(\bar{Q}) \subseteq \text{Literaly}(Q)$) v $D$, protože $\bar{Q}$ absorbuje i $Q \lor x_{j}$ a pak by $Q \lor x_{j}$ nebylo primární implikát. Tedy je absorbován klauzulí v $B$, ale tam nemůžeme absorbovat $Q \lor x_{j}$, tedy je stále primární implikát. Takže pak dle toho, že $D$ nic nemění na absorbcích mezi $B$ a $C$ a lemma máme $B(Y) \land D(Y) \leq C(Y) \land D(Y) \implies C(Y) \le B(Y)$.


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
\begin{multline*}
f(p,s_{1},\dots,s_{5},r_{1},\dots,r_{9}) = (p \land m(s_{1},\dots,s_{5}) \land m(r_{1},\dots,r_{9})) \\ \lor ( \bar{p} \land t(s_{1},\dots,s_{5}) \land t(r_{1},\dots,r_{9}) )
\end{multline*}
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