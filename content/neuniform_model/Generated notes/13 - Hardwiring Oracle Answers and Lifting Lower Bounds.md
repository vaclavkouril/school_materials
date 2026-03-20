# 13 - Hardwiring Oracle Answers and Lifting Lower Bounds

![[assets/cc_lecture_8_4_2020_page_02.png]]
![[assets/cc_lecture_8_4_2020_page_03.png]]

## The auxiliary language $S$

The lecture introduces a language of the form

$$
S = \{ a\,0\,1^n\,0\,1^m \;:\; a \text{ is a prefix of a truth table of a function on } n \text{ bits}
\text{ computable by some circuit of size } m \}.
$$

The exact separators are not important; they just make the encoding parseable.

The point is that membership in $S$ says:

> the prefix $a$ is consistent with some circuit of size $m$.

So non-membership says:

> no circuit of size $m$ has a truth table beginning with prefix $a$.

That is the diagonalization certificate we need.

## Why $S \in \mathsf{NP}$

Suppose the input is

$$
w = a\,0\,1^n\,0\,1^m.
$$

A nondeterministic verifier can:

1. guess a circuit $C$ of size at most $m$ on $n$ input bits,
2. compute the relevant initial segment of its truth table,
3. check that this initial segment equals $a$.

If yes, accept.

This is polynomial in $|w|$ because the verifier only has to simulate a circuit of size polynomial in the encoded parameter $m$, and the prefix $a$ is part of the input.

Hence

$$
S \in \mathsf{NP}.
$$

## Using $S$ as an oracle

Now let $L$ be the diagonal language we are trying to define. On input $x$ of length $n$, the machine guesses a prefix $a$ long enough to determine the bit corresponding to $x$, and then asks whether

$$
a\,0\,1^n\,0\,1^{n^k+k} \in S.
$$

- If the answer is **yes**, then $a$ is still compatible with some circuit of size $n^k+k$.
- If the answer is **no**, then $a$ already witnesses inconsistency with every such circuit.

So a nondeterministic polynomial-time machine with oracle access to $S$ can guess a suitable $a$ and use the answer to define the desired hard language.

Therefore the constructed language lies in

$$
\mathsf{NP}^S = \mathsf{NP}^{\mathsf{NP}} = \Sigma_2^P.
$$

## Why the first accepted prefix matters

The lecture then refines the construction to a language $S'$.

The issue is that many prefixes can be incompatible with small circuits, and we want a canonical choice so that the resulting language is well-defined.

So define $S'$ roughly by:

$$
S' = \{a\,0\,1^n\,0\,1^m : a \in S \text{ or some lexicographically smaller } a' <_{\mathrm{lex}} a \text{ is not in } S\}.
$$

In words, $S'$ marks the first place where incompatibility appears.

This turns the nondeterministic search into a canonical diagonal choice.

## Why $S' \in \mathsf{NP}^{\mathsf{NP}}$

To test membership in $S'$:

- either verify directly that the input is in $S$, which is an $\mathsf{NP}$ property,
- or guess a smaller prefix $a' < a$ and verify that $a' \notin S$.

The second condition is a nondeterministic step with an $\mathsf{NP}$ oracle query, hence still in $\mathsf{NP}^{\mathsf{NP}}$.

So

$$
S' \in \Sigma_2^P.
$$

## Conceptual point

The whole trick is to turn a nonuniform counting argument into a uniform machine computation.

- The witness $a$ represents a piece of a hard truth table.
- The oracle $S$ checks compatibility with small circuits.
- The refinement $S'$ chooses a canonical witness.

That is how one lifts the counting lower bound into a language in the second level of PH.
