## AC0 obvody
$AC^0$ obvody:
- konstantní hloubka $O(1)$,
- polynomiální velikost,
- hradla $\wedge, \vee, \neg$ s neomezeným fan-inem.

Příklady úloh:
- sečíst dvě čísla v binárním zápisu,
- spočítat počet jedniček, pokud je jich nejvýše $\log n$,
- rozhodnout, zda
$$
\sum x_i \leq \log n,
$$
- rozhodnout, zda
$$
\sum x_i \geq \frac34 n \quad \text{nebo} \quad \sum x_i \leq \frac14 n.
$$
Neumí: spočítat paritu vstupu $b$:
$$
\sum_i x_i \bmod 2.
$$
$AC^i =$ obvody s hloubkou $O(\log^i n)$ při libovolném fan-in or, and

$NC^i$ = obvody hloubky $O(\log^i n)$ (bool formule) při $2$-árních and,or
- $LOGSPACE \subseteq NC^2$
- $AC^i \subseteq NC^{i+1}$
- $ADD,SUB \in NC^1$
- $MUL,DIV\not\in AC^0$ (parita se dá redukovat na násobení)
---
## Parita není v AC0
Výsledek: Pro každá prvočísla $p,q$ platí, že $MOD_q$ není v $AC^0[p]$.

Zvlášť:
$$
MOD_2 \notin AC^0.
$$
Poznámka: $AC^0[p]$ jsou polynomiálně velké $AC^0$ obvody nad hradly $\wedge,\vee,\neg$ a $MOD_p$.
## Důkaz ve dvou krocích
1. aproximace obvodu polynomem nad $GF[q]$,
2. $MOD_p$ nelze aproximovat polynomem nízkého stupně nad $GF[q]$.
## Lemma 1: aproximace obvodu polynomem
Cíl: pro obvod $C$ velikosti $s$ a hloubky $\ell$ nad hradly `OR`, `MOD_q`, `NOT` najít polynom $p_g$ nad $GF[q]$ pro každé hradlo $g$, který souhlasí s hodnotou hradla na všech vstupech mimo malou množinu $W_i$.

