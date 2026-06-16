# QBF and the Characterization of PSPACE

## 1. Statement

The lecture proves the polynomial-time alternating characterization of polynomial space:

$$
\mathrm{AP} = \mathrm{PSPACE}.
$$

Using the lecture notation, this is the same as

$$
\mathrm{GAP} = \mathrm{PSPACE}.
$$

The proof is split into two inclusions.

---

## 2. Inclusion $\mathrm{AP} \subseteq \mathrm{PSPACE}$

Let $A$ be an alternating machine running in polynomial time $p(n)$.
We show that membership in $L(A)$ can be decided using polynomial space.

### Key observation

Although the computation tree may have exponentially many nodes, its depth is at most $p(n)$, because each branch halts within polynomial time.

To decide whether the root configuration accepts, we can perform a depth-first recursive evaluation of the tree.

### Recursive evaluation procedure

For a configuration $C$:

1. If $C$ is a halting accept configuration, return true.
2. If $C$ is a halting reject configuration, return false.
3. If $C$ is existential, recursively evaluate its children and return true as soon as one child accepts.
4. If $C$ is universal, recursively evaluate its children and return false as soon as one child rejects.

### Space bound

At any moment, the recursion stack contains only one path from the root to the current node.

- The recursion depth is at most $p(n)$.
- One configuration can be stored in polynomial space.
- The bookkeeping for which successor is currently explored also needs only polynomial space.

Therefore the whole procedure uses polynomial space.

Hence

$$
\mathrm{AP} \subseteq \mathrm{PSPACE}.
$$

### What this proof really uses

It does **not** matter that the tree may be exponentially large. Space complexity only cares about how much memory is needed simultaneously. Depth-first search reuses space after returning from recursive calls.

---

## 3. Why QBF belongs to $\mathrm{AP}$

Take a quantified Boolean formula

$$
\Phi = Q_1x_1\cdots Q_nx_n\,\psi(x_1,\dots,x_n).
$$

An alternating machine can evaluate it in polynomial time:

- when reading $Q_i = \exists$, branch existentially on $x_i \in \{0,1\}$,
- when reading $Q_i = \forall$, branch universally on $x_i \in \{0,1\}$,
- after all variables are assigned, evaluate the propositional part $\psi$ deterministically.

The number of quantifiers is at most the input length, and checking $\psi$ is polynomial, so the running time is polynomial.

Thus

$$
\mathrm{QBF} \in \mathrm{AP}.
$$

Because QBF is PSPACE-complete, this already strongly suggests $\mathrm{PSPACE} \subseteq \mathrm{AP}$.

---

## 4. Inclusion $\mathrm{PSPACE} \subseteq \mathrm{AP}$

There are two standard proofs. The lecture hints at both:

1. reduce a PSPACE computation to a reachability problem in the configuration graph,
2. encode that reachability recursively as a quantified Boolean formula.

We now spell this out.

### 4.1 Configuration graph of a polynomial-space machine

Let $M$ be a deterministic Turing machine deciding a language $L$ in space $p(n)$.
Fix an input $x$.

A configuration of $M$ consists of:

- the current state,
- the tape contents inside the used work space,
- the head positions.

Since the machine uses only $p(n)$ space, the total number of possible configurations is at most exponential:

$$
N \le 2^{O(p(n))}.
$$

Build the directed graph $G_x$ whose vertices are configurations and where

$$
C \to C'
$$

iff $M$ can move from $C$ to $C'$ in one step.

Let $s$ be the start configuration and let $t$ be the unique accepting configuration (or a set of accepting configurations; this distinction is irrelevant).

Then

$$
x \in L \iff \text{there is a directed path from } s \text{ to } t \text{ in } G_x.
$$

So deciding $L$ reduces to graph reachability in an exponentially large graph that is nevertheless succinctly describable.

### 4.2 Divide-and-conquer reachability predicate

Define a predicate

$$
\mathrm{PATH}(u,v,m)
$$

to mean: there is a path from $u$ to $v$ of length at most $2^m$.

This predicate satisfies the recursion

$$
\mathrm{PATH}(u,v,0)
$$

iff either $u=v$ or there is a direct edge $u \to v$,

and for $m>0$,

$$
\mathrm{PATH}(u,v,m)
\iff
\exists z\; \bigl(\mathrm{PATH}(u,z,m-1) \land \mathrm{PATH}(z,v,m-1)\bigr).
$$

### Why the recursion is correct

A path of length at most $2^m$ can be split at its midpoint into two paths of length at most $2^{m-1}$.
Conversely, if such a midpoint $z$ exists, concatenating the two shorter paths gives a path of length at most $2^m$.

Since every reachable accepting computation has length at most the number of configurations, it suffices to check

$$
\mathrm{PATH}(s,t,m)
$$

for $m = O(p(n))$.

### 4.3 From recursive reachability to alternation

The formula

$$
\mathrm{PATH}(u,v,m)
\iff
\exists z\; \bigl(\mathrm{PATH}(u,z,m-1) \land \mathrm{PATH}(z,v,m-1)\bigr)
$$

can be evaluated by an alternating machine in polynomial time.

Why?

- The parameter $m$ decreases by $1$ in every recursive call, so the recursion depth is $O(p(n))$.
- Guessing the midpoint $z$ is existential.
- The conjunction of the two recursive subproblems is universal in the alternating sense: both subcalls must succeed.

So an alternating machine can decide whether $s$ reaches $t$ using only polynomial time in the recursion depth.

Hence every PSPACE language belongs to $\mathrm{AP}$.

Therefore

$$
\mathrm{PSPACE} \subseteq \mathrm{AP}.
$$

Combining with the previous inclusion gives

$$
\mathrm{AP} = \mathrm{PSPACE}.
$$

---

## 5. Equivalent proof through QBF

The lecture also mentions QBF explicitly because it is the canonical PSPACE-complete problem.

The same recursive reachability predicate can be encoded as a quantified Boolean formula of polynomial size.

### Idea

- Encode each configuration by $O(p(n))$ bits.
- Write a formula $\mathrm{Step}(u,v)$ that checks whether $v$ is the legal successor of $u$.
- Define a family of formulas $\Gamma_m(u,v)$ expressing reachability within $2^m$ steps.

Set

$$
\Gamma_0(u,v) := (u=v) \lor \mathrm{Step}(u,v),
$$

and recursively

$$
\Gamma_m(u,v) := \exists z\; \bigl(\Gamma_{m-1}(u,z) \land \Gamma_{m-1}(z,v)\bigr).
$$

This recursion can be translated into a polynomial-size quantified Boolean formula because $m = O(p(n))$ and each configuration has polynomial length.

Then

$$
x \in L \iff \Gamma_m(s,t) \text{ is true}.
$$

So every PSPACE language reduces to QBF, showing QBF is PSPACE-hard. Since QBF is also in PSPACE, it is PSPACE-complete.

---

## 6. What to remember

### Core dictionary

$$
\exists \leftrightarrow \max,
\qquad
\forall \leftrightarrow \min.
$$

### Problems

- SAT corresponds to purely existential computation.
- TAUT corresponds to purely universal computation.
- QBF corresponds to alternating existential and universal computation.

### Complexity consequence

Polynomial-time alternation is exactly as powerful as polynomial space:

$$
\mathrm{AP} = \mathrm{PSPACE}.
$$

This is one of the central structural facts of complexity theory.
