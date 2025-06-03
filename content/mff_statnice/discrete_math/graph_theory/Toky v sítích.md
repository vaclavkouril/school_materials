*Definice:* **Síť** je $(G,z,s,c)$, kde $G$ je orientovaný graf, $z,s \in V(G)$ a $c: E(G) \to \mathbb{R}_{\ge 0}$ je kapacitní funkce.

*Definice:* **Tok** je $f: E(G) \to \mathbb{R}_{\geq 0}$ kde platí
1. $\forall e \in E(G): 0 \le f(e) \le c(e)$
2. $\forall v \in V(G), v \not\in \{ z,s \}: \sum_{x \in V(G)} f((x,v)) = \sum_{y \in V(G)} f((v,y))$
Velikostí toku rozumíme $w(f) = \sum_{x \in V(G)} f((z,x)) - f((x,z))$.

*Věta:* Existuje maximální tok.

## Princip hledání maximálního toku v síti (celočíselné kapacity)

Mějme síť $(G,z,s,c)$ a chceme najít **maximální možný tok** $f$ ze $z$ do $s$, tj. přiřadit každé hraně $e$ hodnotu $f(e) \in [0, c(e)]$ tak, aby platilo:
- **Omezení kapacity:**  
    $\forall e \in E: 0 \leq f(e) \leq c(e)$
- **Zachování toku (mimo $s$ a $t$):**  
    $\forall v \in V \setminus {s, t}: \sum_{e \in \delta^-(v)} f(e) = \sum_{e \in \delta^+(v)} f(e)$
Kde $\delta^-(v)$ jsou hrany vstupující do $v$ a $\delta^+(v)$ jsou hrany vystupující z $v$.

---
## Ford–Fulkersonův algoritmus:

1. **Inicializuj** tok $f(e) := 0$ pro všechny $e \in E$.
2. Opakuj:
    - Najdi **posilující cestu** (augmenting path) z $z$ do $s$ v tzv. **reziduální síti**:
        - Hrany, po kterých lze „posílit“ tok, mají **reziduální kapacitu** $c_{\text{res}}(e) = c(e) - f(e)$.
        - Přidáme i „zpětné hrany“ s kapacitou $f(e)$ pro případné „vrácení toku“.
    - Pokud taková cesta existuje, **zvětši tok** podél této cesty o minimální reziduální kapacitu.
3. Pokud žádná posilující cesta **neexistuje**, skonči – tok je maximální.

Vlastnosti:
- Pokud jsou všechny kapacity **celočíselné**, pak:
    - Algoritmus skončí v konečně mnoha krocích.
    - Každý tok bude celočíselný.
- Maximální tok odpovídá kapacitě minimálního **řezu** mezi $z$ a $s$ (věta o max toku a min řezu).