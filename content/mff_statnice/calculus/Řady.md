*Definice:* Nekonečná řada je výraz  
$$
\sum_{n=1}^\infty a_n = a_1 + a_2 + a_3 + \cdots
$$
kde $(a_n)$ je posloupnost reálných čísel. Její $n$-tý částečný součet  
$$
s_n = \sum_{k=1}^n a_k
$$
a vlastní součet řady je  
$$
\lim_{n\to\infty} s_n
$$
pokud tato limita existuje.

*Definice:* Řada je **konvergentní**, pokud $(s_n)$ konverguje k vlastní limitě, a **divergentní**, jestliže limita neexistuje nebo je nevlastní. 

---

*Příklad:* **Geometrická řada** s kvocientem $q$ je  
$$
\sum_{n=0}^\infty q^n = 1 + q + q^2 + q^3 + \cdots.
$$
Pro $q \neq 1$ je její $n$-tý částečný součet  
$$
s_n = 1 + q + q^2 + \cdots + q^{n-1}
= \frac{q^n - 1}{q - 1},
$$
a tedy  
$$
\lim_{n\to\infty} s_n =
\begin{cases}
\frac{1}{1 - q}, & |q| < 1,\\
+\infty, & q > 1,\\
\text{neexistuje}, & q \le -1.
\end{cases}
$$
*Příklad:* **Harmonická řada** je  
$$
\sum_{n=1}^\infty \frac{1}{n}
= 1 + \frac{1}{2} + \frac{1}{3} + \frac{1}{4} + \cdots.
$$
Podle integrálního kritéria konvergence konverguje  
$$
\sum_{n=1}^\infty \frac{1}{n^s}
$$  
právě pro $s > 1$ a diverguje pro $s \le 1$. V případě $s = 1$ (harmonická řada) tedy řada diverguje, i když její členy $\frac{1}{n}$ konvergují k nule. 
