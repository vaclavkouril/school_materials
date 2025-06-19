Máme-li optimalizační problémy, tak si kvůli složitosti často vystačíme s **$\alpha$-aproximací**, čili s řešením které má cenu $c'\leq \alpha c^*$, kde $c^*$ značíme optimum, pro $\alpha>1$ konstantu v případě minimalizačního problému. Je to totéž jako říci, že relativní chyba $\frac{c-c*}{c*}$ nepřekročí $\alpha-1$. 
Pro maximalizační problémy chceme alespoň $0< \alpha< 1$ optima.

---
# Problém Obchodního cestujícího
Máme neorientovaný graf $G$ s $\forall l(e)>0$ a chceme nejkratší hamiltonovskou kružnici. Hamiltonovskost je sama o sobě $NP$ úplná. 
Relaxujeme problém a budou nás zajímat je úplné grafy s platnou trojúhelníkovou nerovností.

---
## Algoritmus
Najdeme minimální kostru a obejdeme ji, zakořeníme kostru projdeme ji do hloubky a poznamenáme si hrany kterými jsme prošli. Každou hranu kostry ale projdeme 2krát a je to sled. 
Sled upravíme tak, abychom vždy kdybychom měli navštívit již navštívený vrchol tak místo toho půjdeme do nejbližšího nenavštíveného.
Máme tedy hamiltonovskost a jelikož v grafu platí trojúhelníková nerovnost, celková délka nevzrostla.

---
## Algortimus je 2-aproximační
Označíme si $T$ délku minimální kostry a $O$ jako optimum a $A$ jako výsledek algoritmu. Z toho jak jsme vytvořili $A$ nám vychází $A \leq 2T$ a vychází nám $A \leq 2T \leq 2O$.

---
# Problém batohu
Máme $n$ předmětů s **hmotnostmi** $h_1, \dots, h_n$ a **cenami** $c_1, \dots, c_n$, a danou **kapacitu batohu** $H$.

Chceme najít takovou podmnožinu předmětů $S$, že:
- $\sum_{i \in S} h_i \leq H$
- a $\sum_{i \in S} c_i$ je maximální.
---

## Aproximace — kvantování cen
Chceme nalézt řešení s relativní chybou nejvýše $\varepsilon > 0$.
### Idea:
Zmenšíme ceny, aby byly menší než pevné $M = \lceil n / \varepsilon \rceil$ a tím zrychlíme DP.

---
## Kvantování cen
- Označme $c_{\max} = \max_i c_i$
- Kvantujeme ceny:
$$
  \hat{c}_i = \left\lfloor \frac{c_i \cdot M}{c_{\max}} \right\rfloor
$$
- Nové ceny $\hat{c}_i$ jsou celá čísla v intervalu $[0, M]$
- Zaokrouhlením může být každá cena snížena nejvýše o $c_{\max}/M$, tedy maximálně $n \cdot c_{\max}/M$ celkem
- Aby chyba byla $\leq \varepsilon \cdot c^*$, volíme $M \geq n/\varepsilon$

---
## Algoritmus AproximaceBatohu
1. Odstraňme ze vstupu všechny předměty s $h_i > H$
2. Spočítejme $c_{\max} = \max_i c_i$, nastavíme $M = \lceil n / \varepsilon \rceil$
3. Pro každé $i = 1, \dots, n$: 
$$
   \hat{c}_i = \left\lfloor \frac{c_i \cdot M}{c_{\max}} \right\rfloor
$$
4. Vyřešíme batoh pomocí DP pro kvantované ceny $\hat{c}_i$, původní hmotnosti $h_i$ a kapacitu $H$
5. Vrátíme výběr předmětů z kvantovaného řešení a spočítej jejich hodnotu v původních cenách

---
## Důkaz přesnosti
- Označme $P$ jako optimální řešení původního problému
- Označme $Q$ jako výstup našeho algoritmu
Získáme:
$$
\hat{c}(P) \geq \frac{M}{c_{\max}} \cdot c(P) - n
$$
a
$$
c(Q) \geq \hat{c}(Q) \cdot \frac{c_{\max}}{M} \geq \hat{c}(P) \cdot \frac{c_{\max}}{M}
$$
Složením obou:
$$
c(Q) \geq c(P) - \varepsilon \cdot c(P) = (1 - \varepsilon) \cdot c(P)
$$

---
## Složitost
- Kvantované ceny mají maximální součet $nM = O(n^2 / \varepsilon)$
- Čas na řešení DP: $O(n^3 / \varepsilon)$
- Ostatní kroky běží v $O(n)$

---
# Problém batohu s malými čísly (pseudopolynomiální algoritmus)

## Zadání
Máme:
- $n$ předmětů
- každý s **hmotností** $h_i$ a **cenou** $c_i$
- **kapacitu batohu** $H$

Cílem je najít podmnožinu $P \subseteq \{1, \dots, n\}$, která:
- se **vejde do batohu**: $\sum_{i \in P} h_i \leq H$
- má **co největší cenu**: $\sum_{i \in P} c_i$ je maximální
## Idea algoritmu
Namísto klasického dynamického programování podle hmotnosti, sledujeme **všechny možné ceny** a ke každé hledáme **nejmenší možnou hmotnost**, za kterou ji lze dosáhnout.
## Definice
Označme:
- $C = \sum_{i=1}^n c_i$ = celková suma cen (horní mez)
- $A_k(c)$ = minimální možná hmotnost, kterou lze získat pomocí **prvních $k$ předmětů** s přesnou cenou $c$
  - Pokud nelze ceny $c$ dosáhnout, položíme $A_k(c) = \infty$
## Iniciace
Pro $k = 0$ (žádné předměty):
- $A_0(0) = 0$
- $A_0(c) = \infty$ pro $c > 0$
## Rekurence (přechod)
Pro $k = 1, \dots, n$:
- buď $k$-tý předmět **nevybereme**: pak $A_k(c) = A_{k-1}(c)$
- nebo ho **vybereme**: pak $A_k(c) = A_{k-1}(c - c_k) + h_k$ (pokud $c \geq c_k$)

Tedy celkově:
$$
A_k(c) = \min(A_{k-1}(c), A_{k-1}(c - c_k) + h_k)
$$
## Výstup
Po výpočtu všech $A_n(c)$ najdeme největší $c^*$ takové, že:
$$
A_n(c^*) \leq H
$$
To je maximální dosažitelná cena při dané kapacitě.

## Rekonstrukce řešení
Zavedeme si pomocné pole $B_k(c)$ = index posledního předmětu použitý k dosažení ceny $c$ s hmotností $A_k(c)$.

Pak zpětně dohledáme předměty:
- $i = B_n(c^*)$ je poslední
- $i' = B_{i-1}(c^* - c_i)$ je předposlední
- atd.
To celé trvá $O(n)$
## Časová složitost
- Přechod přes $n$ předmětů a $C$ možných cen: $O(nC)$
- Rekonstrukce: $O(n)$

