# 17 - Boolean Circuits and the Class NC

![[assets/cc_lecture_15_4_2020_page_01.png]]
![[assets/cc_lecture_15_4_2020_page_02.png]]

## Boolean circuits as a model of parallel computation

A Boolean circuit is a finite acyclic directed graph whose input nodes are labeled by variables $x_1,\dots,x_n$, whose internal nodes are gates, and whose output node gives the value of the computed Boolean function.

In the lecture, the basic gates are AND, OR, and NOT. The key parameters are:

- **size** = number of gates,
- **depth** = length of the longest path from an input to the output.

The important intuition is:

- size measures the **amount of hardware**,
- depth measures the **parallel time**.

Indeed, all gates on one layer can be evaluated simultaneously, so if the circuit has depth $d$, then the computation can be finished in about $d$ parallel rounds.

This is why circuits are a natural model for parallel computation. A processor network can be idealized by a circuit: many gates work at once, and only dependencies between layers force sequential time.

## Uniform families and polynomial size

When we talk about complexity classes, we really mean **families of circuits** $(C_n)_{n \ge 1}$, where $C_n$ handles all inputs of length $n$.

A language $L$ is in $\mathsf{P}/\mathsf{SIZE}$, or more commonly just in a nonuniform circuit class such as $\mathsf{SIZE}(n^k)$, if for each $n$ there is a circuit $C_n$ of the required size deciding membership in $L$ on inputs of length $n$.

The lecture recalls the standard fact that polynomial-size circuits can compute everything in $\mathsf{P}$:

$$
\mathsf{P} \subseteq \mathsf{P}/\mathsf{poly}.
$$

The reason is that a polynomial-time Turing machine running for $t(n)$ steps can be unrolled into a circuit of polynomial size. Each layer represents one time step, so the circuit depth is roughly $t(n)$.

## Threshold and majority gates

The notes also mention threshold gates. A threshold gate outputs $1$ exactly when

$$
\sum_{i=1}^k a_i x_i \ge \theta,
$$

for fixed weights $a_i$ and threshold $\theta$.

A majority gate is the special case where the output is $1$ iff at least half of the inputs are $1$.

These gates are stronger than plain AND/OR/NOT gates and are useful in other circuit classes, but the main focus of this lecture is the standard basis with bounded fan-in.

## The class $\mathsf{NC}$

The class $\mathsf{NC}$ is meant to capture problems that are efficiently parallelizable.

With binary AND/OR and unary NOT, define:

$$
\mathsf{NC}^1 = \{\text{languages computable by polynomial-size circuits of depth } O(\log n)\},
$$

and more generally

$$
\mathsf{NC}^k = \{\text{languages computable by polynomial-size circuits of depth } O((\log n)^k)\}.
$$

Then

$$
\mathsf{NC} = \bigcup_{k \ge 1} \mathsf{NC}^k.
$$

So the slogan is:

$$
\mathsf{NC} = \text{poly-size circuits with polylogarithmic depth}.
$$

## Why logarithmic depth matters

A complete binary tree with $n$ leaves has depth about $\log n$. So if a task can be reduced to combining many independent partial answers in a tree-like way, then it often has an $\mathsf{NC}$ algorithm.

Typical examples are parallel addition of many bits, balanced evaluation of associative operations, and the divide-and-conquer structure that later appears in formula balancing.

## Open structural questions mentioned in the lecture

The lecture raises the broad question:

> Can we parallelize sequential computation?

This is reflected in questions such as:

$$
\mathsf{P} \stackrel{?}{\subseteq} \mathsf{NC}, \qquad
\mathsf{NP} \stackrel{?}{\subseteq} \mathsf{NC}, \qquad
\mathsf{EXP} \stackrel{?}{\subseteq} \mathsf{NC}.
$$

We do not know the first inclusion. The second would be very surprising, because it would mean NP problems admit highly parallel algorithms.

The lecture also notes that if

$$
\mathsf{NP} \nsubseteq \mathsf{P}/\mathsf{SIZE},
$$

then certainly

$$
\mathsf{NP} \nsubseteq \mathsf{NC},
$$

because every $\mathsf{NC}$ family has polynomial size, so

$$
\mathsf{NC} \subseteq \mathsf{P}/\mathsf{poly}.
$$

Thus circuit lower bounds automatically imply parallel lower bounds.
