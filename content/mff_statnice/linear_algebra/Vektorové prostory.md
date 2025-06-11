*Definice:* Vektorový prostor $(V,+, \cdot)$ na tělesem $(T,+, \cdot)$ je množina $V$ spolu s binární operací $+: V \times V \to V$ a operací skalárního násobku $\cdot: T \times V \to V$, kde
1. $(V,+)$ je Abelovská grupa
2. $\forall a,b \in T, \forall v \in V: (a \cdot b)\cdot v = a \cdot (b \cdot v)$
3. $\forall v \in V: 1 \cdot v = v$
4. $\forall a,b \in T, v \in V: (a + b) \cdot v = (a\cdot v) + (b \cdot v)$
5. $\forall a \in T,\forall v,w \in V: a \cdot (v + w) = a \cdot v + a\cdot w$

*Definice:* Nechť $V$ je vektorový prostor nad $T$, potom podprostor $U$ je neprázdná podmnožina $V$ splňující: 
1. $\forall u,v \in U: u+v \in U$
2. $\forall t \in T, \forall u \in U: tu \in U$

*Definice:* Podprostor prostoru $V$ je generovaný množinou $M$ je průnikem všech podprostorů $U$ z $V$ obsahujících $M$. Značíme $span(M)$.

*Definice:* Lineární kombinace vektorů $v_{1}, \dots, v_{k} \in V$ nad $T$ je libovolný vektor $u = \sum_{i=1}^k a_{i}v_{i}$, kde $a_{i} \in T$. 

*Definice:* Pro množinu $M \subseteq V$ vektorového prostoru $V$ nad tělesem $T$ je **lineární obal** (span) definován jako množina všech konečných lineárních kombinací prvků z $M$:  
$$
\mathrm{span}(M)
\;=\;
\Bigl\{\sum_{i=1}^k a_i\,v_i \mid k\in\mathbb{N},\,v_i\in M,\,a_i\in T\Bigr\}.
$$
*Definice:* Množina vektorů je **lineárně nezávislá**, právě když pro každou $n\text{-tici}$ $v_{1}, \dots,v_{n} \in B$ platí, že $\sum^n_{i=1} a_{i}v_{i} = 0$ má pouze triviální řešení, $a_{1} = \dots= a_{n} = 0$.
Jinak je taková množina **lineárně závislá**.

*Definice:* Množina $M\subseteq V$ se nazývá **generující systém** (systém generátorů) prostoru $V$, pokud  
$$
\mathrm{span}(M) = V.
$$  
To znamená, že každý vektor $v\in V$ lze zapsat jako lineární kombinaci vektorů z $M$.

*Definice*: *Báze* $B$ vektorové prostoru $V$ je lineárně nezávislá množina, která $span(B) = V$, tedy generuje $V$.  

*Definice:* Dimenze konečně generovaného vektorového prostoru $V$ je mohutnost kterékoliv z jeho bází. Značí se $dim(V)$.

*Definice:* Nechť $B$ je uspořádaná báze vektorového prostoru $V$ nad $T$. Pak **vektor souřadnic** $v$ vzhledem k bázi $B$ je 
$$
[v]_{B} = (a_{1},a_{2},\dots,a_{n})^T \in T^n \text{, kde } v = \sum_{i=1}^n a_{i}b_{i}.
$$
*Poznámka:*  
- Každá báze je zároveň generujícím systémem, ale ne každý generující systém je nutně lineárně nezávislý.  
- Generující systém bez přebytečných prvků (tj. žádný prvek nelze vyjádřit jako lin. komb. ostatních) je právě báze. 
---
# Steinitzova věta
*Lemma:* (O výměně) Nechť $C$ generuje vektorový prostor $V$ nad $T$. Jestliže pro vektor $v \in V$ existují $c_{1},\dots,c_{n} \in C$ a $a_{1},\dots,a_{n}\in T$ taková, že $v = \sum^n_{i=1}a_{i}c_{i}$, kde $a_{i} \neq 0$ pro nějaké $i$, pak $span((C \setminus \{c_{i}\}) \cup v) = V$.
*Důkaz:* 
$$
v = a_{1}c_{1}+\dots+a_{n}c_{n} \implies c_{i} = \frac{1}{a_{i}}\left( v - \sum_{k\neq i} a_{k} c_{k} \right)
$$
Jakékoli $u \in V$ můžeme zapsat jako lineární kombinaci prvků z $C$, pokud je v kombinaci $c_{i}$, tak za něj jen dosadíme výraz výše a máme tedy $u$ jako kombinaci $(C \setminus \{c_{i}\}) \cup v$.

*Věta:* (Steinitzova) Nechť $B$ je konečná lineárně nezávislá množina ve vektorovém prostoru $V$ a $C$ generuje $V$. Pak existuje $D$ taková, že 
1. $span(D) = V$
2. $B \subseteq D$
3. $|D| = |C|$
4. $D\setminus B \subseteq C$
*Důkaz:* Použijeme Lemma o výměně pro $b$ a $D' = \{ d_{1}, \dots,d_{n} \}$. Protože $B$ je lineárně nezávislá, je $a_{i} \neq 0$ pro nějaké $d_{i} \in D' \setminus B.$ Potom $D = (D' \setminus \{  d_{i} \}) \cup b$ splňuje všechny 4 vlastnosti.

---
# Vektorové podprostory

- **Řádkový podprostor** matice $A\in T^{m\times n}$ je span řádků $A$ v $T^n$.  
- **Sloupcový podprostor** je span sloupců $A$ v $T^m$.  
- **Jádro (kernel)** je  
$$
  \ker(A) = \{\,x\in T^n \mid A\,x = 0\}.
$$

*Definice:* **Hodnost** matice $A$ je  
$$
\mathrm{rank}(A)
=\dim\bigl(\mathrm{RowSpace}(A)\bigr)
=\dim\bigl(\mathrm{ColSpace}(A)\bigr).
$$  
Platí dimenze jádra:  
$$
\dim(\ker A) = n - \mathrm{rank}(A).
$$
*Důkaz:* Nechť $\dim(\ker(A))=k$. Vyberme bázi $\{v_1,\dots,v_k\}$ prostoru $\ker(A).$ Doplňme ji na bázi celého prostoru $\mathbb{R}^n$ přidáním vektorů $\{v_{k+1},\dots,v_n\}$.  

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
