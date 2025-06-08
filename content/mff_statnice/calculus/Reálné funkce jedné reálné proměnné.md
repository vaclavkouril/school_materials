*Definice:* Řekneme, že funkce $f$ má v bodě $a\in\mathbb{R}^*$ limitu $A\in\mathbb{R}^*$, pokud  
$$
\forall\varepsilon>0\;\exists\delta>0:\;x\in P(a,\delta)\;\Rightarrow\;f(x)\in U(A,\varepsilon).
$$
Zapisujeme  
$$
\lim_{x\to a}f(x)=A.
$$
## Spojitost funkce
*Definice:* Funkce $f$ je v bodě $a\in\mathbb{R}$ spojitá, pokud  
$$
\lim_{x\to a}f(x) = f(a).
$$

*Definice:* Funkce $f$ je v bodě $a$  
- **spojitá zprava**, pokud  
$$
\lim_{x\to a^+}f(x) = f(a),
$$  
- **spojitá zleva**, pokud  
$$
\lim_{x\to a^-}f(x) = f(a).
$$
Zjevně je $f$ v bodě $a$ spojitá právě tehdy, když je spojitá zleva i zprava.

*Definice:* Funkce $f\colon I\to\mathbb{R}$ je **spojitá na intervalu** $I$ právě tehdy, je-li spojitá v každém vnitřním bodě a v krajních bodech jednostranně spojitá.

## Okolí a prstencová okolí bodu

*Definice:* Pro bod $a\in\mathbb{R}$ a $\delta>0$ je $\delta$-okolí bodu $a$ definováno jako  
$$
U(a,\delta) \;=\; (a-\delta,\;a+\delta)
\;=\;\{\,x\in\mathbb{R}\mid |x-a|<\delta\}.
$$

*Definice:* Prstencové okolí bodu $a$ (tj. okolí bez samotného bodu) je  
$$
P(a,\delta) \;=\; U(a,\delta)\setminus\{a\}.
$$

*Definice:* Pravé a levé okolí bodu $a$ a jejich prstencové verze:  
$$
U^+(a,\delta) = [a,a+\delta),\quad U^-(a,\delta) = (a-\delta,a],
$$
$$
P^+(a,\delta) = U^+(a,\delta)\setminus\{a\},\quad P^-(a,\delta) = U^-(a,\delta)\setminus\{a\}.
$$

*Definice:* Pro „okolí“ nekonečna používáme analogii:  
$$
U(+\infty,\delta) = \bigl(\tfrac1\delta,\infty\bigr),\quad 
U(-\infty,\delta) = \bigl(-\infty,-\tfrac1\delta\bigr),
$$
a prstencová okolí nekonečen jsou stejná jako jejich obyčejná okolí. 

---
# Jednoznačnost limity funkce
*Věta:* (Jednoznačnost limity funkce) Funkce může mít v daném bodě nejvýše jednu limitu.  
*Důkaz:* Nechť by existovaly dvě různé limity $A\neq B$. Zvolme $\varepsilon>0$ tak malé, že $U(A,\varepsilon)\cap U(B,\varepsilon)=\emptyset$. Musely by existovat $\delta_1,\delta_2>0$ s  
$$
x\in P(a,\delta_1)\;\Rightarrow\;f(x)\in U(A,\varepsilon),\quad
x\in P(a,\delta_2)\;\Rightarrow\;f(x)\in U(B,\varepsilon).
$$  
Pro $\delta=\min(\delta_1,\delta_2)$ by pak existovalo $x\in P(a,\delta)$ s $f(x)\in U(A,\varepsilon)\cap U(B,\varepsilon)$, což je spor.

---
# Aritmetika limit funkcí
*Věta (Heineho definice limity funkce):* Nechť funkce $f$ je definovaná na prstencovém okolí  
$$
P(a,\delta) = (a-\delta,a+\delta)\setminus\{a\}
$$
bodu $a$ pro nějaké $\delta>0$. Následující dvě tvrzení jsou ekvivalentní:
1.  
$$
\lim_{x\to a}f(x)=A.
$$
2. Pro každou posloupnost $(x_n)\subset P(a,\delta)$ takovou, že $x_n\neq a$ pro všechna $n\in\mathbb{N}$ a  
$$
\lim_{n\to\infty}x_n = a,
$$
platí  
$$
\lim_{n\to\infty}f(x_n)=A.
$$

