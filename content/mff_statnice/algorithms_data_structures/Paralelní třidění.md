*Definice:* Hradlová síť je určena 
- $\Sigma$ abecedou
- Po dvou disjunktních $I$ vstupy, $O$ výstupy, $H$ hradla
- Acyklickým orientovaným multigravem $G = (I\cup O\cup H, E)$
- Zobrazením $F$ které pro každé hradlo $h$ přiřadí nějakou funkci $F(h): \Sigma^{a(h)} \to\Sigma$, což je funkc, kterou toto hradlo vykonává. Číslu $a(h)$ říkáme arita $h$.
- Zobrazením $z: E \to \mathbb{N}$, které o hranách do hradel říká, kolikátému argumentu funkce odpovídá.
S podmínkami
- Do vstupů nevedou hrany
- Z výstupů nevedou hrany a do něj vede právě jedna
- Do každého hradla vede právě tolik hran kolik je jeho arita
- Všechny vstupy hradel jsou zapojeny právě jednou hranou

*Definice:* Výpočet sítě postupně přiřazuje hodnoty z abecedy $\Sigma$ vrcholům grafu. Výpočet probíhá po taktech. V nultém taktu jsou definovány pouze hodnoty na vstupech sítě a v hradlech arity 0 (konstantách). V každém dalším taktu pak ohodnotíme vrcholy, jejichž všechny vstupní hrany vedou z vrcholů s již definovanou hodnotou

---
# Paralelní třídění

## Komparátorová síť
- Síť složená z **komparátorů**, každý má 2 vstupy a 2 výstupy:
  - výstupy jsou: **menší** a **větší** z dvojice vstupních hodnot
- Výstupy komparátorů se **nevětví**
- Celá síť je **bez větvení a slučování** — každá hodnota jde přesně jednou sítí

---
## Bitonická posloupnost
- **Čistě bitonická**: nejprve rostoucí, pak klesající (části mohou být prázdné)
- **Bitonická**: rotace čistě bitonické posloupnosti

---
## Separátor
- Komparátorová síť $S_n$ oddělí **bitonickou posloupnost** délky $n$ na:
  - dvě bitonické permutace $y_0, \dots, y_{n/2-1}$ a $y_{n/2}, \dots, y_{n-1}$
  - všechny prvky první poloviny < všechny ve druhé

- Separátor má:
  - **konstantní hloubku**
  - **Θ(n)** komparátorů

---

## Bitonická třidička $B_n$
- Třídí **bitonické posloupnosti**
- Složená z $\log n$ hladin separátorů (rekurzivně)
- Hloubka: **Θ(log n)**  
- Počet komparátorů: **Θ(n log n)**

---

## Slévačka $M_n$
- Třídí **dvě rostoucí posloupnosti** (délky $n$) do jedné
- Využije bitonickou třidičku $B_{2n}$ po vhodném otočení jedné z posloupností
- Hloubka: **Θ(log n)**
- Komparátory: **Θ(n log n)**

---
## Třídicí síť $T_n$
- Obecná třídicí síť (třídí libovolné vstupy)
- Konstrukce jako paralelní mergesort:
  - 1-prvkové posloupnosti → slévačky $M_1$ → $M_2$ → ... → $M_{n/2}$ → výstup
- Hloubka: **Θ(log² n)**
- Komparátorů: **Θ(n log² n)**

---
*Věta:* Pro $n = 2^k$ existuje třídicí síť $T_n$ hloubky $\Theta(\log^2 n)$ složená z $\Theta(n \log^2 n)$ kompa-
rátorů.
*Důkaz:* Síť bude třídit sléváním, podobně jako algoritmus Mergesort. Vstup rozdělíme na $n$ jednoprvkových posloupností. Ty jsou jistě setříděné, takže je slévačkami $M_{1}$ můžeme slít do dvouprvkových setříděných posloupností. Na ty pak aplikujeme slévačky $M_{2}, M_{4}, \dots , M_{n /2}$, až všechny části slijeme do jedné, setříděné.

Celkem provedeme $\log n$ kroků slévání, $i$-tý z nich obsahuje slévačky $M_{2^{i−1} }$ a ty, jak už víme, mají hloubku $\Theta(i)$. Celkový počet vrstev tedy činí $\Theta(1+2+3+\dots+\log n) = \Theta(\log^2 n)$. Každý krok přitom potřebuje $\Theta(n \log n)$ komparátorů, což dává celkem $\Theta(n \log^2 n)$ komparátorů. 