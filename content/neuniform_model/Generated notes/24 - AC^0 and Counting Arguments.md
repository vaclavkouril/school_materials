# 24 - AC^0 and Counting Arguments

![[assets/cc_lecture_22_4_2020_p04.png]]

## Definition of $AC^0$

The lecture now turns to constant-depth circuits with unbounded fan-in.

A language is in $AC^0$ if it is decided by a circuit family $\{C_n\}_{n\ge 1}$ such that:

- each $C_n$ uses AND, OR, NOT gates,
- AND and OR gates may have unbounded fan-in,
- the depth is bounded by a constant,
- the size is polynomial in $n$,
- and the family is uniform in the intended complexity-theoretic sense.

## Why $AC^0 \subseteq NC^1$

Any unbounded fan-in AND or OR gate with at most polynomially many inputs can be replaced by a balanced binary tree of the same operation. If the gate has at most $n^c$ inputs, this replacement has depth $O(\log n)$.

Thus a depth-$d$ $AC^0$ circuit becomes a bounded-fan-in circuit of depth

$$
O(d \log n)=O(\log n),
$$

since $d$ is constant. Therefore

$$
AC^0 \subseteq NC^1.
$$

## Counting argument

For fixed depth $d$ and polynomial size bound $p(n)$, the number of circuits on $n$ variables of depth at most $d$ and size at most $p(n)$ is at most

$$
2^{\mathrm{poly}(n)},
$$

because a polynomial amount of information suffices to describe the gates and wires.

But the number of Boolean functions on $n$ variables is

$$
2^{2^n},
$$

since each function corresponds to a truth table of length $2^n$.

For large $n$,

$$
2^{\mathrm{poly}(n)} \ll 2^{2^n}.
$$

Hence there exist Boolean functions that are not computable by polynomial-size constant-depth circuits.

## What this proves

This proves that $AC^0$ does not contain all Boolean functions.

## What it does not prove

It does not identify an explicit natural function outside $AC^0$. For that one needs genuine lower-bound methods. The next note discusses parity.
