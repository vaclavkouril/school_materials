# AC0, Razborov-Smolensky a ACC0

Zdrojové stránky: ![[../Assets/pages/page-08.png]], ![[../Assets/pages/page-09.png]], ![[../Assets/pages/page-10.png]], ![[../Assets/pages/page-11.png]], ![[../Assets/pages/page-12.png]], ![[../Assets/pages/page-13.png]], ![[../Assets/pages/page-14.png]], ![[../Assets/pages/page-15.png]], ![[../Assets/pages/page-16.png]], ![[../Assets/pages/page-17.png]], ![[../Assets/pages/page-18.png]], ![[../Assets/pages/page-19.png]], ![[../Assets/pages/page-20.png]]

## Razborov-Smolensky 1987

Výsledek:

Pro každá prvočísla $p,q$ platí, že $MOD_q$ není v $AC^0[p]$.

Zvlášť:

$$
MOD_2 \notin AC^0.
$$

Poznámka: $AC^0[p]$ jsou polynomiálně velké $AC^0$ obvody nad hradly $\wedge,\vee,\neg$ a $MOD_p$.

Předešlé výsledky:

- Furst-Saxe-Sipser 1981,
- Ajtai 1982,
- Håstad 1987.

## Důkaz ve dvou krocích

Důkaz se skládá ze dvou kroků:

1. aproximace obvodu polynomem nad $GF[q]$,
2. $MOD_p$ nelze aproximovat polynomem nízkého stupně nad $GF[q]$.

## Lemma 1: aproximace obvodu polynomem

Cíl: pro obvod $C$ velikosti $s$ a hloubky $\ell$ nad hradly `OR`, `MOD_q`, `NOT` najít polynom $p_g$ nad $GF[q]$ pro každé hradlo $g$, který souhlasí s hodnotou hradla na všech vstupech mimo malou množinu $W_i$.

Pro hradla:

- `NOT`:

