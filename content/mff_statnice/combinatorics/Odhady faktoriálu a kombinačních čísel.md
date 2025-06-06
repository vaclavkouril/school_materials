## Odhad faktoriálu
$e\left( \frac{n}{e} \right)^n \leq n! \leq en\left( \frac{n}{e} \right)^n$
Pro důkaz odhadu užijeme indukce a odhad rozdělíme na dva případy:
1. $n! \leq en\left( \frac{n}{e} \right)^n$
	- $n=1$:
$$
		\begin{align}
		1! &\leq e \cdot {1} \cdot \left( \frac{1}{e} \right)^1 = 1
 \end{align}
		$$
	- Z indukčního předpokladu platí odhad pro $n-1$ a musíme dokázat platnost odhadu u $n$:
		$$
		\begin{align}
n! = n(n-1)! &\leq^{\text{IP}} en(n-1)\left( \frac{n-1}{e} \right)^{n-1} \\
&= en\left( \frac{n}{e} \right)^n \left( \frac{e}{n} \right)^n(n-1) \left( \frac{n-1}{e} \right)^{n-1} \\
&= en\left( \frac{n}{e} \right)^n \left( \frac{n-1}{n} \right)^n e
\end{align}
		$$
		výraz $\left( \frac{n-1}{n} \right)^n e$ je menší než jedna:
		$$
		\left( \frac{n-1}{n} \right)^n e = \left( 1 - \frac{1}{n} \right)^n e \leq \left( e^{-1/n} \right)^n e = e^{-1}e = 1
		$$
		a tedy máme $n! \leq en\left( \frac{n}{e} \right)^n \left( \frac{n-1}{n} \right)^n e \leq en\left( \frac{n}{e} \right)^n$.
2. $e\left( \frac{n}{e} \right)^n \leq n!$
	- $e\left( \frac{n}{e} \right)^n \leq n!$
		- n = 1:
$$
e \cdot \left( \frac{1}{e} \right)^1 = 1 \leq 1!
$$
		- $n-1 \rightarrow n$:
			$$
			\begin{align}
e n \left( \frac{n-1}{e} \right)^{n-1}  &\leq n(n-1)! \\
e n\left( \frac{n}{e} \right)^n \left( \frac{e}{n} \right)^n  \left( \frac{n-1}{e} \right)^{n-1}&=  \\
e \left( \frac{n}{e} \right)^n  \left( \frac{n-1}{n} \right)^{n-1} e &=
\end{align}
			$$
			kde $\left( \frac{n-1}{n} \right)^{n-1} e \geq 1$:
			1. Nechť $m=n-1$. Potřebujeme:
   $$
   \Bigl(\tfrac{n-1}{n}\Bigr)^{n-1}e \ge1
   \;\iff\;
   \Bigl(1+\tfrac1m\Bigr)^m \le e.
   $$

			2. Binomická věta:
   $$
   \Bigl(1+\tfrac1m\Bigr)^m
   =\sum_{k=0}^m \binom m k \,\tfrac1{m^k}
   \le\sum_{k=0}^m \tfrac1{k!}
   \le\sum_{k=0}^\infty \tfrac1{k!}
   = e.
   $$  $$
   \Bigl(1+\tfrac1m\Bigr)^m \le e
   \;\Longrightarrow\;
   \Bigl(\tfrac m{m+1}\Bigr)^m e \ge1,
   $$
			   tedy pro $m=n-1$
   $$
   \Bigl(\tfrac{n-1}{n}\Bigr)^{n-1}e \ge1.
   $$
## Odhad binomických koeficientů
Důkaz odhadů  
$$
\Bigl(\frac{n}{k}\Bigr)^k \;\le\;\binom nk\;\le\;\Bigl(\frac{e\,n}{k}\Bigr)^k.
$$

1. **Výchozí vzorec**  
   $$
   \binom nk
   =\frac{n(n-1)\cdots(n-k+1)}{k!}
   =\prod_{j=1}^k\frac{\,n-j+1\,}{j}.
   $$

2. **Dolní odhad**  
   Pro $j=1,2,\dots,k$ platí
   $$
   \frac{\,n-j+1\,}{j}\;\ge\;\frac{n}{k},
   $$
   neboť funkce $j\mapsto\frac{n-j+1}{j}$ je rostoucí na $[1,k]$ a její nejmenší hodnota je  
   $\frac{n}{k}$ pro $j=1$.  
   Tudíž
   $$
   \binom nk
   =\prod_{j=1}^k\frac{\,n-j+1\,}{j}
   \;\ge\;\bigl(\frac{n}{k}\bigr)^k.
   $$

