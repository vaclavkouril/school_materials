# 14 - Polynomial Hierarchy and Collapse to the Second Level

![[assets/cc_lecture_8_4_2020_page_04.png]]
![[assets/cc_lecture_8_4_2020_page_05.png]]

## Reminder: the polynomial hierarchy

The polynomial hierarchy is

$$
\mathsf{PH} = \bigcup_{\ell \ge 0} \Sigma_\ell^P,
$$

where

- $\Sigma_0^P = \mathsf{P}$,
- $\Sigma_1^P = \mathsf{NP}$,
- $\Pi_1^P = \mathsf{coNP}$,
- $\Sigma_2^P = \mathsf{NP}^{\mathsf{NP}}$,
- and so on.

We also know

$$
\mathsf{PH} \subseteq \mathsf{PSPACE}.
$$

The lecture emphasizes that a collapse of PH means that all higher levels become equal to some fixed lower one.

## Statement of the Karp-Lipton collapse phenomenon

A famous theorem says:

> If $\mathsf{NP} \subseteq \mathsf{P}/\mathsf{poly}$, equivalently if SAT has polynomial-size circuits, then the polynomial hierarchy collapses to the second level.

A common formulation is

$$
\mathsf{PH} \subseteq \Sigma_2^P.
$$

Since trivially $\Sigma_2^P \subseteq \mathsf{PH}$, this means

$$
\mathsf{PH} = \Sigma_2^P.
$$

## Why one expects a collapse

Assume SAT has polynomial-size circuits. Then every SAT query made by an $\mathsf{NP}^{\mathsf{NP}}$ machine can be answered by the appropriate small circuit for formulas of the relevant size.

But that circuit is nonuniform advice, so we cannot simply use it directly in a uniform computation. The fix is:

1. existentially guess the circuit,
2. verify that it is correct,
3. then use it to simulate all SAT queries.

This changes an oracle computation into one extra existential block plus a verification stage, which lands us at level $2$ of PH.

## The two-case argument in the notes

The lecture phrases the proof as follows.

For a fixed $k$, we already know that there exists

$$
L \in \mathsf{NP}^{\mathsf{NP}}
$$

such that

$$
L \notin \mathsf{SIZE}(n^k+k).
$$

Now there are two possibilities:

### Case 1: $\mathsf{NP} \not\subseteq \mathsf{P}/\mathsf{poly}$

Then for every $k$ there is already some language in $\mathsf{NP}$ requiring circuits larger than $n^k+k$, and there is nothing more to prove.

### Case 2: $\mathsf{NP} \subseteq \mathsf{P}/\mathsf{poly}$

Then SAT has polynomial-size circuits. By the Karp-Lipton argument, this implies the polynomial hierarchy collapses to the second level. In particular, every language in $\mathsf{NP}^{\mathsf{NP}}$ is actually in $\Sigma_2^P$ and the whole hierarchy lives there.

So either we get lower bounds for $\mathsf{NP}$ directly, or else PH collapses. This explains why proving strong lower bounds for $\mathsf{NP}$ is deeply tied to major structural questions.

## Clean intuition for the collapse proof

Suppose a machine $M$ decides some language in $\mathsf{NP}^{\mathsf{NP}}$.

On input $x$:

1. the outer $\mathsf{NP}$ machine guesses its usual witness,
2. it also guesses a small circuit $C$ that is supposed to decide SAT on all formulas up to the relevant length,
3. it verifies that $C$ is correct on those formulas,
4. after that, all SAT oracle calls made by $M$ are replaced by evaluations of $C$.

After correctness is established, the rest is ordinary polynomial-time simulation.

So the only real issue is how to verify the circuit $C$. That is exactly what the last pages of the lecture explain.

## Why this matters

The theorem does **not** prove $\mathsf{NP} \not\subseteq \mathsf{P}/\mathsf{poly}$. That remains open.

But it shows that if $\mathsf{NP}$ had polynomial-size circuits, then PH would become unexpectedly small. Since most complexity theorists believe PH does not collapse, this is strong evidence that $\mathsf{NP} \not\subseteq \mathsf{P}/\mathsf{poly}$.
