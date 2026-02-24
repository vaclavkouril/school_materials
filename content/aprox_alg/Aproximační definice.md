# Aproximační algoritmus
Optimalizačním problémem se rozumí vlastně problém, který má
- vstupy $I$ určitého formátu jako prvky množiny instancí $\mathcal{I}$,
- množinu možných řešení, tedy nějaké zobrazení, ze všech možných vstupů $\mathcal{F}(\mathcal{I})$,
- objective function $f(I,S)$, pro $S \in \mathcal{F}(\mathcal{I})$ určující hodnotu na základě vstupu a výsledného možného řešení,
- $\min/\max$ výběr pro objective function.

*Definice:* $\alpha$-aproximační algoritmus $A$ pro optimalizační problém je spočitatelný v polynomiálním čase pro všechny instance a vydávající řešení, jehož hodnota je jen o faktor $\alpha$ vzdálená od optima:
$$
A(I) \leq \alpha \cdot OPT(I) \text{ pro }\min
$$
$$
A(I) \geq \alpha \cdot OPT(I) \text{ pro } \max
$$

---
# PTAS, FPTAS
*Definice:* Polynomial time aproximation scheme (PTAS) je rodina algoritmů $\{ A_{\epsilon} \}$, kde $\forall \epsilon >0$ je takové, že $A_{\epsilon}$ je $(1+\epsilon)$-aproximační algoritmus (pro minimalizační problémy) nebo $(1-\epsilon)$-aproximační algoritmus pro maximalizační problémy.

*Definice:* Fully polynomial time aproximation scheme (FPTAS) je aproximační schéma takové, že jeho čas běhu je omezem polynomem v $1 / \epsilon$.