*Věta:* (Aritmetika limit funkcí) Nechť  
$$
\lim_{x\to a}f(x)=A\in\mathbb{R}^*,\quad \lim_{x\to a}g(x)=B\in\mathbb{R}^*.
$$
Pak  
1. $\lim_{x\to a}(f(x)+g(x))=A+B$, je-li součet definován.  
2. $\lim_{x\to a}(f(x)\,g(x))=A\,B$, je-li součin definován.  
3. Jestliže $g(x)\neq0$ v nějakém prstencovém okolí $a$, pak $\lim_{x\to a}\frac{f(x)}{g(x)}=\frac{A}{B}$.  
*Důkaz:* Použije se Heineova definice limity a aritmetika limit posloupností: např. pro (1) vezmeme libovolnou posloupnost $x_n\to a$, aplikujeme aritmetiku limit posloupností a pak Heineovu větu obráceně. 

---
# Limity funkcí a uspořádání
*Věta:* (Limity funkcí a uspořádání) Nechť  
$$
\lim_{x\to c}f(x)=A,\quad \lim_{x\to c}g(x)=B.
$$  
1. Pokud $A>B$, existuje $\delta>0$ takové, že $f(x)>g(x)$ pro všechna $x\in P(c,\delta)$.  
2. Pokud $f(x)\ge g(x)$ pro všechna $x\in P(c,\delta)$, pak $A\ge B$.  
3. Je-li navíc funkce $h$ taková, že $f(x)\le h(x)\le g(x)$ pro všechna $x\in P(c,\delta)$ a $A=B$, potom $\lim_{x\to c}h(x)=A$.  
*Důkaz:* Bod 1: zvolme $\varepsilon>0$ takové, že vzdálená okolí $U(A,\varepsilon)$ a $U(B,\varepsilon)$ jsou disjunktní a přímou aplikací definice limity najdeme $\delta$ s požadovanou nerovností. Body 2 a 3 se pak dokazují obdobně nebo odvozují od věty o dvou policajtech.

---
# Limita složené funkce
*Věta:* (Limita složené funkce) Nechť  
$$
\lim_{x\to A}g(x)=B,\quad \lim_{y\to B}f(y)=C,
$$  
a buď $f$ spojitá v $B$, nebo $g(x)\neq B$ v nějakém prstencovém okolí $A$. Pak  
$$
\lim_{x\to A}f(g(x))=C.
$$  
*Důkaz:* Standardní $\varepsilon$–$\delta$ argument s dvěma kroky (nejprve $\delta_1$ pro $f$, pak $\delta_2$ pro $g$), použití continuity condition (P1) nebo výběru prstencového okolí (P2).

--- 
# Mezihodnotová vlastnost
*Věta:* (Darbouxova – mezihodnotová vlastnost) Nechť $f\colon[a,b]\to\mathbb{R}$ je spojitá, označme  
$$
m=\min\{f(a),f(b)\},\quad M=\max\{f(a),f(b)\}.
$$
Pak pro každé $y\in[m,M]$ existuje $\alpha\in[a,b]$ takové, že $f(\alpha)=y$. 

*Důkaz:* Uvažme množinu $A=\{x\in[a,b]:f(x)<y\}$, nechte $\alpha=\sup A$ a použijte jednostrannou spojitost na krajích, aby se vyvrátily obě možnosti $f(\alpha)\neq y$.

---
# Princip maxima pro spojité funkce
*Věta:* (Princip maxima pro spojité funkce) Nechť $f\colon[a,b]\to\mathbb{R}$ je spojitá. Pak existují $\xi,\eta\in[a,b]$ takové, že  
$$
f(\xi)=\min_{x\in[a,b]}f(x),\quad f(\eta)=\max_{x\in[a,b]}f(x).
$$  
*Důkaz:* Položme $\alpha=\sup f([a,b])$. Z kompaktu $[a,b]$ a $(f(x_n))\to\alpha$ vybereme konvergentní podposloupnost $x_{n_k}\to\xi\in[a,b]$. Podle spojitosti $f(\xi)=\alpha$, tedy maximum je dosaženo; o minimu se argumentuje analogicky.
