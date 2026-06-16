# NP Oracles and the Second Level

## 1. The claim suggested by the lecture

The lecture ends by connecting NP-oracle computation to $\Sigma_2^P$.
In standard notation,

$$
\Sigma_2^P = NP^{\mathrm{SAT}} = NP^{\mathrm{NP}}.
$$

The handwritten notes illustrate this on formulas of the form

$$
\exists x\, \forall y\, \varphi(x,y).
$$

Let us explain carefully why this is true.

---

## 2. From $\Sigma_2$ formulas to NP with a SAT oracle

Suppose we want to decide whether

$$
\exists x\, \forall y\, \varphi(x,y)
$$

is true.

An NP machine can do the following.

1. Nondeterministically guess the existential assignment $x$.
2. Now it must verify that
   $$
   \forall y\, \varphi(x,y)
   $$
   holds.

This universal statement is equivalent to saying that the negation has no satisfying assignment:

$$
\forall y\, \varphi(x,y)
\iff
\neg \exists y\, \neg \varphi(x,y).
$$

So define the formula

$$
\psi_x(y) := \neg \varphi(x,y).
$$

Then

$$
\forall y\, \varphi(x,y)
$$

holds iff

$$
\psi_x \notin \mathrm{SAT}.
$$

An NP machine with a SAT oracle can ask whether $\psi_x$ is satisfiable. If the oracle answers “no”, then the guessed $x$ is good. Thus the whole problem is solvable in $NP^{\mathrm{SAT}}$.

Therefore,

$$
\Sigma_2^P \subseteq NP^{\mathrm{SAT}}.
$$

---

## 3. From NP with a SAT oracle back to $\Sigma_2^P$

Now let an NP machine with SAT oracle run in polynomial time.
A computation branch consists of:

- the nondeterministic guesses made by the NP machine,
- the oracle queries it asks,
- and the yes/no answers returned by the oracle.

To describe acceptance by a quantified formula, we existentially quantify over all nondeterministic choices and over all guessed certificates that justify the SAT oracle's positive answers.

What remains is to ensure that every oracle answer used in the accepting branch is correct.

- If an oracle answer is “yes”, correctness means there exists a satisfying assignment for the queried formula.
- If an oracle answer is “no”, correctness means there does **not** exist such an assignment, i.e. a universal condition.

When written out carefully, this yields a formula with one existential block for the machine's guesses and one universal block handling the negative-oracle correctness checks. Thus the whole language lies in $\Sigma_2^P$.

So:

$$
NP^{\mathrm{SAT}} \subseteq \Sigma_2^P.
$$

Combining both inclusions gives

$$
\Sigma_2^P = NP^{\mathrm{SAT}} = NP^{\mathrm{NP}}.
$$

---

## 4. Intuition

This identity is very natural.

- The outer NP part guesses the existential witness.
- The SAT oracle is used to answer a universal challenge indirectly by checking whether a counterexample exists.

So “guess something that defeats all counterexamples” becomes

$$
\exists \; \forall,
$$

which is exactly the pattern of the second level.

---

## 5. Dual statement

By symmetry, one also gets the universal second level from coNP machines with SAT oracles, or equivalently from universally starting alternating machines with one alternation. In quantified form this corresponds to

$$
\forall x\, \exists y\, \varphi(x,y),
$$

which is the canonical $\Pi_2^P$ pattern.

---

## 6. Takeaway

The lecture's final point is that there are three equivalent ways to view the second level:

1. bounded alternation starting existentially,
2. quantified Boolean formulas with prefix $\exists\forall$,
3. nondeterministic polynomial time with access to an NP, equivalently SAT, oracle.

These are three presentations of the same complexity class.
