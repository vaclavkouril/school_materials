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

*Věta:* **Princip indukce pro přirozená čísla.** Je-li $X$ množina přirozených čísel pro kterou platí
1. $\emptyset \in X$
2. $x \in X \to s(x) \in X$
potom $\omega = X$.

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

*Věta:* (Cantor) $x \prec \mathscr{P}(x)$
*Důkaz:* Zřejmě zobrazení, které $t \in x$ přiřadí jednoprvkovou množinu $\{ t \}$, je prosté a zobrazuje $x$ do $\mathscr{P}(x)$. Tedy $x \preccurlyeq \mathscr{P}(a)$.
Teď nalezneme (**diagonální**) spor s $x \approx \mathscr{P}(a)$ a tedy pak platí $x \prec \mathscr{P}(x)$.
Předpokládejme $f$ je prosté zobrazení množiny $x$ na $\mathscr{P}(x)$ a definujeme množinu $y \subseteq x$ pomocí
$$
y = \{ t: t\in x \land t \notin f(t) \}
$$
Kdyby platilo $f(v) = y$ pro nějaké $v \in x$, potom buď $v \in y$, nebo $v \notin y$. Obojí je ale v rozporu s definicí množiny $y$. Snadno se ověří, že z $v \in y$ vyplývá $v \not\in y=f(v)$. Obdobně z $v \not\in y =f(v)$ zase plyne $v \in y$. Tedy $f$ není $x$ na $\mathscr{P}(x)$.

*Důsledek:* $\mathscr{P}(\omega)$ je nespočetná množina.

$\mathbb{Q}$ je spočetná, díky zobrazení na $\mathbb{Z} \times \mathbb{N}$ to na $\mathbb{N}\times \mathbb{N}$ a to na $\mathbb{N}$.

# Husté uspořádání
*Definice:* Nechť $<$ je lineární uspořádání na množině $A$. Existuje-li pro libovolné dva prvky $a,b \in A$ takové, že $a<b$, nějaké $c \in A$, pro které platí $a < c<b$, pak $<$ je **husté uspořádání** na množině $A$.

*Věta:*
1. Ke každé nejvýše spočetné lineárně uspořádané množině existuje prosté izomorfní vnoření do množiny $\mathbb{Q}$ uspořádané podle velikosti.
2. Každá spočetná hustě uspořádaná množina, která nemá největší ani nejmenší prvek, je izomorfní s množinou $\mathbb{Q}$.

*Věta:* Nechť $\mathbb{R}$ je množina všech reálných čísel a $\mathbb{I}$ ke uzavřený interval sestávající ze všech reálných čísel na intervalu $0$ až $1$, potom
$$
\mathscr{P}(\omega) \approx \mathbb{I} \approx \mathbb{R},
$$
to znamená nespočetnost množin $\mathbb{I}, \mathbb{R}$.
*Důkaz:* Začneme $\mathbb{I} \approx \mathscr{P}(x)$ a sice tak, že každé nenulové číslo $a$ z $\mathbb{I}$ se dá zapsat ve dvojkové soustavě jediným způsobem ve tvaru $$
a = 0,a_{0}a_{1}a_{2}\dots a_{n}a_{n+1}\dots
$$
kde $0,a_{0}a_{1}a_{2}\dots a_{n}a_{n+1}\dots$ je posloupnost jedniček a nul, kde $0$ je posloupnost nul a $1$ je posloupností jedniček, pak máme $\mathbb{I} \to \prescript{\omega}{}{2}$. Množina $\prescript{\omega}{}{2}$ znamená všechna zobrazení $\omega$ na $2 = \{ 0,1 \}$.
Použijeme trojkovou soustavu k sestrojení prostého zobrazení $\prescript{\omega}{}{2} \to \mathbb{I}$. Každé posloupnosti $0,a_{0}a_{1}a_{2}\dots a_{n}a_{n+1}\dots$  přiřadíme reálné číslo
$$
a = \sum^\infty_{n=0} 2a_{n} \frac{1}{3^{n+1}}.
$$
z $p$-adických rozvojů nám vyplývá, že dvě různá posloupnosti se zobrazí na dvě různá čísla. Z Cantorovy-Bernsteinovy věty tedy máme $\mathscr{P}(\omega) \approx \mathbb{I}$, díky tomu, že $\mathscr{P}(\omega) \approx \prescript{\omega}{}{2}$.
Protože $\mathbb{I} \subseteq \mathbb{R}$ a není komplikované sestrojit prostou funkci zobrazující reálnou přímku na $\mathbb{I}$ máme
$$
\mathbb{R} \preccurlyeq \mathbb{I} \preccurlyeq \mathbb{R}
$$
a ekvivalenci $\mathscr{P}(\omega) \approx \mathbb{R}$ opět dle Cantor-Bernstein věty.