# Bloom filtr
Odpovídá
- Ne, tak jsme to nikdy neviděli.
- Ano, tak jsme prvek už možná viděli.

Filtr vypadá následovně:
- Parametr $m$, který je prostor v počtu bitů.
- Pole $m$ bitů
- $k$ hashovacích funkcí. ($c=1$-univerzální)

### Insert(x)
Nastaví $h_{1}(x),\dots,h_{k}(x)$ na $1$.
### Query(x)
Pokud jsme prvek neviděli, tak je alespoň jedna z $h_{i}(x) =0$ a odpovíme $Ne$, pokud jsou všechny $1$, tak odpovíme $Ano$.

---
# Analýza pro $k=1$
Mějme stav po vložení $\{ x_{1},\dots,x_{n} \}$ a pro $y \in \mathcal{U}\setminus \{ x_{1},\dots,x_{n} \}$ jaká je $\Pr[y \text{ je FP}] \leq \epsilon$. Předpokládejme $k=1$
$$
\Pr[y \text{ je FP}] = \Pr[\exists i: h(x_{i}) = h(y)] \leq \sum_{i=1}^n \Pr[h(x_{i}) = h(y)] \leq \frac{n}{m}  \leq \epsilon.
$$
Tedy potřebujeme $m \geq \left\lceil  \frac{n}{\epsilon}  \right\rceil$ tedy pro konstrukci je potřeba znát horní odhad na $n$.

# Analýza k-pásmového filtru
Paměť je $k \cdot m$ bitů, dáno $M$ a $\epsilon = \Pr[\text{FP}]$ a nastavíme $m = 2n$. Pro každou z $k$ tabulek máme pravděpodobnost kolize jako výše $\leq \frac{n}{m} = \frac{1}{2}$ a tedy chceme
$$
\Pr[y \text{ je FP}]\leq \left( \frac{1}{2} \right)^k \leq \epsilon \implies k\geq \left\lceil  \log_{2} \frac{1}{\epsilon}  \right\rceil. 
$$
tedy chceme-li $\epsilon = 0,01 \implies k=7$ tak pro $n=10^6$ nam vyjde $14Mb$ velký bloom filtr.

## *Věta:* Pro $\forall \epsilon >0$  a $n\in \mathbb{N}$ tak $k$-pásmový bloom filtr s $k = \left\lceil  \log_{2} \frac{1}{\epsilon}  \right\rceil$ a $m =2n$ do kterého přidáme $\leq n$ prvků má $\forall y\in \mathcal{U}: \Pr[y \text{ je FP}] \leq \epsilon$ a použije $2n \cdot \log_{2} \frac{1}{\epsilon}$ bitů paměti ($+ \log n \cdot \log \frac{1}{\epsilon}$ na hashovací funkce) a čas operací je $O\left( \log \frac{1}{\epsilon} \right)$.
---
# Optimalizace máme-li $M$-bitů paměti k nastavení $mk\leq M$.
To, že daný bit je $0$ je s pravděpodobnostní $\left( 1-\frac{1}{m} \right)^n \approx e^{-n /m}=:p$. Pokud nastavíme $p$ tak dostane parametry i $\epsilon$. Z $p$ máme $m \approx -n / \ln p$, kvůli omezení na paměť dostáváme i $k$ $k = \left\lfloor  \frac{M}{m}  \right\rfloor \approx -M / n \cdot \ln p$ a FP se stanou s jedničkou ve všech pásmech, tedy
$$
(1-p)^k = e^{k \ln (1-p)} \approx e^{-M /n \cdot \ln p \cdot \ln (1-p)}.
$$
Vzhledem ke klesání $e^{-x}$, tak maximalizujeme $\log p \cdot \log(1-p)$ pro $p\in (0,1)$, tedy $p=1/2$ a tedy $\epsilon = 2^{-k}$.

Potřebujeme-li dostat $2^{-k}$ pod $\epsilon$, tak nastavíme $\left\lceil  \log\left( \frac{1}{\epsilon} \right)  \right\rceil$ a $M=kn / \ln 2 \approx n \cdot \log(1 / \epsilon) \cdot (\frac{1}{\ln 2}) \approx n \cdot \log(1 / \epsilon) \cdot 1,44$.

---
## Jednotabulkový Bloom filtr (Single-table Bloom filter)

Kromě $k$-pásmové varianty lze Bloomův filtr realizovat i **s jednou sdílenou tabulkou bitů**,  do které ukazují všechny hashovací funkce. 
### Konstrukce
Zvolíme $k$ hashovacích funkcí
$$
h_1,\dots,h_k : \mathcal U \to [m],
$$
které předpokládáme **zcela náhodné a navzájem nezávislé**. Použijeme **jediné pole bitů**
$$
B[0],\dots,B[m-1].
$$
Pak platí to samé jako pro $k$-pásmový protože trefení do stejného indexu je zanedbatelné díky vzájemné nezávislosti.

---

## Příklady použití
- streaming algoritmy,
- webové a HTTP cache,
- databázové indexy,
- aproximativní testy členství s omezenou pamětí.
