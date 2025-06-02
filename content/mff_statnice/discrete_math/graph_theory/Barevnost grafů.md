*Definice:* Obarvení grafu $G$ pomocí $k$ barev je funkce $C: V(G) \to \{ 1,2,\dots,k \}$, že $\forall u,v \in V(G): \{ u,v \} \in E(G) \implies C(u) \neq C(V)$.
*Definice:* Barevnost grafu $\chi(G)$ je nejmenší $k$, že pro něj existuje obarvení grafu $G$.

*Pozorování:* $\chi(K_{k}) = k$, protože každý jeden vrchol má svou barvu a pak každému sousedovi musí přiřadit unikátní barvu tedy $1 + k-1$. 

*Definice:* Klikovost grafu $\omega(G)$ je maximální $k$ takové že $G$ obsahuje $K_{k}$ jako podgraf.

*Pozorování:* Pro každý graf platí $\chi(G) \geq \omega(G)$, protože minimálně na tu největší kliku musíme dát $\omega(G)$ barev.