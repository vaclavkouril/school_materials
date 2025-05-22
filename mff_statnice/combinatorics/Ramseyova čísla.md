*Definice:*
1. Velikost maximální kliky ($K$) $\omega(G)$
2. Velikost maximální nezávislé množiny ($E$) $\alpha(G)$
## Ramseyovo Číslo
$$
r(k,l)= \min  n \text{ takové že } \forall G \text{ na $n$ vrcholech obsahuje buď } K_{k} \text{ nebo } E_{l}
$$
Ekvivalentně mohu vzít $n$ vrcholů a kreslit hrany 2 barvami a ptát se zda obsahuje kliku velikosti $k$ v jedné barvě, nebo kliku velikosti $l$ v barvě druhé.

### Odhady
#### Pro $k,l \geq 2$, $r(k,l) \leq r(k-1,l) +r(k,l-1)$
*Důkaz:* Mějme  $G$ ma $r(k-1,l) +r(k,l-1)$  vrcholech. Zvolme libovolné $u$ a označme:
1. $A:=$ ne-sousedé $u$
 2. $B:=$ sousedé $u$ 
![[Excalidraw/Drawing 2025-05-22 18.02.27.excalidraw|right|200]]
Platí tedy nutně $|A| \geq  r(k-1,l)$ nebo $|B| \geq  r(k,l-1)$, protože jinak bychom se přidáním $u$ nedostali k potřebnému počtu vrcholů. 
Pro $|A| \geq  r(k-1,l)$ máme jen dvě možnosti:
	1. $G|_{A}$ platí $\omega(G|_{A}) \geq l \implies \omega(G) \geq l$.
	2. $G|_{A}$ platí $\alpha(G|_{A}) \geq k-1$, kde přidáním $u$ máme nezávislou množinu velikosti $k$.
Pro $|B| \geq r(k,l-1)$ platí obdobný argument, kde rozšiřujeme kliku o $u$.

Důsledkem je tedy 
$$
r(k,l) \leq \binom{k+l-2}{k-1}= \binom{k+l-2}{l-1} 
$$$$
r(k,l) \leq r(k,l) \leq r(k-1,l) +r(k,l-1) \leq \binom{k+l-3}{k-2} + \binom{k+l-3}{k-2} = \binom{k+l-2}{k-1}
$$

#### $\forall k,n \in \mathbb{N}$ t.ž. $\binom{n}{k}2^{1-k/2} <1 \implies r(k)>n$.
Zapisujeme $r(k)$ jako zkratku $r(k,k)$.
Chceme ukázat, že existuje graf na $n$ vrcholech, který neobsahuje ani zelenou $K_k$, ani modrou $K_k$. Označme $G\left( n,\frac{1}{2} \right)$ náhodný graf, ve kterém každou hranu obarvíme zeleně (resp. existuje) s pravděpodobností $\frac{1}{2}$, nezávisle.
- Pro každou pevnou množinu $K$ o $k$ vrcholech je pravděpodobnost, že tvoří zelenou klikou
$$
Pr[K\text{ je zelená}] = 2^{-\binom k 2}
$$
- Označme $U$ událost, že existuje nějaká $k$-prvková množina, která je buď zelenou klikou, nebo modrou nezávislou množinou. Poté odhadem sjednocení (union bound - $Pr(U_{1} \cup U_{2}) \leq Pr(U_{1})+Pr(U_{2})$) máme
$$
Pr[U] \leq \binom n k \cdot 2 \cdot 2^{-\binom k 2} = \binom n k \cdot 2^{1-\binom k 2}.
$$
	Je-li 
$$
\binom n k \cdot 2^{1-\binom k 2} <1
$$
	Pak i $Pr(U) < 1$. Existuje tedy alespoň jeden graf bez monochromatické $K_{k}$. Tedy
$$
r(k)>n.
$$
	Volbou $n=\bigl\lfloor2^{k/2}\bigr\rfloor$ a hrubou odhadovou nerovností $\binom n k \leq \frac{n^k}{k!}$, dostaneme pro velká $k$ 
$$
r(k) > 2^{k/2}.
$$