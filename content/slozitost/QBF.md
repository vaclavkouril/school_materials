# Kvantifikované formule
*Definice:* QBF je definována rekurzivně
1. $x$ je bool proměnná, pak je to **atomická QBF** a $x$ je ve formuli volná,
2. Mějme $E_{1},E_{2}$ QBF, tak $\neg(E_{1}),(E_{1}) \land (E_{2}), (E_{1})\lor (E_{2})$ jsou QBF a vázanost se nezměnila,
3. $E$ je QBF, pak $\exists x(E)$ a $\forall x(E)$ jsou QBF a všechny kvatifikované proměnné v $E$ se mění na **vázané**.

QBF bez volných proměnných nabývá $T/ F$ a to kvantifikaci chápeme $\exists x(E)$ jako $E_{0} \lor E_{1}$ (kde dolní index určuje dosazení za $x$) a $\forall x (E)$ jako $E_{0} \land E_{1}$.

$QBF \in PSPACE$, protože lze vyhodnotit rekurzivně, hloubka rekurze je $O(n)$, pak stačí na každém patře rekurze držet jen data o velikosti $O(n)$ a tedy průchod stojí $O(n^2)$ prostoru

##### $QBF$ je $PSPACE$-těžký
Nechť $L\in PSPACE$, pak máme DTS $M$, že $L=L(M)$ a pracuje na $x$ v $S(|x|)$ s $S$ pevným polynomem. $M$ na vstupu $x$ má nejvýše $2^{c \cdot S(|x|)}$ konfigurací a označme $c \cdot S(|x|) = K(|x|)$ a každá konfigurace je zakódovatelná binárně řetězcem délky $O(K(|x|))$.
- Chceme aby $x\in L \iff \exists$ cesta v grafu konfigurací z $q_{init}\to q_{acc}$. 
- Chceme kódovat $\exists$cesta do QBF.
- Pro kódování chceme zjistit, zda existuje cesta délky $\leq 2^i$ mezi konfiguracemi

Zjevně $\exists \varphi_{0}$ CNF velikosti $O(K(n))$, které po dosazení dvou zakódovaných konfigurací $c_{1},c_{2}$ je splněna pokud z $c_{1}$ lze jedním krokem $M$ přejít do $c_2$ (konstrukce z důkazu [Cookova-Levinovy věty](Cookova-Levinova%20věta.md)) a nesplněná jinak.

Mějme $\varphi_{i}(C,C')= \exists C'', \forall D_{1},D_{2}((D_{1} = C \land D_{2}=C'') \lor(D_{1} = C'' \lor D_{2}=C'))\implies \varphi_{i-1}(D_{1},D_{2})$, pak $\varphi_{K(n)}(q_{init},q_{acc}) = 1 \iff x\in L$ a prostor pro $|\varphi_{i}|=O(K(n)+|\varphi_{i-1}|)$ a tedy $|\varphi_{K(n)}|\in O(K(n)^2)$.
- trik s univerzálními kvantifikátory platí, protože nezdvojnásobuje počet $i-1$ klauzulí jako by to dělal Savičovský trik, ale místo toho se udělá jedna dosaditelná formule
- jedna formule se vyhodnotí dvakrát vs. dvě formule každá vyhodnocena jednou