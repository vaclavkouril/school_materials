Neuniformita je pro každou délku vstupu existuje individuální výpočetní zařízení, které vstupy dané délky vyhodnocují.

*Definice:* **Booleovský obvod** se $n$ vstupy a jedním výstupem je orientovaný graf s $n$ zdrojovými vrcholy ($deg_{in} = 0$) a jedním stokem. 
- Zdrojové vrcholy jsou jsou vstupy, ostatní vrcholy jsou hradla.
- Hradla $AND,OR$ se vstupním stupněm $2$ a $NOT$ s jedním vstupem.
- Velikost obvodu = počet vrcholů

*Značení:* Pro obvod $C$ a vstup $x$ značíme $C(x)$ hodnotu ve výstupním vrcholu.

---
## Příklady
![XOR-2-arity.excalidraw](XOR-2-arity.excalidraw.svg)
---
$(x_{1} \lor x_{2} \lor x_3) \land (x_{1} \lor x_{2} \lor x_{4}) \land (x_{1} \lor x_{2} \lor x_{5})$ TODO: obrázek stromu i DAGu


---
## Pozorování
Pokud se využije faktu, že výstupní stupeň hradel není omezen, tak můžeme konstruovat menší obvody ve formě DAG-u.
1. Při změně vstupní arity $AND,OR$ ze $2$ na $n$ (nebo $p(n)$) na velikost změní o faktor $n$ ($p(n)$) a hloubku o $O(\log n)$
2. Při změně u výstupní arity hradel z $1$ na $2$ může dojít k exponenciálnímu rozdílu ve velikosti obvodu. 

---
*Definice:* Nechť $T : \mathbb{N}\rightarrow \mathbb{N}$ je funkce, rodina obvodů velikosti $T(n)$ je posloupnost obvodů $\{ C_{n} \}_{n\in \mathbb{N}}$, kde $\forall n: C_{n}$ má $n$ vstupů a $|C_{n}|\leq T(n)$.
- Jazyk patří do třídy $SIZE(T(n))$, pokud $\exists$ rodina obvodů $\{ C_{n} \}$ velikosti $T(n)$ taková, že $\forall x\in \{ 0,1 \}^n: x\in L \iff C_{n}(x)=1$. 

*Definice:* $\mathcal{P}/\text{poly}$ je třída jazyků, přijímaných rodinami obvodů polynomiální velikosti, tedy
$$
\mathcal{P}/\text{poly} = \bigcup_{c=0}^\infty SIZE (n^c).
$$
---
### *Věta:* $\mathcal{P} \subseteq\mathcal{P}/\text{poly}$.
$\supseteq$ nemůže platit, protože umíme zakódovat halting problém.
$$
L = \{  n \mid n \text{ kóduje dvojici } M,x \text{ pro DTS a vstup, zda přijímá stroj vstup} \}
$$

*Důkaz:* $L\in \mathcal{P}\implies \exists M$ DTS takový, že $L=L(M)$ a $M$ pracuje v čase $p(n)$, kde $p$ je jazykem. A tedy i existuje oblivious DTS $\hat{M}$ rozpoznávající $L$ a pracující v $p^2(n)$. 

Oblivious je, že pozice hlav nezáleží na vstupu, ale pouze na počtu kroků od začátku výpočtu.

*Myšlenka konstrukce obvodu:* 
- Nechť je na vstupu $\hat{M}$ řetězec $x$ délky $n$. 
- Označme $z_{1},z_{2},\dots,z_{T(n)}$ pro displeje $\hat{M}$ během výpočtu stroje $\hat{M}$. 
- $C_{v}$ je obvod odpovídající poslednímu kroku, kdy byla vstupní hlava na stejné pozici jako po kroku $i\hbox{.}$ 
- Pokud $C_v$ není definováno dostane $C_{i}$ příslušný bit ze vstupu. 
- Obvod přijme vstup $x$, pokud $z_{T(n)}$ kóduje přijímající stav.

Každé $C_{i}$ má konstantní velikost a tím pádem máme $O(T(n))$ jako celkovou velikost.


*Důsledek:* $\exists$ DTS $\tilde{M}$, který na $1^n$ vydá na výstupu popis obvodu $C_{n}$ a navíc:
1. $\tilde{M}$ pracuje v polynomiálním čase,
2. $\LARGE\tilde{M}$ pracuje v logaritmickém prostoru.
- popis $C_{n}$ dává na výstupní pásku (mimo počítaný prostor)
- vše co se týká popisu $\hat{M}$ je konstantní
- je třeba si pamatovat kódy pozic vstupní a pracovní hlavy, ale na ty je třeba $\log n$ a $\log T(n) = O(\log n)$ bitů a ještě counter na který krok $\hat{M}$ právě řeší (konstruuje příslušné $C_{i}$)