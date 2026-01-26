# I/O model
Mějme rychlou paměť velikosti $M$ rozdělené na bloky velikosti $B$. 
$$
\text{I/O složitost} = \# \text{přenesených bloků}
$$
Tedy se většinou snažíme omezit počet čtení

## I/0 Model a cache aware
- Známe $M,B$ parametry
- Algoritmus musí řešit který blok vyhodit z omezené cache při načítání nového

Příklad:
- $b:=B/2; a:= b /2$ pro [a,b stromy](a,b%20stromy.md) je I/O složitost hledání $O(\log_{a} n +1) =O(\log_{B} n +1)$ přenosů.

### $k$-cestný Mergesort
Obyčejný mergesort má časovou složitost $O(N \cdot \log N +1)$ a I/O složitost $O(\frac{N}{B}\cdot \log N +1)$.

Důvodem je, že merge $T$ prvků zabere $O\left( \frac{T}{B} +1 \right)$ bloků. V merge máme vlastně $3$ průchody polem dohromady $O\left( \frac{N}{B}+1 \right)$ přenosů bloků. Vše dohromady na $i$-té úrovni přenese $O\left( \frac{N}{B} \log N + \log N \right)$ bloků ($+\log N$ je zajímavé jen pokud $N<B$) tedy můžeme psát $O\left( \frac{N}{B}\log N +1 \right)$, protože se vlastně pro $N<B$ vše děje v jednom bloku.

$k$-cestný mergesort kombinuje $k$ seřazených posloupností a ne jen $2$, tedy merge nemá jen $2$ pointery ale $k$ pointerů kde je v polích při kombinaci na větší. Počet úrovní pak není $O(\log N)$, ale $O(\log_{k} N)$ a jedna úroveň $N$ kroků každý v $O(\log k)$, celkem $O(N \cdot\log k \cdot \log_{k} N) = O(N \cdot \log N)$ čas.

Předpokládejme pro počítání přenosů to, že bloky pole jsou v jednom kuse v paměti, tedy počet přenosů na jeden merge je $O\left( \frac{k\cdot T}{B} +1 \right)$ a jedna úroveň má přenosů $O\left( \frac{N}{B} +1 \right)$ a celkem je tedy $O\left( \frac{N}{B} \log_{k} N +1 \right)$ přenosů v celém běhu.

Pro optimální $k$ ho chceme co největší, $k+1$ bloků v cache (ze které seřazujeme) a ještě je nutná halda na $k$ prvků (pro indexy) tedy je na ni potřeba $\left\lceil  \frac{k}{B}  \right\rceil$ na haldu a dohromady
$$
\left\lceil  \frac{k}{B}  \right\rceil + k +1 \leq 2k \leq \frac{M}{B} \implies k = \frac{M}{2B} \in O\left( \frac{M}{B} \right)
$$
dosadíme-li optimum, tak
$$
O\left( \frac{N}{B} \frac{\log N}{\log \frac{M}{B}} +1 \right).
$$
Tedy máme cache-aware algoritmus optimální v parametrech.

---
## I/O model a cache oblivious
- Nepotřebují znát $M,B$
- Architektura je pro implementaci nedůležitá
- Efektivně využívají celou paměť

Máme ale netriviální předpoklady:
1. Cache je řízena algoritmem (optimálně) silný předpoklad orákula na blok který se využije nejpozději v budoucnu, ale nahraditelné pomocí LRU z věty níže.
2. Očekáváme $\frac{M}{B} \geq \Omega(B)$, tedy cache je spíše dlouhá než velká na bloky.
3. Plná asociativita, tedy že blok je kdekoliv v cache

### Maticová transpozice
Budeme používat dva typy podproblémů:
- $\mathbf{T}(A)$: transponuje matici $A$ in-place.
- $\mathbf{TS}(A,B)$: transponuje $A$ a $B$ a zároveň je prohodí, tj. po operaci platí $A \leftarrow B^T$ a $B \leftarrow A^T$ (v původních hodnotách).
#### Rekurze (pro čtvercovou matici $N\times N$)
Předpokládejme zatím $N$ sudé (pro liché později).
Rozdělíme $A$ na kvadranty velikosti $(N/2)\times(N/2)$:
$$
A=\begin{pmatrix}
A_{11} & A_{12}\\
A_{21} & A_{22}
\end{pmatrix}.
$$
Pak:
- $\mathbf{T}(A)$ zavolá $\mathbf{T}(A_{11})$, $\mathbf{T}(A_{22})$ a $\mathbf{TS}(A_{12},A_{21})$.
- $\mathbf{TS}(A,B)$: rozdělíme $A,B$ na kvadranty a rekurzivně voláme:
  $$\mathbf{TS}(A_{11},B_{11}),\ \mathbf{TS}(A_{22},B_{22}),\ \mathbf{TS}(A_{12},B_{21}),\ \mathbf{TS}(A_{21},B_{12}).$$

