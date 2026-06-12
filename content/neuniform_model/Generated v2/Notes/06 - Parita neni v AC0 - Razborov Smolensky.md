# Parita není v $AC^0$ - důkaz Razborova a Smolenského

Zdrojové stránky: ![[page-09.png]], ![[page-10.png]], ![[page-11.png]], ![[page-12.png]], ![[page-13.png]], ![[page-14.png]], ![[page-15.png]], ![[page-16.png]]

## Věta

Pro různá prvočísla $p,q$ platí:

$$
MOD_q\notin AC^0[p].
$$

Speciálně:

$$
MOD_2\notin AC^0.
$$

Důkaz má dva kroky:

1. aproximace obvodu nízkostupňovým polynomem,
2. důkaz, že $MOD_q$ nízkostupňový polynom neaproximuje.

## Lemma 1: aproximace obvodu polynomem

Mějme obvod $C$ velikosti $s$ a hloubky $\ell$ nad hradly `OR`, `MOD_q`, `NOT`. Chceme pro každé hradlo $g$ najít polynom $p_g$ nad $GF[q]$, který souhlasí s hodnotou hradla mimo malou množinu špatných vstupů $W_i$.

### Nahrazení hradel

Pro `NOT`:

$$
p_g=1-p_{g'}.
$$

Pro `MOD_q`, ve variantě „výsledek je $1$, když je součet nenulový“:

$$
p_g=\left(\sum_i p_{g_i}\right)^{q-1}.
$$

Důvod: v $GF[q]$ platí pro $a\neq 0$:

$$
a^{q-1}=1,
$$

zatímco

$$
0^{q-1}=0.
$$

Tedy mocnina $q-1$ je indikátor nenulovosti.

Pro `OR`:

$$
p_g=1-\prod_{j=1}^{k}\left(1-\left(\sum_i a_{ji}p_{g_i}\right)^{q-1}\right),
$$

kde koeficienty $a_{ji}\in\\{0,1\\}$ jsou náhodné.

### Pravděpodobnost chyby u OR

Pro pevný vstup $x$ mimo špatné vstupy nižších hladin předpokládejme, že skutečný OR má hodnotu $1$. Pak alespoň jeden vstup hradla je nenulový, řekněme $b_r\neq 0$.

Pro jednu náhodnou lineární kombinaci

$$
A=\sum_i a_i b_i
$$

zafixujeme všechny koeficienty kromě $a_r$. Pak

$$
A=B+a_rb_r.
$$

Hodnoty pro $a_r=0$ a $a_r=1$ jsou $B$ a $B+b_r$, které jsou různé. Proto nejvýše jedna z nich je nulová. Tedy

$$
\Pr[A=0]\leq \frac12.
$$

Máme $k$ nezávislých kombinací. Všechny selžou s pravděpodobností nejvýše

$$
\left(\frac12\right)^k.
$$

Proto

$$
\Pr[p_g(x)\neq g(x)]\leq 2^{-k}.
$$

### Indukce po hladinách

Nechť $W_i$ je množina vstupů, na kterých už některý polynom do hladiny $i$ nesouhlasí se skutečným obvodem.

Pak

$$
W_{i-1}\subseteq W_i.
$$

Pro $x\notin W_{i-1}$ jsou všechny polynomy na nižších hladinách správné, takže lokální analýza hradla na hladině $i$ platí.

Je-li na hladině $i$ nejvýše $s_i$ hradel, pak union bound přes všech $2^n$ vstupů a $s_i$ hradel dává

$$
|W_i|\leq |W_{i-1}|+2^n s_i2^{-k}.
$$

Po všech hladinách:

$$
|W|\leq O(2^n s2^{-k}).
$$

Volíme například

$$
s=2^{n^{1/(4\ell)}},\qquad k=n^{1/(3\ell)}.
$$

Pak

$$
s2^{-k}=2^{n^{1/(4\ell)}-n^{1/(3\ell)}}=o(1),
$$

tedy

$$
|W|=o(2^n).
$$

### Stupeň polynomu

Při průchodu jednou hladinou se stupeň zvětší nejvýše faktorem $(q-1)k$. Po $\ell$ hladinách:

$$
\deg(p_C)\leq ((q-1)k)^\ell.
$$

Pro

$$
k=n^{1/(3\ell)}
$$

dostaneme

$$
\deg(p_C)\leq (q-1)^\ell n^{1/3}=O(n^{1/3}),
$$

protože $q$ i $\ell$ jsou konstanty.

## Lemma 2: nízký stupeň neaproximuje paritu

Sporem předpokládejme, že existuje polynom $p_C$ stupně $O(n^{1/3})$, který počítá $MOD_2$ správně na všech kromě $o(2^n)$ vstupů.

Přejdeme z $\\{0,1\\}$ do $\\{-1,1\\}$:

$$
p'_2(y_1,\dots,y_n)=1-2p_C\left(\frac{1-y_1}{2},\dots,\frac{1-y_n}{2}\right).
$$

Pak

$$
p'_2:\\{-1,1\\}^n\to\\{-1,1\\}
$$

a mimo špatnou množinu $W'_C$ platí

$$
p'_2(y)=\prod_{i=1}^n y_i.
$$

Tedy $p'_2$ aproximuje multiplikativní paritu.

## Multilineární polynomy

Na krychli $\\{-1,1\\}^n$ platí

$$
y_i^2=1.
$$

Proto každá funkce má multilineární reprezentaci

$$
f(y)=\sum_{I\subseteq[n]}c_I\prod_{i\in I}y_i.
$$

Multilineární znamená, že v žádném monomu se proměnná nevyskytuje s exponentem větším než $1$.

Pro libovolný monom platí

$$
\prod_{i\in I}y_i=\prod_{i=1}^n y_i\cdot \prod_{i\notin I}y_i.
$$

Důvod:

$$
\prod_{i=1}^ny_i=\left(\prod_{i\in I}y_i\right)\left(\prod_{i\notin I}y_i\right)
$$

a po vynásobení ještě $\prod_{i\notin I}y_i$ dostaneme druhé mocniny $y_i^2=1$.

Pokud $|I|>n/2$, pak doplněk $[n]\setminus I$ má velikost $<n/2$.

Proto každý vysokostupňový monom lze na dobrých vstupech přepsat pomocí parity a nízkostupňového monomu.

Díky tomu lze každou funkci $f$ na dobrých vstupech zapsat jako

$$
f(y)=p'_2(y)l_1(y)+l_2(y),
$$

kde $l_1,l_2$ jsou multilineární polynomy stupně nejvýše $n/2$.

Protože

$$
\deg(p'_2)=O(n^{1/3}),
$$

každá funkce na dobrých vstupech by byla reprezentovatelná polynomem stupně

$$
\leq n/2+O(n^{1/3}).
$$

## Počítací spor

Funkcí

$$
f:\\{-1,1\\}^n\setminus W'_C\to GF[q]
$$

je

$$
q^{2^n-|W'_C|}=q^{2^n-o(2^n)}.
$$

Počet multilineárních polynomů stupně nejvýše

$$
D=n/2+O(n^{1/3})
$$

je nejvýše

$$
q^{\sum_{i=0}^{D}\binom ni}.
$$

Důvod: monom stupně $i$ odpovídá volbě $i$ proměnných z $n$, tedy možností je $\binom ni$. Každý koeficient má $q$ možností.

Platí

$$
\sum_{i=0}^{n/2+O(n^{1/3})}\binom ni
\leq 2^{n-1}+o(2^n).
$$

Tedy nízkostupňových polynomů je nejvýše

$$
q^{2^{n-1}+o(2^n)},
$$

ale funkcí na dobrých bodech je

$$
q^{2^n-o(2^n)}.
$$

To je spor.

Proto parita nemůže být aproximována nízkostupňovým polynomem, a tedy není v $AC^0$.
