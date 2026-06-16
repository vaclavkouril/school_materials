# Oracle Computation and $P^{\mathrm{SAT}}$

## 1. What is an oracle?

An **oracle** for a language $A \subseteq \{0,1\}^*$ is an abstract black box that answers membership queries instantly.

Given a word $w$, one may ask:

$$
w \in A ?
$$

and receive the answer in one computation step.

A Turing machine with access to such a black box is called an **oracle machine**.

The lecture draws this by giving the machine a separate query tape. The machine writes a string $w$ onto that tape, enters a special query state, and immediately branches according to whether $w \in A$.

---

## 2. The class $P^A$

The notation

$$
P^A
$$

means: polynomial-time deterministic computation with oracle access to $A$.

So a language $L$ lies in $P^A$ iff some deterministic polynomial-time machine can decide $L$ while being allowed to ask polynomially many unit-cost queries of the form “is $w \in A$?”

The oracle language $A$ may be easy or hard; the class measures what becomes efficiently computable if such queries are free.

---

## 3. Example: $P^{\mathrm{SAT}}$

The most important example in the lecture is

$$
P^{\mathrm{SAT}}.
$$

This means deterministic polynomial time with the power to ask whether a Boolean formula is satisfiable.

For instance, instead of solving SAT directly, the machine may repeatedly submit formulas to the SAT oracle and use the yes/no answers as subroutines.

---

## 4. Why coNP is inside $P^{\mathrm{SAT}}$

The lecture uses TAUT as the example.
Recall:

$$
\varphi \in \mathrm{TAUT}
\iff
\neg \varphi \notin \mathrm{SAT}.
$$

So to decide whether $\varphi$ is a tautology, it is enough to query the SAT oracle on $\neg\varphi$.

- if $\neg\varphi \in \mathrm{SAT}$, then some assignment falsifies $\varphi$, so $\varphi \notin \mathrm{TAUT}$;
- if $\neg\varphi \notin \mathrm{SAT}$, then no assignment falsifies $\varphi$, so $\varphi \in \mathrm{TAUT}$.

Hence

$$
\mathrm{TAUT} \in P^{\mathrm{SAT}}.
$$

Since TAUT is coNP-complete, this shows in particular that

$$
\mathrm{coNP} \subseteq P^{\mathrm{SAT}}.
$$

And of course also

$$
\mathrm{NP} \subseteq P^{\mathrm{SAT}},
$$

because SAT itself can be solved in one oracle query.

---

## 5. NP oracles and SAT oracles

The lecture also writes

$$
P^{\mathrm{NP}} = \bigcup_{A \in \mathrm{NP}} P^A = P^{\mathrm{SAT}}.
$$

Why is that true?

Because SAT is NP-complete. Let $A \in \mathrm{NP}$. Then there is a polynomial-time many-one reduction

$$
f : \{0,1\}^* \to \{0,1\}^*
$$

such that

$$
w \in A \iff f(w) \in \mathrm{SAT}.
$$

So any single oracle query “is $w \in A$?” can be simulated in polynomial time by computing $f(w)$ and asking instead “is $f(w) \in \mathrm{SAT}$?”. Therefore every $P^A$ with $A \in \mathrm{NP}$ is contained in $P^{\mathrm{SAT}}$.

The reverse inclusion is immediate since $\mathrm{SAT} \in \mathrm{NP}$.

So SAT is a canonical representative for all NP oracles at deterministic polynomial time.

---

## 6. Why oracles matter for the hierarchy

Oracle access lets us package one whole complexity class as a primitive operation.
For example, once SAT is available in unit time, we can build more complicated computations around it. This is exactly how the second level of the polynomial hierarchy can be described in machine terms, which is the subject of the next note.