Tedy $\mathbf{T}$ má 3 děti (2x T a 1x TS), $\mathbf{TS}$ má 4 děti (vše TS).

#### Časová složitost: $\Theta(N^2)$
Uvažujme strom rekurze. Na hladině $i$ (kořen je $i=0$) je nejvýše $4^i$ uzlů a každý odpovídá podproblému "velikosti" zhruba $(N/2^i)$.

Rekurze končí v listech, kde je velikost $1\times 1$:
- v listech typu TS dojde k prohození dvou prvků (konstantní čas),
- v listech typu T se neděje nic (konstantní čas),
- vnitřní uzly jen rozdělují problém (konstantní režie).

Hloubka stromu je $O(\log N)$ a počet listů je nejvýše
$$
4^{\log_2 N}=N^2.
$$
Protože každý uzel má alespoň 2 potomky, počet vnitřních uzlů je $O(\#\text{listů})$, tedy celkový počet uzlů je $O(N^2)$. Každý uzel stojí $O(1)$ času, takže
$$
T(N)=\Theta(N^2).
$$
#### I/O složitost: $O(N^2/B+1)$ (tall cache)
Nechť velikost cache je $M$ a block size je $B$ (v prvcích).
Zafixujeme hladinu $i$ tak, aby velikost podproblému byla
$$
d := \left\lceil \frac{N}{2^i}\right\rceil \le B,
$$
a zároveň (pokud $i>0$) platilo $2d > B$, tj.
$$
\frac{B}{2} < d \le B.
$$

#### Caching strategie
- Nad hladinou $i$ necacheujeme nic: vnitřní uzly se položek vůbec nedotýkají.
- Pro každý uzel na hladině $i$:
  načteme celý jeho "tile" (podmatici velikosti $\approx d\times d$) do cache
  a spočteme celý jeho podstrom "v cache".

Tím se chováme stejně jako cache-aware algoritmus s tilem $d\in\Theta(B)$. Každý tile má $d^2$ prvků, tj. vyžaduje $\Theta(d^2/B)$ přenosů bloků. Počet tileů na hladině $i$ je $\Theta\!\left((N/d)^2\right)$, proto
$$
Q(N) \le \Theta\!\left(\left(\frac{N}{d}\right)^2 \cdot \frac{d^2}{B}\right)
= \Theta\!\left(\frac{N^2}{B}\right).
$$
Navíc když je $N^2$ malé, přidáme konstantu $+1$:
$$
Q(N)=O\!\left(\frac{N^2}{B}+1\right).
$$

Aby šlo celý tile držet v cache, stačí tall-cache předpoklad
$$
M = \Omega(B^2),
$$
protože tile má velikost $d^2 \le B^2$.

#### Když $N$ není mocnina 2: skoro čtvercové matice
Řekneme, že matice je skoro čtvercová, pokud je rozměru $p\times q$ a platí
$$
|p-q|\le 1.
$$
#### Lemma (uzavřenost na dělení)
Nechť $A$ je skoro čtvercová $p\times q$ s $|p-q|\le 1$.
Rozdělíme řádky na $p_1=\lfloor p/2\rfloor$, $p_2=\lceil p/2\rceil$
a sloupce na $q_1=\lfloor q/2\rfloor$, $q_2=\lceil q/2\rceil$.
Pak každý kvadrant má rozměr $p_i\times q_j$ a je opět skoro čtvercový:
$$
|p_i-q_j|\le 1.
$$
*Důkaz:* Stačí ukázat, že $\lfloor\cdot/2\rfloor$ a $\lceil\cdot/2\rceil$ "nezvětšují rozdíl". Přesněji pro libovolná celá $p,q$ platí:
$$
\Big|\Big\lfloor \frac{p}{2}\Big\rfloor - \Big\lfloor \frac{q}{2}\Big\rfloor\Big|
\le \Big\lceil \frac{|p-q|}{2}\Big\rceil,
\qquad
\Big|\Big\lceil \frac{p}{2}\Big\rceil - \Big\lceil \frac{q}{2}\Big\rceil\Big|
\le \Big\lceil \frac{|p-q|}{2}\Big\rceil.
$$
Protože zde $|p-q|\le 1$, máme $\lceil |p-q|/2\rceil \le 1$.

Zbývá ošetřit mix floor/ceil (tj. $p_1$ proti $q_2$ apod.). Použijeme fakt
$$
\Big\lceil\frac{x}{2}\Big\rceil \in \Big\{\Big\lfloor\frac{x}{2}\Big\rfloor,\ \Big\lfloor\frac{x}{2}\Big\rfloor+1\Big\}.
$$
Kombinací s předchozími nerovnostmi dostaneme pro všechny dvojice $p_i,q_j$:
$$
|p_i-q_j|\le 1.
$$

##### Důsledek (invariance tvaru v rekurzi)
Startujeme s $N\times N$ (čtverec). Každý krok rekurze rozděluje kvadranty
pomocí $\lfloor\cdot/2\rfloor,\lceil\cdot/2\rceil$, takže všechny vzniklé podmatice
zůstávají čtvercové nebo skoro čtvercové.

---

##### Proč I/O analýza platí i pro skoro čtverce
V I/O analýze jsme používali jen:
- počet podproblémů na hladině $i$ je $\Theta((N/d)^2)$,
- každý tile má $\Theta(d^2)$ prvků,
- tile se vejde do cache, pokud $d\le B$ a $M=\Omega(B^2)$.

U skoro čtverce $d\times(d\pm 1)$ je počet prvků stále $\Theta(d^2)$, a počet tileů je stále $\Theta((N/d)^2)$ až na konstanty.
Proto závěr zůstává:
$$
Q(N)=O\!\left(\frac{N^2}{B}+1\right).
$$
---
# Sleatorovu–Tarjanova věta
Bůno $B =1$ ať se nemusíme trápit se zlomky.

Pokaždé když cache dostane request na nějaký blok, tak ho buď má a hotovo, nebo se stane miss a musí se vyprázdnit nějaký blok a nahradit tím který byl chtěn.

Mějme $OPT$ jako optimální strategii a cena algoritmus s optimální strategií je $C_{OPT}$. My ale chceme online algoritmus určující strategii, mějme typickou LRU *least recently used* (při cache miss se nahrazuje block který byl využíván nejvíce v minulosti) a algoritmus má s takovou strategií cenu $C_{LRU}$. 

Chceme dokázat, že $LRU$ $k$-kompetitivní algoritmus k $OPT$, tedy chtěli bychom $k$ konstantu, že $C_{LRU} \leq k \cdot C_{OPT}$. Tu ale nenaleznu, protože:

*Spor:* Mějme používání bloků$(1\dots M+1)^k$, načteme prvních $M$ a u $M+1$ LRU strategie, vždy zahodí ten další používaný blok, který vzápětí musí načítat, kdežto $OPT$ by prostě mělo na jeden blok jen 2 načtení a to asymptoticky nevychází. Tedy $C_{LRU}$ se blíží libovolně moc $M$.

## *Věta (Sleator-Tarjan):* Pro každou $M_{LRU} > M_{OPT}\geq 1$ a každou posloupnost dotazů na cache máme $C_{LRU} \leq \frac{M_{LRU}}{M_{LRU}- M_{OPT}} \cdot C_{OPT} + M_{OPT}$
*Důkaz:* Rozdělme posloupnost do epoch $E_{0},\dots,E_{t}$ takové, aby cena každé byla přesně $M_{LRU}$ kromě $E_{0}$, která je nejvíce $M_{LRU}$. 

Pak pro $i>0$ máme dvě možnosti pro epochu $E_{i}$
1. Všechny bloky, které LRU miss-nulo jsou různé, tedy máme od v epoše alespoň $M_{LRU}$ různých bloků a optimum jich mohlo mít na začátku epochy nejvýše $M_{OPT}$, tedy musel se musel miss stát aspoň $M_{OPT}-M_{LRU}$ krát.
2. Jinak $LRU$ udělá miss na stejném bloku $b$. Pro prvním miss se přidal na vršek $LRU$ seznamu a vzhledem k tomu, že se musel načíst podruhé, tak musel být vyměněn a to se stane jen pokud se probublá až na konec $LRU$ seznamu, to implikuje alespoň $M_{LRU}$ přístupů k jiným bloků mezitím. Opět $OPT$ musí miss aspoň $M_{LRU} - M_{OPT}$, protože máme aspoň $M_{LRU}$ různých bloků ke kterým jsme přistoupili.

V každé epoše kromě $0$-té tak máme poměr $C_{LRU} / C_{OPT}$ nejvýše $M_{LRU}/M_{LRU} - M_{OPT}$ a průměrem přes všechny epochy máme chtěné omezení. 

Problémem je $E_{0}$, pokud máme prázdnou cache na začátek, tak $C_{LRU}/C_{OPT} =1$, ale pokud je už před vyplněná cache, tak optimum může ušetřit nejvýše $M_{OPT}$ miss-ů.
Dohromady dávaje
$$
C_{LRU} \leq \frac{M_{LRU}}{M_{LRU}- M_{OPT}} \cdot C_{OPT} + M_{OPT}.
$$

