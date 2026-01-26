# Dynamické pole (flexible / nafukovací pole)

## Definice
**Dynamické pole** je pole, které:
- podporuje přístup v čase $O(1)$,
- umožňuje přidávání a odebírání prvků,
- automaticky mění svou kapacitu podle počtu uložených prvků.

Udržujeme:
- $n$ … počet prvků (size),
- $C$ … kapacitu pole (capacity),
kde platí $n \le C$.

---
## Zvětšování pole (stretching)

### Pravidlo
- Pokud při vložení platí $n > C$, vytvoříme nové pole s kapacitou
$$
C' = 2C
$$
a překopírujeme všechny prvky.
### Analýza (agregační metoda)
Po $k$-tém zvětšení je kapacita $2^k$.  
Pro $n$ vložení platí:
$$
2^{k-1} < n \le 2^k
$$

Celkový čas všech realokací:
$$
2^1 + 2^2 + \dots + 2^k = 2^{k+1} - 2 \in \Theta(n)
$$

### Závěr
- jednotlivé vložení může stát až $\Theta(n)$,
- **amortizovaná složitost jednoho Append je** $O(1)$

---
## Zmenšování pole (shrinkable array)

## Správná strategie zvětšování a zmenšování

### Pravidla
- **zvětšíme**, když:
$$
n > C
$$
- **zmenšíme**, když:
$$
n < \frac{C}{4}
$$
- po změně kapacity platí zhruba:
$$
n \approx \frac{C}{2}
$$

Tím zajistíme, že po realokaci je pole **daleko od plnosti i prázdnosti**.

---
## Analýza (účetní metoda)
Rozdělíme posloupnost operací na **bloky**:
- blok končí realokací nebo koncem operací, na začátku mějme $n = C / 2$, pak pro shrink musí proběhnout aspoň $C / 4$ operací, tedy $\frac{1}{2} n$ a pro prodloužení musíme aspoň $C / 2$ operací, tedy $n$ a tedy můžeme redsitribuuovat cenu mezi jednotlivé konstatní operace.
- realokace stojí $\Theta(C)$.

Pozorování:
- mezi dvěma realokacemi musí proběhnout alespoň $\Theta(C)$ operací,
- náklad realokace lze rovnoměrně rozdělit mezi tyto operace.

Každé operaci tak přiřadíme konstantní „kredit“.

---
## Výsledek amortizované analýzy

Pro libovolnou posloupnost $m$ operací:
$$
\text{celkový čas} = \Theta(m)
$$