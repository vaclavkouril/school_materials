Při používání metody rozděl a panuj se snažíme o dělení problému na menší pod problémy, z jejich výsledků pak skládat výsledek a s menšími problémy naložíme stejně, dokud se nedostaneme k triviálním vstupům. 

# MergeSort
$$
\begin{align}

&\text{MergeSort} \\
&\text{Vstup: }a_1,\dots,a_n \text{ k setřízení} \\
&\text{Výstup: }b_{1},\dots,b_n \text{ setřízená} \\
&\quad	\text{1. Pokud }n = 1,\text{ pak vrátíme } a_1=b_1 \text{ a skončíme}\\
&\quad	\text{2. } x_{1},...,x_{\left\lfloor  n/2  \right\rfloor } \leftarrow \text{MergeSort}(a_1,...,a_{\left\lfloor  n/2  \right\rfloor }) 
  \\
&\quad	\text{3. } y_1,...,y_{\left\lceil    n/2  \right\rceil } \leftarrow \text{MergeSort}(a_{\left\lfloor  n/2  \right\rfloor +1},...,a_n)  \\ 
&\quad	\text{4. } b_1,...,b_n \leftarrow \text{Merge}(x_{1},...,x_{\left\lfloor  n/2  \right\rfloor} ; y_1,...,y_{\left\lceil    n/2  \right\rceil })  \\
\end{align}
$$
Kde Merge je metoda slévající v lineárním čase dvě seřazené posloupnosti. 
## Analýza
$T(n)$ bude značit počet kroků algoritmu MergeSort na $n$ velkém vstupu.
$$
\begin{align}
T(1) &= 1 \\
T(n) &= 2 \cdot T(n / 2 ) + cn
\end{align}
$$
Rovnici vyřešíme dosazením rekurentní rovnice do rekurentní rovnice a pozorujeme přírůstky.

---
# Master theorem
*Věta:* Rekurence, $a\in \mathbb{N}$, $b>1, c \geq 0$ 
$$
\begin{align}
T(n) &= a T(n/k) + \Theta(n^c) \\
T(1) &= T(0) = 1
\end{align}
$$
tak rekurence má řešení
1. $T(n) \in \Theta(n^c)$ pro $\frac{a}{b^c}<1$,
2. $T(n) \in \Theta(n^c \log n)$ pro $\frac{a}{b^c}=1$,
3. $T(n) \in \Theta(n^{\log_{b} a})$ pro $\frac{a}{b^c}>1$.
---
## Karatsuba
Rozdělíme každé číslo na dvě poloviny (po $\frac{n}{2}$ cifrách):
$$
x = x_1 \cdot 10^{n/2} + x_0 \\
y = y_1 \cdot 10^{n/2} + y_0
$$
Pak:
$$
x \cdot y = x_1 y_1 \cdot 10^n + ((x_1 + x_0)(y_1 + y_0) - x_1 y_1 - x_0 y_0) \cdot 10^{n/2} + x_0 y_0
$$
Tedy:
- místo 4 rekurzivních volání pro součiny: $x_1y_1$, $x_1y_0$, $x_0y_1$, $x_0y_0$
- **použijeme jen 3**: $x_1 y_1$, $x_0 y_0$, a $(x_1 + x_0)(y_1 + y_0)$

## Rekurentní rovnice
$$
T(n) = 3T(n/2) + \Theta(n)
$$
## Výsledek:
$$
T(n) = \Theta(n^{\log_2 3}) \approx \Theta(n^{1.585})
$$