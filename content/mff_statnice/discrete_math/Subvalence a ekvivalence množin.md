*Definice:* Srovnání mohutnosti u množin $x,y$ 
- mají-li stejnou mohutnost tak píšeme $x \approx y$, jestliže existuje prosté zobrazení z množiny $x$ na $y$.
- má-li množina $x$ mohutnost menší nebo rovnou $y$, píšeme $x \preccurlyeq y$, jestliže existuje prosté zobrazení z $x$ do $y$. 
- je-li $x \preccurlyeq y$ a jestliže neexistuje prosté zobrazení množiny $x$ na $y$, píšeme $x \prec y$ a o $x$ říkáme, že má menší mohutnost než $y$. 
$\approx$ je vlastně ekvivalence na univerzální třídě.

*Věta:* (Cantor-Bernsteinova věta) Je-li mohutnost $x$ menší rovna mohutnosti $y$ a naopak, tak mají stejnou mohutnost.
$$
(x \preccurlyeq y \land y \preccurlyeq x) \to x \approx y
$$

# Počítání množin
*Definice:* Množina $x$ je **konečná**, píšeme $\text{Fin}(x)$, jestliže každá neprázdná podmnožina $y \subseteq \mathscr{P}(x)$ má [maximální](mff_statnice/discrete_math/Množiny a zobrazení#Částečná uspořádání) prvek vůči inkluzi.

*Definice:* Množina $w$ je induktivní platí-li 
$$
\emptyset \in w \land (\forall v \in w)(v \cup \{ v \} \in w).
$$
## Množina přirozených čísel
*Definice:* Množinu všech přirozených čísel značíme $\omega$ a definujeme ji vztahem
$$
\omega = \bigcap \{ w: w \text{ je induktivní}\}.
$$
Prvky zveme **přirozená čísla**. Jako pozorování můžeme uvést, že je $\omega$ vlastně podmnožinou všech *induktivních* množin a tedy je i nejmenší z nich.

Pro každé přirozené číslo máme značení následníka jako $s(n) = n \cup \{ n \}$. Takové zobrazení je $s: \omega \to \omega$. 

## (ne)Spočetné množiny
*Definice:* O množině řekneme, že je
- **spočetná** má-li stejnou mohutnost jako $\omega$.
- **nejvýše spočetná** je-li konečná nebo spočetná.
- **nespočetná** není-li nejvýše spočetná.

*Věta:* Jsou-li $A,B$ spočetné množiny, potom $A \cup B$ i $A \times B$ jsou spočetné množiny.
*Důkaz:* Nechť $f$ je prosté zobrazení $A$ na $\omega$ a $g$ je prosté zobrazení $b$ na $\omega$. Položíme
$$
h(x) = \left\{ \begin{array}{rcl}
\langle f(x), 0 \rangle & \mbox{pro}
& x \in A  \\
\langle g(x), 1 \rangle & \mbox{pro} & x \in B \setminus A 
\end{array}\right.
$$
a máme $h$ jako prosté zobrazení $h:A \cup B \to \omega \times \{ 0,1 \}$. Ta je tedy spočetná díky existenci prostého zobrazení $\omega \times \{ 0,1 \} \to \omega$. 
Pro libovolné $a \in A, b \in B$ položíme 
$$
k(\langle a,b\rangle) = \langle f(a), g(b) \rangle,
$$
potom $k$ je prosté zobrazení $A \times B$ na spočetnou množinu $\omega \times \omega$. 