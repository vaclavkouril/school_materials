# Definice
*Definice:* Mějme TS $T$ a funkci $f: \mathbb{N} \to \mathbb{N}$ definovaná pro každý vstup, řekneme, že 
- $M$ **pracuje v čase** $f(n)$, pokud výpočet nad libovolným vstupem $x$ délky $n$ skončí po provedení nejvýše $f(n)$ kroků.
- $M$ **pracuje v prostoru** $f(n)$, pokud výpočet nad libovolným vstupem $x$ délky $n$ skončí a využije nejvýše $f(n)$ buněk pásky.

*Definice:* Nechť $f: \mathbb{N}\to \mathbb{N}$ je funkce, pak definujeme třídy:
- $TIME(f(n))$ jazyky přijímané TS, které pracují v čase $O(f(n))$,
- $SPACE(f(n))$ jazyky přijímané TS, které pracují v prostoru $O(f(n))$.

---
# $TIME(f(n))\subseteq SPACE(f(n))$
*Důkaz:*




---
# Věta o vztahu prostoru a času
*Věta:*
$$
(\forall L \in NSPACE(f(n)))(\exists c_{L}[L\in TIME(2^{c_{L}f(n)}) ])
$$
*Důkaz:*