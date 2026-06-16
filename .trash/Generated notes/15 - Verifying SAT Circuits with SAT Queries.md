# 15 - Verifying SAT Circuits with SAT Queries

![[assets/cc_lecture_8_4_2020_page_06.png]]
![[assets/cc_lecture_8_4_2020_page_07.png]]

## Goal

Assume we guessed a circuit $C$ that is supposed to decide SAT for all formulas up to some size bound $m$.

We need a way to verify:

$$
\forall \varphi \text{ of size at most } m,\quad C(\varphi)=1 \iff \varphi \in \mathsf{SAT}.
$$

At first sight this looks universal and difficult. The lecture shows how to package incorrectness into an $\mathsf{NP}$ property.

## Self-reducibility of SAT

The key fact is that SAT is self-reducible.

For a formula

$$
\varphi(x_1,\dots,x_n),
$$

we have

$$
\varphi \in \mathsf{SAT}
\iff
\varphi(x_1,\dots,x_{n-1},0) \in \mathsf{SAT}
\ \lor \
\varphi(x_1,\dots,x_{n-1},1) \in \mathsf{SAT}.
$$

So satisfiability of a formula reduces to satisfiability of two smaller formulas obtained by fixing one variable.

This gives a recursive characterization that any correct SAT-deciding circuit must satisfy.

## Two correctness conditions

The lecture isolates two kinds of conditions for $C$.

### Local recursion condition

For every formula $\varphi$ of size at most $m$,

$$
C(\varphi)=1
\iff
C(\varphi(x_1,\dots,x_{n-1},0))=1
\ \lor \
C(\varphi(x_1,\dots,x_{n-1},1))=1.
$$

This says $C$ behaves compatibly with the self-reduction of SAT.

### Base-case truth condition

For fully instantiated formulas, equivalently formulas with no variables left,

$$
C(\psi)=1 \iff \psi \text{ evaluates to true}.
$$

This anchors the recursion.

If both conditions hold for all formulas up to the required size, then $C$ correctly decides SAT on that domain.

## Why incorrectness is in $\mathsf{NP}$

Define

$$
L_{\neg\mathsf{SAT}}
=
\{\, C : C \text{ is a circuit that does not correctly decide SAT} \,\}.
$$

To show this language is in $\mathsf{NP}$, it is enough to show that a wrong circuit has a short certificate.

A certificate can guess a violating formula witnessing failure of one of the two conditions:

1. a formula $\varphi$ where the recursion condition fails, or
2. a fully assigned formula $\psi$ where the base-case truth condition fails.

Such a witness is polynomial-size, and once guessed, the verifier only needs to:
- evaluate $C$ on a few explicitly described inputs,
- possibly evaluate a fully assigned Boolean formula directly.

All of that is polynomial time.

Hence

$$
L_{\neg\mathsf{SAT}} \in \mathsf{NP}.
$$

Equivalently, correctness of a guessed SAT circuit is a $\mathsf{coNP}$-type condition, whose **failure** has an NP witness.

## How this proves the collapse

Now simulate an $\mathsf{NP}^{\mathsf{NP}}$ computation as follows.

On input $x$:

1. existentially guess the ordinary $\mathsf{NP}$ witness for the outer computation,
2. existentially guess a polynomial-size circuit $C$ for SAT on all formulas of relevant size,
3. universally require that no NP witness of incorrectness for $C$ exists, or equivalently place the correctness test at the second level,
4. use $C$ in place of every SAT oracle query.

Thus the whole computation can be expressed within $\Sigma_2^P$.

Therefore, under the assumption $\mathsf{NP} \subseteq \mathsf{P}/\mathsf{poly}$,

$$
\mathsf{NP}^{\mathsf{NP}} \subseteq \Sigma_2^P.
$$

Iterating the same idea gives

$$
\mathsf{PH} \subseteq \Sigma_2^P,
$$

so PH collapses to the second level.

## Intuition

The verification works because SAT is not just any NP-complete language; it has a very useful recursive structure.

A guessed circuit for SAT is checked by asking:

- does it decompose satisfiability correctly under variable assignment?
- does it give the right answer on leaf formulas?

That turns a global claim, "this circuit solves SAT on all inputs," into a family of local consistency checks plus easy base cases.
