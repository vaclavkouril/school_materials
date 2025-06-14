*Definice:* Reálná funkce $n$ proměnných je
$$
f: D \to \mathbb{R}, D \subseteq \mathbb{E}_{n}.
$$
*Definice:* Pro $f(x_{1},\dots,x_{n})$ vezmeme 
$$
\phi_{k}(t) = f(x_{1},\dots,x_{k-1},t,x_{k+1},\dots,x_{n})
$$
jako funkci kde je $x_{k}$ proměnná a zbytek je zafixovaný jako konstanty. Pak standartní derivace 
$$
\phi'_{k}(t) = \lim_{ h \to 0 }  \frac{\phi_{k}(t+h) - \phi_{k}(t)}{h}
$$
je **parciální derivací** funkce $f$ v proměnné $x_{k}$ a značíme $\frac{\partial f(x_{1},\dots,x_{n})}{\partial x_{k}}$.

Výpočet probíhá stejně jako ve [funkci o jedné proměnné](Derivace), kde se k ostatním zafixovaným parametrům chováme jako ke konstantám. 

Příklad (2D):*
$$
f(x, y) = x^2y + \sin(xy)
$$

$$
\frac{\partial f}{\partial x} = 2xy + y\cos(xy), \quad \frac{\partial f}{\partial y} = x^2 + x\cos(xy)
$$
Příklad (3D):*

$$
f(x, y, z) = xyz + e^{xz} \sin(y)
$$

$$
\frac{\partial f}{\partial x} = yz + ze^{xz}\sin(y),\quad \frac{\partial f}{\partial y} = xz + e^{xz}\cos(y),\quad \frac{\partial f}{\partial z} = xy + xe^{xz}\sin(y)
$$

---
# Totální diferenciál
Pro $x \in \mathbb{E}_n$ definujeme $||x|| = \max_i |x_i |$. $h$ bude $n$-tice blízká nule. $\nabla f(x_{1},\dots,x_{k})$ zveme gradientem funkce $f$ a je to vektor jejích parciálních derivací.
*Definice:* Funkce $f$ má v bodě $a$ **totální diferenciál**, existuje-li funkce $\mu$ spojitá v okolí $U$ bodu $o \in \mathbb{R}^n$ taková, že $\mu(o) = 0$ a čísla $A_{1},A_{2},\dots,A_{n}$ pro která 
$$
f(a + h) - f(a) = \sum^n_{k=1} A_{k}h_{k} + ||h||\mu(h).
$$
S pomocí [skalárního součinu](linear_algebra/Skalární%20součin) to můžeme zapsat jako 
$$
f(a+h) - f(a) = Ah + ||h||\mu(h).
$$

*Věta:* Pokud má $f$ **spojité parciální derivace** v okolí bodu $a$, pak má v bodě totální diferenciál.
_Důsledek:_ Totální diferenciál implikuje spojitost a existenci všech parciálních derivací.
*Tvrzení:* Nechť má funkce $f$ totální diferenciál v bodě $a$. Potom platí: 
1. $f$ je spojitá v $a$,
2. f má všechny parciální derivace v $a$, a to s hodnotami $\frac{\partial f(a)}{\partial xk} = A_k$.
Příklad:*
$$
f(x, y, z) = x^2 + y^2z + z^3
$$
$$
df = 2x\,dx + y^2\,dz + 2yz\,dy + 3z^2\,dz = 2x\,dx + 2yz\,dy + (y^2 + 3z^2)\,dz
$$
---
# Hessova matice a extrémy
*Definice:* Nechť $f : \mathbb{R}^n \to \mathbb{R}$ má druhé parciální derivace v bodě $x$, pak **Hessova** matice je definována
$$
(H_{f}(x))_{i,j} = \frac{\partial^2 f}{\partial x_{i}\partial x_{j}} (x).
$$
*Použití:* Pro klasifikaci **stacionárního bodu** funkce podle vlastností kvadratické formy:
- pozitivně definitní $\implies$ lokální minimum,
- negativně definitní $\implies$ lokální maximum,
- jinak $\implies$ sedlový bod.


