# Nondeterminism, coNondeterminism, and Randomization

## 1. Computation trees

A convenient way to think about nondeterministic computation is through a **computation tree**.

- The root is the initial configuration on input $x$.
- Every branching step corresponds to a nondeterministic choice.
- Leaves are terminating configurations, labeled accept or reject.

For a deterministic algorithm, this tree degenerates to a single path. For a nondeterministic one, many branches may exist.

## 2. Acceptance for nondeterministic machines

A nondeterministic machine $A$ **accepts** input $x$ iff **there exists** a branch of the computation tree of $A$ on $x$ that ends in an accepting state.

Equivalently, if we label accepting leaves by $1$ and rejecting leaves by $0$, then a nondeterministic node computes the maximum of its children.

$$
\text{value of a nondeterministic node} = \max \{\text{values of its children}\}.
$$

This is why nondeterminism corresponds to existential quantification.

## 3. The class $\mathrm{NP}$

A language $L$ lies in $\mathrm{NP}$ if there is a nondeterministic algorithm running in polynomial time that accepts exactly the inputs in $L$.

That is,

$$
x \in L \iff \text{some polynomial-length computation branch accepts } x.
$$

### Example: SAT is in $\mathrm{NP}$

Let $\varphi(x_1,\dots,x_n)$ be a Boolean formula. A nondeterministic machine can:

1. guess an assignment $a_1,\dots,a_n \in \{0,1\}$,
2. evaluate $\varphi$ under this assignment,
3. accept iff the assignment satisfies $\varphi$.

This runs in polynomial time. Hence

$$
\mathrm{SAT} \in \mathrm{NP}.
$$

## 4. Universal acceptance and $\mathrm{coNP}$ intuition

Now reverse the semantics.

A machine $A$ **accepts** $x$ iff **all** branches of its computation tree accept.

This is the universal analogue of nondeterminism. If leaves are labeled by $0$ and $1$, then the value at such a node is the minimum of the values of its children:

$$
\text{value of a universal node} = \min \{\text{values of its children}\}.
$$

This corresponds to universal quantification.

### Example: TAUT

Define

$$
\mathrm{TAUT} = \{\varphi : \varphi \text{ is true under every assignment}\}.
$$

A universal polynomial-time machine can check whether $\varphi$ is a tautology by universally branching over all truth assignments and accepting iff every branch evaluates $\varphi$ to true.

So the semantics of tautologies matches universal branching just as SAT matches existential branching.

## 5. Why TAUT is not naturally in $\mathrm{NP}$

The lecture asks whether $\mathrm{TAUT} \in \mathrm{NP}?$ The point is not that we know it is impossible, but that the existential meaning of $\mathrm{NP}$ does not fit the problem naturally.

- For SAT, one satisfying assignment is enough.
- For TAUT, we need to know that **no counterexample assignment exists**.

Thus TAUT naturally belongs to the universal side, i.e. to $\mathrm{coNP}$.

Indeed,

$$
\varphi \in \mathrm{TAUT} \iff \neg \varphi \notin \mathrm{SAT}.
$$

## 6. Randomized branching

The lecture then inserts a third interpretation of branching: **randomized computation**.

Suppose a node chooses uniformly among its children. If children have acceptance values in $\{0,1\}$, then the parent node takes the average value of the children.

$$
\text{value of a randomized node} = \frac{1}{d}\sum_{i=1}^d v_i,
$$

where $d$ is the number of children.

For binary branching with child values $0$ and $1$, possible parent values are $0$, $\tfrac12$, or $1$.

This allows us to interpret the computation tree quantitatively rather than only as accept/reject.

## 7. Unified viewpoint

The lecture's key conceptual step is this:

- existential branching computes a **maximum**,
- universal branching computes a **minimum**,
- randomized branching computes an **average**.

Hence a computation tree can be seen as evaluating an expression bottom-up.

At leaves we put values in $\{0,1\}$.
At internal nodes we apply an operator determined by the node type.

This viewpoint prepares the transition to **generalized alternating computation**, where node values can lie in the whole interval $[0,1]$.
