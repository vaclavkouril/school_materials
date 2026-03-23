## Motivace
- $33333$ - $3^{11}$
- $314159265358$ - $\pi$
- $843542795217$ - náhodné číslo

a míra toho jak moc vypadají náhodně v pořadí je Ne, Možná, Ano. Všechny mají ale pravděpodobnost $10^{-11}$. Tedy by nenáhodná čísla měla být reprezentovatelná "krátkým popisem", kde co znamená krátkost záleží na jazyku.

$f: \{ 0,1 \}^* \to \{ 0,1 \}^*$ je částečně rekurzivní funkce, pokud se dá vypočítat TS transducerem, který výstup vydá na výstupní pásku. 

*Definice:* Pro $x \in \{ 0,1 \}^*$ je **Kolmogorovská složitost** $x$ vzhledem k $f$: 
$$
C_{f}(x) = \min \{ |p|;p \in \{ 0,1 \}^*, f(p) = x\}.
$$
 *Intuice:* $p$ je vlastně popis programu, který zvládne vydat $x$ na výstupu.

### *Věta:* Existuje univerzální částečně rekurzivní funkce $\mathcal{U}$ taková, že $\forall$ č. r. f. $g, \exists c_{g} \in \mathbb{N}: (\forall x \in \{ 0,1 \}^*)(C_{\mathcal{U}}(x)\leq C_{g}(x) + c_{g})$.
*Důkaz:* Mějme očíslování $\phi_{1},\phi_{2},\dots$ částečně rekurzivních funkcí, mějme $i\to \phi_{i}$ pro $i$-tou č. r. f. mějme
$$
\left\langle i,z \right\rangle = 0^{|i|}1iz
$$
Algoritmus pro $\mathcal{U}$
1. Na vstupu $w$, tak pokud $w = \left\langle i,z \right\rangle \to i,z$.
2. Simulujeme $\phi_{i}(z)$,
3. Výstupem je výsledek simulace $\phi_{i}$.

Mějme
- $g-\phi_{n}$
- $x$, kde $p$ je nejkratší program pro $x$ vzhledem k $g$
- $\left\langle n,p \right\rangle$ je program $x$ vůči $\mathcal{U}$. $\overbrace{0^{|n|}1n}^{c_{g}}p$
$$
C_{\mathcal{U}} (x) \leq |\left\langle n,p  \right\rangle| \leq |p| + c_{g} = C_{g}(x) + c_{g}.
$$

---
# Vztah mezi $C(x)$ a $C_{\mathcal{U}}(x)$
Zafixujme si č. r. f. $\mathcal{U}$, pak $C(x) = C_{\mathcal{U}}(x)$
- $C(x) \leq |x| + O(1)$ pro č. r. f. $f(x)=x$ a tedy $C_{f}(x) = |x|$
- $C(O^n) \leq \log n + O(1)$
- $C(\pi_{[1:n]}) \leq \log n + O(1)$

#### *Tvrzení:* $\forall n \exists x\in \{ 0,1 \}^n: C(x)\geq n$
*Důkaz:* Počet programů $p$ délky $\leq n-1$ je
$$
\sum_{i=0}^{n-1} 2^{i} = 2^n - 1.
$$
a tedy musí existovat $x$, který se nevejde do programu délky $n-1$. Takové $x$ nazveme **Kolmogorovsky náhodné**, pokud $C(x) \geq |x|$.

---
# Podmíněná Kolm. složitost
*Definice:* Pro $x,y \in \{ 0,1 \}^*$ č. r. f. $f$
$$
C_{f}(x \mid y) = \min \{ |p|;p\in \{ 0,1 \}^* f(\left\langle p,y \right\rangle) = x \}.
$$
Platí $\exists \mathcal{U}: \forall$ č. r. f. $f$; $\exists c_{f}, \forall x,y \in \{ 0,1 \}^*$
$$
C_{\mathcal{U}}(x\mid y) \leq C_{f}(x\mid y) + c_{f}.
$$
---
*Definice:* $C(x,y) := C(\left\langle x,y \right\rangle)$.

---
### *Věta:* $C(x,y)\leq C(x)+ C(y\mid x) + O(\log|x|)$.
*Důkaz:* $\left\langle x,y \right\rangle$ mějme program pro $x$, program pro $y$, když znám $x$, takže $C(x), C(y \mid x)$. Ale je nutné rozdělit a rozpoznat jeden výstup začíná a končí, tedy $\log|x|$ na počítadlo.

### *Věta:* $C(x,y) \geq C(x)+C(y\mid x) - O(\log|x| +|y|)$.
*Důkaz:* (je nehezký a nepotřebný)

##### *Důsledek:* $C(x,y) = C(x)+C(y\mid x) \pm O(\log|x| + |y|)$.
---
# Kolmogorovská informace
*Definice:* $I_{C} (x:y) = C(x)- C(y\mid x)=C(y)- C(y\mid x) \pm O(\log|x| + |y|)$.