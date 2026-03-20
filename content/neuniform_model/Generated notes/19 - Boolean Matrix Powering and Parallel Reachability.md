# 19 - Boolean Matrix Powering and Parallel Reachability

![[assets/cc_lecture_15_4_2020_page_05.png]]
![[assets/cc_lecture_15_4_2020_page_06.png]]

## Adjacency matrices over the Boolean semiring

Let $G$ be a directed graph on vertices $1,\dots,n$ and let $A_G \in \{0,1\}^{n \times n}$ be its adjacency matrix, where

$$
(A_G)_{ij} = 1 \iff \text{there is an edge } i \to j.
$$

To express reachability, the lecture uses matrix multiplication over the **Boolean semiring**:

- multiplication is AND,
- addition is OR.

Thus for Boolean matrices $A,B$ we define

$$
(A \cdot B)_{ij} = \bigvee_{k=1}^n \bigl(A_{ik} \wedge B_{kj}\bigr).
$$

This is exactly the usual formula for matrix multiplication, except that $+$ is replaced by OR and $\cdot$ is replaced by AND.

## Why powers of $A_G$ encode paths

The key fact is:

$$
(A_G^2)_{ij} = 1
$$

iff there exists some vertex $k$ such that

$$
A_{ik} = 1 \text{ and } A_{kj} = 1,
$$

that is, iff there is a walk of length $2$ from $i$ to $j$.

More generally, by induction on $m$:

$$
(A_G^m)_{ij} = 1 \iff \text{there exists a walk of length } m \text{ from } i \text{ to } j.
$$

### Proof

We prove the claim by induction on $m$.

For $m=1$, the statement is just the definition of the adjacency matrix.

Assume it holds for $m$. Then

$$
(A_G^{m+1})_{ij} = \bigvee_{k=1}^n \bigl((A_G^m)_{ik} \wedge (A_G)_{kj}\bigr).
$$

This entry is $1$ exactly when there exists some $k$ such that:

- $(A_G^m)_{ik}=1$, so by the induction hypothesis there is a walk of length $m$ from $i$ to $k$,
- $(A_G)_{kj}=1$, so there is an edge from $k$ to $j$.

Concatenating them yields a walk of length $m+1$ from $i$ to $j$. Conversely, every walk of length $m+1$ splits after its first $m$ steps through some intermediate vertex $k$, giving such a witness. This completes the induction.

## From walks to reachability

In a graph with $n$ vertices, if there is a path from $s$ to $t$, then there is one of length at most $n-1$.

Therefore, to decide reachability, it is enough to know whether there exists a walk of length at most $n-1$ from $s$ to $t$.

The lecture packages this by repeating the transition relation enough times in a layered graph, or equivalently by taking a sufficiently high Boolean power of the adjacency matrix. Since the configuration graph of a logspace machine has polynomially many vertices, the required exponent is polynomial in the input size.

## Repeated squaring

Suppose we need $A_G^{t(n)}$ where $t(n)$ is polynomial. Then we can compute this by repeated squaring:

$$
A, A^2, A^4, A^8, \dots
$$

After only $O(\log t(n)) = O(\log n)$ squaring steps we reach the needed exponent size.

So the main issue becomes: can one compute the square of an $n \times n$ Boolean matrix by a shallow polynomial-size circuit?

## Circuit for one Boolean matrix product

Fix matrices $A$ and $B$. For each pair $(i,j)$ we compute

$$
C_{ij} = \bigvee_{k=1}^n (A_{ik} \wedge B_{kj}).
$$

This can be done by:

1. $n$ AND gates computing $A_{ik} \wedge B_{kj}$ for all $k$,
2. a balanced binary OR tree combining those $n$ values.

Hence each output bit $C_{ij}$ has depth

$$
1 + O(\log n),
$$

and uses $O(n)$ gates.

Since there are $n^2$ output bits, the whole matrix product circuit has:

- size $O(n^3)$,
- depth $O(\log n)$.

## Consequence for powering

To compute a polynomially high power of $A_G$, we perform $O(\log n)$ such squaring steps in sequence. Each step has depth $O(\log n)$, so the total depth is

$$
O(\log n) \cdot O(\log n) = O(\log^2 n).
$$

The total size remains polynomial.

Therefore Boolean matrix powering is in $\mathsf{NC}^2$.

Since reachability reduces to Boolean matrix powering, we conclude:

$$
\mathsf{STCON} \in \mathsf{NC}^2,
$$

and because $\mathsf{STCON}$ is $\mathsf{NL}$-complete,

$$
\mathsf{NL} \subseteq \mathsf{NC}^2.
$$