3. **Horní odhad**  
   Zřejmé je i
   $$
   \frac{\,n-j+1\,}{j}\;\le\;\frac{n}{j},
   $$
   proto
   $$
   \binom nk
   \le\;\prod_{j=1}^k\frac{n}{j}
   =\frac{n^k}{k!}
   \;\le\;\frac{n^k}{(k/e)^k}
   =\Bigl(\tfrac{e\,n}{k}\Bigr)^k,
   $$
   kde jsme použili odhad $k!\ge (k/e)^k$: 
	1. **Logaritmický přechod**  
   $$
   \ln(k!) \;=\;\sum_{i=1}^k\ln i
   \;\ge\;\int_{1}^{k}\ln x\,dx
   \;=\;\bigl[x\ln x - x\bigr]_{1}^{k}
   \;=\;k\ln k - k + 1.
   $$

	2. **Jednodušší odhad**  
   Protože pro $k\ge1$ platí
   $$
   k\ln k - k + 1 \;\ge\; k\ln k - k,
   $$
   dostaneme
   $$
   \ln(k!) \;\ge\; k(\ln k - 1)
   \;=\;k\ln\!\bigl(\tfrac{k}{e}\bigr).
   $$$$
   k! \;=\;\exp\bigl(\ln(k!)\bigr)
   \;\ge\;\exp\bigl(k\ln(k/e)\bigr)
   \;=\;\bigl(\tfrac{k}{e}\bigr)^k.
   $$

## Odhad $\binom {2m}m$
Pro odhad
$$
2^{2𝑚}/(2\sqrt{m}) \leq \binom{2m}{m} \leq 2^{2m}/\sqrt{2m}
$$
si můžeme všimnout
$$
\begin{align}
P &= \frac{1 \cdot 3 \cdot 5 \cdot \ldots \cdot (2m-1)}{2 \cdot 4 \cdot 6 \cdot \ldots \cdot (2m)} \\
&= \frac{1 \cdot 3 \cdot 5 \cdot \ldots \cdot (2m-1)}{2^{m}m!} \frac{2 \cdot 4 \cdot 6 \cdot \ldots \cdot (2m)}{2 \cdot 4 \cdot 6 \cdot \ldots \cdot (2m)} \\
&= \frac{(2m)!}{2^{2m} (m!)^2} = \frac{\binom{2m}{m}}{2^{2m}}.
\end{align}
$$
Teď nám tedy stačí ukázat 
$$
\frac{1}{(2\sqrt{m})} \leq P \leq \frac{1}{\sqrt{2m}},
$$to rozdělíme na horní a dolní odhad.
1. Pro horní odhad se nám hodí další kouzlení:
	$$
	\begin{align}
	1 &> \left( 1-\frac{1}{2^2} \right) \cdot \left( 1-\frac{1}{4^2} \right) \cdot \ldots \cdot \left( 1-\frac{1}{(2m)^2} \right) \\
& = \frac{1\cdot 3}{2 \cdot 2} \cdot \frac{3\cdot 5}{4 \cdot 4} \cdot \ldots \cdot \frac{(2m-1)(2m+1)}{2m \cdot 2m} = P^2 \cdot (2m+1)
 
    \end{align}
	$$
	ze kterého nám vlastně přirozeně vypadlo, že $P < \frac{1}{\sqrt{ 2m+1}} <  \frac{1}{\sqrt{ 2m+1}}$
2. Spodní odhad je opět trikem z nerovnosti:
	$$
	\begin{align}
	1 &> \left( 1-\frac{1}{3^2} \right) \cdot \left( 1-\frac{1}{5^2} \right) \cdot \ldots \cdot \left( 1-\frac{1}{(2m-1)^2} \right) \\
& = \frac{2\cdot 4}{3 \cdot 3} \cdot \frac{4\cdot 6}{5 \cdot 5} \cdot \ldots \cdot \frac{(2m-2)(2m)}{(2m-1) \cdot (2m-1)} = \frac{1}{P^2 \cdot 2 \cdot 2m}
    \end{align}
	$$
	z čehož plyne $P > \frac{1}{2\sqrt{m}}$

Oba triky nejsou kouzla z ničeho nic, oba staví na konstruování čísel podobných $P$, kde je vždy jen malý rozdíl v chybějících/přebývajících číslech.