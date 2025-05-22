Jsou počtem zakořeněných binárních stromů na $n$ vrcholech.

*Pozorování:* $\forall i \geq 1:  b_{0}b_{i-1} + b_{1}b_{i-2}+ \ldots +b_{i-1}b_{0} = \sum^{i-1}_{k=1} b_{k}b_{i-k-1}$, což je koeficient u $x^{i-1}$ u konvoluce [[Vytvořující funkce]] $b(x)\cdot b(x)$.

Chceme-li vytvořující funkci pro Catalanova čísla, tak nám $b(x)^2$ nestačí, protože chceme aby koeficient u $n$ odpovídal $n$ a ne $n-1$, tedy musíme řadu posunout a kompenzovat $b_{0}$, protože to má vyjít $1$ a ne $0$ a sice máme $b(x) = xb(x)^2 + 1$.
$$
\begin{align}
b(x) &= xb(x)^2 + 1 \text{ mějme b(x) jako neznámou a x jako parametr} \\
b(x)_{1,2} &= \frac{1 \pm \sqrt{1 -4x}}{2x} \text{ + v okolí 0 koverguje zleva a zprava k jiným hodnotám}  \\
b(x) &= \frac{1 - \sum^\infty_{i=0}(-4)^i\binom{1/2}{i}x^i}{2x},
\end{align}
$$
v poslední rovnici aplikujeme na $(1-4x)^{1/2}$ důsledek [[Zobecněná binomická věta]].
$$
\begin{align}
b(x) &= \frac{1-1 - \sum^\infty_{i=1}(-4)^i\binom{1/2}{i}x^i}{2x} \\
&= -\frac{1}{2}\sum^\infty_{i=1} (-4)^i\binom{1/2}{i}x^{i-1} \\
b_{n} &=  -\frac{1}{2}(-4)^{n+1}\binom{1/2}{n+1}x^{n} \text{, teď nás zajímá jen konkrétní koeficient} \\ \\
b_{n} &= \frac{1}{2} (-1)^n 2^{2n+2} \frac{\frac{1}{2} \cdot \left( \frac{1}{2}-1 \right) \cdot \stackrel{n-2}{\dots}\cdot\left( \frac{1}{2} - (n +1)-1 \right)}{(n+1)!} \\
b_{n} &= \frac{1}{2} (-1)^n 2^{2n+2} \frac{\frac{1}{2} \cdot \left( -\frac{1}{2}\right) \cdot \stackrel{n-2}{\dots}\cdot\left( -\frac{2n-1}{2} \right)}{(n+1)!} \text{ teď roznásobíme našich $n$ záporných členů pomocí $-1$} \\
b_{n} &= \frac{1}{2} 2^{2n+2} \frac{\frac{1}{2} \cdot \frac{1}{2} \cdot \stackrel{n-2}{\dots}\cdot\frac{2n-1}{2}}{(n+1)!} \text{ všechny zlomky teď roznásobíme s $2$} \\ 
b_{n} &= 2^{n}  \frac{1\cdot 1 \cdot \stackrel{n-2}{\dots}\cdot(2n-1)}{(n+1)!} \cdot \frac{n!}{n!} \text{ distribuujeme 2 do čitatele s $n!$} \\
b_{n} &=\frac{1\cdot 3 \cdot \ldots \cdot(2n-1)}{(n+1) n!} \cdot \frac{2 \cdot 4 \cdot 6\cdot \dots \cdot 2n}{n!} \\
b_{n} &= \frac{1}{n+1} \cdot \frac{(2n)!}{(n!)^2} \\
b_{n} &= \frac{1}{n+1} \binom{2n}{n}
\end{align}
$$
