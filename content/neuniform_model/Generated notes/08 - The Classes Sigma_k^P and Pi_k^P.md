# The Classes $\Sigma_k^P$ and $\Pi_k^P$

## 1. First level

The lecture uses the notation $\Sigma_k^P$ and $\Pi_k^P$ for the levels of the polynomial hierarchy.

At level $1$ we have:

$$
\Sigma_1^P = \mathrm{NP},
\qquad
\Pi_1^P = \mathrm{coNP}.
$$

These correspond to purely existential and purely universal polynomial-time computation.

---

## 2. Formula view of $\Sigma_2^P$

A typical $\Sigma_2^P$ formula has the form

$$
\exists x_1,\dots,x_m\; \forall y_1,\dots,y_r\; \varphi(x_1,\dots,x_m,y_1,\dots,y_r),
$$

where $\varphi$ is quantifier-free and polynomial-time evaluable.

The associated decision problem is:

> Does there exist an assignment to the existential block such that for every assignment to the universal block the matrix is true?

This is the canonical complete form for the second existential level.

Likewise, a typical $\Pi_2^P$ formula is

$$
\forall x_1,\dots,x_m\; \exists y_1,\dots,y_r\; \varphi(x_1,\dots,x_m,y_1,\dots,y_r).
$$

Its decision problem asks whether every assignment to the first block can be answered by a suitable assignment to the second block.

---

## 3. General definition

For $k \ge 1$:

- $\Sigma_k^P$ consists of polynomial-time alternating computations with at most $k-1$ alternations, starting existentially;
- $\Pi_k^P$ consists of polynomial-time alternating computations with at most $k-1$ alternations, starting universally.

Equivalently, $\Sigma_k^P$ is described by true quantified formulas with $k$ quantifier blocks, starting with an existential block:

$$
\exists X_1\, \forall X_2\, \exists X_3\, \cdots\, Q_k X_k\; \varphi(X_1,\dots,X_k),
$$

and $\Pi_k^P$ is the analogous class starting universally.

Here each block contains polynomially many variables, and the matrix $\varphi$ is computable in polynomial time.

---

## 4. Complete problems

The handwritten pages say that deciding truth of a $\Pi_2$-formula is complete for the corresponding class, and similarly for $\Sigma_\ell$-formulas.

The general rule is:

- truth of $\Sigma_k$-QBF formulas is complete for $\Sigma_k^P$,
- truth of $\Pi_k$-QBF formulas is complete for $\Pi_k^P$.

Here “$\Sigma_k$-formula” means a quantified Boolean formula whose prefix has exactly $k$ alternating quantifier blocks and starts existentially; similarly for $\Pi_k$.

Why is this natural?

- membership is immediate by simulating the quantifiers with alternating choices,
- hardness follows because any bounded-alternation computation can be encoded by a bounded-alternation quantified formula.

So quantified formulas are not only useful for PSPACE; when the number of quantifier blocks is bounded, they describe the levels of the polynomial hierarchy one by one.

---

## 5. Union of all levels

The full polynomial hierarchy is

$$
\mathrm{PH} = \bigcup_{k \ge 1} \Sigma_k^P.
$$

Equivalently one could take the union of the $\Pi_k^P$, because each level has a dual counterpart.

This hierarchy is contained in PSPACE, since every bounded-alternation polynomial-time computation is in particular an alternating polynomial-time computation, and

$$
\mathrm{AP} = \mathrm{PSPACE}.
$$

Thus

$$
\mathrm{PH} \subseteq \mathrm{PSPACE}.
$$

Whether the inclusions between successive levels are strict is a major open question.
