*Definice:* Mějme náhodnou proměnnou $X$, která popisuje nějaké výstupy $X$ a kódování je $C:X\to \{ 0,1 \}^*$ pro kterou platí $\forall x,y:C(x)\neq C(y)$.
- Mějme $\ell(C(x)) = |C(x)|$, pak $L(C) = \mathbb{E}[C(X)] = \sum_{x \in supp(X)}p(x)\ell(C(x))$ a chceme kódování takové, aby $L(C)$ bylo co nejmenší.
- $\forall C: L(C)\geq H(X)$, $\exists C: L(C)\leq H(X)+1$.
- $C^*(x_{1},\dots,x_k) = C(x_{1}) \circ \dots\circ C(x_{k})$.
## Jednoznačné kódování
*Definice:* Kód je jednoznačný, pokud $C^*$ nemá kolizi (je to prosté zobrazení), tedy neexistuje $x_{1},\dots,x_{k},y_{1},\dots,y_{l}: C^(x_{1},\dots,x_{k}) = C^*(y_{1},\dots,y_{l})$.

*Definice:* Kód je bezprefixový, když $\forall x,y,x\neq y: C(x)$ není prefixem $C(y)$.

#### *Tvrzení:* Bezprefixový kód $C$ $\implies$ $C$ je jednoznačný.
*Důkaz:* Vezmeme-li libovolné $C^*$ tak hladově hledáme kódová slova a vzhledem k tomu, že žádné není prefixem jiného tak vždy když najde kódové slovo tak ohlásíme jaké to je hledáme další, tedy je to zjevně jednoznačné.

### *Věta:* Nechť $C$ je prefixový kód s kódovými slovy délek $\ell_{1},\ell_{2},\dots$, pak $\sum_{i} 2^{-\ell_{i}} \leq 1$.
*Důkaz:* 