*Definice:* Skalární součin na vektorovém prostoru $V$ nad $\mathbb{C}$ je zobrazení $\forall u,v \in V: \langle u|v\rangle \in \mathbb{C}$ přiřazující dvojici vektorů skalár splňující axiomy
1. $\forall u \in V: \langle u|u \rangle \in \mathbb{R}^+_{0}$
2. $\forall u \in V: \langle u|u \rangle = 0 \iff u = 0$
3. $\forall u,v \in V: \langle u|v \rangle = \overline{\langle v|u \rangle}$, tedy jeho komplexně sdružené číslo
4. $\forall u,v,w \in V: \langle u+v|w \rangle \leq \langle u|w \rangle + \langle v|w \rangle$
5. $\forall u,v \in V, \forall t \in \mathbb{C}: \langle tu|v \rangle = t\langle u|v \rangle$

*Pozorování:* Pro skalární součin lineárních kombinací vektorů platí 
$$
\left\langle  \sum^k_{i=1} a_{i}u_{i} | \sum_{j=0}^l b_{j}v_{j}  \right\rangle = \sum^k_{i=1} \sum_{j=0}^l a_{i} \overline{b_{j}} \left\langle u_{i} | v_{j}  \right\rangle
$$

*Definice:* Je-li $V$ prostor se skalárním součinem nad $\mathbb{C}$, či $\mathbb{R}$ pak **norma odvozená ze skalárního součinu** je zobrazení $||u|| = \sqrt{ \langle u|u \rangle }$.

---
## Pythagorova věta
*Věta:* $a,b,c \in \mathbb{R}: c^2 = a^2 + b^2$, kde je pravý úhel mezi $a$ a $b$ v trojúhelníku $abc$.
# Cauchyho-Schwarzova nerovnost
*Věta*: Skalární součin libovolných dvou vektorů $u,v \in V$ nad $\mathbb{C}$ splňuje $|\langle u,v \rangle| \leq \sqrt{ \langle u,u \rangle \langle v,v \rangle }$. Jinými slovy vzhledem k normě 
$$
|\langle u,v \rangle| \leq ||u|| \cdot ||v||.
$$
*Důkaz:* 
1. Pro libovolné $\lambda\in\mathbb{C}$ je  
$$
   0 \;\le\; \|u - \lambda v\|^2 
   \;=\; \langle u - \lambda v,\;u - \lambda v\rangle.
$$
2. Rozepíšeme pravou stranu:  
$$
   \|u - \lambda v\|^2
   = \langle u,u\rangle 
     - \overline{\lambda}\,\langle u,v\rangle
     - \lambda\,\langle v,u\rangle
     + |\lambda|^2\,\langle v,v\rangle.
$$
3. Zvolme $\lambda = \frac{\langle v,u\rangle}{\langle v,v\rangle}.$
   Potom  
$$
   -\overline{\lambda}\,\langle u,v\rangle
   - \lambda\,\langle v,u\rangle
   = -2\,|\langle u,v\rangle|^2 / \langle v,v\rangle,
$$
   a     
$$
   |\lambda|^2\,\langle v,v\rangle
   = |\langle u,v\rangle|^2 / \langle v,v\rangle.
$$
4. Dosazením do nerovnosti $0\le\|u-\lambda v\|^2$ dostaneme  
$$
   0 \;\le\; \langle u,u\rangle 
             - \frac{|\langle u,v\rangle|^2}{\langle v,v\rangle},
$$
   tj.  
$$
|\langle u,v\rangle|^2 \le \langle u,u\rangle\,\langle v,v\rangle.
$$
5. Vezmeme druhou odmocninu a získáme  
$$
   |\langle u,v\rangle| \le \|u\|\cdot\|v\|.
