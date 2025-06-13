*Definice:* Metrický prostor je $(X, d)$, kde $X$ je množina a $d: X \times X \to \mathbb{R}$ funkce pro kterou platí
1. $\forall x,y \in X: d(x,y) >0, \quad d(x,y) = 0 \iff x=y$,
2. $\forall x,y\in X: d(x,y) = d(y,x)$,
3. $\forall x,y,z \in X: d(x,z) \leq d(x,y) + d(y,z)$.
*Příklady:* Eukleidovský metrický prostor $\mathbb{E}_{n}$ je $(\mathbb{R}, d)$, kde $d$ je definované
$$
d((x_{1},\dots,x_{n}), (y_{1},\dots,y_{n})) = \sqrt{ \sum_{i=1}^d (x_{i} - y_{i})^2}.
$$
*Definice:* Podprostor $(Y,\hat{d})$ prostoru $(X,d)$ je $Y \subseteq X$ a $\forall x,y \in Y: \hat d(x,y) = d(x,y)$.

*Definice:* Posloupnost $(x_{n})_{n}$ v metrickém prostoru $(X,d)$ **konverguje** k $x$ právě tehdy, když
$$
\forall \epsilon > 0, \exists n_{0} \in \mathbb{N}, \forall n\in \mathbb{N}, n \geq n_{0}: d(x_{n},x) < \epsilon.
$$
---
# Otevřené a uzavřené množiny
*Definice:* Nechť $(X,d)$ je metrický prostor, $x \in X$, pak okolí je množina
$$
B(x,\epsilon) = \{ y \in X \mid d(x,y) < \epsilon \}.
$$
Takovému okolí se říká otevřená koule s poloměrem $\epsilon$ okolo $x$. 

*Definice:* Množina $U$ je otevřená pokud je okolím každého svého bodu. 
Třeba $(0,1)$ je otevřená množina v prostoru $(\mathbb{R},||)$.

*Definice:* Množina $V$ je uzavřená, pokud $\forall(x_{n})_{n} \subseteq V$ je konvergentní v $X$ a $\lim_{ n } x_{n} \in V$. 

*Definice:* Mějme metrický prostor $(X,d)$ a množinu $A \subseteq X, x \in X$, pak vzdálenost bodu $x$ od množiny $A$ je 
$$
d(x,A) = \inf \{ d(x,a) \mid a \in A \}.
$$
*Definice:* Uzávěrem množiny $A$ je $\overline{A} = \{ x \mid d(x,A) = 0 \}$.

*Věta:* Mějme $A\subseteq \mathbb{R}$, taková $A$ je uzavřená $\iff$ $A^c$ (komplement k $A$ v $X$) je otevřená.

---
# Spojitost funkce
*Definice:* Zobrazení $f: (X,d) \to (Y,d')$  je **spojité**, pokud 
$$
\forall x,y \in X, \forall \epsilon >0, \exists\delta>0: d(x,y) < \delta \Rightarrow d'(f(x), f(y)) < \epsilon.
$$
**Rovnocenné charakterizace spojitosti**:
- Pomocí **konvergence posloupností**:  
    $f$ je spojitá právě když platí:  
$$
    x_n \to x \Rightarrow f(x_n) \to f(x)
$$
- Pomocí **otevřených množin**:  
    $f$ je spojitá právě tehdy, když **vzor každé otevřené množiny** je otevřená množina.
- Pomocí **uzavřených množin**:  
    Vzor uzavřené množiny je uzavřený.
---
# Kompaktnost
*Definice:* Metrický prostor $(X, d)$ je kompaktní, pokud každá posloupnost v něm obsahuje konvergentní podposloupnost.

*Věta:*  Podprostor kompaktního prostoru je kompaktní právě když je uzavřený.

*Definice:* Množina $A \subseteq X$ v metrickém prostoru $(X,d)$ je omezená, pokud existuje číslo $0< M$ a bod $x_{0} \in X$, že 
$$
\forall x \in A: d(x,x_{0})<M.
$$
*Tvrzení*: Každý kompaktní prostor je omezený.

Věta: Podprostor euklidovského prostoru $\mathbb{E}_n$ je kompaktní právě když je uzavřený a omezený.

*Tvrzení*: Buď $f : (X, d) \to (Y, d' )$ spojité zobrazení a buď $A \subseteq X$ kompaktní. Potom je $f[A]$ kompaktní.

*Tvrzení*: Buď $(X, d)$ kompaktní. Potom každá spojitá funkce $f : (X, d) \to R$ nabývá maxima i minima (t.j. nejsou nekonečné).

**Příklad:** Mějme funkci $f(x, y) = x^2 + y$ definovanou na množině
$$
D = \{ (x, y) \in \mathbb{R}^2 \mid x^2 + y^2 \leq 1 \}.
$$
Množina $D \subseteq \mathbb{R}^2$ je **kompaktní**, protože je uzavřená a omezená.
Funkce $f$ je spojitá jako součet spojitých funkcí. Podle věty o spojitém zobrazení na kompaktním prostoru tedy $f$ nabývá minima i maxima.

**Hledání extrémů:**
Spočteme gradient:
$$
\nabla f(x, y) = (2x, 1).
$$

Neexistuje bod, kde by byl gradient nulový, protože $\frac{\partial f}{\partial y} = 1 \neq 0$. Uvnitř množiny tedy žádný stacionární bod není.
**Hledáme extrémy na hranici** $x^2 + y^2 = 1$. Použijeme parametrizaci:
$$
x = \cos t,\quad y = \sin t,\quad t \in [0, 2\pi],
$$
pak:
$$
f(\cos t, \sin t) = \cos^2 t + \sin t = 1 - \sin^2 t + \sin t = -\sin^2 t + \sin t + 1.
$$
Označíme $s = \sin t$, pak hledáme extrémy funkce:
$$
g(s) = -s^2 + s + 1,\quad s \in [-1,1].
$$
Parabola má maximum ve vrcholu:
$$
s = \frac{1}{2},\quad g\left(\frac{1}{2}\right) = \frac{5}{4},
$$
krajní hodnoty jsou:
$$
g(-1) = -1,\quad g(1) = 1.
$$
**Závěr:**
$$
\max f(x, y) = \frac{5}{4},\quad \text{např. v bodě } \left(\frac{\sqrt{3}}{2}, \frac{1}{2}\right),
$$
$$
\min f(x, y) = -1,\quad \text{v bodě } (0, -1).
$$
Funkce tedy dosahuje globálního extrému, což je důsledek kompaktnosti definiční množiny.

---
# Stejnoměrná spojitost
*Definice:* Řekneme, že $f:(X,d) \to (Y,d')$ je **stejnoměrně spojité**, je-li
$$
(\forall \epsilon>0)(\exists \delta>0)(\forall x,y\in X): d(x,y)< \delta \Rightarrow d'(f(x),f(y)) < \epsilon.
$$
*Poznámka:* Rozdíl oproti obyčejné spojitosti je v tom, že volba $\delta$ závisí pouze na $\varepsilon$, **ne na konkrétním bodě** $x \in X$. Tedy „funguje stejně dobře všude“. Tedy každá **stejnoměrně spojitá** funkce je spojitá, ale **opačně to obecně neplatí**.

*Příklad:* $f(x) = x^2$ je příkladem spojité, stejnoměrně nespojité funkce.

*Věta:* Je-li $(X, d)$ kompaktní, je každé spojité $f :(X, d) \to (Y, d')$ stejnoměrně spojité. Zejména to platí pro spojité reálné funkce na kompaktních intervalech.