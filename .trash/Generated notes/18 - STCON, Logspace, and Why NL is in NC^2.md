# 18 - STCON, Logspace, and Why NL is in NC^2

![[assets/cc_lecture_15_4_2020_page_03.png]]
![[assets/cc_lecture_15_4_2020_page_04.png]]

## Logarithmic space classes

The lecture recalls the definitions

$$
\mathsf{LOG} = \mathsf{DSPACE}(\log n),
\qquad
\mathsf{NL} = \mathsf{NSPACE}(\log n).
$$

A logspace machine has read-only access to the input and only $O(\log n)$ writable work tape cells.

That amount of space is tiny: with $O(\log n)$ bits, the machine can only store polynomially many different work-tape configurations. This is the reason that configuration graphs of logspace machines have polynomial size.

## The canonical NL-complete problem: STCON

The central problem is directed $s$-$t$ reachability:

$$
\mathsf{STCON} = \{(G,s,t) : \text{there is a directed path from } s \text{ to } t \text{ in } G\}.
$$

This problem is complete for $\mathsf{NL}$.

Membership in $\mathsf{NL}$ is immediate: a nondeterministic logspace machine can start at $s$, repeatedly guess the next vertex, and accept if it reaches $t$ within at most $|V|$ steps.

It needs only to store:

- the current vertex,
- a step counter up to $|V|$.

Both require only $O(\log n)$ space.

## Why every NL computation becomes reachability

Let $M$ be a nondeterministic logspace machine on input $x$.

A **configuration** of $M$ records all information needed to continue the computation:

- current state,
- positions of the heads,
- work tape contents,
- head position on the work tape.

Because the work tape has only $O(\log n)$ cells, the number of possible configurations is polynomial in $n$.

More precisely, each configuration is described by $O(\log n)$ bits, hence the number of configurations is at most

$$
2^{O(\log n)} = n^{O(1)}.
$$

Now construct the configuration graph $G_{M,x}$:

- vertices are configurations of $M$ on input $x$,
- there is an edge $c \to c'$ if $M$ can move from $c$ to $c'$ in one step.

Then $M$ accepts $x$ iff there is a path in $G_{M,x}$ from the start configuration to some accepting configuration.

So deciding the behavior of $M$ reduces to an instance of $\mathsf{STCON}$.

This proves that $\mathsf{STCON}$ is $\mathsf{NL}$-hard, and therefore $\mathsf{NL}$-complete.

## Why this matters for parallel complexity

Once we know that every $\mathsf{NL}$ problem can be reduced to reachability, it is enough to design a small-depth polynomial-size circuit for $\mathsf{STCON}$.

That is exactly the route taken in the rest of the lecture:

1. encode the graph by its adjacency matrix,
2. use Boolean matrix powering to test existence of walks of bounded length,
3. implement matrix squaring by a shallow circuit,
4. conclude that reachability is in $\mathsf{NC}^2$.

So the theorem to remember is:

$$
\mathsf{NL} \subseteq \mathsf{NC}^2.
$$

This is one of the classical examples showing that some apparently sequential graph search problems can in fact be parallelized.
