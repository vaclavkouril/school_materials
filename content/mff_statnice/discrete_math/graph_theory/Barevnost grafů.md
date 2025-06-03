*Definice:* Obarvení grafu $G$ pomocí $k$ barev je funkce $C: V(G) \to \{ 1,2,\dots,k \}$, že $\forall u,v \in V(G): \{ u,v \} \in E(G) \implies C(u) \neq C(V)$.
*Definice:* Barevnost grafu $\chi(G)$ je nejmenší $k$, že pro něj existuje obarvení grafu $G$.

*Pozorování:* $\chi(K_{k}) = k$, protože každý jeden vrchol má svou barvu a pak každému sousedovi musí přiřadit unikátní barvu tedy $1 + k-1$. 

*Definice:* Klikovost grafu $\omega(G)$ je maximální $k$ takové že $G$ obsahuje $K_{k}$ jako podgraf.

*Pozorování:* Pro každý graf platí $\chi(G) \geq \omega(G)$, protože minimálně na tu největší kliku musíme dát $\omega(G)$ barev.

---
# Hranová barevnost
*Definice:* Hranové obarvení grafu $G$ je $b: E(G) \to \{ 1,2,\dots,k \}$ pro $k \in \mathbb{N}$ taková, aby platilo 
$$
\forall e,f \in E(G), e \neq f: e \cap f \neq \emptyset \implies b(e) \neq b(f).
$$
*Definice:* **Hranová barevnost** grafu $G$ je $\chi'(G) =$ nejmenší takové $k$, aby pro něj existovalo barevné obarvení.

Nechť $\Delta (G)$ je označení nejvyššího ze stupňů grafu $G$.

*Věta:* (Vizing) Pro každý graf $G$ platí, že $\Delta(G) \leq \chi'(G) \leq \Delta(G) +1$