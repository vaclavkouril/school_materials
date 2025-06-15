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
Rovnici vyřešíme dosazením 