# Alternation and the Polynomial Hierarchy

## 1. From full alternation to bounded alternation

The previous lecture explained that unrestricted polynomial-time alternation gives all of $\mathrm{PSPACE}$:

$$
\mathrm{AP} = \mathrm{PSPACE}.
$$

This lecture now asks what happens if we only allow **a bounded number of alternations** between existential and universal choices.

That leads to the **polynomial hierarchy**.

Very roughly:

- only existential choices correspond to $\mathrm{NP}$,
- only universal choices correspond to $\mathrm{coNP}$,
- one alternation gives the second level,
- two alternations give the third level,
- and so on.

---

## 2. Existential and universal polynomial time

If a polynomial-time alternating machine uses only existential states, then it is just an ordinary nondeterministic polynomial-time machine. Thus

$$
\Sigma_1^P = \mathrm{NP}.
$$

If it uses only universal states, we get the complementary notion:

$$
\Pi_1^P = \mathrm{coNP}.
$$

The lecture pictures this by drawing a purely existential computation tree for NP and a purely universal one for coNP.

---

## 3. One alternation

Now consider a polynomial-time alternating computation that first makes existential choices and then, below them, universal choices.

Semantically this corresponds to quantified formulas of the form

$$
\exists x\, \forall y\, \varphi(x,y),
$$

where $\varphi$ is a polynomial-time decidable predicate, or equivalently a polynomial-size Boolean formula.

The meaning is:

- we are looking for a witness $x$,
- such that for every counter-choice $y$,
- the predicate $\varphi(x,y)$ holds.

This is a natural generalization of NP. In NP we only ask for an existential witness. Here we ask for an existential witness that survives all universal challenges.

This is the second existential level of the hierarchy.

---

## 4. General bounded alternation

More generally, a computation with $k-1$ alternations beginning existentially corresponds to a quantified prefix of the form

$$
\exists X_1\, \forall X_2\, \exists X_3\, \cdots\, Q_k X_k,
$$

where each block $X_i$ contains polynomially many bits and the matrix is polynomial-time decidable.

Similarly, if the prefix begins universally, we obtain the dual class.

So bounded alternation is a computation model whose syntactic counterpart is **bounded-depth quantifier alternation** in QBF.

---

## 5. Why this is different from PSPACE

For PSPACE, the number of alternations may grow polynomially with the input size, because the quantified Boolean formula produced in the PSPACE-completeness proof may have polynomially many alternating blocks.

For the polynomial hierarchy, the number of alternations is **fixed in advance**. For example:

- one block: NP or coNP,
- two blocks: second level,
- three blocks: third level.

That is why the polynomial hierarchy is viewed as a refined stratification lying below full PSPACE.

---

## 6. The picture to keep in mind

The lecture draws a triangle-like picture:

- the top corresponds to few alternations,
- as one goes down, more alternations are allowed,
- the union over all fixed levels forms the hierarchy.

So the polynomial hierarchy is not one class but a family of classes measuring the complexity of **how many alternations of quantifiers are needed**.

The next note makes the formal definitions.
