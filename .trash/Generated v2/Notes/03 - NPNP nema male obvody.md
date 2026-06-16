# $NP^{NP}$ nemůže mít obvody velikosti $O(n^k)$ pro pevné $k$

Zdrojové stránky: ![[page-05.png]], ![[page-06.png]], ![[page-07.png]], ![[page-08.png]]

## Cíl

Chceme dokázat tvrzení ve tvaru:

$$
\forall k\geq 0\ \exists L\in NP^{NP}\quad L\notin SIZE(n^k+k).
$$

Poznámky používají jako mezikrok jazyk ve třetí úrovni hierarchie:

$$
\forall k\ \exists H\in NP^{NP^{NP}}\quad H\notin SIZE(n^k+k),
$$

a potom pomocí kolapsového argumentu stáhnou třídu do $NP^{NP}$.

## Počáteční úsek pravdivostní tabulky

Seřaďme slova délky $n$ lexikograficky:

$$
w_1=0^n,w_2=0^{n-1}1,\dots,w_{2^n}=1^n.
$$

Pravdivostní tabulka funkce $f:\\{0,1\\}^n\to\\{0,1\\}$ je řetězec

$$
f(w_1)f(w_2)\cdots f(w_{2^n}).
$$

Počáteční úsek délky $r$ je

$$
f(w_1)f(w_2)\cdots f(w_r).
$$

## Pomocný jazyk $S$

Definujeme

$$
S=\{a01^n01^m;\ a \text{ je počáteční úsek pravdivostní tabulky funkce } f:\{0,1\}^n\to\{0,1\},
$$
$$
\text{která je počitatelná obvodem velikosti }\leq m\}.
$$

Tedy

$$
a01^n01^m\in S
$$
právě tehdy, když existuje obvod $C$ velikosti $\leq m$ takový, že pro první $|a|$ slov délky $n$ platí

$$
C(w_i)=a_i.
$$

### Proč $S\in NP$

Certifikát je popis obvodu $C$ velikosti $\leq m$.

Ověřovač:

1. uhádne obvod $C$,
2. vygeneruje první $|a|$ slov $w_1,\dots,w_{|a|}$ délky $n$,
3. ověří, že $C(w_i)=a_i$ pro všechna $i$.

Délka vstupu $a01^n01^m$ je $|a|+n+m+O(1)$, takže ověřování je polynomiální v délce vstupu.

## Výběr špatného prefixu

Nechť

$$
\ell=n^{2k}+k,\qquad m=n^k+k.
$$

Z počítání obvodů plyne, že existuje prefix

$$
a\in\\{0,1\\}^{\ell}
$$

který není počátečním úsekem pravdivostní tabulky žádného obvodu velikosti $\leq m$.

Tedy

$$
a01^n01^m\notin S.
$$

Kdybychom v algoritmu jen nedeterministicky hádali libovolný takový prefix $a$, vznikl by problém: pro různá vstupní slova $w_j$ by stroj mohl vybrat různá $a$.

Pak by platilo

$$
w_j\in L \iff \exists a\notin S:\ a_j=1,
$$

což obecně není jeden pevný špatný prefix, ale slepenec bitů z různých prefixů.

## Jazyk $S'$ a jednoznačná volba

Vybereme kanonický prefix

$$
h_n=\min_{lex}\\{a\in\\{0,1\\}^{\ell};\ a01^n01^m\notin S\\}.
$$

Definujeme $S'$ tak, že

$$
a01^n01^m\in S'
$$

právě tehdy, když platí alespoň jedna z možností:

1. $a01^n01^m\in S$,
2. existuje lexikograficky menší $a'<a$ takové, že

$$
a'01^n01^m\notin S.
$$

Pak platí

$$
a01^n01^m\notin S' \iff a=h_n.
$$

Důvod:

- pro $a<h_n$ je $a$ dobrý prefix, tedy $a\in S\subseteq S'$,
- pro $a=h_n$ není $a\in S$ a neexistuje menší špatný prefix, tedy $a\notin S'$,
- pro $a>h_n$ existuje menší špatný prefix, totiž $h_n$, tedy $a\in S'$.

Proto mimo $S'$ zůstane právě jeden prefix.

