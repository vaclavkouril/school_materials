*Definice:* Mocninná řada je nekonečná řada ve tvaru $a(x) = \sum_{i=0}^{\infty} a_{i}x^i$, kde $\forall i\in \mathbb{N}: a_{i} \in \mathbb{R}$.

Pro $a_{0}=a_{1}=\dots=1 \mapsto 1 + x+ x^2+ \dots$ , kde pro $|x| < 1$ řada konverguje k $\frac{1}{1-x}$, tedy $(1,1,\dots) \approx \frac{1}{1-x}$. Protože:
$$
\begin{align*}
S(x) &= \sum_{i=0}^\infty a_{n} x^n \\
S(x) &=  1 + x+ x^2+ \dots \\
(1-x) \  S(x) &= (1-x)(1 + x+ x^2+ \dots) \\
(1-x) \  S(x) &= (1 + x+ x^2+ \dots) - (x+ x^2+ x^3 + \dots) \\
S(x) & = \frac{1}{1-x}
\end{align*}
$$
*Definice:* Nechť $(a_{1}, a_{2},\dots)$ je posloupnost reálných čísel. Vytvořující (generující) funkce této posloupnosti je mocninná řada $a(x)= \sum_{i=0}^\infty a_{i}x^{i}$. 

| operace               |                                    řada                                     | úprava                        |
| :-------------------- | :-------------------------------------------------------------------------: | :---------------------------- |
| součet                |                  $\forall i \in \mathbb{N}: a_{i} + b_{i}$                  | $a(x)+b(x)$                   |
| násobení konstantou   |                  $\forall i \in \mathbb{N}: \alpha a_{i}$                   | $\alpha a(x)$                 |
| posun doprava         |                           $0,a_{0}, a_{1}, \dots$                           | $xa(x)$                       |
| posun doleva          |                         $a_{1}, a_{2}, a_{3} \dots$                         | $\frac{a(x)- a_{0}}{x}$       |
| substituce $\alpha x$ |                   $\sum_{i=0}^{\infty} a_i \alpha^i x^i$                    | $a(\alpha x)$                 |
| substituce $x^n$      | $a_{0},0,\stackrel{n-1}{\dots},a_{1},0,\stackrel{n-1}{\dots}, a_{2}, \dots$ | $a(x^n)$                      |
| derivace              |                        $a_{1},2a_{2}, 3a_{3},\dots$                         | $a'(x)$                       |
| integrování           |               $\sum_{i=0}^\infty \frac{1}{i+1} a_{i} x^{i+1}$               | $\int_{0}^x a(t) \text{ d} t$ |
| konvoluce             |                  $c_{n} =\sum_{k=1}^n a_{k} \cdot b_{n-k}$                  | $c(x) = a(x) \cdot b(x)$      |
Příklady užitečných výrazů a řad:
$\sum_{n=0}^{\infty} x^n = (1,1,1,1,...) \quad = \frac{1}{1-x}$

$\sum_{n=0}^{\infty} (ax)^n = (a^0,a^1,a^2,a^3,...) \quad = \frac{1}{1-ax}$

$\sum_{n=0}^{\infty} (x^2)^n = (1,0,1,0,...) \quad = \frac{1}{1-x^2}$

$\sum_{n=0}^{\infty} (-1)^n x^n = (1,-1,1,-1,...) \quad = \frac{1}{1+x}$
