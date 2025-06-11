*Definice:* Nechť $U,V$ jsou vektorové prostory nad $T$. Zobrazení $f: U \to V$ nazveme lineární pokud splňuje 
1. $\forall u,v \in U: f(u+v) = f(u) + f(v)$,
2. $\forall u \in U, \forall t \in T: f(t \cdot u) = f \cdot f(u)$.

*Věta:* (Jednoznačnost zobrazení) Nechť $U,V$ jsou prostory nad $T$ a $B$ je báze $U$. Pak pro jakékoliv zobrazení $f_{0}: B \to V$ existuje jediné lineární zobrazení $f: U \to V$ rozšiřující $f_{0}$, t.j. $\forall b \in B: f(b) = f_{0}(b)$.
*Důkaz*: Pro jakékoliv $u \in U$ existují jednoznačná $n \in \mathbb{N}_{0}$, $a_{1},\dots,a_{n} \in T \setminus \{ 0 \}$ a $b_{1},\dots,b_{n}\in B$ taková, že $u = \sum_{i=0}^n a_{i}b_{i}$, potom
$$
f(u) = f\left( \sum a_{i}b_{i} \right) = \sum a_{i} f(b_{i}) = \sum a_{i} f_{0}(b_{i}).
$$

---
# Matice lineárního zobrazení
*Definice:* Nechť $U,V$ jsou vektorové prostory na tělesem $T$ s uspořádanými bázemi $B = (b_{1},\dots,b_{n})$ a $C = (c_{1}, \dots,c_{n})$. 
**Matice lineárního zobrazení** $f: U \to V$ vzhledem k bázím $B,C$ je $[f]_{B,C} \in T^{m \times n}$ jejíž sloupce jsou vektory souřadnic obrazů vektorů báze $B$ vzhledem k bázi $C$. Tedy
$$
[f]_{B,C} = ([f(b_{1})]_C|\dots|[f(b_{n})]_C).
$$
*Pozorování*: Mějme vektorové prostory $U,V,W$ s konečnými uspořádanými bázemi $B,C,D$. Pro matice lineárního zobrazení platí $f: U\to V$, $g: V \to W$ máme $[g \circ f]_{B,D} = [g]_{C,D}[f]_{B,C}$

---
# Obraz a jádro lineárních zobrazení
Nechť $U$ a $V$ jsou vektorové prostory nad stejným tělesem $T$
- jádro lineárního zobrazení je $ker(f) = \{ w \in U: f(w) = 0 \}$, tedy jsou to vektory v prostoru $U$, které se zobrazí na nulový vektor v prostoru $V$
- Isomorfismus prostorů
	- vektorové prostory jsou isomorfní, pokud mezi nimi existuje isomorfismus, tedy bijektivní (vzájemně jednoznačné) lineární zobrazení
    - pro isomorfismus $f$ platí, že existuje $f^{-1}$ a je také isomorfismem
    - isomorfní prostory mají shodné dimenze
*Věta:* $f$ je isomorfismus, právě když $[f]_{X,Y}$​ je regulární