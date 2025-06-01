*Věta:* **Inkluze a exkluze** Nechť $A_{1}, A_{2}, \dots, A_{n}$ jsou konečné [množiny](mff_statnice/discrete_math/Množiny a zobrazení#Množiny). Potom
$$
\left| \bigcup^n_{i=1} A_{i} \right| = \sum^n_{k=1}(-1)^{k+1} \sum_{I \in \binom{\{ 1,2,\dots,n \}}{k}}\left|\bigcap_{{i\in I}} A_{i}\right|
$$
také lze zapsat jako 
$$
\left| \bigcup^n_{i=1} A_{i} \right| = \sum_{\emptyset \neq I \subseteq \{ 1,2,\dots,n \}} (-1)^{|I|+1} |\bigcap_{i \in I}A_{i}|
$$
*Důkaz:* Hlavní otázka je kolikrát započteme prvek $x \in \bigcup_{i=0}^n A_{i}$ na pravé straně rovnosti.
Nechť $k =$ počet $A_{i}$ ve kterých se vyskytuje $x$. Vezmeme-li postupně $j = |I|$ jedno po druhém, tak $j> k$ máme příspěvek $x$ nulový, ale pro $j \leq k$ máme $\binom k j$ $j$-tic obsahujících $x$ a celkem tedy přispějí $(-1)^{j+1} \binom{k}{j}$. 
*Pozorování:* Dle [binomické věty](mff_statnice/discrete_math/Kombinační čísla#Binomická věta) máme $$(1-1)^k = \sum_{i=0}^k \binom k i (-1)^{i} =1 + \sum_{i=1}^k \binom k i (-1)^{i} = 1 -1 = 0.$$
Sečtením přes všechna $j$ máme 
$$
\sum_{i=1}^k \binom k i (-1)^{i+1} = (-1) \sum_{i=0}^k \binom k i (-1)^{i}
$$
kde aplikujeme pozorování o $\sum_{i=0}^k \binom k i (-1)^{i} = -1$ a tedy
$$
-1 \cdot \sum_{i=0}^k \binom k i (-1)^{i} = (-1) \cdot (-1) = 1.
$$