- $m$ počet mašin
- každá má $s_{1}\geq s_{2}\geq\dots\geq s_{m}$ rychlosti
- Vstupem je posloupnost jobů $p_{1},\dots,p_{i},\dots$, když přijde tak se schedulne
- Výstup rozvrh mašin s preemption
- OBJ chceme minimalizovat Makespan schedule
- rychlosti: job zabere $\frac{p_{j}}{s_{i}}$ času na $i$-tém stroji
- preemption- můžeme rozdělit joby na různé mašiny ale nikdy paralelně
- $p_{max}:= \max_{p} p_{j}$ a $P=\sum{p_{j}}$
- Semi-online algoritmus je toto když přidáme "hint" v podobě $p_{max}$
- pro online platí, že nemůžeme přehazovat schedule, nakreslíme přicházející job a TAM JE

- $S= \sum s_{i}$ a $S_{k}=\sum_{i=1}^k s_{k}$ - suma $k$ nejrychlejších strojů
- $P_{k}$- suma největších processing časů.
---
## Exact algorithm with known optimum [ES2]  
### Identické mašiny
$OPT\geq p_{max}$ a $OPT \geq P / m$

#### $OPT =\max\{ p_{max}, P / m \}=:X$ pro identické mašiny
Mějme pseudo-online s $X$, kde $X$ je výsledný makespan $=X$:
- Přijde job $p_{i}$ dáme co největší jeho část na mašinu $k$
- Pokud $k$ je plná zbytek dáme na $k+1$
- funguje vždy protože kdyby se overlappovali tak spor se správností makespanu $X$ (je aspoň $p_{max}$)

Protože $X$ je aspoň $P / m$ tak se nám vejdou všechny joby.

### Různé speeds
Víme
$$
OPT \geq P / S, \quad OPT \geq \frac{P_{1}}{S_{1}}, OPT \geq \frac{P_{2}}{S_{2}}, \frac{P_{k}}{S_{k}}
$$
Máme větu 
#### $OPT =\max\{P / S, P_{1} / S_{1}, P_{2} / S_{2},\dots,P_{m-1} / S_{m-1} \}$
Mějme semi-online, kde $G$ je nápověda a když $G\geq OPT$ tak vyrobí validní schedule.

Chceme
- schedule job na dvojici mašin vedle sebe, tak aby běžela v každém čase mezi $[0,G]$ 
- edge case 1: malý job co nezabere žádnou, dá se na vršek nejpomalejšího stroje a přidá se umělý stroj s rychlostí nula na konec
- Spárované mašiny spojíme do nové **virtuální mašiny** s variabilní rychlostí
- tedy snažíme se najít co nejpomalejší dvojici (klidně i virtuální) mašin tak aby job běžel celou domu $[0,G]$
- po vybrání páru vždy sloučíme mašiny do jedné virtuální s variabilní rychlostí (může jich být hodně těch rychlostí)

**Virtuální mašina:** $i$ mašin vedle sebe se scheduled $i-1$ joby a na intervalu $[0,G]$ je právě jedna z nich vždy volná.

Mějme nějaký job $p_k$ a ten se nevejde na žádnou virtual machine, pak to znamená, že se nevejde na $S_{k}$ - nejrychlejší uvnitř nějaké virtual machine $\cdot G$ (plocha s výškou $G$) $<P_{k}$, tedy pokud by ALG failnul, tak je to spor s volbou $G$. 

Pokud by nastalo, že poslední job nevejde a byla by chyba u přidané $0$ rychlé, tak je to spor s $OPT \geq P / S$

---
## Upper bounds for deterministic and randomized algorithms (doubling algorithms) [ES2]  


---
## Survey of results for nonpreemptive scheduling [S]
- Bez preemptivity máme $\mathcal{NP}$-těžkost


---
## Lower bounds for preemptive and nonpreemptive scheduling on related machines [ES1]
