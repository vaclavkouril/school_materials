# 25 - Parity, AC^0[p], and MOD Gates

![[assets/cc_lecture_22_4_2020_p05.png]]

## Parity

The parity function is

$$
\mathrm{PARITY}(x_1,\dots,x_n)
=
\sum_{i=1}^n x_i \bmod 2.
$$

It outputs $1$ iff an odd number of the inputs are $1$.

A central lower bound says

$$
\mathrm{PARITY} \notin AC^0.
$$

This is far stronger than the counting argument because parity is explicit and natural.

## Consequence

Since parity is in $P$, the lower bound immediately implies

$$
P \nsubseteq AC^0.
$$

## Relation to addition

If one could sum many bits in $AC^0$, then the least significant bit of the sum would give parity. So parity lower bounds obstruct certain constant-depth arithmetic constructions.

## The classes $AC^0[p]$

To enrich the model, we may add modular counting gates. A $\mathrm{MOD}_q$ gate outputs $1$ iff the number of $1$-inputs is divisible by $q$:

$$
\mathrm{MOD}_q(y_1,\dots,y_m)=1
\iff
\sum_{i=1}^m y_i \equiv 0 \pmod q.
$$

Then $AC^0[q]$ consists of constant-depth, polynomial-size circuits with unbounded fan-in gates of types AND, OR, NOT, and $\mathrm{MOD}_q$.

For $q=2$, parity becomes easy, because parity is just the negation of divisibility by $2$:

$$
\mathrm{PARITY}(y_1,\dots,y_m)=\neg \mathrm{MOD}_2(y_1,\dots,y_m).
$$

Hence

$$
\mathrm{PARITY} \in AC^0[2].
$$

## Different moduli

The lecture alludes to the deep fact that different moduli genuinely matter: for distinct primes $p \neq q$, the class $AC^0[p]$ has difficulty computing $\mathrm{MOD}_q$. This is one of the main consequences of the Razborov--Smolensky polynomial method.
