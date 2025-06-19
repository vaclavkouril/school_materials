# Princip dynamického programování
- Začneme s rekurzivním pomalým algoritmem
- Analyzujeme ho pro opakované výpočty
- Pořídíme si tabulku a budeme si v ní pamatovat, které podproblémy jsme již vyřešili. Tedy počítáme si **cache**.
- Odstraníme rekurzi a zvolíme vhodné pořadí podproblémů. Cache a odstranění rekurze zrychlí běh algoritmu.
---
# Nejdelší rostoucí podposloupnost
Dostaneme $x_{1},\dots,x_{n}$ posloupnost celých čísel a chceme vymazat co nejméně prvků, aby nám zbyla jen a pouze rostoucí podposloupnost. 
Hladový algoritmus můžeme postavit na algoritmu NRP, který má ale složitost $2^n$.
$$
\begin{align}
&\text{NRP(i)} \\
&\text{Vstup: Posloupnost } x_{i},\dots,x_{n} \\
&\text{Výstup: Délka nejdelší podposloupnosti }d \\
&\text{1. } d  \leftarrow 1 \\
&\text{2.  Pro } j = i+1,\dots,n: \\
&\text{3.  }\quad \text{Je-li } x_{j} > x_{i}: \\
&\text{4.  }\quad \quad d \leftarrow \max(d,1+\text{NRP}(j))\\
\end{align}
$$
Můžeme si ale pomocí návodu udělat lepší algoritmus, budeme počítat tabulku a postupně vyplňovat od největšího indexu k nejmenšímu. Chceme $T[i]$, což bude délka té nejdelší podposloupnosti začínající $x_{i}$.
$$
\begin{align}
&\text{NRP2} \\
&\text{Vstup: Posloupnost } x_{1},\dots,x_{n} \\
&\text{Výstup: Délka nejdelší podposloupnosti }T[0] \\
&\text{1. } x_{0}  \leftarrow - \infty \\
&\text{2.  Pro } i = n,n-1,\dots,0: \\
&\text{3.  }\quad T[i] \leftarrow 1  \\
&\text{4.  }\quad P[i] \leftarrow 0 \\
&\text{5.  }\quad \text{Pro } j = i+1,\dots,n: \\
&\text{6.  }\quad\quad \text{Pokud } x_{i} < x_{j} \text{ a } T[i]<1+T[j]: \\
&\text{7.  }\quad\quad\quad T[i] \leftarrow 1+ T[j]\\
&\text{8.  }\quad\quad\quad P[i] \leftarrow j\\
\end{align}
$$
Algoritmus běží v $O(n^2)$ a jeho korektnost je dokazatelná induktivně dle $i$. Stačí si povšimnout, že začíná-li optimální řešení pro vstup $x_{i},\dots,x_{n}$ dvojicí $x_{i},x_{j}$, pak z něj odebráním $x_{i}$ vznikne optimální řešení pro $x_{j},\dots,x_{n}$, tedy máme optimální substrukturu, protože existujíc lepší řešení pro kratší vstup tak bychom narazili na rozpor, protože by to bylo lepší řešení i pro vstup větší. 

Zároveň díky $P$ můžeme vytrasovat jaké prvky jsou součástí podposloupnosti a sice, první je $P[0]$, druhý $P[P[0]]$ atd.

---
# Editační vzdálenost
Editační operací na řetězci nazveme vložení, smazání nebo změnu jednoho znaku. Editační vzdálenost řetězců $x = x_1 \dots x_n$ a $y = y_{1} \dots y_{m}$ udává, kolik nejméně editačních operací je potřeba, abychom z prvního řetězce vytvořili druhý. Značeno $L(x, y)$.

- Pokud $x_{1} = y_{1}$, můžeme první znak ponechat beze změny. Tehdy $L(x, y) = L(x_{2}\dots x_{n}, y_{2} \dots y_{m}).$
- Znak $x_{1}$ změníme na $y_{1}$. Pak $L(x, y) = 1 + L(x_{2}\dots x_{n}, y_{2} \dots y_{m})$.
- Znak $x$ smažeme. Tehdy $L(x, y) = 1 + L(x_{2}\dots x_{n}, y_{1} \dots y_{m})$.
- Na začátek vložíme $y_{1}$. Tehdy $L(x, y) = 1 + L(x_{1}\dots x_{n}, y_{2} \dots y_{m})$
Pokaždé $L(x,y)$ závisí na vzdálenostech nějakých suffixů $x,y$.
$$
\begin{align}
&\text{Edit} \\
&\text{Vstup: Řetězce } x_i \dots x_n \text{ a } y_j \dots y_m \\
&\text{Výstup: Editační vzdálenost } L(x_i \dots x_n, y_j \dots y_m) \\
&\text{// překontrolujeme zda nějaký řetězec již skončíl} \\
&1.\ \text{Pokud } i > n: \quad \text{vrátíme } m - j + 1 \\
&2.\ \text{Pokud } j > m: \quad \text{vrátíme } n - i + 1 \\ 
&\text{// ponecháme znak nebo ho změníme} \\
&3.\ z \leftarrow \text{Edit}(i+1,\ j+1) \\
&4.\ \text{Pokud } x_i \neq y_j: \quad z \leftarrow z + 1 \\
&\text{// smažeme znak} \\
&5.\ s \leftarrow \text{Edit}(i+1,\ j) \\
&\text{// vložíme znak} \\\
&6.\ v \leftarrow \text{Edit}(i,\ j+1) \\
&7.\ \text{Vrátíme } \min(z,\ s,\ v)
\end{align}
$$
Použitím principu dynamického programování spočteme tabulku $T$ odzadu, kde se tabulka bude chovat jako matice a každý prvek záleží na prvku vpravo dole od něj samotného. 
$$
\begin{align}
&\text{Edit2} \\
&\text{Vstup: Řetězce } x_i \dots x_n \text{ a } y_j \dots y_m \\
&\text{Výstup: Editační vzdálenost } L(x_i \dots x_n, y_j \dots y_m) = T[1,1] \\
&1.\ \text{Pro } i =1,\dots, n+1 \text{ položíme } T[i,m+1] \leftarrow n -i+1\\
&2.\ \text{Pro } j =1,\dots, m+1 \text{ položíme } T[n +1,j] \leftarrow m -j+1 \\ 
&3.\ \text{Pro }i =n, \dots,1: \\
&4.\ \quad \text{Pro } j = m, \dots,1 \\
&5.\ \quad \quad \text{Je-li } x_{i} =x_{j}: \delta \leftarrow 0, \text{ jinak }\delta \leftarrow 1 \\
&6.\ \quad \quad T[i,j] \leftarrow \min(\delta + T[i+1,j+1], 1+ T[i+1,j],  1+T[i,j+1])\\
\end{align}
$$
Algoritmus $\text {Edit2}$ běží v čase $\Theta(mn)$ a správnost je dokazatelná indukcí na délkách řetězců a pozorování o změnách editační vzdálenosti. 