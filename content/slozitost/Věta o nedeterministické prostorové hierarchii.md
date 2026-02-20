## *Translační lemma:* Pro funkce $S_{1}(n),S_{2}(n)\geq n, f(n)\geq n$, kde $f$ je prostorově konstruovatelná funkce, splňující $NSPACE(S_{1}(n)) \subseteq NSPACE(S_{2}(n))$ pak platí $NSPACE(S_{1}(f(n))) \subseteq NSPACE(S_{2}(f(n)))$.
*Důkaz:* Mějme libovolný jazyk $L_{1} \in NSPACE(S_{1}(f(n)))$, pro který tedy existuje NTS $M_{1}$, který ho rozhoduje. Definujme si, pro $\$$, který nebyl v pracovní abecedě $M_{1}$
$$
L_{2} = \{ x\$^i \mid M_{1}(x)\text{ přijme v prostoru } S_{1}(|x|+i) \text{, pro }i \geq f(|x|) \}.
$$
Tedy vlastně
$$
\forall i:|x|+i \geq f(|x|)\text{ platí, že } x\$^i \in L_{2} \iff x \in L_{1},
$$
specificky to platí pro $i=f(|x|)-|x|$.

Máme $L_{2}\in NSPACE(S_{1}(n))$, protože $\$$ umíme v prostoru $O(n)$ oddělit, a z předpokladu $NSPACE(S_{1}(n)) \subseteq NSPACE(S_{2}(n))$ tak plyne $L_{2}\in NSPACE(S_{2}(n))$. Tedy máme i NTS $M_{2}$ s $L(M_{2}) = L_{2}$ rozhodující v prostoru $S_{2}(n)$.

Dostáváme ale i NTS $M_{3}$ rozhodujícího jazyk $L_{1}$ v prostoru $S_{2}(n)$ a pořídíme si $M_{4}$ pomocí tohoto $M_{3}$, který budeme simulovat na vstupu $x\$^i$, pro $i = f(|x|)-|x|$. Pracovat bude na 2 páskách a jedné vstupní:
1. vstupní páska obsahuje $x$ (standardní vstup pro $M_{3}$),
2. pracovní páska si spočte $f(|x|)-|x|$ a má tolik $\$$ vyplněných v buňkách,
3. pracovní páska velikosti $S_{2}(f(|x|))$ simulující $M_{3}$.

Vzhledem k tomu, že $M_{3}$ rozhoduje v prostoru $S_{2}(n)$, tak $M_{4}$ rozhoduje v prostoru $S_{2}(n)=S_{2}(|x|+i)=S_{2}(|x| + f(|x|) -|x|)=S_{2}(f(|x|))$, tedy 
$$
x\in L(M_{4}) \iff x\$^i \in L(M_{3})=L_{2} \iff x \in L_{1}.
$$

# *Věta o nedeterministické prostorové hierarchii pro polynomy:* Pro každá $k,l\in \mathbb{N},k<l$ platí $NSPACE(n^k)\subsetneqq NSPACE(n^l)$.
*Důkaz:* 