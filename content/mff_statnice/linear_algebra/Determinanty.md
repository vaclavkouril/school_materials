*Definice*: Determinant matice $A \in T^{n \times n}$ je definován výrazem
$$
\det(A) = \sum_{p \in S_{n}} sgn(p) \prod^{n}_{i=0} a_{i,p(i)}
$$
kde $S_{n}$ je grupa permutací na $\{ 1,\dots,n \}$ a $sgn(p) = (-1)^{\text{počet inverzí }p}$, tedy $x,y$ takových, že původně $x <y$ ale $p(x) > p(y)$. 

Vzhledem k charakteru výběru všech permutací tak $\forall A \in T^{n \times n}: \det(A) = \det(A^T)$. 

*Věta:* Determinant je lineárně závislý na každém jejím řádku a sloupci, tj. přenásobení řádku konstantou změní o násob dané konstanty determinant a matice kde $i$-tý řádek je součtem $b_{ij}$ a $c_{ij}$ tak je roven determinantům dvou matic kde každá má na $i$-tém řádku jen $b$, nebo $c$.
*Důkaz:* Násobení
$$
\sum_{p \in S_{n}} sgn(p) (t \cdot\prod^{n}_{i=0} a_{i,p(i)}) = t \cdot \sum_{p \in S_{n}} sgn(p) \prod^{n}_{i=0} a_{i,p(i)} = t \cdot \det(A)
$$
Sčítání, pokud $A,B,C$ splňují $a_{kj} = \left\{ \begin{array}{rcl} b_{ij} + c_{ij} & \text{když} & k =i  \\ b_{kj} = c_{kj} & \text{když} & k \neq i  \end{array}\right.$ pak 
$$
\begin{align}
\det(A) &= \sum_{p \in S_{n}} sgn(p) \prod^{n}_{i=0} a_{i,p(i)} \\
& = \sum_{p \in S_{n}} (b_{i,p(i)} + c_{i, p(i)})  sgn(p) \prod_{k \in \{ 1,\dots,n \}\setminus i} a_{k,p(k)} \\
&= \sum_{p \in S_{n}} sgn(p) \prod^{n}_{i=0} b_{i,p(i)} + \sum_{p \in S_{n}} sgn(p) \prod^{n}_{i=0} c_{i,p(i)} \\
& =\det(B) \cdot \det(C)
\end{align}
$$

*Poznámka k determinantům:* Díky multilinearitě a alternaci determinantu z definice vyplývá i invariance při přičtení násobku jednoho řádku k jinému.  
1. **Multilinearita** v každém řádku říká, že pokud v matici $A$ nahradíme $i$-tý řádek součtem  
$$
     \text{(původní }i\text{-tý řádek)} + t\cdot\text{(nějaký }j\text{-tý řádek)},
$$
tak  
$$
   \det(A)
   = \det\bigl(\ldots,\,\underbrace{\mathbf{r}_i + t\,\mathbf{r}_j}_{\text{nový }i\text{-tý řádek}},\ldots\bigr)
   = \det\bigl(\ldots,\,\mathbf{r}_i,\ldots\bigr)
     \;+\;
     t\,\det\bigl(\ldots,\,\mathbf{r}_j,\ldots\bigr).
$$
2. **Alternace** říká, že pokud má matice dva stejné řádky, její determinant je nula. V druhém členu se $i$-tým i $j$-tým řádkem objeví stejný vektor $\mathbf{r}_j$, takže  
   $$
   \det\bigl(\ldots,\,\mathbf{r}_j\;\text{(na místě }i\text{)},\,\mathbf{r}_j\ldots\bigr)
   = 0.
   $$
3. **Závěr:**  
   $$
   \det\bigl(\ldots,\,\mathbf{r}_i + t\,\mathbf{r}_j,\ldots\bigr)
   = \det\bigl(\ldots,\,\mathbf{r}_i,\ldots\bigr)
     + t\cdot0
   = \det(A).
   $$
Analogicky pro sloupce díky symetrii definičního vzorce.

*Důsledek:* $\det(S)=0$ pro singulární matici $S$.

---
# Multiplikativnost
*Věta*: Pro libovolné $A,B \in T^{n \times n}$ platí $\det(AB) = \det(A)\det(B)$
*Důkaz:* Obě jsou regulární jinak je důkaz triviální.
Můžeme si všimnou, že součiny s elementárními maticemi zachovávají determinanty protože máme-li $E$, která způsobí
1. přičtení $i$-tého řádku k $j$-tému: $\det(E) = 1$
2. vynásobení $i$-tého řádku $t$: $\det(E)=t$
Rozložíme regulární $A = E_{1} \cdots E_{k}$ a spočítáme
$$
\det(E_{1} \cdots E_{k}B) = \det(E_{1})\det(E_{2} \cdots E_{k}B) = \det(A)\det(B).
$$
*Důsledek:* $\det(A^{-1}) = \det(A)^{-1}$

---
# Vlastní čísla a determinant
*Definice:* $\lambda$ je [vlastním číslem](Vlastní%20čísla%20a%20vlastní%20vektory) $A$, právě tehdy když $\det(A-\lambda I_{n}) = 0$, tedy když je kořenem charakteristického polynomu $p_{A}(t) = \det(A-tI_{n})$.

Determinant matice je roven součinu vlastních čísel.

---
# Laplaceův rozvoj determinantu
Pro notaci máme $A^{ij}$ jako podmatici $A$ bez $i$-tého řádku a $j$-tého sloupce.

*Věta:* Pro libovolné $A \in T^{n \times n}$ a jakékoliv $i \in \{ 1,2,\dots,n \}$ platí 
$$
\det(A) = \sum_{j=0}^n a_{i,j} (-1)^{j+k} \det(A^{ij})
$$
*Důkaz:*
1. **Dělení podle hodnoty $p(i)$:**  
   Každá permutace $p$ přiřazuje řádku $i$ číslo $p(i)=j$ pro některé $j\in\{1,\dots,n\}$. Rozdělíme sumu na části podle $j$:
$$
   \det(A)
   = \sum_{j=1}^n
     \sum_{\substack{p\in S_n\\p(i)=j}}
       \mathrm{sgn}(p)\;\prod_{k=1}^n a_{k,p(k)}.
$$
2. **Odstranění faktoru $a_{i j}$:**  
   V každém vnitřním součtu je $\prod_{k=1}^n a_{k,p(k)} = a_{i j}\;\prod_{k\neq i} a_{k,p(k)}$. Tedy
$$
   \det(A)
   = \sum_{j=1}^n a_{i j}
     \sum_{\substack{p\in S_n\\p(i)=j}}
       \mathrm{sgn}(p)\;\prod_{k\neq i} a_{k,p(k)}.
$$
3. **Redukce na menší permutace:**  
   Permutace $p$ s $p(i)=j$ odpovídá jednoznačně permutaci $q$ na množině $\{1,\dots,n\}\setminus\{i\}$ do $\{1,\dots,n\}\setminus\{j\}$. Přechod od $q$ k $p$ způsobí změnu znaménka o $(-1)^{\,i+j}$. Formálně:
$$
   \mathrm{sgn}(p)
   = (-1)^{\,i+j}\,\mathrm{sgn}(q).
$$
   Součin $\prod_{k\neq i} a_{k,p(k)}$ je právě determinant $\det(A^{ij})$ rozvinutý podle permutací $q$.
4. **Složení:**  
   $$
   \sum_{\substack{p\in S_n\\p(i)=j}}
     \mathrm{sgn}(p)\;\prod_{k\neq i} a_{k,p(k)}
   = (-1)^{\,i+j}
     \sum_{q\in S_{n-1}} \mathrm{sgn}(q)\;\prod_{k\neq i} a_{k,q(k)}
   = (-1)^{\,i+j}\,\det\bigl(A^{ij}\bigr).
   $$
5. **Závěr:**  
   Dosazením zpět do bodu 2 dostáváme
$$
   \det(A)
   = \sum_{j=1}^n a_{i j}\,\bigl[(-1)^{\,i+j}\,\det(A^{ij})\bigr]
   = \sum_{j=1}^n (-1)^{\,i+j}\,a_{i j}\,\det(A^{ij}).
$$

---
# Geometrická interpretace determinantu
Objem rovnoběžnostěnu určeného $k$ vektory je roven absolutní hodnotě determinantu matice, jejíž sloupce tyto vektory tvoří

Po provedení lineárního zobrazení se objemy těles změní úměrně absolutní hodnotě determinantu matice zobrazení.