# QBF is PSPACE-complete

## 1. Goal

The lecture continues the proof that quantified Boolean formulas capture polynomial space.

The target statement is

$$
\mathrm{QBF} \text{ is PSPACE-complete.}
$$

Membership in $\mathrm{PSPACE}$ is straightforward: one can evaluate a quantified Boolean formula by recursively processing the outermost quantifier and reusing memory. The harder direction is PSPACE-hardness.

So let

$$
L \in \mathrm{PSPACE}.
$$

We want to transform an input $x$ into a quantified Boolean formula $\Phi_x$ such that

$$
x \in L \iff \Phi_x \text{ is true}.
$$

---

## 2. Start with a polynomial-space machine

Let $M$ be a deterministic Turing machine deciding $L$ and using at most $p(n)$ space on inputs of length $n$.

Fix an input $x \in \{0,1\}^n$.
Since only $p(n)$ tape cells may be used, every configuration of $M$ has a binary encoding of length $O(p(n))$:

- the current state,
- the work tape contents,
- the head positions,
- and the input head position if needed.

Hence the number of possible configurations is at most

$$
2^{O(p(n))}.
$$

This means that although the computation may be exponentially long, the machine moves inside an exponentially large but finite **configuration graph**.

---

## 3. Configuration graph and reachability

Define the graph $G_x$ as follows:

- vertices are configurations of $M$ on input $x$,
- there is an edge $C \to C'$ iff $M$ can move from $C$ to $C'$ in one step.

Let $s$ be the start configuration on input $x$, and let $t$ be the unique accepting configuration.
Then

$$
x \in L \iff \text{there is a path from } s \text{ to } t \text{ in } G_x.
$$

So everything reduces to reachability in a graph of exponential size but with succinctly encoded vertices.

---

## 4. Recursive reachability predicate

The lecture introduces formulas of the form $\operatorname{path}_k(w,v)$.
The intended meaning is:

$$
\operatorname{path}_k(w,v) = 1
$$
iff there is a path from configuration $w$ to configuration $v$ of length at most $2^k$.

Here $w$ and $v$ are not graph names but **binary encodings of configurations**.
Because one configuration uses only $O(p(n))$ bits, all variables describing $w$ and $v$ are polynomially many.

### Base case

For $k=0$, a path of length at most $1$ means either:

- $w=v$, or
- there is a single legal transition $w \to v$.

Thus $\operatorname{path}_0(w,v)$ can be written by a Boolean formula of polynomial size. Indeed, checking equality of two configuration encodings is polynomial, and checking whether one legal machine step transforms $w$ into $v$ is also polynomial.

So:

$$
\operatorname{path}_0(w,v)
$$

has a polynomial-size propositional description.

### Recursive step

A path of length at most $2^k$ exists iff there is some midpoint $u$ such that:

- there is a path from $w$ to $u$ of length at most $2^{k-1}$, and
- there is a path from $u$ to $v$ of length at most $2^{k-1}$.

Therefore

$$
\operatorname{path}_k(w,v)
\equiv
\exists u\, \bigl(\operatorname{path}_{k-1}(w,u) \wedge \operatorname{path}_{k-1}(u,v)\bigr).
$$

This is the standard divide-and-conquer idea behind Savitch's theorem as well.

---

## 5. Why the naive recursion is too large

If we substitute the definition recursively in the obvious way, the resulting formula blows up exponentially in $k$, because each occurrence of $\operatorname{path}_{k-1}$ gets duplicated.

Since we need to reach path lengths up to roughly the number of configurations,

$$
2^k \approx 2^{p(n)},
$$

we only need

$$
k = O(p(n)),
$$

which is polynomial. But naive expansion would still produce a formula of exponential size.

So we need a better way to write the recursion.

---

## 6. The quantifier trick from the lecture

The lecture sketches the standard trick: instead of duplicating subformulas, quantify over both halves and use implication to select the relevant one.

The idea is to express

$$
\operatorname{path}_k(w,v)
$$

by saying that there exists a midpoint $u$, and for **all** pairs $(w',v')$, if $(w',v')$ is one of the two relevant pairs,

$$
(w',v')=(w,u) \quad \text{or} \quad (w',v')=(u,v),
$$

then $\operatorname{path}_{k-1}(w',v')$ must hold.

Symbolically one writes something of the form

$$
\operatorname{path}_k(w,v)
\equiv
\exists u\, \forall w'\, \forall v'\,
\Bigl(
\bigl(((w'=w)\wedge(v'=u)) \vee ((w'=u)\wedge(v'=v))\bigr)
\to
\operatorname{path}_{k-1}(w',v')
\Bigr).
$$

Why does this help? Because now only **one** copy of $\operatorname{path}_{k-1}$ appears syntactically. The price is extra quantifiers, but the formula size stays polynomial.

This is exactly what the handwritten pages indicate when they rewrite the recursive conjunction into a universally quantified implication.

---

## 7. Unrolling the recursion

Apply the above construction for

$$
k = \ell(n)
$$

where $2^{\ell(n)}$ exceeds the number of configurations. Since the latter is at most $2^{O(p(n))}$, we can choose

$$
\ell(n)=O(p(n)).
$$

At each level we introduce only polynomially many fresh variables, because a configuration encoding has polynomial length.
Thus the final quantified Boolean formula has overall polynomial size.

Let $\bar s$ and $\bar t$ be the binary encodings of the start and accepting configurations. Then we obtain a formula

$$
\Phi_x := \operatorname{path}_{\ell(n)}(\bar s,\bar t)
$$

such that

$$
\Phi_x \text{ is true } \iff \text{there is a path from } s \text{ to } t.
$$

Therefore

$$
x \in L \iff \Phi_x \text{ is true}.
$$

This proves PSPACE-hardness of QBF.

---

## 8. Conclusion

We have shown:

1. $\mathrm{QBF} \in \mathrm{PSPACE}$,
2. every language in $\mathrm{PSPACE}$ many-one reduces to $\mathrm{QBF}$.

Hence

$$
\mathrm{QBF} \text{ is PSPACE-complete.}
$$

Because a quantified Boolean formula can also be evaluated by an alternating polynomial-time machine, the lecture concludes that

$$
\mathrm{AP} = \mathrm{PSPACE}.
$$

This is the conceptual bridge from space-bounded computation to alternation.
