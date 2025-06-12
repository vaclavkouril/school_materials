*Definice:* Vlastní číslo $\lambda$ matic splňuje
$$
Ax = \lambda x
$$
kde $x$ je vektor řešení pokud existuje tak ho nazveme **vlastní vektor**.
*Definice*: Pro vektorový prostor $V$ nad $T$ a lineární zobrazení $f: V \to V$ je vlastní číslo zobrazení $f$ jakékoliv $\lambda \in T$, pro které existuje **vlastní vektor** $v \in V \setminus \{ 0 \}$ takový, že $f(v)= \lambda v$.

U $V$ s konečnou dimenzí můžeme $f$ reprezentovat maticí $A = [f]_{B,B} \in T^{n \times n}$ vzhledem k nějaké bázi $B$ prostoru $V$.

Množina všech vlastních čísel matice je jejím **spektrem**.

*Definice*: Charakteristický polynom matice je $p_{A}(x) = \det(A - xI_{n})$.

*Věta:* Číslo $\lambda \in T$ je vlastní číslem matice $A$ $\iff$ $\lambda$ je kořenem jejího charakteristického polynomu. 
*Idea důkazu*: vlastní číslo je jen a pouze když charakteristický polynom vyjde 0

*Definice:* Algebraická násobnost vlastního čísla $\lambda_{i}$ matice $A$ je rovna násobnosti kořene $\lambda_{i}$ v charakteristickém polynomu $p_{A}(x)$

*Důsledek*: Je-li $T$ algebraicky uzavřené, pak lze charakteristický polynom rozložit na lineární faktory dané kořeny.

---
# Geometrický význam
Vlastní vektor $v$ je jediným (až na skalární násobek) směrem, který $A$ „nezakroutí“ — zůstává na stejné jednorozměrné přímce $span(v)$. Zobrazení $A$ jej pouze **natáhne** nebo **stlačí** (případně otočí o $180^\circ$, pokud je $\lambda<0$). 
Vlastní číslo $\lambda$ určuje, o kolik se délka vlastního vektoru změní:
$$
\|A\,v\| \;=\; |\lambda|\;\|v\|.
$$
– Pokud $|\lambda|>1$, dochází k **řízenému natažení** ve směru $v$.  
– Pokud $|\lambda|<1$, je to **komprese**.  
– Pokud $\lambda=0$, celá přímka $span(v)$ se zplošťuje na nulový vektor.

---
# Podobnost matic
*Definice:* Matice $A,B \in T^{n \times n}$ jsou podobné, pokud existuje regulární matice $R$, že $A = R^{-1}BR$.

*Věta:* Podobné matice mají stejná vlastní čísla.

*Definice:* Matice $A$ je diagonalizovatelná, je-li podobná nějaké diagonální matici.

*Věta:* Diagonalizovatelná matice $A$ jde vyjádřit ve tvaru $A = R D R^{-1}$, kde $D$ je diagonální.
- To se názývá spektrální rozklad
- Sloupce $R$ odpovídají vlastním vektorům (v pořadí, v němž jsou vlastní čísla na diagonále $D$)

*Věta*: Matice $A$ je diagonalizovatelná $\iff$ má $n$ lineárně nezávislých vlastních vektorů.

*Věta:* Pokud má matice $A$ $n$ různých vlastních čísel tak je diagonalizovatelná.

---
# Symetrické matice
*Definice:* Matice je symetrická když $A = A^T$
Vlastní čísla reálných symetrických matic jsou reálná

*Věta:* Pro každou symetrickou matici $A \in \mathbb{R}^{n \times n}$ existuje ortogonální $Q \in R^{n \times n}$ a diagonální $D$ takové, že $A = QDQ^T$.
