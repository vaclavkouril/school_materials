# Alternating Computation and PSPACE

## Contents

- [[01 - Nondeterminism, coNondeterminism, and Randomization]]
- [[02 - Generalized Alternating Computation]]
- [[03 - QBF and the Characterization of PSPACE]]

## Main message of the lecture

The lecture builds a path from ordinary nondeterministic computation to more general computation trees where inner nodes can be evaluated by different operators:

- existential nodes: accept if **some** child accepts,
- universal nodes: accept if **all** children accept,
- randomized nodes: accept according to the **average** value of children,
- generalized nodes: each node returns a value in $[0,1]$.

The central complexity-theoretic point is that polynomial-time alternating computation captures polynomial space:

$$
\mathrm{AP} = \mathrm{PSPACE}.
$$

In the lecture this appears under the notation $\mathrm{GAP}$ or generalized alternating polynomial time.

## Reading advice

The original pages are very compact and diagram-heavy. These notes expand every definition and proof sketch into a form that can be studied independently.
