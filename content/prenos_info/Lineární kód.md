Kontrolní matice $H \in \{ 0,1 \}^{n \times (n- k)}$, tedy
$$
y\in \{ 0,1 \}^n: y\in C \iff yH = 0^{n-k}.
$$
$H$ je báze ortogonálního doplňku $\{ y \mid y=xG \}= C$.

Zápis lineárního kódu je $[n,k,d]$ na rozdíl od $(n,k,d)$.

---
Mějme $[n,k,d]_{q}$ a vezmeme-li kódová slova, tak platí
$$
\forall x,y\in C: x+y \in C; x-y \in C; \quad \forall \alpha\in GF[q]: \alpha x\in C.
$$
Pozorujme
$$
d_{Ham} (x,y)= |\{ i, x_{i} \ne y_{i} \}| = |\{ i, (x-y)_{i}\ne 0 \}| = wt_{Ham} (x-y).
$$
A tedy zajímá-li nás $d(C)=\min_{x\ne y\in C} d_{Ham}(x,y)$ a to je dle pozorování stejné jako 
$$
\min_{x\ne y\in C} wt_{Ham}(x-y) = \min_{z\in C; z\ne 0} wt_{Ham}(z).
$$
---
### *Věta (Singelton):* $\forall$ kód $C$, $[n,k,d]_{q}$, kde $n\geq k+d-1$.
*Důkaz:* 