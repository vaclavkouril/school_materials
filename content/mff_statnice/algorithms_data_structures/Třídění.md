# BubbleSort
Je to třídící algoritmus třídící v čase $O(n^2)$, pro každý s $n$ prvků musíme udělat až $n$ porovnání.

$$
\begin{align}
&\text{BubbleSort} \\
&\text{Vstup: Pole } P[1,\dots,n] \\
&\text{Výstup: Setřízené pole }P \\
&\text{1. } pokračuj \leftarrow 1 \\
&\text{2.  Dokud je } pokračuj = 1: \\
&\text{3.  }\quad pokračuj \leftarrow 0 \\
&\text{4.  }\quad \text{Pro } i = 1,2,\dots,n-1:\\
&\text{5.  }\quad\quad \text{Pokud } P[i]> P[i+1]: \\
&\text{6.  }\quad\quad \quad \text{Prohodíme } P[i] \text{ a } P[i+1] \text{.} \\
&\text{7.  }\quad\quad\quad pokračuj \leftarrow 1
\end{align}
$$
---
# InsertionSort
Je to třídící algoritmus s časovou složitostí $O(n^2)$ v nejhorším případě. V každém kroku vkládáme prvek na správné místo mezi již setříděné prvky.
$$
\begin{align}
&\text{InsertionSort} \\
&\text{Vstup: Pole } P[1,\dots,n] \\
&\text{Výstup: Setřízené pole }P \\
&\text{1.  Pro } i = 2,3,\dots,n: \\
&\text{2.  }\quad \text{klíč } \leftarrow P[i] \\
&\text{3.  }\quad j \leftarrow i - 1 \\
&\text{4.  }\quad \text{Dokud } j \geq 1 \text{ a } P[j] > \text{klíč}: \\
&\text{5.  }\quad\quad P[j+1] \leftarrow P[j] \\
&\text{6.  }\quad\quad j \leftarrow j - 1 \\
&\text{7.  }\quad P[j+1] \leftarrow \text{klíč}
\end{align}
$$

---
# QuickSort
$$
\begin{align}
&\text{QuickSort} \\
&\text{Vstup: Posloupnost } X = x_1,\dots,x_n \\
&\text{Výstup: Setřízená posloupnost }Y \\
&\text{1.  Pokud } n\leq 1, \text{vrátíme }Y=X \text{ a skončíme.} \\
&\text{2.  } p \leftarrow \text{některý z prvků } x_{1},\dots,x_{n} \text{ jako pivot.} \\
&\text{3.  } L \leftarrow \text{ prvky } X \text{ jenž jsou menší než } p \\
&\text{4.  } P \leftarrow \text{ prvky } X \text{ jenž jsou větší než } p \\
&\text{5.  } S \leftarrow \text{ prvky } X \text{ jenž jsou rovny } p \\
&\text{6.  } L \leftarrow \text{QuickSort}(L) \\
&\text{7.  } R \leftarrow \text{QuickSort}(R) \\
&\text{8.  } \text{Vrátíme } Y \leftarrow L.S.R
\end{align}
$$
Algoritmus v každé vrstvě stráví $n$ času a vrstev je $O(\log n)$ protože zvolením pivota jako "skoromediánu" máme dělení na podobné části. tedy složitost je $O(n \cdot \log n)$.

---
# Dolní odhad složitosti porovnávacích třídicích algoritmů

---

Každý porovnávací třídicí algoritmus má v nejhorším případě časovou složitost alespoň:

$$
\boxed{\Omega(n \log n)}
$$

Porovnávací třídicí algoritmus lze modelovat jako **rozhodovací strom**, kde:

- Každý vnitřní uzel představuje porovnání dvou prvků.
- Každá hrana odpovídá výsledku porovnání (např. „menší“ nebo „větší“).
- Každý list odpovídá jedné možné výstupní permutaci.

Aby algoritmus mohl správně roztřídit všech $n$ vstupních prvků ve všech případech, musí být strom schopen reprezentovat všechna jejich uspořádání.
### Krok 1: Počet možných výstupů

- Všechny možné permutace $n$ různých prvků: $n!$
- Tedy rozhodovací strom musí mít **alespoň $n!$ listů**.
### Krok 2: Výška binárního stromu

- Binární strom s výškou $h$ má nejvýše $2^h$ listů.
- Musí tedy platit: $2^h \geq n!$
- ⇒ $\log_2(n!) \leq h$
### Krok 3: Stirlingova aproximace

$$
n! \geq \left( \frac{n}{e} \right)^n
$$
Zlogaritmujeme:
$$
\log_2(n!) \geq \log_2\left(\left( \frac{n}{e} \right)^n\right) = n \log_2\left(\frac{n}{e}\right) = n \log_2 n - n \log_2 e
$$
Tedy:
$$
\log_2(n!) = \Omega(n \log n)
$$
