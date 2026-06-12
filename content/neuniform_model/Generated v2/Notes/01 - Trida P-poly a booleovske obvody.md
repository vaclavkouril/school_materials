# Třída $P/poly$, Booleovské obvody

Zdrojové stránky: ![[page-01.png]], ![[page-02.png]], ![[page-03.png]], ![[page-04.png]], ![[page-21.png]], ![[page-22.png]], ![[page-23.png]]

## Neuniformní model výpočtu

Uniformní algoritmus pro funkci $f$ je jeden algoritmus $A$, který na vstupu $x$ spočítá $f(x)$.

Neuniformně se na problém díváme po délkách vstupu. Pro booleovskou funkci

$$
f:\\{0,1\\}^{*}\to \\{0,1\\}
$$

píšeme

$$
f=\\{f_n\\}_{n\geq 0}, \qquad f_n=f|_{\\{0,1\\}^n}.
$$

Neuniformní algoritmus je posloupnost

$$
A=\\{A_n\\}_{n\geq 0},
$$

kde $A_n$ počítá pouze funkci $f_n$ na vstupech délky $n$. Pro každou délku tedy můžeme mít jiný objekt.

## Booleovské formule a obvody

Booleovská formule je strom složený z hradel. Typicky používáme hradla

$$
\\wedge,\\vee,\\neg.
$$

Booleovský obvod je orientovaný acyklický graf. Na rozdíl od formule může být výsledek jednoho hradla použit vícekrát.

Měříme hlavně:

- velikost obvodu = počet hradel,
- hloubku obvodu = délku nejdelší cesty od vstupu k výstupu,
- fan-in = počet vstupů do jednoho hradla.

Posloupnost obvodů

$$
\\{C_n\\}_{n\geq 0}
$$

počítá jazyk $L$, jestliže $C_n$ počítá charakteristickou funkci $L\cap\\{0,1\\}^n$.

## Každá funkce má obvod exponenciální velikosti

Tvrzení:

$$
\\forall f_n:\\{0,1\\}^n\to\\{0,1\\}
$$

existuje booleovský obvod s binárními hradly `AND`, `OR` a unárními `NOT` velikosti přibližně

$$
10n2^n,
$$

který počítá $f_n$.

### Důkaz přes DNF

Pro každý vstup $a=(a_1,\\dots,a_n)$, kde $f(a)=1$, vezmeme konjunkci literálů

$$
T_a=\\ell_1\\wedge\\ell_2\\wedge\\cdots\\wedge\\ell_n,
$$

kde

$$
\ell_i=\begin{cases}
x_i, & a_i=1,\\
\neg x_i, & a_i=0.
\end{cases}
$$
Potom

$$
f(x)=\bigvee_{a:f(a)=1}T_a.
$$

Počet členů $T_a$ je nejvýše $2^n$. Jeden člen potřebuje $O(n)$ hradel. Celkem tedy $O(n2^n)$ hradel. Konstanta $10$ je jen bezpečný hrubý odhad.

Hloubka při vyvážení:

- jeden AND strom nad $n$ literály má hloubku $O(\log n)$,
- OR strom nad až $2^n$ členy má hloubku $O(n)$.

Celý DNF obvod má tedy hloubku $O(n)$.

## Dolní odhad počítáním obvodů

Počet všech booleovských funkcí na $n$ bitech je

$$
2^{2^n}.
$$

Počet obvodů velikosti $s$ lze hrubě omezit takto:

$$
|\{\text{obvody velikosti }s\}|\leq s^{2s}(n+3)^s.
$$

Důvod:

- každé z $s$ hradel má nejvýše dva vstupy,
- každý vstup může ukazovat na jedno z nejvýše $s$ dřívějších hradel,
- tedy zhruba $s^2$ možností na hradlo,
- navíc každé hradlo může být označeno jednou z možností $x_1,\\dots,x_n,\\wedge,\\vee,\\neg$, tedy nejvýše $n+3$ možností.

Pro $s$ hradel dostaneme

$$
s^{2s}(n+3)^s.
$$

Pro

$$
s=\\frac{2^n}{10n}
$$

je tento počet menší než $2^{2^n}$. Tedy většina funkcí potřebuje exponenciálně velké obvody.

## Simulace polynomiálního času obvody

Pokud $f\in P$, pak $f$ má polynomiálně velké obvody.

Důkazová idea: vezmeme výpočet Turingova stroje v čase $n^k$ a zapíšeme jeho výpočetní tabulku. Každé políčko tabulky závisí jen na konstantně mnoha políčkách předchozího času. To lze lokálně simulovat hradly. Vznikne obvod velikosti polynomiální v $n$.

Důsledek:

$$
NP \text{ nemá polynomiálně velké obvody } \implies P\neq NP.
$$

## Třída $P/poly$

$P/poly$ je třída jazyků rozhodnutelných polynomiálním algoritmem s polynomiálně dlouhou radou.

Radící funkce:

$$
g:\mathbb{N}\to\\{0,1\\}^{*}, \qquad |g(n)|=poly(n).
$$

Jazyk $L$ je v $P/poly$, pokud existují $A,g$ takové, že

$$
x\in L \iff A(x,g(|x|))=1,
$$

a $A$ běží v polynomiálním čase.

Rada závisí jen na délce vstupu, ne na samotném vstupu.

## Věta: $P/poly = PSIZE$

Nechť $PSIZE$ značí jazyky počitatelné posloupností obvodů polynomiální velikosti. Potom

$$
P/poly=PSIZE.
$$

### Směr $PSIZE\subseteq P/poly$

Máme posloupnost obvodů $C_n$ velikosti $poly(n)$. Rada $g(n)$ bude binární popis obvodu $C_n$. Algoritmus na vstupu $x$ dostane $g(|x|)$, zrekonstruuje obvod $C_{|x|}$ a vyhodnotí jej na $x$.

Protože $|C_n|=poly(n)$, vyhodnocení je polynomiální.

### Směr $P/poly\subseteq PSIZE$

Máme polynomiální algoritmus $A$ a radu $g(n)$. Pro pevné $n$ je rada $g(n)$ pevná konstanta. Výpočet $A(x,g(n))$ na vstupech délky $n$ lze simulovat polynomiálně velkým obvodem, kde bity rady jsou zadrátované jako konstanty.

Dostaneme posloupnost obvodů $C_n$, tedy $L\in PSIZE$.
