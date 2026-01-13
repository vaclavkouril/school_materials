# Pseudonáhodné generátory
*Definice:* $G: \{ 0,1 \}^n \to \{ 0,1 \}^{\ell(n)}$ je pseudonáhodný generátor pokud
- $G$ je vyčíslitelná deterministickým polynomiálním algoritmem
- $\ell(n)>n$ pro každé $n\in \mathbb{N}$
- Pro každý polynomiální algoritmus $A$ platí, a zanedbatelnou $\epsilon(n)$ (existuje $n_{k}, že všechna $n$ platí $\epsilon(n) < \frac{1}{n^k}$$) že
$$
\left| \Pr_{y \in \{ 0,1 \}^{\ell(n)}} [A(y) = 1] - \Pr_{y \in \{ 0,1 \}^n} [A(G(y)) = 1]  \right| \leq \epsilon(n)
$$

*Věta:* Pokud $P=NP$ pak neexistuje PRG. 

*Důkaz:* Sporem nechť existuje PRG $G$ definujme obraz $G$ jako 
$$
I_{G} = \{ y \in \{ 0,1 \}^{\ell(n)} \mid (\exists s \in \{ 0,1 \}^n)[G(s) = y]\}
$$
$I_{G}$ patří do $P=NP$, takže uvažme poly algoritmus $A$ 
$$
A(y)= \iff y \in I_{G}.
$$
pak
$$
\left| \Pr_{y \in \{ 0,1 \}^{\ell(n)}} [A(y) = 1] - \Pr_{y \in \{ 0,1 \}^n} [A(G(y)) = 1]  \right| = |2^{n -\ell(n)} -1| \geq \frac{1}{2}
$$
a to jednoznačně není zanedbatelné.

Pro PRG chceme vysokou složitost v průměrném případě. 

---
# Jednosměrné funkce
*Definice:* $f:\{ 0,1 \}^* \to \{ 0,1 \}^*$ je jednosměrná (OWF) pokud je snadno (poly) vyčíslitelná a těžko invertovatelná, pro každého $A$ který je v pravděpodobnostní polynomiálním čase existuje zanedbatelná funkce $\epsilon(n)$ taková, že pro každé $n \in \mathbb{N}$
$$
\Pr_{x \in \{ 0,1 \}^*} [A(f(x)) \in f^{-1}(f(x)))] \leq \epsilon(n).
$$
*Věta:* PRG existují $\iff$ existují OWF.

---
# Bit commitment
Alice lockne bit $b \in \{ 0,1 \}$ a nechce ho sdělit Bobovi a Bob chce commit schovaný. Mějme PRG $G$ s $\ell (n)= 3n$, pak může Bob poslat náhodný $r$ řetězec $3n$-bitů Alice vygeneruje náhodný $n$-bitový řetězec $y$ a zaváže se k bitu $b$. A Alice pošle $c$
$$
c = \begin{cases}
G(y) &b=1 \\
G(y) \oplus r &b=0
\end{cases}
$$
během odhalení pošle Alice $y$ a Bob určí jaké bylo $b$