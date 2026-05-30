Mějme 
- $N$ pages slow memory
- $k$ pages fast memory
- je-li požadovaná page ve fast memory, tak hotovo, jinak se musí nějaká z pages ve fast vyměnit za chtěnou page
- Vstupem problému je posloupnost requestů $r_{1},r_{2},\dots,r_{n}\in 1\dots N$
- Výstupem je posloupnosti konfigurací $C_{1},C_{2},\dots \subseteq 1\dots N, |C_{i}|\leq k$
- Cost je $1$ pro každou $C_{i+1}\setminus C_{i}$, můžeme očekávat, že rozdíl konfigurací je $\leq 1$. 
- Cílem je minimalizovat Cost.

Deterministické online:
1. LeastRecentlyUsed (smallest last used time)
2. LeastFrequentlyUsed - není kompetitivní, protože nepřítel jednoduše hodnékrát chce $1,\dots,k-1$ a pak jen střídá $k,k+1$ a to jem drahé.
3. FirstInFirstOut
4. LastInFirstOut

Deterministický offline: Belady's rule vyhodí tu kterou potřebuje co nejpozději (Optimum).

Randomizovaný online: RAND, vyhodí náhodnou page.

---
### Věta: For $N\geq k+1$ pages, no deterministic algorithm is better than $k$-competitive.
*Důkaz:* Let us define phases of a request sequence $\overbrace{r_{1},r_{2},\dots,r_{k},}^k r_{k+1},\dots$ where
1. phase: the longest prefix with $\leq k$ distinct pages requested.
2. phase: the same for the remaining sequence.

Nepřítel si může vždy zvolit page, který není ve fast memory a kvůli determinismu.
- Deterministický ALG zaplatí 1 v každém requestu.
- Belady zaplatí $\leq 1$ za každý request, takže optimum.

---
**Request is new** if it was not requested in the previous phase and **is old** otherwise.

A **page** in fast memory **is MARKED** if already requested is this phase.

*Definice:* And algorithm is marking if it never evicts a marked page. 
- **LRU** is a marking algorithm.
- **FIFO** is not a marking algorithm, ale je $k$-komp.
---
#### *Pomocná Věta:* Any marking algorithm is $k$-competitive.
*Důkaz pomocné věty:* $ALG \leq k \cdot \# \text{phases}$, and we know that $OPT \geq \# \text{phases} -1$ and we get
$$
ALG \leq k \cdot OPT + k.
$$
- $OPT \geq \# \text{phases} -1$ protože první request nové faze je z definice nova page, takže $F_{i} + 1.\text{req. } F_{i+1}$ je $k+1$ různých pages z definice, takových přechodů je počet fází bez 1, protože jen tolik je přechodů mezi fázemi.
- For FIFO the same argument holds, even though it isn't a marking algorithm.
---
*Algoritmus:* **MARK** maintains marked pages, evicts a random not marked page, if all pages are Marked then unmark all (new phase).
- Marking je deterministické, protože to jsou přesně pages načtené v dané fázi.
- Fáze jsou deterministické.

---
#### *Věta:* If $N=k+1$, then MARK is $H_k$-competitive. In general ($N >k+1$) MARK is $2H_{k}$-competitive (vlastně $(2H_{k}-1)$).
*Důkaz:* For the $i$-th phase we have $m_{i}=\#\text{of new pages requested}$ and we have (ignore request to marked pages- each page is in a phase requested only once)
$$
\begin{align*}
\Pr[\text{fault on request to first old page}] &\leq \frac{m_{i}}{k}, \text{old, so it ejected and then req.}\\
\Pr[\text{fault on request to second old page}] &\leq \frac{m_{i}}{k-1} \\
\Pr[\text{fault on request to } (k-m_{i}) \text{-th old page}] &\leq \frac{m_{i}}{k-(k-m_{i})+1} =\frac{m_{i}}{m_{i}+1} \leq \frac{m_{i}}{2}
\end{align*}
$$
and we get
$$
\mathbb{E}[\# \text{faults in phase }i] \leq \frac{m_{i}}{k} + \frac{m_{i}}{k-1} + \dots+ \frac{m_{i}}{2} + \underbrace{m_{i}}_{\text{cost of requsting the new pages}} = m_{i}\cdot H_{k}
$$
- Nejvýše $m_i$ vyhozených užitečných old pages a na začátku jich je $k$, tedy $\frac{m_{i}}{k}$ je pravděp., že bude konkrétní první old page co se bude hodit vyhozena.

###### Lemma:  $OPT \geq \frac{1}{2}  \left( \sum m_{i} \right) -const$
Ve fázích $i-1,i$ requestují $k+m_{i}$ různých stránek $\implies OPT$ má $\geq m_{i}$ pagefaultů a tedy
$$
OPT \geq m_{2} + m_{4}+m_{6} +\dots,\quad m_{3}+m_{5}+m_{7}+\dots\leq OPT
$$
so we get
$$
OPT \geq \frac{1}{2} \sum m_{i}.
$$
- pro $N=k+1\implies m_{i}=1$ vždy

Po sečtení přes fáze:
$$
\mathbb{E}[MARK] \leq H_{k}\sum_{i}m_{i}
$$
a máme
$$
\sum_{i}m_{i}\leq 2OPT + O(k)
$$
tedy
$$
\mathbb{E}[MARK] \leq H_{k} (2OPT + O(k)) = 2H_{k} \cdot OPT + O(kH_{k})
$$

---
### *Věta:* No randomized algorithm is better than $H_k$-competitive, even for $N=k+1$.
*Důkaz:* Mějme fáže a předpokládejme pro current phase, že $2,\dots,k+1$ byli requested v předešlé fázi. 

Definujeme posloupnost requestů:
- $1$ a $2:=$ page nejpravděpodobněji mimo fast mem. 
- další podfáze vybere $12$ a zvolíme $3:=$ page nejpravděpodobněji mimo fast mem. (mezi $3,\dots,k+1$) 
- další podfázi req. $123$ a opět $4:=$ page nejpravděp. mimo fast v $4,\dots,k+1$. 
- 1234 a opět $5$
- až dojdeme k $1\dots k$ a zbývá-li vybrat jen $k+1$ tak začne nová fáze protože req. $1\dots k\,\mid k+1$

Algoritmus zaplatí
- máme 1 nový page, takže zaplatí 1.
- po request 12, tak aspoň jedna z page bude mimo, takže se zapalatí in expectation $\geq \frac{1}{k}$
- po $123$ máme buď nějaký z $12$ mimo fast mem. tedy zaplatí určitě aspoň $1$, nebo 12 jsou v mem. a in expectation se zaplatí $\geq \frac{1}{k-1}$ z definice 3
- pro $1234$ máme opět rozborem případů fault aspoň $\geq \frac{1}{k-2}$ in expectation.
- pro $1\dots k$ zaplatí aspoň $\frac{1}{2}$ (vybírá se zda v memory zůstane $k$, nebo $k+1$)
- pro $1\dots k\,k+1$ zaplatí $\geq 1$ (ale to už je další fáze)

Dohromady, protože $OPT$ tato fáze stojí jen $1$ page fault, tak
$$
\mathbb{E}[\# \text{ page fault}] \geq H_{k} OPT
$$
---
# General Paging
Each page has size cost
- size=1
- cost=1
- cost=size
- weighted paging - each page has $w_{i}$ cost to be loaded
- file caching- each page has a size and possibly $w_{i}$-cost
- offline version is $\mathcal{NP}$ hard even for sizes $1,2,3$
- $O(\log(\text{size of cache}))$-competitive randomized algorithms.