$$
# Trojúhelníková nerovnost
*Věta:* Každá norma odvozená ze skalárního součinu splňuje trojúhelníkovou nerovnost $|| u+v || \leq ||u|| + ||v||$.
*Důkaz:*
$$
\begin{array}{rcl}
||u+v|| = \sqrt{ \langle u+v | u+v\rangle } = \sqrt{ \langle u | u\rangle + \langle u | u\rangle + \langle v | u\rangle + \langle u | v\rangle } \leq  \\ \\
\leq \sqrt{ ||u||^2 + 2 |\langle u|v \rangle| +||v||^2 } \leq \sqrt{ ||u||^2 + 2 ||u|\cdot||v|| +||v||^2 } = ||u||\cdot||v||
\end{array}
$$
---
# Ortonormální systémy vektorů
*Definice:* Vektory $u,v$ v prostoru se skalárním součinem jsou **kolmé**, pokud  
$$
  \langle u \mid v\rangle = 0,
$$  
označujeme $u\perp v$.  

*Pozorování:* Libovolná množina netriviálních vzájemně kolmých vektorů je lineárně nezávislá.

*Definice:* Ortonormální systém $(b_i)_{i\in I}$ vektorů v prostoru $V$ se skalárním součinem splňuje  
$$
\langle b_i \mid b_j\rangle = 0 \quad(i\ne j), 
  \quad
  \|b_i\| =1\quad(\forall i).
$$
*Definice:* Pokud je takový systém navíc báze prostoru $V$ (tj. generuje $V$), nazýváme ho **ortonormální bází**.

---
# Fourierovy koeficienty
*Věta:* Nechť $B=(b_1,\dots,b_n)$ je ortonormální báze konečně rozměrného prostoru $V$. Pak pro každý $v\in V$ platí  
$$
  v \;=\;\sum_{i=1}^n \langle v\mid b_i\rangle\,b_i.
$$
Koeficienty $\langle v \mid b_i\rangle$  se nazývají **Fourierovy koeficienty** vektoru $v$ vzhledem k bázi $B$. 
*Důkaz:* Je-li $v=\sum_i a_i b_i$, pak pro pevné $j$  
$$
  \langle v\mid b_j\rangle
  =\sum_i a_i\langle b_i\mid b_j\rangle
  =a_j\,. 
$$
---
# Gramova–Schmidtova ortonormalizace
*Algoritmus:* Mějme bázi $$b_1,\dots,b_n$$vektorového prostoru $V$ se skalárním součinem. Pro $i = 1,\dots,n$ vypočteme:
$$
c_i \;=\; b_i \;-\; \sum_{j=1}^{i-1} \langle b_i, b'_j\rangle\,b'_j,
\qquad
b'_i \;=\;\frac{c_i}{\|c_i\|}.
$$  
*Idea:* Odečteme od $b_i$ jeho projekce na dosud ortonormované $b'_1,\dots,b'_{i-1},$ čímž zajistíme kolmost, a pak normalizujeme.

---
# Ortogonální doplněk
*Definice:* Ortogonální doplněk podmnožiny $V$ prostoru $U$ se skalárním součinem je
$$
V^\perp \;=\;\{\,u\in U\mid \forall v\in V:\;\langle u,v\rangle = 0\}.
$$

*Pozorování:* Každý ortogonální doplněk je podprostorem $U$.  
*Důkaz:* Pokud $u\perp v$ pak pro libovolné $t\in\mathbb R$ a $v\in V$ máme  
$$
\langle t\,u,v\rangle
= t\,\langle u,v\rangle
= 0,
\quad
\langle u+w,\,v\rangle
= \langle u,v\rangle + \langle w,v\rangle
= 0,
$$  
takže $t\,u\in V^\perp$ a $u+w\in V^\perp$.

*Pozorování:* Pro každý podprostor $V\subseteq U$ platí
$$
V \cap V^\perp = \{0\}.
$$  
*Důkaz:* Kdyby $u\in V\cap V^\perp$, pak $\langle u,u\rangle =0$, takže $u=0$.

*Věta:* Nechť $U$ má konečnou dimenzi a $V\subseteq U$ je podprostor. Potom
1. $(V^\perp)^\perp = V$,
2. $\dim V + \dim V^\perp = \dim U$.
---
# Ortogonální projekce
**Definice:** Nechť $U$ je prostor se skalárním součinem a $V\subseteq U$ podprostor s ortonormální bází $b_1,\dots,b_n$. Zobrazení
$$
p_V: U \;\to\; V,
\qquad
p_V(u) \;=\; \sum_{i=1}^n \langle u, b_i\rangle\,b_i
$$
je **ortogonální projekce** $U$ na $V$.
*Vlastnosti:*
- $p_V$ je lineární:  
$$
  p_V(tu) = t\,p_V(u),
  \quad
  p_V(u+v) = p_V(u) + p_V(v).
