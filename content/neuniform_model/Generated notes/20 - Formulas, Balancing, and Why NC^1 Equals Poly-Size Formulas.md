# 20 - Formulas, Balancing, and Why NC^1 Equals Poly-Size Formulas

![[assets/cc_lecture_15_4_2020_page_07.png]]
![[assets/cc_lecture_15_4_2020_page_08.png]]
![[assets/cc_lecture_15_4_2020_page_09.png]]

## Circuits versus formulas

A Boolean **formula** is a circuit in which every gate has fan-out $1$. Equivalently, the computation is a tree rather than a DAG.

That means subcomputations cannot be shared. If the same intermediate value is needed twice, it must be recomputed twice.

So formulas are weaker than general circuits from the point of view of size, but they have a simpler tree structure.

## From shallow circuits to formulas

Take a circuit of depth $d$ with fan-in at most $2$.

If we duplicate every gate each time its output is used in two places, we can unfold the circuit into a formula of the same depth $d$.

The size may increase, but not too much when $d$ is logarithmic. A binary tree of depth $d$ has at most $2^d$ leaves, so the resulting formula has size at most about $2^d$ times a polynomial factor.

In particular, if

$$
d = O(\log n),
$$

then

$$
2^d = n^{O(1)},
$$

so every $\mathsf{NC}^1$ circuit can be converted into a polynomial-size formula.

Thus

$$
\mathsf{NC}^1 \subseteq \{\text{languages computable by polynomial-size formulas}\}.
$$

## Why arbitrary formulas can be too deep

A formula of size $s$ may be very unbalanced. For example, a long chain of binary AND gates can have depth $s$.

So polynomial size alone does not automatically imply logarithmic depth.

The main theorem of the lecture is that formulas can be **balanced**.

## Balancing a formula

Let $F$ be a formula of size $|F|$.

The balancing idea is to find a subformula $A$ whose size is neither too small nor too large, specifically such that

$$
\frac{1}{3}|F| \le |A| \le \frac{2}{3}|F|.
$$

Such a node exists by following a path from the root downward until we first reach a subtree of size at most $\frac{2}{3}|F|$. The child just above it had size more than $\frac{2}{3}|F|$, so the chosen subtree cannot be too small either; otherwise its parent would also be too small. This gives the desired split point.

Now treat the value of $A$ as a fresh variable and decompose the original formula into:

- the subformula $A$ itself,
- the remaining context $F[A := z]$ where $z$ stands for the value of $A$.

Both pieces have size at most $\frac{2}{3}|F|$ up to constant-factor bookkeeping.

Recursively balance each piece and combine them.

## Depth bound

At each balancing step, the problem size shrinks by a factor at most $\frac{2}{3}$.

So after $r$ levels of recursion, the remaining formula size is at most

$$
\left(\frac{2}{3}\right)^r |F|.
$$

We reach constant size when this becomes at most $1$, that is when

$$
r = O(\log |F|).
$$

Each balancing layer contributes only constant extra depth, so the balanced formula has depth

$$
O(\log |F|).
$$

The lecture even writes this concretely as about $2 \log |F|$.

## Size bound after balancing

Balancing does not blow up the formula size by more than a polynomial factor. In the notes the resulting size is bounded by about

$$
|F|^2.
$$

That is enough for complexity-class purposes: a polynomial-size formula can be transformed into another polynomial-size formula of logarithmic depth.

## Final equivalence

We already saw that every $\mathsf{NC}^1$ circuit unfolds into a polynomial-size formula.

Conversely, every polynomial-size formula can be balanced into a logarithmic-depth polynomial-size formula, hence into an $\mathsf{NC}^1$ computation.

Therefore:

$$
\mathsf{NC}^1 = \{\text{languages computable by polynomial-size Boolean formulas}\}.
$$

## Why this theorem is useful

This equivalence lets us reason about $\mathsf{NC}^1$ in two different ways:

- as highly parallel bounded fan-in circuits of logarithmic depth,
- as polynomial-size formulas.

The formula viewpoint is often convenient for lower bounds and structural arguments, because tree computations are easier to analyze than general DAG-like circuits.
