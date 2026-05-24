# Samoopravné kódy
- $C : \{ 0,1 \}^k\to \{ 0,1 \}^n$
- Když chceme opravit $t$ chyb tak je vlastně potřeba minimální vzdálenost $2t+1$

---
# Konstrukce dobrého kódu
Zajímá nás vlastně parametr minimální vzdálenosti
$$
d= \min_{{x,x'\in C}\\ x\ne x'} \Delta_{Ham} (x,x').
$$
Vzhledem k trojúhelníkové nerovnosti máme
$$
\left. \begin{array}{l}
  \Delta_{Ham} (x,y) = \frac{d-1}{2} \\
  \Delta_{Ham} (x',y) = \frac{d-1}{2}
\end{array} \right\} = \Delta_{Ham}(x',x) \leq d-1
$$
a tedy počet chyb $\leq\frac{d-1}{2}$ dekódujeme správně.

Naším cílem je pro dané $n,k [=Rn]$ maximalizovat $d$. Ale [Shannonovy věta 2](Shannonovy%20věty.md), takže
$$
\frac{k}{n}\leq 1-H\left( \frac{d-1}{2n} \right)
 \implies t=pn=\left( \frac{d-1}{2} \right)n.
$$
A budeme značit kód pomocí $(n,k,d)$ , kde je to kód v prostoru $\Sigma^n$ velikosti $|\Sigma|^k$ s minimální vzdáleností $d$.

---
## Paritní kód
$x\in \{ 0,1 \}^k\to x,\Sigma_{\text{mod }2} x_{i}$, pak $(k+1,k,2)$.
