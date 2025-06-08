*Definice:* Posloupnost reálných čísel $(a_n)$ je zobrazení $n\mapsto a_n$ z $\mathbb{N}$ do $\mathbb{R}.$ 

*Definice:* Posloupnost $(a_n)$ je omezená, pokud existuje $K\in\mathbb{R}$ takové, že 
$$
|a_n|<K \quad \forall n\in\mathbb{N}.
$$  
Je monotónní, pokud je neklesající  
$$
a_n\le a_m \quad \text{pro }n<m,
$$  
nebo nerostoucí  
$$
a_n\ge a_m \quad \text{pro }n<m.
$$

*Definice:* Říkáme, že $A\in\mathbb{R}$ je (vlastní) limita posloupnosti $(a_n)$, pokud pro každé $\varepsilon>0$ existuje $n_0\in\mathbb{N}$ takové, že  
$$
|a_n - A| < \varepsilon \quad \forall n\ge n_0.
$$  
Zapisujeme  
$$
\lim_{n\to\infty} a_n = A.
$$

*Definice:* Posloupnost $(a_n)$ má (nevlastní) limitu $+\infty$, pokud pro každé $K\in\mathbb{R}$ existuje $n_0\in\mathbb{N}$ takové, že  
$$
a_n > K \quad \forall n\ge n_0,
$$
a analogicky pro $-\infty$. 

*Poznámka:* Vlastní limita je "normální" limita, kdy se členy posloupnosti přibližují konečnému reálnému číslu. Nevlastní limita vyjadřuje, že hodnoty rostou (resp. klesají) neomezeně a limitu nemají v reálných číslech.

---
# Aritmetika limit
*Věta:* (Aritmetika limit) Nechť  
$$
\lim_{n\to\infty}a_n = a \in \mathbb{R}^*,\quad \lim_{n\to\infty}b_n = b \in \mathbb{R}^*.
$$
Pak platí:
1.  
$$
\lim_{n\to\infty}(a_n + b_n) = a + b,
$$
2.  
$$
\lim_{n\to\infty}(a_n b_n) = a\,b,
$$
3. pokud $b_n\neq0$ pro $n\gg0$, pak  
$$
\lim_{n\to\infty}\frac{a_n}{b_n} = \frac{a}{b}.
$$
*Důkaz:* Nechť $\varepsilon>0$.  

4. Protože $a_n\to a$, existuje $N_1$ takové, že  
$$
   |a_n - a| < \frac{\varepsilon}{2}\quad \forall n\ge N_1.
$$
   A protože $b_n\to b$, existuje $N_2$ takové, že  
$$
   |b_n - b| < \frac{\varepsilon}{2}\quad \forall n\ge N_2.
$$
   Položme $N=\max(N_1,N_2)$. Pak pro $n\ge N$ platí  
$$
   |(a_n+b_n)-(a+b)| \le |a_n - a| + |b_n - b| < \frac{\varepsilon}{2} + \frac{\varepsilon}{2} = \varepsilon,
$$
   což dokazuje bod 1.

2. Nechť navíc existuje $M$ tak, že $|b_n|\le M$ pro $n\ge N_2$. Pro $n\ge N$ máme  
$$
\begin{align}
   &|a_n b_n - a b|
   = |a_n b_n - a b_n + a b_n - a b|
   \le \\
   &\le |a_n - a|\,|b_n| + |a|\,|b_n - b|
   < M\frac{\varepsilon}{2M} + |a|\frac{\varepsilon}{2|a|}
   = \varepsilon.
\end{align}
$$
   Zde jsme volili $N_1$ tak, aby $|a_n - a|<\frac{\varepsilon}{2M}$ a $N_2$ tak, aby $|b_n - b|<\frac{\varepsilon}{2|a|}.$

3. Protože $b_n\to b\neq0$, existuje $N_3$ takové, že  
$$
   |b_n - b| < \frac{|b|}{2}\quad \forall n\ge N_3
   \quad\Longrightarrow\quad
   |b_n|>\frac{|b|}{2}.
$$
   Pro $n\ge N'=\max(N_1,N_2,N_3)$ platí
$$
\begin{align}
   &\left|\frac{a_n}{b_n} - \frac{a}{b}\right|
   = \frac{|a_n b - a b_n|}{|b\,b_n|}
= \frac{|(a_n - a)b - a(b_n - b)|}{|b\,b_n|}
   \le \\ &\le \frac{|b|\,|a_n - a| + |a|\,|b_n - b|}{|b|\,(|b|/2)}
   < \varepsilon.
\end{align}
$$  
   Tím je dokázán bod 3.

---

# Limity a uspořádání
*Věta*: (Limity a uspořádání) Nechť  
$$
\lim_{n\to\infty}a_n = a \in \mathbb{R},\quad \lim_{n\to\infty}b_n = b \in \mathbb{R}.
$$  
Pak:
1. Pokud $a < b$, existuje $n_0$ takové, že  
$$
   a_n < b_n\quad \forall n>n_0.
$$
2. Pokud $a_n \le b_n$ pro všechna $n>n_0$, pak $a \le b$. 

*Důkaz:*  
1. Položme 
$$
   \delta = \frac{b - a}{2} > 0.
$$
   Protože $a_n\to a$, existuje $N_1$ tak, že $|a_n - a|<\delta$ pro $n\ge N_1$, a protože $b_n\to b$, existuje $N_2$ tak, že $|b_n - b|<\delta$ pro $n\ge N_2$. Pro $n\ge N=\max(N_1,N_2)$ máme  
$$
   a_n < a + \delta = \frac{a+b}{2}
   < b - \delta < b_n,
$$
   tedy $a_n<b_n$.

2. Předpokládejme sporem, že $a>b$. Pak podle bodu 1 by pro dostatečně velká $n$ platilo $a_n > b_n$, což je v rozporu s předpokladem $a_n\le b_n$. Tudíž $a\le b$.

---

# O dvou policajtech 
**Věta:** (O dvou policajtech) Nechť  
$$
\lim_{n\to\infty}a_n = \lim_{n\to\infty}b_n = a \in \mathbb{R}
$$
a existuje $n_0$ takové, že  
$$
a_n \le c_n \le b_n \quad \forall n>n_0.
$$
Pak  
$$
\lim_{n\to\infty}c_n = a.
$$

*Důkaz:* Nechť $\varepsilon>0$. Protože $a_n\to a$, existuje $N_1$ tak, že  
$$
a - \varepsilon < a_n < a + \varepsilon \quad \forall n\ge N_1,
$$
a protože $b_n\to a$, existuje $N_2$ tak, že  
$$
a - \varepsilon < b_n < a + \varepsilon \quad \forall n\ge N_2.
$$
Nechť $N=\max(N_1,N_2,n_0)$. Pro $n\ge N$ pak z $a_n\le c_n\le b_n$ plyne  
$$
a - \varepsilon < c_n < a + \varepsilon,
$$
tedy $|c_n - a|<\varepsilon$, což ukazuje, že $c_n\to a$.
