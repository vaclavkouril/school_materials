*Definice:* Zobecněné kombinatorické číslo, mějme $r \in \mathbb{R}, k \in \mathbb{N}$ pak
$$
\binom{r}{k} = \frac{r \cdot (r - 1) \cdot (r-2) \cdot \dots \cdot (r-k+1)}{k!}.
$$

### Zobecněná binomická věta
 Nechť $x,y, r \in \mathbb{R}$ a $|x| > |y|$ (pro konvergenci). Pak zobecněná binomická věta je výraz: 
$$
(x+y)^r = \sum^\infty_{k=0} \binom{r}{k} x^{r-k} y^{k}
$$

*Důsledek:*  Pro záporné $n$ exponent dostáváme 
$$
(1-x)^n = \sum^\infty_{i=0} \binom{n}{i}(-x)^i = \sum^\infty_{i=0} \frac{n \cdot (n - 1) \cdot (n-2) \cdot \dots \cdot (n-i+1)}{i!} (-x)^i
$$
$x$ má u sebe přesně $i$ krát $-1$, kterými můžeme přenásobit  každý prvek čitatele
$$
\sum^\infty_{i=0} \frac{-n \cdot (1-n) \cdot (2-n) \cdot \dots \cdot (-n+i-1)}{i!} x^i = \sum^\infty_{i=0} \binom{-n+i-1}{i}x^i,
$$
všechny záporné členy kvůli $n$ jsou nyní kladnými s $(-n+i-1)$ jako největším.
$$
\sum^\infty_{i=0} \binom{-n+i-1}{i}x^i = \sum^\infty_{i=0} \binom{-n+i-1}{-n-1}x^i
$$

*Příklad:* Mějme v krabici $30$ červených, $40$ žlutých a 50 zelených míčků. Kolika způsoby můžeme zvolit $70$ míčků.

*Řešení:*
Zvolme řady odpovídající barvám míčků:
Červená: $(1+x+x^2+ \dots+ x^{30}) = \frac{1-x^{31}}{1-x}$
Žlutá: $(1+x+x^2+ \dots+ x^{40})$ = $\frac{1-x^{41}}{1-x}$
Zelená: $(1+x+x^2+ \dots+ x^{50}) = \frac{1-x^{51}}{1-x}$
Roznásobením mezi sebou dostaneme koeficient u $x^{70}$, který je náš hledaný výsledek:
$$
\begin{align}
(1+x+x^2+ \dots+ x^{30})(1+x+x^2+ \dots+ x^{40})(1+x+x^2+ \dots+ x^{50}) = \\ = \frac{1-x^{31}}{1-x} \frac{1-x^{41}}{1-x}\frac{1-x^{51}}{1-x} = \frac{1}{(1-x)^3} \cdot (1-x^{31}) \cdot (1-x^{41}) \cdot (1-x^{51})
\end{align}
$$
$\frac{1}{(1-x)^3} = (1-x)^{-3}$ se dá aplikovat zobecněná binomická věta a získáme
$$
\left[\binom{2}{2} + \binom{3}{2} x+ \binom{4}{2} x^2 + \dots\right] \cdot (1-x^{31}) \cdot (1-x^{41}) \cdot (1-x^{51})
$$
a tedy máme po aplikaci důsledku zobecněné binomické věty
$$
1 + \dots + \left[\binom{3 + 70 -1}{2} + \binom{72 -31}{2} + \binom{72 -41}{2} + \binom{72 -51}{2}\right] x^{70} + \dots
$$
což vede na výsledek $1061$.
Binomická čísla vypadají u $x^{70}$ tak jak vypadají, protože vynásobíme-li to mezi sebou tak máme či nemáme posun o $31$ a tedy posuny hýbou s možnými zvolenými koeficienty, a mezi sebou se nekombinují, protože libovolné dva posuny už posouvají o více než 70 pozic, tedy jsou irelevantní pro náš koeficient.