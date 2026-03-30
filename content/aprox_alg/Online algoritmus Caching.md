### Věta: For $N\geq k+1$ pages, no deterministic algorithm is better than $k$-competitive.
*Důkaz:* Let us define phases of a request sequence $\overbrace{r_{1},r_{2},\dots,r_{k},}^k r_{k+1},\dots$ where
1. phase: the longest prefix with $\leq k$ distinct pages requested.
2. phase: the same for the remaining sequence.

**Request is new** if it was not requested in the previous phase and **is old** otherwise.

A **page** in fast memory **is MARKED** if already requested is this phase.

*Definice:* And algorithm is marking if it never evicts a marked page. 
- **LRU** is a marking algorithm.
- **FIFO** is not a marking algorithm.
---
#### *Pomocná Věta:* Any marking algorithm is $k$-competitive.
*Důkaz pomocné věty:* $ALG \leq k \cdot \# \text{phases}$, and we know that $OPT \geq \# \text{phases} -1$ and we get
$$
ALG \leq k \cdot OPT + k.
$$
- For FIFO the same argument holds, even though it isn't a marking algorithm.

---
*Algoritmus:* **MARK** maintains marked pages, evicts a random not marked page.

For the $i$-th phase we have $m_{i}=\#\text{of new pages requested}$ and we have
$$
\begin{align*}
\Pr[\text{fault on requst to first old page}] &\leq \frac{m_{i}}{k}\\
\Pr[\text{fault on request to second old page}] &\leq \frac{m_{i}}{k-1} \\
\Pr[\text{fault on request to } (k-m_{i}) \text{-th old page}] &\leq \frac{m_{i}}{k-(k-m_{i})+1} =\frac{m_{i}}{m_{i}+1} \leq \frac{m_{i}}{2}
\end{align*}
$$
and we get
$$
\mathbb{E}[\# \text{faults in phase }i] \leq m_{i}+\frac{m_{i}}{2}+\dots+\frac{m_{i}}{k} = m_{i}\cdot H_{k}
$$
#### *Věta:* If $N=k+1$, then MARK is $H_k$-competitive. In general MARK is $2H_{k}$-competitive.
*Důkaz:*
$$
OPT \geq m_{2} + m_{4}+m_{6} +\dots,\quad m_{3}+m_{5}+m_{7}+\dots\leq OPT
$$
so we get
$$
OPT \geq \frac{1}{2} \sum m_{i}.
$$
---
### *Věta:* No randomized algorithm is better than $H_k$-competitive, even for $N=k+1$.
*Důkaz:* Let us assume that we know the initial state, then on requests in order: $a_{1},a_{2}$ ($a_{1}\neq a_{2}$), they have probabilities to fault $\geq 1$ for $a_{1}$, $\geq \frac{1}{k}$ for $a_{2}$.

We have then for $a_{3}\not\in \{ a_{1},a_{2} \}$ and the $a_{1}a_{2}a_{3}$ we get probability $\geq \frac{1}{k-1}$, for $a_{1}a_{2}a_{3}a_{4}$ probability $\geq \frac{1}{k-2}$ and for $a_{1},\dots,a_{k}$ we have probability $\frac{1}{2}$ and we again see the harmonic.

---
# General Paging
Each page has size cost
- size=1
- cost=1
- cost=size
- weighted paging
- offline version is $\mathcal{NP}$ hard even for sizes $1,2,3$k
- $O(\log(\text{size of cache}))$-competitive randomized algorithms.