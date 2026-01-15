*Definice:* Parametrizovaný problém je jazyk $L \subseteq \Sigma^* \times \mathbb{N}$, kde $\Sigma$ je konečná abeceda, $k$ je parametrem instance $\langle I,k\rangle \in \Sigma^* \times \mathbb{N}$ a velikost instance $\langle I,k\rangle$ je $|\langle I,k\rangle| = |I|+k$.

*Definice:* Parametrizovaný problém $L \subseteq\Sigma^* \times \mathbb{N}$ je řešitelný s pevným parametrem (FPT), právě když lze rozhodnout algoritmem $\mathcal{A}$, který pracuje v čase
$$
O(f(k) \cdot |I|^c)
$$
pro nějakou algoritmicky vyčíslitelnou $f$ a konstantu $c$.

*Definice:* $O^*(f(k))$ označuje třídu funkcí $O(f(k)\cdot n^c)$ pro libovolnou konstantu $c$.

*Věta:* Vrcholové pokrytí s parametrem $k$ je v $FPT$. 

Problém je definován následovně: Máme graf $G$ a parametr $k$, existuje vrcholové pokrytí $S \subseteq V(G), |S| \leq k$. 

Algoritmus $SearchVP(G,k)$:
1. Pokud je $E = \emptyset$ tak vrátíme $\emptyset$
2. Když $k = 0$ tak vrátíme NONE (neexistuje)
3. Vezměme libovolnou $\{ u,v \} \in E$
4. Když $SearchVP(G-u, k-1)$ vrátí $S'$ tak vrátíme $S := S' \cup \{ u \}$
5. Když $SearchVP(G-v, k-1)$ vrátí $S''$ tak vrátíme $S := S'' \cup \{ v \}$
6. Vrátíme NONE

Indukcí na $k$ pro $k=0$ máme buď $E=\emptyset$, pak vrcholové pokrytí existuje a je velikosti $0$, jinak pokud $E \neq \emptyset$, tak budget na vrcholy došel, ale zbývají hrany k pokrytí a tedy správně odpoví NONE. 

Pro $k> 0$, tak uvažujeme-li libovolnou hranu tak ji musí pokrýt a každé $S$ obsahuje $u$, nebo $v$ a máme vrcholové pokrytí přesně když máme $k-1$ pokrytí bez jednoho z nich. 

Algoritmus běží v čase $O(2^k(m+n))$, protože hloubka rekurze je $k$ a máme $2$ rekurzivní volání v každé instanci a tedy máme $2^k$ volání $SearchVP$  a ta běží kontrolami v $O(m+n)$ pro výběr hrany a odstranění vrcholu. A je tedy řešitelné pro pevný parametr.

---
# Kernelizace
*Definice:* $A$ je kernel (kernelizační algoritmus) pro problém $L$ pokud 
- $A$ pracuje v poly čase
- Pro instance $\langle I,k \rangle, \langle I',k' \rangle= A(\langle I,k \rangle)$ platí $\langle I,k \rangle \in L \iff \langle I',k' \rangle \in L$.
- Existuje vyčíslitelná funkce $g(k)$ taková, že pro každé instance $\langle I,k \rangle$ a $\langle I',k' \rangle = A(\langle I,k \rangle)$ platí $|I'|+k' \leq g(n)$

Funkcí $g(n)$ rozumíme velikost kernelu.

*Lemma:* Rozhodnutelný parametrizovaný problém $L$ je v $FPT$, právě když má kernel.

Důkaz: ($\impliedby$) Mějme $A$ kernel s velikostí $g(n)$, pak máme algoritmus pro $L$:
1. $\langle I',k' \rangle \leftarrow A(I,k)$
2. hrubou silou vyřešíme omezený $\langle I',k' \rangle$.

Složitost 2. je závislá na $k$ a platí $|I'| + k' \leq g(n)$ a tedy máme složitost $O^*(f(k))$

($\implies$) Nechť $\mathcal{A}$ rozhoduje $L$ v čase $f(k)\cdot|I|^c$ pak můžeme udělat kernelizační alg.
1. Proveďme nejvýše $|I|^{c+1}$ kroků výpočtu $\mathcal A (I,k)$
2. Pokud $\mathcal A$ přijal tak vrátíme triviální instanci uvnitř $L$
3. Pokud odmítl tak vrátíme triviální instanci mimo $L$
4. Pokud výpočet neskončil během $|I|^{c+1}$ kroků tak vrátíme $\langle I, k \rangle$

Dosáhne-li algoritmus kroku 4. tak $|I|^{c+1} \leq f(k) |I|^c$ a tedy $|I| \leq f(k)$, takže $\langle I,k\rangle$ je kernel velikosti $g(k) \leq f(k) +k$.

Kernelizační algoritmus pro vrcholové pokrytí je vstupem $G,k$ a výstup kernel pro $G,k$
1. opakujme:
	1. pro každý izolovaný vrchol $v$ grafu tak $G \leftarrow G-v$
	2. dokud existuje vrchol $v: deg(v)>k$ tak $G \leftarrow G-v; k \leftarrow k -1$
2. dokud se hodnota $k$ nezměnila iterací
3. když $k<0$ nebo $|V| >k^2+k$ nebo $|E|>k^2$ tak vrátíme negativní instanci
4. jinak vrátíme $\langle G,k\rangle$

Výsledkem je kernel s $O(k^2)$ vrcholy a $O(k^2)$ hranami. 

---
# Prohledávání s omezenou hloubkou
Pro $\Delta$ grafu menší než dva tak umíme triviálně vyřešit vrcholové pokrytí, tak vezmeme algoritmus $SearchVP3(G,k)$:
1. když $k \leq {2}$ tak vyřešíme základní případ
2. $d \leftarrow \max_{v\in V} \deg v$
3. $d\leq 2$ vyřešíme základní případ
4. $v \leftarrow$ libovolný vrchol s maximálním stupněm
5. Když $SearchVP{3}(G-v, k-1)$ vrátí $S'$ tak vrátíme $S := S' \cup \{ u \}$
6. Když $SearchVP{3}(G-(N(v) \cup v), k-d)$ vrátí $S''$ tak vrátíme $S := S'' \cup N(v)$
7. Vrátíme NONE

Tak máme počet listů odhadnutelný pomocí 
$$
T(i) = \begin{cases}
T(i-1) + T(i-3) &i\geq {3} \\
1 &jinak
\end{cases}
$$
tedy hledáme řešení rovnice
$$
\lambda^{k-1} + \lambda^{k-3} \leq \lambda^k
$$
$$
\lambda^3 = \lambda^2 +1 
$$
a největší kořen shora odhadneme na $\lambda \leq 1.4656$ a spojíme-li to s kernelem, tak máme
$$
O(1.4656^kk^2+n^c)
$$