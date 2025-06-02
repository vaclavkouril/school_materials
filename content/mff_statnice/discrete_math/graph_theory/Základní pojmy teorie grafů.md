*Definice:* Graf $G$ je dvojice $(V,E)$, kde $V$ je množina vrcholů a $E \subseteq \binom{V}{2}$ je množina hran.
- $E(G)$ je značení množiny hran grafu $G$
- $V(G)$ je značení množiny vrcholů grafu $G$
Zajímavé typy grafů:
- úplný $K_{n} = \left(\{ 1,2,\dots,n, \binom{V}{2} \}\right)$
- úplný bipartitní $K_{m,n}$:
	- $V(K_{m,n}) = \{ a_{1},a_{2},\dots,a_{m},b_{1},b_{2},\dots,b_{n} \}$
	- $E(K_{m,n}) = \{ \{ i,j \} \ | \ i \in \{a_{1},a_{2},\dots,a_{m}\}, j \in \{b_{1},b_{2},\dots,b_{n}\} \}$
	- bipartitní graf je takový, který je podgrafem úplného bipartitního.
- cesta $P_{n} = \{ \{ 1,2,\dots,n \}, \{ \{ i,i+1 \}\ | \ 0 \le i < n \} \}$
- cyklus $C_{n} = \{ \{ 1,2,\dots,n \}, \{ \{ i,(i+1) \text{ mod }n \}\ | \ 0 \le i < n \} \}$

*Definice:* Grafy $G$ a $H$ jsou izomorfní $G \cong H \iff f: V(G) \to V(H)$ bijekce taková, že $\forall u,v \in V(G)$ platí $\{ u,v \} \in E(G) \iff \{ f(u),f(v) \} \in E(H)$.

*Definice:* Graf $H$ je **podgrafem** grafu $G$ platí-li $V(H) \subseteq V(G) \land E(H) \subseteq E(G) \cap\binom{V(H)}{2}$.

*Definice:* Graf $H$ je **indukovaným** podgrafem grafu $G$ platí-li $V(H) \subseteq V(G) \land E(H) = E(G) \cap\binom{V(H)}{2}$.

*Definice:* Okolí vrcholu $v \in V(G)$ v grafu $G$ značíme $N(v) = \{ u \ | \ \{ u,v \} \in E(G) \}$.
*Definice:* Stupeň vrcholu $v$ v grafu $G$ se rozumí přirozené číslo $k = \deg(v) = |N(v)|$.

*Definice:* Doplněk grafu $G$ je graf $\overline{G}$, pro který platí $V(G) = V(\overline{G})$ a $(\forall u,v\in V(\overline{G}), u \neq v) (\{ u,v \} \in E(\overline{G}) \iff\{ u,v \} \not\in E(G) )$.

*Definice:* **Orientovaný graf** $G$ je dvojice $(V(G),E(G))$, kde $V(G)$ je množina vrcholů a $E(G)$ je množina uspořádaných dvojic vrcholů a pro $(u,v)\in E(G)$ říkáme, že hrana vede z $u$ do $v$.
# Souvislost grafů
*Definice:* Graf $G$ je **souvislý**, právě tehdy když $\forall u,v \in V(G)$ existuje cesta z $u$ do $v$.
Můžeme takto definovat relaci $\sim$ dosažitelnosti na vrcholech grafu $G$, která je ekvivalencí pro neorientované grafy. Tranzitivita se jen musí ošetřit, abychom měli jen cesty a ne sledy.

*Definice:* Komponenty souvislosti grafu $G$ jsou $V_{1}, V_{2}, \dots,V_{m} \subseteq V(G)$, definované ekvivalenčními třídami na $V(G)$ promocí $\sim$.

Alternativně můžeme říci, **komponenta souvislosti grafu** je _maximální_ souvislý podgraf, tj. v tomto podgrafu najdeme cestu z vrcholu $a$ do vrcholu $b$ pro jakékoliv vrcholy $a , b$ v podgrafu.

Jsou to všechny indukované podgrafy na jednotlivých třídách ekvivalence souvislosti. Je to souvislý podgraf, který není obsažen v žádném větším souvislém podgrafu. Souvislý graf má právě jednu komponentu.

Pro orientované grafy definujeme dvě souvislosti:
1. Silně souvislá komponenta je takový maximální podgraf orientovaného grafu, v němž pro každou dvojici vrcholů $u, v$ existuje sled.
2. Slabě souvislá komponenta je takový maximální podgraf orientovaného grafu, v němž pro každou dvojici vrcholů $u, v$ existuje sled alespoň v jednom směru.
## Vzdálenost v grafu
*Definice:* **Vzdálenost** dvou vrcholů grafu $G$ je funkce $d: V(G) \times V(G) \to \mathbb{N}$, která je definována $\forall u,v \in V(G): d(u,v)=$ nejkratší cesta z $u$ do $v$.