$$
- Pro každé $i$:  
$$
  u - p_V(u) \;\perp\; b_i.
$$
- $p_V(u)$ je vektor v $V$, který minimalizuje $\|u - v\|$; tj.  
$$
  \|u - p_V(u)\| \;\le\; \|u - v\|
  \quad\forall\,v\in V.
$$

---
# Projekce jako lineární zobrazení
Nechť $U$ je vektorový prostor se skalárním součinem a $V\subseteq U$ jeho podprostor. Ortogonální projekce  
$$
p_V \colon U \;\to\; V
$$
je zobrazení, které každému $u\in U$ přiřadí jediné $v\in V$ tak, že  
$$
u - v \;\in\; V^\perp,
$$
tj. $v$ je „stínem“ $u$ na $V$.

### Vlastnosti
1. **Lineárnost:**  
   Pro všechna $u,w\in U$ a $a\in\mathbb R$ platí  
$$
   p_V(u + w) \;=\; p_V(u) + p_V(w),
   \qquad
   p_V(a\,u) \;=\; a\,p_V(u).
$$
2. **Idempotence:**  
$$
   p_V\bigl(p_V(u)\bigr)
   \;=\; p_V(u),
$$
   protože pokud už jsme v $V$, další projekce nic nezmění. Formálně:
$$
   p_V^2 = p_V.
$$
3. **Symetrie (pro ortogonální projekci):**  
$$
   \langle p_V(u), w\rangle
   = \langle u, p_V(w)\rangle
   \quad\forall u,w\in U.
$$
   To znamená, že $p_V$ je samoadjunktní operátor: $p_V = p_V^*$.
### Obraz a jádro
- $\mathrm{Im}(p_V) = V$: každý výsledek leží v cílovém podprostoru.
- $\ker(p_V) = V^\perp$: $p_V(u)=0$ právě když $u$ leží kolmo na $V$.

Díky tomu se rozkládá prostor jako přímý součet:
$$
U = V \oplus V^\perp,
$$
a pro každé $u\in U$ máme jedinečný rozklad
$$
u = p_V(u) \;+\; \bigl(u - p_V(u)\bigr).
$$
### Matice projekce
Pokud $\{b_1,\dots,b_n\}$ je ortonormální báze podprostor $V$, pak pro libovolné $u\in U$
$$
p_V(u)
= \sum_{i=1}^n \langle u,b_i\rangle\,b_i.
$$
Vnější součinová forma matice projekce vůči této bázi vypadá:
$$
P \;=\; B\,B^T,
$$
kde $B$ je matice, jejíž sloupce jsou souřadnice $b_i$. Tato matice splňuje
$$
P^2 = P,\quad P^T = P.
$$
### Geometrický význam
- **Minimalizace:** $p_V(u)$ je jediný vektor v $V$, který minimalizuje vzdálenost $\|u - v\|$.  
- **Stínování:** V geometrii „vrháme stín“ bodu $u$ na rovinu $V$.
---
# Ortogonální matice
*Definice:* Matice $Q \in \mathbb{R}^{n \times n}$ je ortogonální pokud $Q^TQ=I_{n}$.
*Věta:* $Q$ je ortogonální $\iff$ sloupce tvoří ortogonální bázi $\mathbb{R}^n$
*Tvrzení:* Je-li $Q$ ortogonální, pak 
1. $Q^T$ je též ortogonální,
2. $Q^{-1}$ existuje a je též ortogonální.
Součin dvou ortogonálních matic dá zase ortogonální matici.
Další vlastnosti:
3. $\langle Qx \mid Qy \rangle = \langle x \mid y \rangle$ 
4. $||Qx|| = ||x||$
5. zobrazení $x \to Qx$ zachovává úhly a délky
6. matice zobrazení zachovávající skalární součin je ortogonální
7. $\forall i,j: |Q_{i,j}| \leq 1$
8. $\begin{pmatrix} 1 & o^T \\ o & Q\end{pmatrix}$ je ortogonální matice