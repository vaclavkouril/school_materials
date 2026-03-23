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

---
# Minimalizace $L(C)$
### *Tvrzení:* Mějme bezprefixové kódování $C$, pak platí $H(X)\leq L(C)$
*Důkaz:* 
$$
L(C) - H(X) = \sum_{x} p(x) \ell(x) - \sum_{x} p(x) \log \frac{1}{p(x)}
$$
a protože $\ell(x)= \log \frac{1}{2^{-\ell(x)}}$ tak dostáváme
$$
\log 2^{-y} - y = \sum_{x} p(x) \log \frac{1}{2^x} - \sum_{x} p(x) \log \frac{1}{p(x)} = \sum_{x} p(x) \log \frac{p(x)}{2^{-\ell (x)}}
$$
a pro $c= \sum_{x} 2^{-\ell(x)} \leq 1$ a tedy $c\leq 1$ a $g(x) = 2^{-\ell (x)} \frac{1}{c}$ pomůžeme si
$$
\sum_{x} p(x) \log \frac{p(x)}{2^{-\ell (x)}} = \sum_{x} p(x) \log \frac{p(x)}{c \cdot \frac{1}{c} \cdot 2^{-\ell (x)}} = \sum_{x} p(x) \log \frac{p(x)}{g(x)} + \sum_{x} p(x) \log \frac{1}{c}
$$
a tedy máme
$$
D(p||g) + \log \frac{1}{c}
$$
a oba jsou $\geq 0$ a tedy
$$
L(C) - H(X) \geq 0.
$$

---
# Shannonův kód
Chceme ideální délku a to je $\ell(x)=\log \frac{1}{p(x)} \approx I(X)$, protože $\sum_{x} 2^{-\ell(x)} = \sum_{x} 2^{\log p(x)} = 1$, pak by $L(C)=H(X)$, ale to nejde kvůli omezením na reálná čísla, takže $\left\lceil  \log \frac{1}{p(x)}  \right\rceil$, kde každá délka přiroste maximálně o jedna, takže (platí to pro každý bezprefixový jazyk)
$$
H(X) \leq L(C) \leq H(X)+1.
$$
Nepřesnost o bit může být drahá.
- Mějme $p(x_{1}) = 0,99999, p(x_{2}) = 0,00001$ a $\ell(x_{1}) = 1, \ell(x_{2}) = 17$. Tedy Shannonův kód přiřadí $c(x_{1})=0, c(x_{2})=10^{16}$ a to jde zlepšit na $c'(x_{1})=0, c'(x_{2})=1$.
---
# Huffmanův kód
Seřadíme si pravděpodobnosti $p_{1}\geq p_{2}\geq\ldots\geq p_{n}$, kde vyrábíme strom, tak že vezmeme $p_{n} + p_{n+1} = p'_{{n-1}}$ a to co dostaneme definuje podstrom.

Mějme $x_{1},x_{2},\dots,x_{k} \approx X$ nezávislé a sestrojme pro $k$-tici kód a tedy $H(x_{1},\dots,x_{k})  \leq \mathbb{E}[C(x_{1},\dots,x_{k})]\leq H(x_{1},\dots,x_{k}) +1$ a z nezávislosti $H(x_{1},\dots,x_{k})  = k\cdot H(X)$ a tedy
$$
k \cdot H(X) \leq \mathbb{E}[C(x_{1},\dots,x_{k})]\leq k \cdot H(X) +1.
$$
V průměru jsme zaplatili $\frac{1}{k}$ bitů navíc oproti optimu.

---
# Fanův kód
Mějme nesetřízenou posloupnost $p_{1},\dots,p_{i}|p_{i+1},\dots,p_{n}$ tak aby $min_{i}|(p_{1}+p_{2}+\dots+p_{i} )-(p_{i+1}+\dots+p_{n})|$  a první "polovině" dáme bit $0$ a ostatním $1$ a pak dále konstruujeme strom kódu dávající další bity pro jednotlivé prvky odpovídající jejich pravděpodobnostem.

Takže pokud $X$ je uspořádaná tak ho zachováme $\forall x<y\in X: C(x) <_{LEX} C(y)$.

*Fakt:* $\mathbb{E}[C_{\text{Fanův}}(X)] \leq H(X)+2$.

---
### *(McMillan) Věta:* Mějme jednoznačně dekódovatelný kód $C$ s délkami $\ell(x)$ pak $\sum_{x} 2^{-\ell(x)} \leq 1$.
Tedy můžeme nahradit jednoznačně dekódovaný kód ekvivalentně dlouhým bezprefixovým.

*Důkaz:* Mějme $C^k, k\geq{1}$, pak
$$
\left( \sum 2^{-\ell(x)} \right)^k = \sum_{x_{1}\in C} \sum_{x_{2}\in C} \dots \sum_{x_{k}\in C} \underbrace{2^{-\ell(x_{1})}2^{-\ell(x_{2})}\dots2^{-\ell(x_{k})}}_{} = \sum_{\vec{x} \in C^k} 2^{-\ell(\vec{x})}
$$
Mějme $C(m)=$ počet slov v $C^k$ délky $m$, pak pro $\ell_{\max} = \max_{x\in C} \ell(x)$
$$
\sum_{\vec{x} \in C^k} 2^{-\ell(\vec{x})} = \sum_{m=1}^{k \cdot \ell_{\max}} C(m) \cdot 2^{-m}
$$
a z jednoznačné dekódovatelnosti $C(m)\leq 2^m$ a tedy
$$
\sum_{m=1}^{k \cdot \ell_{\max}} C(m) \cdot 2^{-m} \leq \sum_{m=1}^{k \cdot \ell_{\max}} 1 = k \cdot \ell_{\max}.
$$
Dohromady
$$
\left( \sum_{x \in C} 2^{-\ell(x)} \right)^k \leq k \cdot \ell_{\max}.
$$
a to je ekvivalentní tomu, že 
$$
\sum 2^{-\ell(x)} = (k \cdot \ell_{\max})^{1/k}
$$
a pro $\lim_{ k \to \infty } (k \cdot \ell_{\max})^{1/k} = 1$ a tedy
$$
\sum_{x\in C} 2^{-\ell(x)} \leq 1,
$$
protože jinak by existoval $k_{0}$ od kterého bychom měli spor.

---
# Odhad na délku kódu
### *Věta:* $\forall C:H(X)-2\log H(X) \leq L(C)$
*Idea důkazu:* Z $C$ uděláme bezprefixový jazyk, protože o bezprefixových umíme říct odhad $H(X)\leq L(C)$. Přidáme délku binárního zápisu jako prefix
$$
x \to O^{|x|} 1 |x|x, \quad \ell(x) \to \ell'(x)\leq \ell(x)+ 2\log \ell(x) + 3
$$
$$
\begin{align}
H(X) \leq L(C') &= \sum p(x) \ell'(x)  \\
&\leq \sum p(x)\ell(x) + 2\sum p(x) \log\ell(x) + 3 \sum p(x)
\end{align}
$$
a můžeme aplikovat Jensenovu nerovnost na $\log$
$$
2\sum p(x) \log \ell(x) \leq 2 \log \sum p(x) \ell(x) = 2\log L(C)
$$
a tedy 
$$
H(X)\leq L(C) + 2\log L(C) +3.
$$
a rozborem případů pro $H(X)$ máme
- $H(X)\leq L(C)$, tedy věta platí,
- $H(X)\geq L(C)$, tak jsme se výše dostali k $H(X)\leq L(C)+2\log L(C) +3$, takže i tak věta platí.
---

