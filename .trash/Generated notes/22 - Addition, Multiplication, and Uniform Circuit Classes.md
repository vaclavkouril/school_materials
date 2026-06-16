# 22 - Addition, Multiplication, and Uniform Circuit Classes

![[assets/cc_lecture_22_4_2020_p01.png]]

## Main point

The lecture compares classes such as $NC^1$, $NC^2$, and polynomial-size formulas, then turns to parallel arithmetic.

A circuit family for a language is usually required to have polynomial size, a depth bound such as $O(\log n)$ or $O((\log n)^2)$, bounded fan-in unless stated otherwise, and some form of uniformity.

The page recalls:

- $NL \subseteq NC^2$,
- polynomial-size Boolean formulas correspond to $NC^1$,
- and asks how far small-depth circuit classes might reach with respect to $P$, $NP$, or even $EXP$.

## Arithmetic in small depth

For $NC^1$, the lecture notes that one can compute addition, multiplication, and division.

The difficulty is depth. A ripple-carry adder has linear depth, so it is too sequential. The standard fix is to compute carries in parallel.

## Carry characterization

Suppose

$$
x = x_n x_{n-1} \cdots x_1, \qquad
y = y_n y_{n-1} \cdots y_1.
$$

The carry into position $i$ is $1$ iff there exists a more significant position $j>i$ where a carry is generated and every intermediate position propagates it. A standard formulation is

$$
\mathrm{carry}_i
=
\bigvee_{j=i+1}^n
\left(
(x_j \wedge y_j)
\wedge
\bigwedge_{\ell=i+1}^{j-1} (x_\ell \vee y_\ell)
\right).
$$

More refined versions use propagate bits $x_\ell \oplus y_\ell$. The handwritten note is sketching the standard generate/propagate idea.

## Why this gives logarithmic depth

The expression above is an OR of terms, each involving an AND over a range. Balanced trees compute such ANDs and ORs in depth $O(\log n)$, so all carries can be computed in parallel within $O(\log n)$ depth. Each sum bit is then a local function of the input bits and the carry.

Hence addition is in $NC^1$.

## Why multiplication is plausible

Multiplication reduces to summing many shifted partial products. The real issue is therefore how to add many integers in parallel. That is the topic of the next note.
