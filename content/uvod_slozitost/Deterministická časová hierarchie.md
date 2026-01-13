*Definice:* Funkci $f: \mathbb{N} \to \mathbb{N}$, kde $f (n)= \Omega(n \log n)$ nazveme časově konstruovatelnou, je-li funkce, která zobrazuje $1^n$ na binární reprezentaci $f(n)$ vyčíslitelná v čase $O(f(n))$.

*Věta:* (o deterministické časové hierarchii) Pro každou funkci $f: \mathbb{N} \to \mathbb{N}; f(n) = \Omega(n \log n)$ časově vyčíslitelnou a existuje jazyk $A$, který je rozhodnutelný v čase $O(f(n))$, nikoli však v čase $o(f(n)/\log f(n))$.

*Důkaz:* Předpokládáme, že všechny TS mají jednu pásku a je třeba simulovat $M$ s časem $g(n) = o(f(n)/\log f(n))$ na stroji $N$ v čase $O(f(n))$.

Definujme $N$ se vstupem $x$, tak aby přijímal jazyk $A = L(N)$ následovně
1. $n \leftarrow |x|$
2. Z čas. konstruovatelnosti $f(n)$ vypočtěme $f(n)$
3. Inicializujme binární čítač hodnotou $f(n) / \lceil \log f(n) \rceil$
4. Snížíme hodnotu čítače při provádění **6.-8.**
5. Když čítač dosáhne 0 tak odmítneme
6. Když $x$ není tvaru $\langle M\rangle10^*$ tak odmítneme
7. Simulujeme $M(x)$
8. Když $M$ přijme tak odmítneme jinak přijmeme

Faktor $\lceil \log f(n) \rceil$ je potřeba, protože na jeden krok nás stojí odečtení přesně $\log f(n)$ kroků. 

Potřebujeme simulaci jen s konstantní $c_{M}$ zpožděním a tedy je nutné mít kód $\langle M\rangle$ a stav stroje $M$ blízko hlavy $N$, tedy budeme mít dvě zarovnané stopy a sice:
1. páska $M$, každý znak kódovaný v $b = \lceil \log|\Sigma| \rceil$ bitech
2. aktuální stav $q$ a přechodová funkce $\langle M \rangle$

Tak aby to bylo vždy zarovnané s hlavou $M$ s po simulaci $1$ kroku bude možná muset být stopa 2 posunuta.

Pak simulace zabere $c_{M}$ kroku, protože nalezení instrukce je v $|\langle M \rangle|^2$ čase, posunutí $|\langle M \rangle|^2$ a to je pro fixní TS $M$ konstantní. Tedy pokud $M$ pracuje v čase $g(n)$ pak se dá simulovat v $O(g(n))$.

Nyní je třeba omezit čítač, tak aby byl vždy poblíž $N$ hlavy a má $O(\log f(n))$ bitů a vzhledem k počtu bitů se dá lineárně odečítat. Tedy potřebujeme 3. stopu a po každém kroku je stopa posunuta. 

A tedy je simulace $M$ ukončena nejpozději po provedení $\lceil \log f(n)  \rceil$ kroků skončí, čítači se sníží hodnota a je případně posunut v každém kroku simulace, a tedy $O(\log f(n))$ kroků stačí ke snížení a to samé k posunutí. dohromady tedy celkový čas je
$$
O\left( \frac{f(n)}{\log f(n)} \cdot \log(f(n)) \right) = O(f(n)).
$$
Tedy i $A$ lze rozhodnou v čase $O(f(n))$. 

Pro spor předpokládejme $M$ rozhodující $A$, tedy $L(M) = A$ v čase $o(f(n) / \log f(n))$, k jeho simulaci pomocí $N$ je potřeba $c_{M} g(n)$ kroků s $c_{M}$ záležícím na pevném $M$. Z toho, že $g(n) = o(f(n)/\log f(n))$ tak 
$$
(\exists n_{0} \in \mathbb{N})(\forall n \geq n_{0})\left[ c_{0}g(n) \leq \frac{f(n)}{\log f(n)} \right].
$$
Mějme $x = \langle M \rangle 1 0^{n_{0}}$, a tedy $|x| \geq n_{0}$, pak $N$ simuluje $M$ po $f(n)/\log f(n)$ kroků a simulace $M$ s $x$ skončí a $x \in L(N) \iff x \not\in L(M)$ a tedy spor.

---
# Důsledky
$f_{1},f_{2}: \mathbb{N} \to \mathbb{N}$ časově konstruovatelné funkce a $f_{1} (n) = o(f_{2} (n)/ \log f_{2} (n))$, pak
$$
TIME(f_{1}(n)) \subsetneq TIME(f_{2}(n))
$$
Pro každá dvě $\epsilon_{1},\epsilon_{2}\in \mathbb{R}, 0\leq \epsilon_{1} < \epsilon_{2}$ platí
$$
TIME(n^{\epsilon_{1}}) \subsetneq TIME(n^{\epsilon_{2}})
$$
$$
P \subsetneq EXPTIME,
$$
protože
$$
P \subseteq TIME(2^n) \subsetneq TIME(2^{n^2}) \subseteq EXPTIME.
$$