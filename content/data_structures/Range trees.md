# Definice

2-d Předpokládejme, že žádné 2 body nemají stejnou souřadnici $x$ - předpoklad se dá odstranit tím, že každý $x$-stromový uzel má $2$ y-stromy a jeden je jako popsáno níže, 2. jsou vrcholy se stejným $x$ a znich složen $y$ strom.

2-D range stromy budou mít několik instancí $1-d$ range stromů, kde máme $T$ BVS v každém uzlu je $int(v)$ interval, kde jsou všechna čísla která když hledáme, tak navštíví $v$. 

Postavme $x$-strom a pro každý $v$ v něm mějme pás $int(v)\times \mathbb{R}$ (libovolnou hodnotou), v každém uzlu bude ještě $1$-d $y$-strom pro body v pásu

---
# Prostorová složitost
V kolika stromech je jeden bod? $O(\log n)$ pásech $\implies O(\log n )$ $y$ stromech. Tedy nám vychází $\Theta(n\cdot \log n)$ prostorová složitost. (Na každé hladině mají dohromady $\Theta(n)$ prvků $y$ stromy)

---
# Složitost konstrukce
V $O(n \log n)$ si seřadíme body dle $x$ a $y$. V $O(n)$ vyrobíme $x$-strom. V každém uzlu dostaneme body podstromu a z nich vyrobíme $Y_{v}$ v lineárním čase.

Algoritmus běží na jedné úrovni v čase $O(n)$ ($2^i$ uzlů každý velikost $n / 2^i$) pro postavení všech $y$-stromů a $x$-strom má $\log n$ úrovní, dohromady $O(n \cdot \log n)$. 
# Obdélníkové dotazy
Mějme query $[x_{1},x_{2}] \times [y_{1},y_{2}]$, $x$-strom odpoví na range query u $[x_{1},x_{2}]$. Dostaneme tedy sjednocení $O(\log n)$ bodů a pásů. Pro každý bod otestujeme, zda $y$ daných bodů z $[x_1,x_{2}]$ je v $[y_{1},y_{2}]$. Pro každý pás se zeptáme odpovídající $y$-stromu na body v $[y_{1},y_2]$. 

Trávíme $O(\log n)$ času v $x$-stromu, $O(\log n)$ času na processing jednotlivých bodů a $O(\log n)$ v každém $y$-stromu a $O(1)$ za označení každého bodu, že je v intervalu. Dohromady máme pro $p$ počet reportů:
$$
O(\log^2 n +p)
$$
Počet bodů je $O(\log^2 n)$.

*Intuice:* x-strom rozdělí na $\log n$ mnoho intervalů dle $x$ a pro každý interval máme ještě stromek rozdělující inrevaly na $\log n$ k prohledání co je v obdélníku.

---
# Rozšíření 2-d 
Pro rozšíření na $d$ si vyrobíme hlavní $1-d$ strom a pak $d-1$ stromy vedlejšími každý vrchol je $O(\log n)$ vedlejších stromech ale stromy berou $O(\log n)$ krát více paměti, tedy máme $O(n \cdot \log^{d-1} n)$ prostorová složitost. A dotazy jsou opět rekurzí po dimenzi, kde nejdříve primární strom a máme dotazy v $O(\log^d n)$ čase.

---
# Dynamizace Insert
Použijeme [vyhledávací stromy s líným vyvažováním](Vyhledávací%20stromy%20s%20líným%20vyvažováním.md) pro $x$ i $y$ stromy.

Chceme-li insert, tak do každého $x$-stromu můžeme udělat maximálně jeden insert a $O(\log n)$ do $y$-stromů. Každý insert může potřebovat rebalanc amortizovaně v čase $O(\log n)$, tedy jeden insert $O(\log^2 n)$, pokud ale je potřeba rebalanc $x$-stromu tak ten stojí $n \cdot \log n$ a tedy je potřeba amortizovaný insert v čase $O(\log n)$, abychom předplatili za ne tak časté rebuildy $x$-stromu.

---
# bonus: včetně zrychlení zlomkovým kaskádováním
Mějme statické 2d range strom. 

Vyhledávání v jednotlivých $y$-seznamech **není nezávislé**:
- $y$-seznamy v potomcích jsou **podseznamy** seznamu v rodiči,
- hledané intervaly $[y_1,y_2]$ jsou ve všech seznamech stejné.
## Konstrukce (statický případ)
- V každém uzlu $x$-stromu je $y$-seznam (setříděné pole).
- Pro každý prvek $a$ v rodičovském seznamu $A$ si uložíme:
$$
\text{pred}_B(a) = \max\{ b \in B \mid b \le a \}
$$
kde $B$ je $y$-seznam potomka.
- Do každého seznamu přidáme $-\infty$, aby byl předchůdce vždy definovaný.
- Předchůdce se spočítá lineárně při stavbě → bez změny asymptotiky.
## Dotaz
1. Provedeme **jediné binární vyhledávání** $y_1,y_2$ v kořenovém $y$-seznamu:
$$
O(\log n)
$$
2. Při sestupu po $x$-stromu:
   - hranice intervalu v $y$-seznamu potomka spočteme pomocí uložených ukazatelů,
   - každá aktualizace hranic trvá $O(1)$.

Celkem navštívíme $O(\log n)$ uzlů:
$$
O(\log n) \cdot O(1)
$$
## Výsledná složitost
$$
\boxed{O(\log n + p)}
$$
## Zobecnění
V $d$-rozměrném range stromu:
$$
\boxed{O(\log^{d-1} n + p)}
$$
