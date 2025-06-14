---

# Riemannův integrál jedno- i vícerozměrný

---
*Definice:* Nechť $f: [a,b] \to \mathbb{R}$ je omezená. Zvolíme rozklad intervalu:

$$
P = \{x_0 = a < x_1 < \dots < x_n = b\}
$$

Pro každý interval $[x_{i-1}, x_i]$ definujeme:

- dolní součet: $s(f,P) = \sum_{i=1}^n m_i \Delta x_i$, kde $m_i = \inf_{x \in [x_{i-1},x_i]} f(x)$
- horní součet: $S(f,P) = \sum_{i=1}^n M_i \Delta x_i$, kde $M_i = \sup_{x \in [x_{i-1},x_i]} f(x)$

*Poznámka:* 
$$
\Delta x_i = x_i - x_{i-1} \text{ je délka $i$-tého podintervalu.}
$$
*Definice:* Funkce $f$ je **Riemannovsky integrovatelná**, pokud existuje:

$$
\int_a^b f(x)\,dx := \lim_{\|P\| \to 0} \sum_{i=1}^n f(c_i)\Delta x_i
$$
kde $c_i \in [x_{i-1},x_i]$ a limita existuje.

*Poznámka:* Pokud se dolní a horní součet sbíhají ke stejné hodnotě, říkáme, že $f$ je Riemannovsky integrovatelná.

*Věta:* Každá spojitá (nebo monotonní) funkce na uzavřeném intervalu je Riemannovsky integrovatelná.

---
# Vícerozměrný Riemannův integrál

*Definice:* Mějme funkci $f: R \to \mathbb{R}$, kde $R = [a_1, b_1] \times \dots \times [a_n, b_n]$ je kvádr v $\mathbb{R}^n$.
Rozdělme každý interval $[a_k,b_k]$ na podintervaly, dostaneme rozklad kvádru $P$ na podkvádry.

- $M_i =$ suprema $f$ na $i$-tém podkvádru
- $m_i =$ infima $f$ na $i$-tém podkvádru
- $\Delta V_i =$ objem $i$-tého podkvádru

*Horní součet:* $S(f,P) = \sum_i M_i \Delta V_i$ \
*Dolní součet:* $s(f,P) = \sum_i m_i \Delta V_i$

*Definice:* Funkce $f$ je **Riemannovsky integrovatelná** na $R$, pokud:

$$
\sup_P s(f,P) = \inf_P S(f,P) = \int_R f(x)\,dx
$$

kde supremum/dolní součet a infimum/horní součet se berou přes všechny rozklady $P$.

---
# Vlastnosti a pravidla
- Linearita: $\int_R (af + bg) = a\int_R f + b\int_R g$
- Monotonicita: $f \leq g \Rightarrow \int_R f \leq \int_R g$
- Pokud $f$ spojitá na $R$, pak je integrovatelná
- Aditivita podle oblastí: pokud $R = A \cup B$ a $A \cap B$ má nulový objem, pak:

$$
\int_R f = \int_A f + \int_B f
$$

---

# Více iterovaný integrál (Fubiniho věta)

*Věta (Fubini):* Pokud $f$ je spojitá na kvádru $R = [a,b]\times[c,d]$, pak platí:

$$
\int_R f(x,y)\,dxdy = \int_a^b \left(\int_c^d f(x,y)\,dy \right) dx = \int_c^d \left(\int_a^b f(x,y)\,dx \right) dy
$$

*Poznámka:* Podmínky lze zobecnit na omezené funkce s nulovou množinou nespojitosti.
*Příklad:*
$$
f(x, y) = x + y \,\text{ na } R = [0,1]\times[0,2]
$$
$$
\int_0^1 \int_0^2 (x + y)\,dy dx = \int_0^1 \left[xy + \frac{1}{2}y^2\right]_{y=0}^{2} dx = \int_0^1 (2x + 2) dx = [x^2 + 2x]_0^1 = 3
$$

---
# Obecné oblasti v rovině a prostoru
*Definice:* Oblast $D \subset \mathbb{R}^2$ je **normální vzhledem k ose $x$**, pokud existují spojité funkce $\alpha(x), \beta(x)$ tak, že:
$$
D = \{ (x,y) \in \mathbb{R}^2 \mid x \in [a,b], y \in [\alpha(x), \beta(x)] \}
$$
Pak:

$$
\int_D f(x,y) dxdy = \int_a^b \left( \int_{\alpha(x)}^{\beta(x)} f(x,y) dy \right) dx
$$
*Poznámka:* Podobně pro oblast normální vzhledem k ose $y$.

---
## Příklady integrace
**Příklad 2D:**
$$
f(x, y) = x^2 + y^2,
$$
na oblasti mezi parabolami $y = x^2$ a $y = \sqrt{x}$ na $x \in [0,1]$:

$$
\int_0^1 \int_{x^2}^{\sqrt{x}} (x^2 + y^2)\,dy dx
$$
**Příklad 3D:**
$$
f(x,y,z) = x + y + z,
$$
na oblasti $[0,1] \times [0,1] \times [0,1]$:
$$
\int_0^1 \int_0^1 \int_0^1 (x + y + z)\,dz dy dx = \int_0^1 \int_0^1 \left[ xz + yz + \frac{1}{2}z^2 \right]_0^1 dy dx = \int_0^1 \int_0^1 (x + y + 1/2) dy dx
$$

$$
= \int_0^1 \left[ xy + \frac{1}{2}y^2 + \frac{1}{2}y \right]_0^1 dx = \int_0^1 (x + 1/2 + 1/2) dx = \int_0^1 (x + 1) dx = [\frac{1}{2}x^2 + x]_0^1 = 1.5
$$
