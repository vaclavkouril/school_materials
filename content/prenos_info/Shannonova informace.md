## Pravděpodobnostní základ
*Definice:*
- Pravděpodobnostní prostor $\Omega$ je množina elementárních jevů.
- Pravděpodobnostní funkce $p: \Omega \to [0,1]$ je funkce splňující
	- $\forall \omega \in \Omega: p(\omega)\geq {0}$,
	- $\sum_{\omega \in \Omega} p(\omega)=1$.
- $X: \Omega \to R$ je diskrétní náhodná veličina (proměnná) ($R$ prostor čísel, třeba $\mathbb{R}, \{ 0,1 \}^n$) a $\Pr[X=x]=p(x) = \Pr(\{ \omega \in \Omega \mid X(\omega) x \})$.
- Jev $S \subseteq R$ je $[x\in S] = \{ \omega \in \Omega \mid X(\omega) \in S \}$.
- Jevy $S,S' \subseteq R$ jsou nezávislé, když $[x \in S]$ a $[y \in S']$ jsou nezávislé, tedy
$$
\Pr[S=x \mid S'=y] = \Pr[S=x].
$$
#### Markovova nerovnost
*Věta:* Pro $X \geq 0$ náhodnou proměnnou a $\forall k\in \mathbb{R}^+$ platí
$$
\Pr[X \geq k \cdot \mathbb{E}(X) ] \leq \frac{1}{k}.
$$
# Definice Informace
*Definice:* Pro událost (jev) $A \subseteq \Omega$ definujeme funkci $I: \Omega \to \mathbb{R}^+_{0}$ určující objem **informace** takovou aby splňovala
1. $I(A)$ klesá s rostoucí pravděpodobnost pro jev $A$,
2. Pro nezávislé $A,B$ události platí $I(A \,\&\,B) = I(A) + I(B)$, tedy při $\Pr[A \cap B] = \Pr[A] \cdot \Pr[B]$,
3. $\forall A: I(A)\geq 0$,
4. $I$ spojitá, diferencovatelná a všeobecně hezká funkce.

Dohromady dostáváme kandidáta na funkci $I(A) = -\log_{b}p(A)$, pro $b>1; b:=2$.