# Diskrétní Fourierova transformace (DFT)

### Definice
$$
F(x)_j = \sum_{k=0}^{n-1} x_k \cdot \omega^{jk}, \quad \text{pro } j = 0, \dots, n-1,
$$
kde $\omega = e^{-2\pi i/n}$ je primitivní $n$-tá odmocnina z jedné.
$$
\begin{align}
&\textbf{Diskrétní Fourierova transformace (DFT)} \\
&\text{Vstup: } x_0, x_1, \dots, x_{n-1} \in \mathbb{C}, \text{ délka } n \\
&\text{Definujeme: } \omega = e^{-2\pi i / n} \quad (\text{primitivní } n\text{-tá odmocnina z } 1) \\
&\text{Výpočet:} \\
&\forall k = 0, \dots, n-1: \\
&\quad X_k = \sum_{j=0}^{n-1} x_j \cdot \omega^{jk} \\
&\text{Výstup: } X_0, X_1, \dots, X_{n-1}
\end{align}
$$

---
## Fourierova báze a ortonormalita
Vektory $b_k = \left( \frac{\omega^{jk}}{\sqrt{n}} \right)_{j=0}^{n-1}$ tvoří ortonormální bázi prostoru $\mathbb{C}^n$ vzhledem ke skalárnímu součinu:
$$
\langle x, y \rangle = \sum_{j=0}^{n-1} x_j \cdot \overline{y_j}
$$
### Intuice:
- Fourierova báze rozkládá signál do harmonických složek (sinusy a cosiny).
- DFT převádí signál z časové domény do frekvenční.

---
## Lemma R (DFT reálného vektoru)
Pokud je $x \in \mathbb{R}^n$, pak platí:
$$
F(x)_j = \overline{F(x)_{n-j}}, \quad \Rightarrow \quad \text{DFT je antisymetrická.}
$$
**Důkaz:**
Použijeme definici a vlastnosti komplexních exponentů a sdružení:

$$
F(x)_{n-j} = \sum_{k=0}^{n-1} x_k \cdot \omega^{(n-j)k} = \sum_{k=0}^{n-1} x_k \cdot \omega^{-jk} = \overline{F(x)_j}
$$

---
## Spektrální rozklad
Každý reálný signál $x \in \mathbb{R}^n$ lze vyjádřit jako:
$$
x = \sum_{k=0}^{n/2} \alpha_k c_k + \beta_k s_k,
$$

kde $c_k$ a $s_k$ jsou vzory funkcí $\cos(2\pi k x)$ a $\sin(2\pi k x)$.

## Výpočet koeficientů:
Z Fourierova obrazu $y = F(x) = (a_0 + ib_0, \dots)$ spočteme:
$$
\begin{align}
\alpha_0 &= \frac{a_0}{n}, \\
\alpha_k &= \frac{2a_k}{n}, \quad k = 1, \dots, n/2 \\
\beta_k &= -\frac{2b_k}{n}, \quad k = 1, \dots, n/2 - 1, \quad \beta_0 = \beta_{n/2} = 0
\end{align}
$$

---
# FFT – Rychlý výpočet DFT
DFT v naivním tvaru má časovou složitost $\Theta(n^2)$. FFT ji snižuje na:

$$
\boxed{\Theta(n \log n)}
$$

### Idea:
- Rekurzivně rozdělit signál na sudé a liché indexy.
- DFT délky $n$ rozložíme na dvě DFT délky $n/2$.
---
## Algoritmus FFT (rekurzivní)

$$
\text{FFT}(x)_j =
\begin{cases}
\text{FFT}_{\text{even}}(x) + \omega^j \cdot \text{FFT}_{\text{odd}}(x), & \text{pro } j < n/2 \\
\text{FFT}_{\text{even}}(x) - \omega^{j - n/2} \cdot \text{FFT}_{\text{odd}}(x), & \text{jinak}
\end{cases}
$$

---
## Nerekurzivní FFT (FFT2)
$$
\begin{align}
&\text{FFT2 – Rychlá Fourierova transformace (nerekurzivní)} \\
&\text{Vstup: } x_0, \dots, x_{n-1},\; \text{primitivní } n\text{-tá odmocnina z jedné } \omega \\
&\text{Výstup: } y_0, \dots, y_{n-1}\\
&1.\; \text{Předpočítáme hodnoty } \omega^0, \omega^1, \dots, \omega^{n-1} \\
&2.\; \text{Pro každé } k = 0, \dots, n - 1 \text{ nastavíme: } y_k \gets x_{r(k)} \quad \text{(bitové zrcadlení)} \\
&3.\; b \gets 1 \\
&4.\; \text{Dokud } b < n \text{ opakujeme:} \\
&5.\quad \; \text{Pro } j = 0, 2b, 4b, \dots, n - 1: \\
&6.\quad\quad \; \text{Pro } k = 0, \dots, b - 1: \\
&7.\quad\quad\quad \; \alpha \gets \omega^{nk / (2b)} \\
&8.\quad\quad\quad \; (y_{j+k}, y_{j+k+b}) \gets \left(y_{j+k} + \alpha \cdot y_{j+k+b},\; y_{j+k} - \alpha \cdot y_{j+k+b}\right) \\
&\quad 9.\; b \gets 2b \\
\end{align}
$$
## Komplexita:
- Čas: $\Theta(n \log n)$
- Paměť: $\Theta(n)$

