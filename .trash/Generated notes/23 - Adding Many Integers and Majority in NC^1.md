# 23 - Adding Many Integers and Majority in NC^1

![[assets/cc_lecture_22_4_2020_p02.png]]
![[assets/cc_lecture_22_4_2020_p03.png]]

## Summing many integers

To multiply two $n$-bit numbers in parallel, one forms $n$ shifted partial products and then sums them. The lecture sketches a compression method that replaces the sum of three integers by the sum of two integers, column by column.

## Three-to-two compression

In one bit-column, three bits $a,b,c \in \{0,1\}$ sum to one of

$$
0,1,2,3.
$$

This can be encoded by:

- one bit left in the same column,
- one carry bit sent to the next column.

So three rows can be replaced by two rows by constant-depth local circuitry. This is just a fully parallel full-adder layer.

After one compression step:

- $3$ rows become $2$ rows,
- so $n$ rows become about $\frac{2n}{3}$ rows.

Iterating yields

$$
n \to \frac{2}{3}n \to \left(\frac{2}{3}\right)^2 n \to \cdots
$$

Therefore after $O(\log n)$ levels only constantly many rows remain. Those can then be added by the $NC^1$ adder from the previous note.

So the sum of $n$ many $n$-bit integers can be computed by a polynomial-size circuit of depth $O(\log n)$.

## Consequence for multiplication

Multiplication of two $n$-bit integers proceeds by:

1. forming the $n$ shifted partial products,
2. compressing the $n$ rows down to two rows in $O(\log n)$ depth,
3. adding the last two rows.

Hence multiplication is in $NC^1$.

## Majority

The majority function is

$$
\mathrm{MAJ}(x_1,\dots,x_n)
=
\left[
\sum_{i=1}^n x_i \geq \frac{n}{2}
\right].
$$

It belongs to $NC^1$ because we can sum the input bits in depth $O(\log n)$ and then compare the result with $n/2$.

## Conceptual takeaway

Small-depth bounded-fan-in circuits can already perform substantial arithmetic, provided the computation is arranged in a tree-like parallel form rather than sequentially.
