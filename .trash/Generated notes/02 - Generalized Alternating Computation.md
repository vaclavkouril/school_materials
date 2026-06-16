# Generalized Alternating Computation

## 1. From accept/reject to values in $[0,1]$

In ordinary nondeterministic and universal computation, node values are Boolean: $0$ or $1$.

The lecture generalizes this by allowing each subtree to evaluate to a number in the interval $[0,1]$.

A computation tree is then evaluated bottom-up.

- Leaves carry values in $[0,1]$, usually $0$ or $1$.
- Internal nodes combine child values using an operator.

The three fundamental operators from the lecture are:

$$
\forall \leadsto \min,
\qquad
\exists \leadsto \max,
\qquad
R \leadsto \text{average}.
$$

So if a node has child values $a_1,\dots,a_m$, then:

$$
\forall(a_1,\dots,a_m) = \min_i a_i,
$$

$$
\exists(a_1,\dots,a_m) = \max_i a_i,
$$

$$
R(a_1,\dots,a_m) = \frac{1}{m}\sum_{i=1}^m a_i.
$$

## 2. Truth values of quantified formulas as tree values

Consider a quantified Boolean formula of the form

$$
\Phi = Q_1 x_1 \, Q_2 x_2 \, \cdots \, Q_n x_n\; \psi(x_1,\dots,x_n),
$$

where each $Q_i \in \{\forall,\exists\}$ and $\psi$ is quantifier-free.

We can build a tree of depth $n$:

- at level $i$, branch according to the two possible values of $x_i$,
- label the branching node by $Q_i$,
- at leaves, evaluate $\psi$ under the chosen assignment.

Then the value of the root is exactly the truth value of $\Phi$.

### Why this is true

We prove it by induction on the number of quantifiers.

#### Base case

If there are no quantifiers, the formula is just $\psi$, which is either true or false under the current assignment. This is exactly the leaf value.

#### Induction step

Suppose the claim is true for formulas with $n-1$ quantifiers.

Take

$$
\Phi = \exists x\, \Theta(x).
$$

The tree root has two children, corresponding to $x=0$ and $x=1$. By the induction hypothesis, those two subtrees evaluate to the truth values of $\Theta(0)$ and $\Theta(1)$. Since an existential node computes the maximum of its children, the root value is $1$ iff at least one child has value $1$, i.e. iff at least one of $\Theta(0),\Theta(1)$ is true. That is precisely the semantics of $\exists x\,\Theta(x)$.

The universal case is analogous, replacing maximum by minimum.

So the claim follows.

## 3. SAT, TAUT, and QBF in the tree picture

The lecture highlights three progressively richer cases.

### SAT

A formula

$$
\exists x_1 \cdots \exists x_n\, \psi(x_1,\dots,x_n)
$$

is true iff there is a satisfying assignment. This is exactly SAT and corresponds to purely existential branching.

### TAUT

A formula

$$
\forall x_1 \cdots \forall x_n\, \psi(x_1,\dots,x_n)
$$

is true iff every assignment satisfies $\psi$. This is the tautology problem and corresponds to purely universal branching.

### QBF

A general alternation such as

$$
\exists x_1\, \forall x_2\, \exists x_3\, \forall x_4\, \forall x_5\; \psi(x_1,x_2,x_3,x_4,x_5)
$$

is evaluated by alternating max and min levels in the computation tree.

This is the quantified Boolean formula problem, QBF.

## 4. Alternating machines

An **alternating Turing machine** extends a nondeterministic machine by allowing states of two kinds:

- existential states,
- universal states.

Acceptance is defined recursively:

- an existential configuration is accepting if **some** successor is accepting,
- a universal configuration is accepting if **all** successors are accepting,
- a halting accept configuration is accepting,
- a halting reject configuration is rejecting.

This is exactly the tree semantics described above.

## 5. Time classes

The lecture introduces a class written as $\mathrm{GATIME}(t(n))$, the languages decidable by a generalized alternating machine in time $t(n)$.

For polynomial time, the lecture uses

$$
\mathrm{GAP} = \bigcup_k \mathrm{GATIME}(n^k + k).
$$

In standard notation this is the same idea as polynomial-time alternating computation, often written $\mathrm{AP}$.

The important claim is

$$
\mathrm{GAP} = \mathrm{PSPACE}.
$$

The next note explains both inclusions carefully.
