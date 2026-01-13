*Definice:* 
$$
s_{k} = \inf \{  \delta \mid k-SAT \text{ lze vyřešit v čase } O(2^{\delta n} poly(n))) \}
$$
hypotéza o exponenciálním čase (ETH): pro nějaké $k$ je $s_{k} > 0$, ekvivalentně $s_{3} > 0$. 

Silná hypotéza o exponenciálním čase (SETH):
$$
\lim_{ k \to \infty } s_{k} = 1 
$$

*Definice:* $A,B$  obsahují po $n$ vektorech z $\{ 0,1 \}^d$ a obsahuji pro všechna $i=1,\dots,d$ $a[i] \cdot b[i] =0$. Vyřešitelné v $O(n^2 d)$.

Hypotéza o ortogonálních vektorech (OV): OV nelze vyřešit v čase $O(n^{2-\delta}d^c)$ pro žádné $\delta,c > 0$.

---
# SETH na OV
*Věta:* SETH $\implies$ OV

*Důkaz:* Předpokládejme $k$-CNF a proměnné si rozdělme na $X_{1} = \{x_{1},\dots,x_{n /2}\}, X_{2} = \{ x_{n/2 +1},\dots,x_{n}\}$.

Definujme množinu $A$, za předpokladu ohodnocení $\alpha$ pro $X_{1}$ a definujme vektory délky $d =m$ (počet klauzulí)
$$
a^\alpha[j] = \begin{cases}
0 &C_{j}(\alpha) = 1  \\
1 &\text{jinak}
\end{cases}
$$
pak mějme
$$
A = \{ a^\alpha \mid \alpha : X_{1}\to \{ 0,1 \} \}
$$
a obdobně $\beta: X_{2} \to \{ 0,1 \}$, pak
$$
b^\beta[j] = \begin{cases}
0 &C_{j}(\beta) = 1  \\
1 &\text{jinak}
\end{cases}
$$
a máme
$$
B \{ b^\beta \mid \beta:x_{2} \to \{ 0,1 \} \}
$$
a formule $\varphi$ je splnitelná když existuje dvojice ortogonálních vektorů. Pro dvojici $a^\alpha \in A, b^\beta \in B$ platí
$$
a^\alpha \cdot b^\beta = 0 \iff \varphi(\alpha \circ \beta) = 1.
$$
Nyní předpokládejme pro spor algoritmus pro OV se složitostí $O(N^{2-\delta} d^c)$ pro $\delta,c >0$. Platí $d = m = O(n^k) \implies d^c = O(n^{kc}) = o(2^{n \delta / 10})$ pro každé $k$. Platí $N = 2^{n/2}$, tedy
$$
O(N^{2- \delta}d^c) = O(2^{n(1-\delta /2)}2^{n(\delta/ 10)}) = O(2^{n(1-\delta')})
$$
pro vhodné $\delta' >0$. Čas konstrukce je $O(2^{n / 2}n^k)= 2^{n-\delta''}$, pro každé $k$ existuje $\gamma>0$ splňující $s_{k} \leq 1-\gamma$ a tedy by byl spor s SETH.

---
# OV na hledání regulárního výrazu v textu
*Definice:* Mějme reg. výraz $R$ a text $T \in \Sigma^*$ a ptáme se, zda je $t \in L(R)$ v $T$. 

To lze řešit v $O(mn)$ s $n = |T|, m=|R|$

*Věta:* Problém shody podřetězce s regulárním výrazem nelze vyřešit v čase $O((m+n)^{2-\epsilon})$ pro žádné $\epsilon > 0$ pokud platí hypotéza o ortogonálních vektorech.

*Důkaz:* Předpokládejme $OV$ instanci s množinami vektorů délky $d$: $A = \{ a_{1},\dots,a_n \}, B=\{ b_{1},\dots,b_{n} \}$. 

Zkonstruujme $T,R$ pro které platí $|T| = O(nd) = |R|$ následovně:

Pro $v\in \{ 0,1 \}$ definujme regulární výraz
$$
C(v) = \begin{cases}
0 &v=1 \\
(0|1)&v=0
\end{cases}
$$
pro vektor $a$ definujeme regulární výraz
$$
V(a) = C(a[0])C(a[1])\dots C(a[d])
$$
Regulární výraz definujeme
$$
R = V(a_{1})|V(a_{2})|\dots|V(a_{n}).
$$
Text definujme 
$$
T= b_{1} \#b_{2} \#\dots\#b_{n}.
$$
tedy pokud v textu je nějaký blok, který by se původně roznásobil na nulu, tak se najde z toho regexu.

A kdyby se dalo zrychlit hledání regulárního výrazu tak se zrychlí i OV.