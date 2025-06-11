*Definice:* Jednotková matice $I_{n} \in T^{n \times n}$ je matice kde všechny prvky jsou $0$ až na prvky na hlavní diagonále $(I_{n})_{i,i} = 1$.

*Definice:* Součet matic $A,B \in T^{n\times m}$ je $(A+B) \in T^{n\times m}$ definován
$$
(A+B)_{i,j} = a_{i,j} + b_{i,j}.
$$
*Definice:* Součin matic $A\in T^{m \times n}$, $B\in T^{n \times p}$ je $(AB) \in T^{m \times p}$ definován
$$
(AB)_{i,j} = \sum_{k=0}^n a_{i,k} b_{k,j}.
$$
*Definice:* Hodnost matice $A$ je $rank(A)$ rovna počtu pivotů v libovolné $A\sim\sim A'$ v $REF$ tvaru.

*Definice*: Pokud $A \in T^{n\times n}$ tak existuje $B \in T^{n \times n}$ taková, že $AB = I_{n}$, pak $B$ značíme $A^{-1}$ a nazýváme ji **inverzní**.
Má-li $A$ inverzní matici pak ji nazveme **regulární**, jinak ji zveme singulární.

*Věta*: Následující tvrzení o $A \in T^{n \times n}$ jsou ekvivalentní
1. A je regulární, tedy existuje inverzní matice.
2. $rank(A) = n$.
3. $A \sim\sim I_{n}$
4. Soustava $Ax=0$ má pouze triviální řešení $x = 0$.
*Důkaz:* $2. \implies 3.$ z Gauss-Jordanovi eliminace. $3. \implies 2.$ $I_{n}$ je v REF.
$2. \implies 1.$ Rozdělíme $I_{n}$ na $e_{1},\dots,e_{n}$ vektory s $1$ na $i$-tém místě, pro všechna $i$ spočteme $Ax_{i} =e_{i}$ a to nám dá z $rank(A) = n$ řešení $A^{-1} = (x_{1}|\dots|x_{n}).$ $1. \implies 2.$ Pokud by $rank(A)$ byl menší než $n$, tak by pak nějaký řádek mohl být eliminován ostatními řádky, tedy $Ax_{i} =e_{i}$ nemá řešení a tedy spor.
$2 \iff 4$  
Obecně platí $\dim(\ker(A)) = n - \operatorname{rank}(A).$
*Důkaz:* Nechť $\dim\ker(A)=k$. Vyberme bázi $\{v_1,\dots,v_k\}$ prostoru $\ker(A).$ Doplňme ji na bázi celého prostoru $\mathbb{R}^n$ přidáním vektorů $\{v_{k+1},\dots,v_n\}$.  

Protože $A\,v_i=0$ pro $i\le k$ a $A$ je lineární, obrazy $\{A\,v_{k+1},\dots,A\,v_n\}$ generují obraz matice $A$. Navíc jsou lineárně nezávislé: 
pokud  
$$
\sum_{i=k+1}^n \alpha_i\,A\,v_i = 0,
$$
pak
$$
A\Bigl(\sum_{i=k+1}^n \alpha_i v_i\Bigr)=0
$$
a tedy $\sum_{i=k+1}^n\alpha_i v_i\in\ker(A)$. Ale vektory $v_{k+1},\dots,v_n$ spolu s $v_1,\dots,v_k$ tvoří bázi, takže musí být všechny $\alpha_i=0$.  
Tedy  
$$
\operatorname{rank}(A)
=\dim\bigl(\mathrm{Im}(A)\bigr)
=n-k
\quad\Longrightarrow\quad
k = n - \operatorname{rank}(A).
$$
