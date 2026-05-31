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
Deterministický algoritmus: $G_{0}=\frac{p_{1}}{S_{1}}$
1. $G:= G_{0}$
2. použijeme semi-online ALG s nový pruhem dovoleného prostoru výšky $G$
3. Pokud semi-online failne tak $G:=2G$ a goto 2.

Poslední hodnota $G\leq 2OPT$, protože algoritmus zastaví při prvním $G\geq OPT$. 

#### Věta: Online ALG je $4$-kompetitivní
Protože ALG dá job vždy do nějakého intervalu $[G,G+2G)$ a protože do poslední volby $G$ se vejdeme a vše dvojnásobíme, tak i velikost předešlých odhadů ve kterých je něco scheduled, tak se dá odhadnout pomocí $G$ a tedy 
$$
ALG\leq 2G\leq 4OPT
$$
---
Randomized algorithm RAND: 
1. $r:=$ uniformně náhodně z $[0,1]$
2. $G:= e^r \cdot \frac{p_{1}}{s_{1}}$
3. Použijeme semi-online ALG s přidaným novým pruhem prostoru výšky $G$
4. Pokud fail tak $G:= e \cdot G$ goto 3.

Definujme $k=\ln\left( OPT \cdot \frac{s_{1}}{p_{1}} \right)$, zjevně je to konstanta $\geq 1$. Dle definice $RAND$ nezvětší $G$ více než $\lceil k-r \rceil$-krát, protože 
$$
e^{r+\lceil k-r \rceil } \frac{p_{1}}{s_{1}}\geq  e^k \frac{p_{1}}{s_{1}}= OPT
$$
nechť $z:= r-k - \lfloor r-k \rfloor$ tak $z\in[0,1]$ uniformní náhodná veličina. Algortimus skončí s
$$
G_{fin}\leq e^{r+\lceil k-r \rceil } \frac{p_{1}}{s_{1}} = e^z \cdot OPT
$$
a tedy makespan RAND je nejvýše 
$$
\mathbb{E}[G_{fin}] \cdot\left( 1 + \frac{1}{e} + \frac{1}{e^2} +\dots \right) \leq \frac{e}{e-1} \mathbb{E}[e^z] \cdot OPT = e\cdot OPT \cdot\frac{1}{e-1} \int_{0}^1 e^x \text{ d}x = e \cdot OPT
$$

---
## Survey of results for nonpreemptive scheduling [S]
- Bez preemptivity máme $\mathcal{NP}$-těžkost
- Preemptivita: je optimum u $2.12,e$, pro identické mašiny máme $\frac{e}{e-1}$
- bez preemptivity jsou upper bound $5.828$ det. a $4.311$ random, dle doublingu
- bez preempt máme lower bound $2.4$ pro det. a $2$ random.


---
## Lower bounds for preemptive and nonpreemptive scheduling on related machines [ES1]
## Věta: Předpokládejme ALG $A$, který je $R$-kompetitivní, pak $R>0$.
Platí pro deterministické i randomizované, s i bez preemptivity (OPT je nepptřebuje).

Zafixujeme si $a<1$ a mašiny: $s_{1}=1,s_{2} =a,s_{3}=a^2,\dots,s_{i}=a^{i-1},\dots$ joby budou
$$
\dots, a^{i-1},\dots a^2,a,1
$$
chceme $\infty$, ale to není možné, argument se dá ale upravit na dostatečně velké posloupnosti.

Mějme instanci $I_{i}: \dots ,a^{i-1}$, tedy instance s $i$ největšími joby odstraněnými. 

Pozorování:
- $OPT(I_{i})=a^{i-1}$
- mějme rozvrh $A$ na $I$ a $T_{i}:=$ je poslední čas, kde $\geq i$ mašin je busy (tedy pokud odeberu $i-1$ jobů tak stále někdo pracuje v tento čas)
- $\mathbb{E}[A(I_{i})]\geq \mathbb{E}[T_{i}]$
$$
T_{i}\leq R \cdot OPT(I_{i}) = R\cdot a^{i-1}
$$
$$
\sum_{i=1}^\infty s_{i}T_{i} \leq R \cdot \sum s_{i}\cdot a^{i-1} = R \cdot \sum_{i=1}^{\infty} a^{i-1}\cdot a^{i-1}
$$
dokonce máme
$$
P\leq \sum_{i=1}^\infty s_{i}T_{i}
$$
a vše platí i in expectation. Pak
$$
R\geq \frac{P}{\sum_{i=1}^{\infty} a^{i-1}\cdot a^{i-1}} = \frac{1+a+a^2+\dots}{1+a^2+a^4+\dots} = \frac{\frac{1}{1-a}}{\frac{1}{1-a^2}} = \frac{1-a^2}{1-a} = 1+a
$$
a pokud necháme $\lim_{ a \to 1 } a = 1$ a tedy není lepšího algoritmu než $2$-kompetitvního