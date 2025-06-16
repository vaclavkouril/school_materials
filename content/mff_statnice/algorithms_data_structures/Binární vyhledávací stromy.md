*Definice:* O [stromu](Stromy) řekneme, že je **binární**, pokud je zakořeněný a každý vrchol má nejvýše dva syny, u nichž rozlišujeme, který je levý a který pravý.

Značení:
1. $T(v)$ - podstrom obsahující vrchol $v$ jako kořen a všechny jeho potomky
2. $l(v), r(v)$ - jsou levý a pravý syn vrcholu $v$
3. $L(v), R(v)$ - jsou $T(l(v))$ a $T(r(v))$
4. $h(v)$ - hloubka stromu $T(v)$, tedy nejdelší z cest z $v$ do listů
Nemá-li vrchol syna tak funkce $l(v)$, či $r(v)$, podle toho jaký chybí je $\emptyset$ a hloubka $h(\emptyset) = -1.$

*Definice:* Binární vyhledávací strom (BVS) je binární strom, jehož každému vrcholu $v$ přiřadíme unikátní klíč $k(v)$ z univerza. Přitom musí platit
1. $a\in L(v) \implies k(a)<k(v)$
2. $b\in R(v) \implies k(b)>k(v)$

Na takových stromech můžeme definovat několik operací
$$
\begin{align}
&\text{BvsShow - výpis BVS} \\
&\text{Vstup: Kořen BVS }v \\
&\text{1. Pokud } v = \emptyset \text{ pak skončíme} \\
&\text{2. BvsShow}(L(v)) \\
&\text{3. Vypíšeme } k(v) \\
&\text{4. BvsShow}(R(v)) 
\end{align}
$$
$$
\begin{align}
&\text{BvsFind - hledání klíče v BVS} \\
&\text{Vstup: Kořen BVS }v \text{, hledaný klíč }x \\
&\text{Výstup: Vrchol }v \text{ s klíčem }x \text{, nebo }\emptyset\\
&\text{1. Pokud } v = \emptyset \text{ vrátíme }\emptyset \text{.} \\
&\text{2. Pokud }x = k(v) \text{, vrátíme }v \text{.} \\
&\text{3. Pokud }x < k(v) \text{, vrátíme BvsFind}(L(v)) \text{.} \\
&\text{4. Pokud }x > k(v) \text{, vrátíme BvsFind}(R(v)) \text{.} \\
\end{align}
$$
$$
\begin{align}
&\text{BvsMin - hledání minima} \\
&\text{Vstup: Kořen BVS }v \\
&\text{Výstup: Vrchol }v \text{ s nejmenším klíčem }x \\
&\text{1. Pokud } l(v) = \emptyset \text{ vrátíme }v \text{.} \\
&\text{2. Jinak}\text{ vrátíme BvsMin}(l(v)) \text{.} \\
\end{align}
$$
$$
\begin{align}
&\text{BvsInsert - vkládání do BVS} \\
&\text{Vstup: Kořen BVS }v \text{, vkládaný klíč }x \\
&\text{Výstup: Nový kořen }v \\
&\text{1. Pokud } v = \emptyset \text{ vytvoříme nový vrchol }v \text{ s klíčem }x \text{ a skončíme.} \\
&\text{2. Pokud }x = k(v) \text{ klíč již ve stromu je a není nic potřeba} \text{.} \\
&\text{3. Pokud }x < k(v) \text{, položíme }l(v) \leftarrow \text{BvsInsert}(l(v),x) \text{.} \\
&\text{4. Pokud }x > k(v) \text{, položíme }r(v) \leftarrow \text{BvsInsert}(r(v),x) \text{.} \\
\end{align}
$$
Mazání má problém v tom že mažeme-li ne-list, tak mohou nastat dvě situace, vrchol má jednoho syna a tedy jen náš mazaný $v$ nahradíme jeho synem. Pokud mazaný vrchol má oba syny, tak určíme nejlevější vrchol pravého podstromu jako další v řadě, ten vystřihneme a nahradí náš vrchol $v$ a sám měl maximálně jednoho syna a tedy jen ho přepojíme.
$$
\begin{align}
&\text{BvsDelete} \\
&\text{Vstup: Kořen BVS }v \text{, mazaný klíč }x \\
&\text{Výstup: Nový kořen }v \\
&\text{1. Pokud } v = \emptyset \text{ tak $x$ ve stromu nebyl a vrátíme }\emptyset \text{.} \\
&\text{2.  Pokud }x < k(v) \text{, položíme }l(v) \leftarrow \text{BvsDelete}(l(v),x) \text{.} \\
&\text{3.  Pokud }x > k(v) \text{, položíme }r(v) \leftarrow \text{BvsDelete}(r(v),x) \text{.} \\
&\text{4.  Pokud }x = k(v): \\
&\text{5.  }\quad \text{Pokud } l(v)=r(v) = \emptyset \text{ vrátíme } \emptyset \text{.}\\
&\text{6.  }\quad \text{Pokud } l(v)= \emptyset \text{ vrátíme } r(v)\text{.} \\
&\text{7.  }\quad \text{Pokud } r(v)= \emptyset \text{ vrátíme } l(v)\text{.} \\
&\text{8.  }\quad s \leftarrow \text{BvsMin}(r(v)) \\
&\text{9.  }\quad k(v) \leftarrow k(s) \\
&\text{10. }\quad r(v) \leftarrow \text{BvsDelete}(r(v),s) \\
&\text{11. }\quad \text{Vrátíme } v \text{.}
\end{align}

$$

---
# AVL stromy
*Definice:* Binární vyhledávací strom je hloubkově vyvážený pokud pro každý jeho vrchol $v$ platí
$$
|h(l(v)) - h(r(v))| \leq 1.
$$
Stromy splňující tuto podmínku jsou zvané **AVL** stromy.

*Tvrzení:* AVL strom na $n$ vrcholech má hloubku $\Theta(\log n)$.