Věta o korektnosti říká, že pokud existuje formální důkaz formule $φ$ z teorie $T$, pak $φ$ platí ve všech modelech $T$, tj.  
$$
T⊢φ \;\Rightarrow\; T\models φ.
$$
Věta o úplnosti ve výrokové logice tvrdí, že každá tautologie (formule platná ve všech ohodnoceních) je formálně dokazatelná, tj.  
$$
⊨φ \;\Rightarrow\; ⊢φ.
$$
Gödelova věta o úplnosti predikátové logiky říká, že pro libovolnou teorii $T$ a uzavřenou formuli (větu) $φ$ platí ekvivalence:
$$
T\models φ \;\Longleftrightarrow\; T⊢_H φ
$$
tj. pokud je $φ$ pravdivá ve všech modelech $T$, existuje formální Hilbertovský důkaz $φ$ z $T$, a naopak.

Věta o kompaktnosti říká, že teorie $T$ má model právě tehdy, když každá její konečná podteorie $T'\subseteq T$ má model, tj.  
$$
T\text{ je splnitelná}
\;\Leftrightarrow\;
\forall\,T'\subseteq T,\;|T'|<\infty:\;T'\text{ je splnitelná}.
$$
Příklad použití kompaktnosti: Nechť $G$ je spočetně nekonečný graf a definujme teorii  
$$
T=\{\,p_u\leftrightarrow\neg p_v \mid \{u,v\}\in E(G)\}
$$  
v jazyce $\{p_v : v\in V(G)\}$. Každá konečná podteorie $T'$ odpovídá konečnému podgrafu $G'$, který je bipartitní, tedy $T'$ má model. Kompaktnost zaručuje, že pak i $T$ má model, a $G$ je bipartitní. 

Důsledky kompaktnosti:  
1. Existence *nestandardních modelů* aritmetiky, tj. modelů obsahujících "nekonečné" elementy.  
2. Löwenheim–Skolemova věta: každá spočetně axiomatizovatelná teorie s nekonečným modelem má model libovolné spočetné kardinály.