## Složitost $S'$

Druhá podmínka obsahuje existenci $a'<a$ s $a'\notin S$. Test $a'\in S$ je v $NP$, takže test $a'\notin S$ je coNP relativně k $S$.

Celkově se $S'$ dá rozhodovat v $NP^{NP}$: uhádneme $a'$ a dotazem do oracle pro $S$ ověříme, zda $a'\in S$; přijímáme podle negované odpovědi.

Tedy

$$
S'\in NP^{NP}.
$$

## Konstrukce jazyka $H\in NP^{NP^{NP}}$

Na vstupu $x$ délky $n$:

1. zjisti index $j$, kde $x=w_j$ v lexikografickém pořadí slov délky $n$,
2. nedeterministicky uhádni prefix $a\in\\{0,1\\}^{\ell}$,
3. pomocí oracle $S'$ ověř, že $a01^n01^m\notin S'$,
4. tím je vynuceno $a=h_n$,
5. pokud $j\leq \ell$, přijmi právě tehdy, když $(h_n)_j=1$,
6. pokud $j>\ell$, odmítni.

Protože $S'\in NP^{NP}$, algoritmus je v

$$
NP^{S'}=NP^{NP^{NP}}.
$$

## Proč $H$ nemá malé obvody

Předpokládejme pro spor, že $H\in SIZE(n^k+k)$.

Pak pro danou délku $n$ existuje obvod $C_n$ velikosti $\leq m=n^k+k$, který počítá $H$ na všech slovech délky $n$.

Vezměme prvních $\ell$ slov délky $n$:

$$
w_1,\dots,w_{\ell}.
$$

Z definice $H$ platí

$$
H(w_j)=(h_n)_j
$$

pro všechna $j\leq \ell$.

Protože $C_n$ počítá $H$,

$$
C_n(w_j)=H(w_j)=(h_n)_j.
$$

Tedy počáteční úsek pravdivostní tabulky $C_n$ je právě $h_n$. Z definice $S$ plyne

$$
h_n01^n01^m\in S.
$$

To je spor s volbou $h_n$, protože $h_n$ byl zvolen tak, že

$$
h_n01^n01^m\notin S.
$$

Tedy

$$
H\notin SIZE(n^k+k).
$$

## Kolaps z $NP^{NP^{NP}}$ do $NP^{NP}$

Důkaz závěrečného tvrzení rozlišuje dvě možnosti.

### 1. $NP\nsubseteq PSIZE$

Pak existuje jazyk $L\in NP$, který nemá polynomiálně velké obvody. Protože

$$
NP\subseteq NP^{NP},
$$

máme rovnou jazyk v $NP^{NP}$ bez malých obvodů.

### 2. $NP\subseteq PSIZE$

Pak se použije Karp-Liptonův kolaps. Protože $SAT\in NP$, existují polynomiálně velké obvody $C_N$ rozhodující SAT pro všechny formule velikosti $\leq N$.

Pro formuli

$$
\exists x\ \forall y\ \exists z\ \varphi(x,y,z)
$$

po fixaci $x,y$ vznikne SAT instance

$$
\psi_{x,y}(z)=\varphi(x,y,z).
$$

Jedním obecným obvodem $C_N$ lze rozhodovat všechny takové instance $\psi_{x,y}$, protože $y$ je jen část vstupu do formule, ne důvod k volbě nového obvodu.

Správnost uhádnutého obvodu $C_N$ se ověří samoredukovatelností SATu:

$$
\psi\in SAT \iff \psi[u:=0]\in SAT\ \vee\ \psi[u:=1]\in SAT.
$$

Tím dostaneme popis ve tvaru

$$
\exists x\exists C_N\ \forall y\forall \psi\ R(x,C_N,y,\psi),
$$

kde $R$ je polynomiálně ověřitelný predikát. To je úroveň $\Sigma_2^p=NP^{NP}$.

Za předpokladu $NP\subseteq PSIZE$ tedy

$$
NP^{NP^{NP}}\subseteq NP^{NP}.
$$

Jazyk $H$ z předchozí části je tedy ve skutečnosti v $NP^{NP}$ a stále nemá malé obvody.