$$
p_g = 1-p_{g'}.
$$

- `MOD_q`:

$$
p_g = \left(\sum_{i=1}^{\ell} p_{g_i}\right)^{q-1}.
$$

- `OR`:

$$
p_g = 1-\prod_{j=1}^{k}\left(1-\left(\sum_i a_{ji}p_{g_i}\right)^{q-1}\right).
$$

Koeficienty $a_{ji} \in \{0,1\}$ se volí náhodně.

Pro pevný vstup $x \notin W_i$, kde aspoň jedno hradlo má hodnotu 1, platí, že součet nad $GF[q]$ je nenulový s dostatečnou pravděpodobností.

Odhad:

$$
\Pr[p_g(x)=0] \leq \left(\frac12\right)^k.
$$

Tedy pro jedno hradlo a pro všechny vstupy lze zvolit náhodné koeficienty tak, aby množina chybných vstupů byla malá.

Po $i$-té hladině:

$$
|W_i| \leq |W_{i-1}| + 2^n s_i \left(\frac12\right)^k.
$$

Proto

$$
|W_n| \leq O\left(2^n s \left(\frac12\right)^k\right).
$$

Volbou parametrů, např.

$$
s = 2^{n^{1/(4\ell)}}, \qquad k = n^{1/(3\ell)},
$$

dostaneme malou chybu.

Závěr:

Pro každý $AC^0[q]$ obvod velikosti asi $2^{n^{1/(4\ell)}}$ a hloubky $\ell$ existuje polynom nad $GF[q]$, který počítá stejnou funkci na všech vstupech kromě $o(2^n)$ vstupů.

Stupeň polynomu je přibližně

$$
O(n^{1/3}).
$$

## Lemma 2: nízký stupeň neaproximuje MOD

Pro $p=2$ se používá přepis:

$$
p'_2(y_1,\dots,y_n)=1-2p_2\left(\frac{1-y_1}{2},\dots,\frac{1-y_n}{2}\right),
$$

kde $p'_2 : \{-1,1\}^n \to \{-1,1\}$.

Má reprezentovat multiplikativní polynom nad $GF[q]$.

Použijeme paritu:

$$
\prod_{i=1}^{n} y_i.
$$

Jestliže funkce souhlasí s paritou na většině vstupů, lze ji reprezentovat polynomem stupně asi

$$
\leq \frac n2 + O(n^{1/3}).
$$

Počet takových polynomů je menší než počet funkcí, které by bylo třeba aproximovat. Spor.

Pro $p \neq 2$ se poznámky odvolávají na podobný trik.

## Přibližné počítání v AC0

Přibližné počítání je v $AC^0$.

Definujme:

$$
AMAJ(x)=
\begin{cases}
0, & \sum x_i \leq \frac14 n,\\
1, & \sum x_i \geq \frac34 n.
\end{cases}
$$

Tvrzení:

$$
AMAJ(x) \in AC^0.
$$

Důkaz náhodným obvodem:

Vybereme náhodný bit vstupu. Pokud

$$
\sum x_i \leq \frac14 n,
$$

pak jeden náhodný bit je 1 s pravděpodobností nejvýše $1/4$.

Pokud

$$
\sum x_i \geq \frac34 n,
$$

pak je vybraný bit 1 s pravděpodobností aspoň $3/4$.

Zesílení:

- $C_0(x)=x_i$ pro náhodné $i$,
- $C_1(x)=\bigwedge$ z $10\log n$ nezávislých kopií $C_0$,
- $C_2(x)=\bigvee$ z $n^5$ nezávislých kopií $C_1$,
- $C_3(x)=\bigwedge$ z $n^2$ nezávislých kopií $C_2$.

Dostaneme obvod, který se s vysokou pravděpodobností chová správně na všech vstupech. Existuje tedy pevný obvod $C_3$, který počítá $AMAJ$.

## ACC0 a Koubský obvod

Koubský obvod: poznámky uvádějí konstrukci typu „Briegel-Tarui na $ACC^0$“.

$ACC^0$:

- konstantní hloubka,
- polynomiální velikost,
- hradla $\wedge,\vee,\neg,MOD_m$.

Myšlenka: použít „symetrickou“ funkci, která závisí pouze na počtu jedniček na vstupu, ne na jejich rozmístění.

Důležitý tvar:

$$
ACC^0 = \bigcup_{m\geq 1} AC^0[m].
$$

Razborov-Smolensky lze použít na redukci hradly pro $AC^0[q]$, když $q$ je prvočinitel $m$.

## Rozklad modulo $m$

Mějme

$$
m=p_1^{a_1}p_2^{a_2}\cdots p_k^{a_k}.
$$

Funkce

$$
MOD_m(x)=
\begin{cases}
0, & m \mid \sum x_i,\\
1, & m \nmid \sum x_i
\end{cases}
$$

je ekvivalentní kombinaci testů modulo prvočíselné mocniny.

Platí:

$$
m \mid \sum x_i \iff \forall j=1,\dots,k:\; p_j^{a_j} \mid \sum x_i.
$$

Tím lze $MOD_m$ rozpadnout na hradla $MOD_{p_i}$ a konstantně mnoho operací.

## Nahrazení hradel polynomy

Každé hradlo lze nahradit polynomem, přičemž každá vrstva aritmetiky se sníží na polynomy nad vhodným prvočinitelem $p$.

Speciální polynomy:

$$
P_2(x)=3x^2-2x^3.
$$

Pro $x \equiv 0 \pmod p$ dostaneme $P_2(x)\equiv 0 \pmod {p^2}$.

Pro $x \equiv 1 \pmod p$ dostaneme $P_2(x)\equiv 1 \pmod {p^2}$.

Definice iterací:

$$
P_{2^i}(x)=P_2(P_{2^{i-1}}(x)).
$$

Tvrzení:

$$
P_{2^i} \text{ splňuje zesílení modulo } p^{2^i}.
$$

Pro $k=2^i$ platí odhady:

$$
\deg P_k(x) \leq k^2-1,
$$

$$
\|P_k(x)\| \leq 5^{k^2-1}.
$$

## Čínská věta o zbytcích

Definujeme operaci

$$
x \bmod m =
\begin{cases}
x \bmod m, & x \bmod m < \frac m2,\\
(x \bmod m)-m, & x \bmod m \geq \frac m2.
\end{cases}
$$

Lemma: Jestliže $r(y_1,
\dots,y_
\ell)$ je polynom normy $N$ a

$$
m^k \geq 2N+1,
$$

pak pro všechna $a_1,
\dots,a_
\ell$ existuje ekvivalentní vztah mezi hodnotou $r$ modulo $m$ a hodnotou po aplikaci polynomů $P_k$ na argumenty.

Tím se dá zachovat správná hodnota při přechodu do vyšších mocnin modulu.

## Výsledek pro ACC0-SAT

Testování splnitelnosti $ACC^0$ obvodu:

Máme $ACC^0$ obvod $C$ s $n$ bity vstupu. Existují vstupy $a_1,\dots,a_n$ takové, že

$$
C(a_1,
\dots,a_n)=1?
$$

Triviální algoritmus: čas přibližně $poly(n)2^n$.

Lepší algoritmus: čas

$$
2^n - 2^{n-g^{O(1)}n}.
$$

Náčrt:

- rozdělíme vstup na $n'$ pevně zvolených bitů a zbytek,
- obvod redukujeme na symetrickou vrstvu,
- používáme aritmetické nahrazení hradel,
- vytvoříme tabulky hodnot funkcí pro malé množiny bitů.

## Williams 2010

Výsledek:

$$
NEXP \not\subseteq ACC^0.
$$

Uložený slabší výsledek v poznámkách:

$$
E^{NP} \not\subseteq ACC^0.
$$

Silnější výsledek používá:

$$
NEXP \subseteq P/poly \Rightarrow NEXP \text{ má svědky v } P/poly.
$$

Důkazová idea:

- uvažujme $L \in NTIME(2^n)$ přijímaný strojem $M$,
- pokud $NEXP \subseteq ACC^0$, pak lze ověřovací obvod zapsat jako $ACC^0$,
- pro dané $x$ existuje svědek $\varphi_x$ velikosti $2^n poly(n)$,
- ověření svědka lze převést na problém $ACC^0$-SAT.

Pomocný algoritmus pro $ACC^0$-SAT rozlišuje, zda daný obvod přijímá nějaký vstup.

Tím vznikne algoritmus pro $L$ v čase menším než očekávaný podle časové hierarchie, což dá spor:

$$
NTIME(o(2^n)) \neq NTIME(t(n)).
$$

Poznámka v rukopisu: vhodná posloupnost obvodů ekvivalentních jednotlivým hradlům, proměnným a podobvodům v $C_x$, a proměnná $ACC^0$-SAT určí, zda jejich kombinace dělají, co by měly.
