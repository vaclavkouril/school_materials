# Pokud $\mathcal{P}\ne \mathcal{NP}$, tak existuje jazyk $A\in \mathcal{NP}$ a zároveň $A\not\in \mathcal{P}$ a $A$ není NPÚ.
## Příprava Důkazu:
- zakódujeme CNF formule do nějaké standardní abecedy $(a,\dots,z),(,),\lor,\land$ a tyto řetězce pak zakódujeme do $\{ 0,1 \}$.
- řetězce nad abecedou $\{ 0,1 \}$ očíslujeme lexikograficky od nejkratších $y_{1}=\{ 0 \},y_{2}=\{ 1 \},y_{3}=\{ 0,0 \}\dots$
- řetězce, které po zpětném překódování nedávají syntakticky správnou CNF sloučíme s nesplnitelnou CNF

*Platí* $SAT= \{ y_{i}\mid y_{i} \text{kóduje splnitelnou CNF} \}\in \mathcal{NPÚ}$.
- očíslujeme všechny orákulové DTS pracující v polyn. čase což lze udělat např. tak, že $M_{i}$ je DTS s Gödelovým číslem $i$ doplněný o "budík", který ukončí pro vstup $x$ výpočet po $|x|^i$ krocích.
*Platí* 
- $x\in \mathcal{P}\implies \exists i: X=L(M_{i},\emptyset)$
- $X\in \mathcal{NPÚ} \implies \exists i: SAT = L(M_{i},X)$
*Cíl* Zkonstruovat $A\in \mathcal{NP}$ (rozpoznáván poly-čas NTS) takový, že
- $A\in \{ L(M_{1},\emptyset),L(M_{2},\emptyset),\dots \}$
- $SAT \not\in \{ L(M_{1},A),L(M_{2},A),\dots \}$

Zkonstruujeme univerzální NTS $N$ pracující na vstupu $x$ v čase $p(|x|)$ pro nějaký pevný polynom $x$ (stupně $\geq{1}$) rozpoznávající $A$ a $N$ na vstupu $x$ pracující takto:
1. $i\leftarrow{1},y\leftarrow \text'0\text'$ (řetězec délky $1$ obsahující $0$)
2. Dokud $N$ neudělá $p(|x|)$ kroků tak opakuj:
	1. dokud $AGREE(M_{i}(\emptyset),y)$ vrací $ANO$ tak $inc(y)$
	2. dokud $AGREE(M_{i}(A),y)$ vrací $ANO$ tak $inc(y)$
	3. $i\leftarrow i+1$
3. pokud fáze 2. skončila v bodě 1., tak $N$ přijme $x\iff x\in SAT$ (ověření zvládne v poly. čase), jinak pokud ve 2. nebo 3., tak $N$ odmítne $x$.

Procedura $AGREE(M_{i}(\emptyset),y)$:
1. $N$ otestuje $y\in L(M_{i},\emptyset)$
2. $N$ otestuje $y\in A$
3. $N$ vrátí $ANO\iff$ 1. a 2. daly stejnou odpověď.

$AGREE(M_{i}(A),y)$:
1. $N$ otestuje $y\in L(M_{i},A)$
2. $N$ otestuje $y\in SAT$
3. $N$ vrátí $ANO\iff$ 1. a 2. daly stejnou odpověď.

Pozn. Všechna rekurzivní volání se pouští s limitem $p(|y|)$.

Chceme dokázat:
1. $A\in \mathcal{NP}$ (je rozpoznáván NTS v poly čase).
2. $A\not\in NPÚ$ sporem, nechť $A\in NPÚ$

$\implies \exists i: SAT=L(M_{i},A)$ a vezměme nejmenší takové $i$.

Pokud $N$ dojde až k testování $M_{i}$ tak navždy uvázne v 
> (2) dokud $AGREE(M_{i}(A),y)$ vrací $ANO$ tak $inc(y)$

$\forall j\leq i:L(M_{i},\emptyset)$ se od SAT liší v $\infty$ mnoha $y$ (díky $\mathcal{P}\ne \mathcal{NP}$)
$\implies \exists y_{1},\dots,y_{i}$ na kterých $N$ vyskočí z 
> (1) dokud $AGREE(M_{i}(\emptyset),y)$ vrací $ANO$ tak $inc(y)$

$\forall j<i: L(M_{i},\emptyset)$ se liší od $SAT$ a buď $N$ najde příslušné $y'_{j}$ které ukončí (2) nebo uvázne v (2) již po tento index $j<i$.

*Pozorování:* Posloupnost řetězců $y_{1},y_{1}',y_{2},y_{2}',\dots,y_{j}'$ kde buď $j<i$ a $N$ uváznul v (2) nebo $j=i$ a $N$ uváznul v (2) nezávisí na vstupu $x$ a proto pro "dostatečně dlouhá" $x$ k uváznutí v (2) jistě dojde.

$\implies N$ od jisté délky vstupu všechny vstupy odmítá $\implies A$ je konečný jazyk $\implies A\in \mathcal{P}\implies$ spor.

3. $A\notin\mathcal{P}$ sporem předpokládejme, že $A\in \mathcal{P}\implies \exists i: A=L(M_{i},\emptyset)$ nechť $i$ je nejmenší takové $N$ uvázne v bodě (1) nejpozději pro stroj $M_{i}$.

$\forall j<i: L(M_{i},A)$ a $SAT$ se liší na $\infty$ mnoha $y$ a protože $A\in \mathcal{P}\implies L(M_{i},A)\in \mathcal{P}$ a předpokládejme $\mathcal{P}\ne\mathcal{NP}$.

$\forall j<i: L(M_{i},A)$ a $A$ se liší a buď $N$ najde příslušný protipříklad, nebo už všechny minul a uvázne v (1) pro dané $j$

$\implies N$ od jisté délky $\ell$ vstup dál rozpoznává jazyk $SAT$

$\implies A=$ konečný jazyk (slova délky $\leq \ell$) $\cup \mathcal{NPÚ}$ jazyk ($SAT$ s instancemi délky $\geq \ell$)

$\implies A\in \mathcal{NPÚ}\implies$ spor.

---
$y$ aby bylo $\leq \log |x|$ 