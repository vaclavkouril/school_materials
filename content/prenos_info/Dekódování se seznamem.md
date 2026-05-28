Chceme najít všechna kódová slova do vzdálenosti $d'$ od $y$, kde $\frac{d}{2} < d' < d$ a tento seznam je $\leq n^{O(1)}$. 

Principiálně chceme lokálně dekódovat a odhadneme $x_i$, tedy $O(1)$-pozic $\to x_{i}$. Chceme náhodně vybrané pozice a odhalení $x_{i}$ s velkou pravděpodobností.

## Hadamardův kód
$\left[ 2^k,k, \frac{1}{2} 2^k \right]_{2}$, tedy vlastně pro volbu $k=\log n$ $\left[ n,\log n, \frac{n}{2} \right]$. Mějme 
$$
I\in \{ 1,\dots,k \}: x_{I} = \sum_{i\in I}  \mod 2
$$
Chceme zjistit $x_{J}$: $x_{A},x_{B}\to x_{I}$, kde $A$ mějme libovolně náhodné a $B = I \Delta A$, pak
$$
x_{I} = \sum_{i\in I} z_{i} = \sum_{i\in A}z_{i} \oplus \sum_{i\in A \Delta I} z_{i}.
$$
jako výstup vydáme $x_{A} \oplus x_{B}$
- Pokud jsou bez chyby $\implies$ výsledek je správně
- $\#$ chyb je $\leq \frac{n}{6}:\Pr[\text{správně dekóduju}] \geq\frac{{2}}{3}$.

Principiálně se jedná o to samé jako u *private information retrieval*, nebo-li dopočtení informace, kterou potřebujeme ze serveru, tak aby server netušil co přesně jsme chtěli.