Pro hradla:
- `NOT`:
$$
p_g = 1-p_{g'}.
$$
- `MOD_q`: (odpoví se 1, když je výsledek nenulový)
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
Protože pro fixní $x\in W_{j-1}$ je pravděpodobnost pro jedno z $k$ výběrů je pravděp. toho, že ten jeden index $x$, kde je polynom na nižší úrovni $1$ vybrán je $\frac{1}{2}$ a výběrů $a_{ij}$ je $k$ a jsou nezávislé.  

Po $i$-té hladině: (špatné $W_{i-1}$ jsou nadále špatné, na $i$ je $s_{i}$ hradel a $2^n$ je počet možných vstupů)
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

Závěr: Pro každý $AC^0[q]$ obvod velikosti asi $2^{n^{1/(4\ell)}}$ a hloubky $\ell$ existuje polynom nad $GF[q]$, který počítá stejnou funkci na všech vstupech kromě $o(2^n)$ vstupů. Tedy $|W_{n}| - 2^n \to 0$.

$$
deg (p_{g}) \leq ((q-1)k)^\ell,
$$
protože při jednom hradle se zvýší stupeň
- NOT $\to$ nezvýší stupeň
- MOD$_q$ $\to$ zvýší stupeň $(q-1)$-krát (kvůli mocnění)
- OR $\to$ zvýší stupeň $(q-1)\cdot k$-krát (mocnění a k členů se násobí)
- $\ell$ je maximální hloubka tedy dobrý odhad na počet změn polynomu

Stupeň celého polynomu je přibližně
$$
((q-1)n^{1/(3\ell)})^{\ell} = (q-1)^\ell n^{1/3} \in O(n^{1/3}).
$$
## Lemma 2: nízký stupeň neaproximuje MOD
Sporem, mějme obvod $C$ pro $p=2, MOD-2$ s $\text{deg } p_{C}=O(n^{1/3})$ počítající správně $2^n - o(2^n)$ vstupech. 

Definujme si
$$
p'_2(y_1,\dots,y_n)=1-2p_2\left(\frac{1-y_1}{2},\dots,\frac{1-y_n}{2}\right),
$$
kde $p'_2 : \{-1,1\}^n \to \{-1,1\}$. Počítáme nad $q>2$ a máme tedy inverzi pro $1$, pak 
$$
deg (p_{2}') \leq deg(p_{C}) = O(n^{1/3}).
$$
$$
p_{2}'(y_{1},\dots,y_{n}) =\prod_{i=1}^n y_{i} \text{ na } \{ -1,1 \}^n \setminus W'_{C}
$$
Nechť $f:\{ -1,1 \}^n \setminus W'_{C} \to GF[q]$, protože $x^2_{i}=1$, lze $f$ reprezentovat multilineárním polynomem nad $GF[q]$ taková, že $l_{1},l_{2}$ jsou multilineární polynomy stupně $\leq \frac{n}{2}$ takové, že
$$
f(y_{1},\dots,y_{n}) = p'_{2} l_{1} + l_{2}
$$
navíc platí
$$
y_{1},\dots,y_{n}\in \{ -1,1 \}^n \setminus W'_{C}: \prod_{i\in I} y_{i} = \prod_{i=1}^n y_{i} \cdot \prod_{i\not\in I} y_{i}
$$
takže $f$ lze reprezentovat polynomem stupně $\leq \frac{n}{2} + O(n^{1/3})$.

Takových funkcí $f: \{ -1,1 \}^n \setminus W'_{C} \to GF[q]$ je 
$$
\geq q^{2^{n}-|W'_{C}|} \geq 3^{2^n - |W'_{C}|},
$$
ale polynomů, které by měli dle předpokladu být pro každou takovou funkci je
$$
\leq q^{\sum_{i=0}^{n/2 + O(n^{1/3})} \binom{n}{i}} \leq q^{2^{n-1}+o(2^n)}
$$
a
$$
q^{2^{n-1}+o(2^n)} \ll 3^{2^n - |W'_{C}|}
$$
tedy spor.

Ten exponent u $q$ je protože multilineární monom stupně nejvýše $D$ se vybírá tak, že se zvolí podmnožina indexů proměnných.  

---
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
- $C_2(x)=\bigvee$ z $n^{15}$ nezávislých kopií $C_1$,
- $C_3(x)=\bigwedge$ z $n^2$ nezávislých kopií $C_2$.

Pak pravděpodobnost chyby je (nechť je $\sum x_{i}\leq \frac{1}{4} n$)
- $C_0: \Pr[C_{0}(x)=1]\leq \frac{1}{4}$ protože maximálně čtvrtina je s $1$ a ta da chybu
- $C_{1}: \Pr[C_{1}(x)=1]\leq 4^{-10\log n} = \frac{1}{n^{20}}$
- $C_{2}: \Pr[C_{2}(x)=1] \leq n^{15} \cdot n^{-20}=n^{-5}$
- $C_{3}: \Pr[C_{3}(x)] \leq n^{-10} \leq 2^{-n^2}$ a chyba je velmi malá

Pravděpodobnost správné odpovědi když $\sum x_{i}\geq \frac{3}{4}n$
- $C_0: \Pr[C_{0}(x)=1]\geq \frac{3}{4}$
- $C_{1}: \Pr[C_{1}(x)=1]\geq \left( \frac{3}{4} \right)^{10\log n} \geq \frac{1}{n^{10}}$
- $C_{2}: \Pr[C_{2}(x)=1] \geq 1- ( 1-  n^{-10})^{n^{15}} \geq 1-e^{-n^5}$
- $C_{3}: \Pr[C_{3}(x)] \geq 1-  (n^{2}(1-e^{-n^5})) \geq 1-e^{-n^4}$

Náhodně zvolený $C_{3}$ počítá AMAJ s nenulovou pravděpodobností a tedy existuje $C_{3}$ počítající AMAJ a tedy je zjevně v $AC^0$.

---
## Redukce hloubky obvodu
$ACC^0$:
- konstantní hloubka,
- polynomiální velikost,
- hradla $\wedge,\vee,\neg,MOD_m$.
  
Chceme $ACC^0$ obvod poly-velikosti a konstantní hloubky předělat na obvod, kde výstupem je symetrická funkce s fan-in $2^{\log^{O(1)}n}$ a k ní připojené jen $\land$ s $\log^{O(1)}n$ proměnnými.

Myšlenka: použít „symetrickou“ funkci, která závisí pouze na počtu jedniček na vstupu, ne na jejich rozmístění. Těchto funkcí je $2^m$ místo $2^{2^m}$, protože závisí jen na vahách ohodnocení $0,1,\dots,m$ a těch je $m+1$, asymptoticky tedy $2^{m}$ fcí.
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

Důkaz $\implies$ triviální

$\impliedby$ pokud všechny dělí $\sum x_{i}$, tak i nejmenší společný násobek $p_{1},\dots,p_{k}$ dělí $\sum x_{i}$ a tento násobek je z definice rozkladu $m$.


$ACC^0$ obvod $C$ rozepíšeme $MOD-m$ jako $MOD-p_{i}$ a hradla rozvrstvíme tak, že v každé vrstvě obvodu je jen jeden typ hradla
1. $\neg$ nebo $\lor$
2. $MOD-p_{i}$, kde $p_i$ je shodné v rámci jedné vrstvy.

$\to$ $C$ je stále konstantně hluboké ($O(k)$) a polynomiálně velké.
### Nahradíme hradla polynomy
1. $\neg y_{i}\to r_{\neg}(y_{i}) = 1-y_{i} \mod 2$
2. $OR(y_{1},\dots,y_\ell) \to r_{OR}(y_{1},\dots,y_{\ell}) = 1- \prod_{i=0}^{\log^2 n}\left( 1-\left( \sum_{j=1}^{\ell} a_{ij}y_{j} \right) \right) \mod 2$, kde $a_{ij}$ jsou zvoleny náhodně. Pro pevné $y_{1},\dots,y_{\ell}$ je $\Pr[r_{OR} = OR] \geq 1-\left( \frac{1}{2^{\log^2 n}} \right)\geq 1 - \frac{1}{n^{\log n}}$.
3. $MOD-p(y_{1},\dots,y_{\ell}) \to r_{MOD-p}(y_{1},\dots,y_{\ell}) =\left( \sum_{i=1}^{\ell} y_{i}\right)^{p-1} \mod p$ a to vychází z malé Fermatovy věty $0 / 1$.

$C''$ takto vzniklý pro dané $x$ vstup máme
$$
\Pr_{a_{ij}}[ \text{v } C'' \text{ některý polynom na } x \text{ nedá správnou odpověď}] \leq \frac{1}{n^{\log n}} \cdot |C''| \leq \frac{1}{64}
$$
pro dostatečně velká $n$, protože $C''$ je poly velký $O(k \cdot n^c)$. 

Mějme teď $C'''$, který je složen z $MAJ$ připojené k $n$ nezávisle náhodně zvoleným $C''$, pak pro daný vstup $x$
$$
\Pr_{a_{ij}}[C'''(x)\neq C(x)]\leq \binom{n}{\frac{n}{2}} \left( \frac{1}{64} \right)^{n/2} \leq 2^n \cdot \frac{1}{8^n} = \frac{1}{4^n}
$$
a tedy lze zafixovat $a_{ij}$ takové, že se odpoví správně na všech vstupech.

Zkonstruujeme $C''''$ do podoby kterou chceme postupným kolapsem vrchních dvou vrstev. 

Chceme aby MAJ, která rozhoduje na $r(y_{1},\dots,y_{n})=\sum_{i=1}^n y_{i}$ se zkolabovalo s polynomy $r'_{1},r'_{2},\dots,r_{\ell}'$, které jsou všechny $\mod p$. Nemůžeme je ale jednoduše substituovat protože při $\mod p$ může dojít k tomu, že vyjde $r(x)=0$, i když se něco splnilo, můžou vznikat chyby při splnění přesně $p$ členů.

Pro polynom je norma součet koeficientů v absolutní hodnotě.

Speciální polynomy $P_{k}: \mathbb{Z}\to \mathbb{Z}$, že $\forall m,\forall k,\forall x$:
- Pro $x \equiv 0 \pmod p$ dostaneme $P_k(x)\equiv 0 \pmod {p^k}$.
- Pro $x \equiv 1 \pmod p$ dostaneme $P_k(x)\equiv 1 \pmod {p^k}$.
$$
P_2(x)=3x^2-2x^3.
$$
Definice iterací:
$$
P_{2^i}(x)=P_2(P_{2^{i-1}}(x)).
$$
Pro $2^{j-1} < k < 2^{j}$ máme
$$
P_{k} (x) = P_{2^{j}}(x).
$$
Tvrzení:
$$
P_{2^i} \text{ splňuje zesílení modulo } p^{2^i}.
$$
Důkaz: pro $i=0$ máme
- $x=0 \mod p \implies x=  c \cdot p \implies p^2 \mid 3 x^2$ i $p^2 \mid 2x^3$ a tedy $p^2 \mid 3x^2 - 2x^3$
- $x=1 \mod p \implies x=  c \cdot p +1 \implies 3(2cp + 1) - 2(2cp +1 )(cp+1)$, protože $x^2 \mod p^2 = (2cp+1)$ a pak máme $\stackrel{\mod p^2}= 6cp +3 - 4cp -2cp -2$ a $\stackrel{\mod p^2}= 1$.

Pro $i>1$ máme
- $x=0 \mod p \implies y = P_{2^{i-1}}(x)=c \cdot p^{2^{i-1}}$ a pak stejným odvozením jako výše máme $\implies p^{2^{i}} \mid P_{2}(y)$.
- $x=1 \mod p \implies y = P_{2^{i-1}}(x)=cp^{2^{i-1}}+1 \implies P_{2}(y) = c' p^{2^i}+1 \mod p^{2^i}$.

Tvrzení: Pro $k=2^i$ platí odhady:
1. $\deg P_k(x) \leq k^2-1$,
2. $\|P_k(x)\| \leq 5^{k^2-1}$.

Důkaz indukcí: Stupeň $P_{k}(x) \leq 3\left[ \left( \frac{k}{2} \right)^2 -1 \right]=\frac{3}{4}k^2 -3 \leq k^2 -1$

A norma $P_{k}(x)$, předpokládejme $P_{\frac{k}{2}}(X)= N \leq 5^{(k/2)^2 -1}$, pak 
$$
P_{k}(x)\leq 3 N^2 + 2N^3 \leq{5}N^3 \leq5(5^{(k/2)^2 -1})^3 \leq 5^{((k/2)^2 -1)3+1} \leq 5^{k^2 -1}.
$$
## Čínská věta o zbytcích
Definujeme operaci (má hodnoty z $\left[ -\frac{m}{2}, \frac{m}{2} \right]$)
$$
x \overline{\bmod} m =
\begin{cases}
x \bmod m, & x \bmod m < \frac m2,\\
(x \bmod m)-m, & x \bmod m \geq \frac m2.
\end{cases}
$$
Lemma: Jestliže $r(y_1,\dots,y_\ell)$ je polynom normy $N$ a $m^k \geq 2N+1$, pak pro všechna $a_1,\dots,a_\ell$ (t.ž $a_{i}\mod m\in \{ 0,1 \})$ je 
$$
r(a_{1} \mod m,a_{2} \mod m,\dots,a_{\ell} \mod m) = r(P_{k}(a_{1}),\dots,P_{k}(a_{\ell})) \overline{\bmod} m^k
$$
Důkaz
$$
\begin{align*}
&r(a_{1} \mod m,a_{2} \mod m,\dots,a_{\ell} \mod m)\\ 
& = r(P_{k}(a_{1}) \mod m^k,\dots,P_{k}(a_{\ell}) \mod m^k) \\
& = r(P_{k}(a_{1}) \mod m^k,\dots,P_{k}(a_{\ell}) \mod m^k) \overline{\bmod} m^k \\
&= r(P_{k}(a_{1}),\dots,P_{k}(a_{\ell})) \overline{\bmod} m^k
\end{align*}
$$
kde 2. rovnost platí, protože $m^k \geq 2N +1$, protože hodnota polynomu je $\leq N$ pro všechny. 

Kolabujeme vrstvy dle lemma a vznikne nám polynom $R(x)= \sum_{i} P_{k}(r_{i}(x))$ a ten roznásobíme na 
$$
R(x) = \sum_{I} c_{I} \prod_{j\in I} x_{j}
$$
to si můžeme dovolit, protože výsledky u $x_{i}$ jsou jen $0,1$ a každý člen $\prod x_{j}$ je AND nad proměnnými z $I$. Pokud je stupeň polynomu $\log^{O(1)}n$ (a to je protože or ma nejvyšše $\log^2 n$ faktorů a mocnění na $p$ je konstanta), pak každý AND má fan-in také $\log^{O(1)}n$. 

Norma pro polynom $OR$ je $(1+n^c)^{\log^2 n}$, protože máme $(1-a_{ij}y_{i})$, pak tedy je norma $2^{\log^{O(1)}n}$, to samé pro $MOD-p$ hradla. Když vše naskládáme přes konstantně mnoho vrstev, tak mám stále normu $2^{\log^{O(1)}n}$. 

Protože počet různých členů stupně nejvýše $d$ je $n^d$ a $d=\log^{O(1)}n$ a jeden unikátní člen musíme mít jako vstup maximálně norma-krát, takže fan-in symetrické funkce je $2^{\log^{O(1)}n}$.

## Výsledek pro ACC0-SAT
Testování splnitelnosti $ACC^0$ obvodu:

Máme $ACC^0$ obvod $C$ s $n$ bity vstupu. Existují vstupy $a_1,\dots,a_n$ takové, že $C(a_1,\dots,a_n)=1$?

Triviální algoritmus: čas přibližně $poly(n)2^n$.

Lepší algoritmus: čas $2^{n-\log^{O(1)}n}.$

V čase $2^{\log^{O(1)}n}$ si vyrobíme redukci dle mechanismu výše, překontrolujeme validitu $h$ (symetrická funkce) a $r(x_{1},\dots,x_{n'})$, kde $n'=n-\log^{O(1)}n$ a chceme otestovat zda $\exists x_{1},\dots,x_{n'}\in \{ 0,1 \}$ takové, že $h(r(x_{1},\dots,x_{n'}))=1$.

Mějme $x\in \{ 0,1 \}^{n'}$ a definujme $S_{x}=\{ i;x_{i}=1 \}$ a $g(S)=$ koeficienty mnohočlenu $\prod_{i\in S}x_{i}$ v $r(x_{1},\dots,x_{n'})$. Navíc $\forall S\subseteq \{ 1,\dots,n' \}$ je $|S|\leq \log^{O(1)}n$ a lze $g(S)$ spočítat v čase $2^{\log^{O(1)}n}$.
$$
\forall x; r(x) = \sum_{T \subseteq S_{x}} g(T)
$$
Definujme $g_{i}(S)= \sum_{T \subseteq S,T \cap \{ i+1,\dots,n' \}=S\cap \{ i+1,\dots,n' \}} g(T)$, pak
- $g_{0}(S)=g(S)$
- $g_{n'}(S_{x})=r(x)$

Spočteme $g_{i}(S)$ pro $\forall S \subseteq \{ 1,\dots,n' \}$ tak, že
$$
g_{i}(S) = \begin{cases}
g_{i-1}(S) & i\not\in S \\
g_{i-1}(S)+g_{i-1}(S \setminus \{ i \}) & i\in S
\end{cases}
$$
$g_{n'}(S)$ lze spočítat v čase $2^{n'}\cdot n'$ pokud známe $g_{0}(S)=g(S)$, z tabulky pro $g_{n'}(S)=r(x)$ se určí spolu s tabulkou pro $h$ splnitelnosti $C(x)$. 

Program vypadá jak vypadá protože v $i$ t€m kroku si dovolujeme vynechávat prvky jen z množiny $\{ 1,\dots,i \}$, pokud $i \not\in S$ tak stejně nemůže být v $T$ a druhá možnost charakterizuje to když $i\in T$, pak $g_{i-1}(S)$ jsou přesně podmnožiny s $i$ (musí z def ho vybrat, protože $i>i-1$) a $g_{i-1}(S \setminus \{ i \})$ jsou podmnožiny bez $i$.

Obojí tabulky jsou nad $n'$ a tedy se dá rozhodnout ve $2^{n - \log^{O(1)}n}$.

---
## WIlliams 2010: $NEXP \not\subseteq ACC^0.$
$$
NEXP = \bigcup_{k \in \mathbb{N}} NTIME(2^{n^k}), \quad E= DTIME(2^{O(n)})
$$
Slabší výsledek:
$$
E^{NP} \not\subseteq ACC^0.
$$
Silnější výsledek používá:
$$
NEXP \subseteq P/poly \Rightarrow NEXP \text{ má svědky v } P/poly.
$$

Důkazová idea:
- uvažujme $L \in NTIME(2^n)$, který $L\not\in NTIME(o(2^n))$ přijímaný strojem $M$,
- pokud $NEXP \subseteq ACC^0$, pak $L\in NTIME(o(2^n))$. To je spor s větou o nedeterministické časové hierarchii $NTIME(o(t(n)) \subsetneqq NTIME(t(n+1))$
- $\forall x, \exists \varphi_x$ 3-CNF velikosti $2^n poly(n)$ taková, že $x\in L \iff \varphi_{x}$ je splnitelná (svědek),
- ověření svědka lze převést na problém $ACC^0$-SAT.

$\varphi_{x}$ kóduje tabulku výpočtu $M$ pro $x$ a to dá $\varphi_{x}$ velikosti $O(2^n \cdot 2^n)$ ale to můžeme zlepšit na $O(2^n poly(n))$.

Existuje poly-time algoritmus, který pro $x$ sestrojí poly-velký obvod $C_{x}$ kódující $\varphi_{x}$. 
- $C_{x}$ na vstupu $i\in \{ 0,1 \}^{n +O(\log n)}$ vypíše indexy tří proměnných obsažených v $i$-té disjunkci $\varphi_{x}$ spolu se třemi bity určujícími, které z těchto tří proměnných jsou v $i$-té disjunkci negované.
- v $E^{NP}$ lze najít pro dané $x\in L$ splňující ohodnocení $\varphi_{x}$ (binární vyhledávání na proměnných $\varphi_{x}$)
- Pokud je $E^{NP} \subseteq ACC^0$ pak pro dané $x\in L$ existuje $ACC^0$ obvod $W_{x}$ kódující splnitelné ohodnocení $\varphi_{x}$. $W_{x}$ jako vstup vezme index proměnné a spočítá její hodnotu ve splňujícím ohodnocení pro $\varphi_{x}$.
- Kdyby $C_{x}$ byl $ACC^0$ obvod, pak $T_{x}$, který je $1 \iff i$-tá klauzule $\varphi_{x}$ je splněná ohodnocením $W_{x}$ je také v $ACC^0$.
![[t-x.excalidraw.svg]]

Pomocí algoritmu pro $ACC^0$-SAT otestujeme v čase $o(2^n)$, zda $T_{x}$ dává $1$ pro všechna $i$.

Pak máme algoritmus pro $L$
1. Uhodneme $C'_{x}$ ($ACC^0$ obvod ekvivalentní $C_{x}$)
2. Ověříme, že $C_{x}'\equiv C_{x}$,
3. Uhodni $W_{x}$ a otestuj, že $T_{x}$ dává vždy $1$

Ověření ekvivalence je uhodnutí posloupnosti obvodů ekvivalentní jednotlivým hradlům v $C_{x}$ a pomocí $ACC^0$-SAT ověříme, že jejich konkatenace dělají co by měli.

Tím vzniklý algoritmus v čase $NTIME(o(2^n))$ menším než očekávaný podle časové hierarchie, což dá spor:
$$
NTIME(o(2^n)) \neq NTIME(t(n)).
$$