---
# Aplikace DFT a FFT

- **Zpracování signálu**: Rozklad na tóny, redukce šumu, dolní propust
- **Násobení polynomů**: DFT transformuje součin na součin po složkách
- **Kompresní algoritmy**: JPEG využívá variantu DFT (DCT)

---
# Konvoluce a spektrální vlastnosti
Konvoluce $z = x * y$ odpovídá skalárnímu součinu "posunutých" vektorů. Platí:

$$
F(x * y) = F(x) \cdot F(y)
$$
využívá se v efektivním výpočtu konvoluce.

---
## FFT v konečných tělesech

Fourierovu transformaci lze definovat nejen nad $\mathbb{C}$, ale i nad **konečnými tělesy**, pokud v nich existuje *primitivní $n$-tá odmocnina z jedničky*.
### Příklad:
V tělese $\mathbb{Z}_p$, kde $p$ je prvočíslo tvaru $2^k + 1$, platí:
$$
2^k = -1 \Rightarrow 2^{2k} = 1
$$
a tedy $2$ je primitivní $2k$-tá odmocnina z jedničky. Ale problém:
- $2k$ **zřídkakdy** mocnina dvou $\implies$ **nepoužitelné** přímo ve FFT.

### Řešení:
Využijeme algebraickou větu:

> **Multiplikativní grupa** $\mathbb{Z}_p^*$ je cyklická: $\exists\, g$ takové, že každé nenulové $x \in \mathbb{Z}_p^*$ lze zapsat jako $x = g^i$.

Tedy $g$ je *generátor* grupy a:
- $g$ je **primitivní $(p-1)$-ní odmocnina z jedničky**.

### Praktické příklady:
| Prvočíslo $p$ | Generátor $g$ | $n$ | $\omega = g^{(p-1)/n} \bmod p$ |
|--------------|---------------|-----|--------------------------------|
| $2^{16}+1 = 65537$ | $3$ | $2^{16}$ | $\omega = 3$ |
| $15 \cdot 2^{27} + 1 = 2\,013\,265\,921$ | $31$ | $2^{27}$ | $\omega = 31^{15} \bmod p = 440\,564\,289$ |
| $3 \cdot 2^{30} + 1 = 3\,221\,225\,473$ | $5$ | $2^{30}$ | $\omega = 5^3 \bmod p = 125$ |

---
## FFT mimo tělesa
Není třeba pracovat pouze v tělese. Stačí:
- **komutativní okruh** s jednotkou,
- ve kterém existuje:
  - *primitivní $n$-tá odmocnina z jedničky* $\omega$,
  - její inverze $\omega^{-1}$ (vždy existuje: $\omega^{-1} = \omega^{n-1}$),
  - *multiplikativní inverze* čísla $n$.
Takové okruhy umožňují další varianty FFT (např. při násobení velkých čísel) — **bez zaokrouhlovacích chyb** jako v $\mathbb{C}$.

Na rozdíl od klasické komplexní FFT, kde $\omega$ má iracionální složky $\implies$ **numerické chyby**,
- FFT v $\mathbb{Z}_p$ (či vhodném okruhu) **je zcela přesná**.
- To se **využívá v násobení velkých čísel** (např. Karatsuba, Schönhage-Strassen).
---
# Násobení polynomů pomocí FFT
Chceme efektivně spočítat součin dvou polynomů $A(x)$ a $B(x)$ stupně $< n$:
$$
A(x) = \sum_{i=0}^{n-1} a_i x^i,\quad B(x) = \sum_{i=0}^{n-1} b_i x^i
$$
Výsledkem je polynom $C(x) = A(x) \cdot B(x)$ stupně $< 2n$.
## Postup (FFT-based násobení)
1. **Doplnění nulami:**
   Zvolíme $m = 2^k \geq 2n$, doplníme $a_i$, $b_i$ nulami na délku $m$.

2. **DFT obou polynomů:**
   Použijeme FFT k výpočtu hodnot $A(\omega^k)$, $B(\omega^k)$ pro $k = 0, \dots, m-1$, kde $\omega$ je primitivní $m$-tá odmocnina z jedničky.
3. **Bodové násobení:**
$$
   C_k = A(\omega^k) \cdot B(\omega^k),\quad \text{pro } k = 0, \dots, m-1
$$
4. **Inverzní DFT:**
   Získáme zpět koeficienty $c_0, \dots, c_{2n-2}$ pomocí inverzní FFT (iDFT), tj. 
   $$
   c_j = \frac{1}{m} \sum_{k=0}^{m-1} C_k \cdot \omega^{-jk}
   $$
## Složitost
$$
\mathcal{O}(n \log n)
$$
(pro $n$-složkové polynomy po doplnění na $m = 2^k \geq 2n$)

## Intuice
- DFT převede polynom z koeficientové formy do bodové reprezentace.
- V bodové formě lze snadno násobit: hodnoty v odpovídajících bodech se jen vynásobí.
- iDFT převede výsledek zpět do koeficientové reprezentace.