*Příklad:*
$$
f(x, y, z) = x^2 + y^2 + z^2 - 2xy - 2yz
$$

Stacionární bod: $\nabla f = (2x - 2y, 2y - 2x - 2z, 2z - 2y) = 0 \Rightarrow x = y = z$
$$
H_f = \begin{bmatrix} 2 & -2 & 0 \\ -2 & 2 & -2 \\ 0 & -2 & 2 \end{bmatrix}
$$
- $\det(H_1) = 2$
- $\det(H_2) = \begin{vmatrix} 2 & -2 \\ -2 & 2 \end{vmatrix} = 4 - 4 = 0$
- $\det(H_f) = 2(2 \cdot 2 - (-2)^2) - (-2)(-2 \cdot 2) = 2(4 - 4) - 4 = -4$

---
# Výpočet extrémů pomocí parciálních derivací
Definice: Bod $a$ je stacionární bod funkce $f$, pokud:
$$
\nabla f(a) = \vec{0}
$$
Postup hledání extrému funkce :
1. Spočteme $\nabla f$ a najdeme stacionární body.
2. Spočteme Hessovu matici.
3. Určíme charakter stacionárních bodů pomocí pozitivní/negativní definitnosti.

**Příklad (3D):**
$$
f(x, y, z) = x^2 + y^2 + z^2 - xy - yz - xz
$$
Stacionární body řešíme z rovnic:
$$
\nabla f = (2x - y - z, 2y - x - z, 2z - x - y) = 0
$$
$\Rightarrow x = y = z$

--- 
# Existence extrémů pro spojité funkce
_Věta:_ Nechť $f: D\to \mathbb{R}$ je spojitá a $D \subseteq \mathbb{R}^n$ je **kompaktní**. Pak nabývá maxima i minima na $D$.
_Postup:_
1. Hledáme stacionární body ve vnitřku $D$.
2. Prozkoumáme chování na hranici (např. parametrizací).
3. Porovnáme hodnoty ve všech kandidátech.
**Příklad:**
$$
f(x, y, z) = x + y + z,\quad D = \{ (x, y, z) \in \mathbb{R}^3 \mid x^2 + y^2 + z^2 \leq 1 \}
$$

---
# Lagrangeovy multiplikátory
*Situace:* Mějme za úkol hledat extrémy funkce $f(x_{1},\dots,x_{n})$ za podmínky
$$
g_{1}(x) = 0,\dots, g_{k}(x) = 0
$$
*Věta:* Nechť funkce $f,g_{1},\dots,g_{n}$ mají spojité parciální derivace a gradienty $\nabla g_{1}, \dots,\nabla g_k$ jsou v bodě $x$ lineárně nezávislé. Pak existují čísla (Lagrangeovy multiplikátory) $\lambda_{1}, \dots,\lambda_{k}$, že:
$$
\nabla f(x) =  \lambda_{1}\nabla g_{1}+ \dots+ \lambda_{k}\nabla g_k
$$
s podmínkami $g_{i}(x) =0$.
Postup řešení:
1. Zapsat $\nabla f = \sum \lambda_{i} \nabla g_{i}$
2. Spočteme derivace a sestavíme rovnici
3. Vyrobíme soustavu rovnic přidáním podmínek $g_{i}(x) =0$
4. Vyřešíme soustavu $x_{i}, \lambda_{i}$

**Příklad (2D):** Maximalizujte $f(x, y) = xy$ za podmínky $x^2 + y^2 = 1$
$$
g(x, y) = x^2 + y^2 - 1 \Rightarrow \nabla f = (y, x), \nabla g = (2x, 2y)
$$
$$
y = 2\lambda x,\quad x = 2\lambda y,\quad x^2 + y^2 = 1
$$
$\Rightarrow \max = 1/2, \min = -1/2$
**Příklad (3D):** Minimalizujte $f(x, y, z) = x^2 + y^2 + z^2$ za podmínky $x + y + z = 1$
$$
\nabla f = (2x, 2y, 2z),\quad \nabla g = (1, 1, 1)
$$
$$
2x = \lambda,\quad 2y = \lambda,\quad 2z = \lambda \Rightarrow x = y = z = 1/3
$$