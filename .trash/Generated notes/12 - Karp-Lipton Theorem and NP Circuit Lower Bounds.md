# 12 - Karp-Lipton Theorem and NP Circuit Lower Bounds

![[assets/cc_lecture_8_4_2020_page_01.png]]

## Main message

A central theorem of Karp and Lipton says:

$$
\forall k \ \exists L \in \mathsf{NP}^{\mathsf{NP}} \text{ such that } L \notin \mathsf{SIZE}(n^k+k).
$$

Since $\mathsf{NP}^{\mathsf{NP}} = \Sigma_2^P$, this gives nonuniform lower bounds for the second level of the polynomial hierarchy.

The lecture first revisits the older diagonalization-style idea for plain $\mathsf{NP}$:

$$
\forall k \ \exists L \in \mathsf{NP} \text{ such that } L \notin \mathsf{SIZE}(n^k+k).
$$

This is exactly the type of lower bound one wants: for every fixed polynomial size bound, there is an $\mathsf{NP}$ language that cannot be computed by circuits of that size.

## Circuit classes and notation

- $\mathsf{SIZE}(s(n))$ is the class of languages decided by Boolean circuits of size at most $s(n)$.
- $\mathsf{AC}^0$ is the class of bounded-depth, polynomial-size circuits with unbounded fan-in AND/OR gates.
- When we write $L \notin \mathsf{SIZE}(n^k+k)$, we mean that **no** family of circuits of size at most $n^k+k$ computes $L$ on all input lengths.

## The diagonalization idea

Fix a length $n$. There are only finitely many circuits of size at most $n^k+k$ on $n$ input bits, so there are only finitely many Boolean functions on $\{0,1\}^n$ that these circuits compute.

The crude counting idea is:

1. enumerate all circuits of size at most $n^k+k$,
2. list the functions they compute,
3. define a new Boolean function $f_n$ on $n$ bits that disagrees with every one of them at some point.

Then $f_n$ cannot be computed by any circuit of size at most $n^k+k$.

The difficulty is not existence, but **complexity of the language we build**. We want the resulting language to stay inside a low complexity class such as $\mathsf{NP}$ or $\Sigma_2^P$.

## Truth-table encoding of a hard function

The lecture sketches the standard trick: encode the truth table of a Boolean function into a long binary string and make the language talk about prefixes of such truth tables.

An input $x$ of length $n$ indexes one position in the truth table of a function on $n$ bits. If we had a truth table $a$ of length $2^n$, then the bit $a_x$ is the value of the function on input $x$.

So one tries to define a language that says, roughly:

> there exists a truth-table prefix $a$ that is **incompatible** with all small circuits.

Then, given $x$, the machine can guess such an $a$ and output the corresponding bit $a_x$.

This is the heart of the Karp-Lipton style construction: use a succinct existential witness describing a function that no small circuit can realize.

## Why this is nontrivial

The witness string $a$ is meant to encode partial information about a truth table of an exponentially large function. So to keep the language in a low class, we cannot explicitly compare against all small circuits by brute force in deterministic polynomial time.

Instead we package the condition into a language that is easy to verify with nondeterminism and oracle access.

## What the theorem ultimately gives

The outcome is a robust nonuniform lower bound:

$$
\forall k \ \exists L \in \Sigma_2^P \text{ such that } L \notin \mathsf{SIZE}(n^k+k).
$$

Equivalently, every fixed polynomial size bound fails for some language in $\Sigma_2^P$.

This is important because proving similar lower bounds for $\mathsf{NP}$ itself is a famous open problem.

## Intuition

Why does going one level higher help?

Because the obstruction is: "this guessed function defeats **every** small circuit."  
That is an existential guess followed by a universal obstruction. This naturally looks like second-level polynomial hierarchy structure:

$$
\exists a \ \forall C \ \text{``$a$ disagrees with $C$ somewhere''}.
$$

That is exactly why $\Sigma_2^P$ appears.
