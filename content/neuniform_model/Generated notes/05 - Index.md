# PSPACE, Polynomial Hierarchy, and Oracles

These notes were reconstructed from the handwritten lecture **CC - 25.3.2020**.
They continue the numbering from the previous lecture.

## Contents

- [[06 - QBF is PSPACE-complete]]
- [[07 - Alternation and the Polynomial Hierarchy]]
- [[08 - The Classes Sigma_k^P and Pi_k^P]]
- [[09 - Oracle Computation and P^SAT]]
- [[10 - NP Oracles and the Second Level]]
- [[11 - Lecture Page Images]]

## Main message of the lecture

This lecture has three tightly connected themes.

First, it finishes the idea that **QBF captures PSPACE**. The lecture sketches how a polynomial-space computation can be encoded as a quantified Boolean formula by recursively expressing reachability in the configuration graph.

Second, it explains that **alternation with only a bounded number of quantifier blocks** gives the levels of the **polynomial hierarchy**. Pure existential polynomial-time computation gives $
\Sigma_1^P = \mathrm{NP}$, pure universal polynomial-time computation gives $\Pi_1^P = \mathrm{coNP}$, and alternating prefixes such as

$$
\exists x_1 \cdots \exists x_k\, \forall y_1 \cdots \forall y_m\, \varphi(x,y)
$$

lead to the second and higher levels.

Third, it introduces **oracle computation**. An oracle for a language $A$ lets an algorithm ask in one step whether a given string belongs to $A$. This gives classes such as $P^A$, and in particular $P^{\mathrm{SAT}}$. The lecture uses this to connect SAT, TAUT, coNP, and the second level of the polynomial hierarchy.

## Reading advice

The handwritten pages are very compressed and often present only the key equations or pictures. The notes below expand the proofs and the intuition so that they can be read independently.
