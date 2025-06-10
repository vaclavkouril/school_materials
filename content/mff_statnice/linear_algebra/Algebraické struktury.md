# Grupy a podgrupy
*Definice:* Binární operace na množině $X$ je zobrazení $X \times X\to X$.
*Definice:* Grupa je $(G, \circ)$, kde $G$ je množina spolu s binární operací $\circ: G \times G\to G$. Taková operace musí splňovat
1. asociativitu: $\forall a,b,c \in G: (a\circ b) \circ c = a\circ (b \circ c)$,
2. existenci neutrálního prvku: $\exists e\in G, \forall a \in G: a \circ e = e\circ a =a$,
3. existence inverzních prvků: $\forall a \in G, \exists b\in G: a \circ b = b \circ a = e$.
Platí-li navíc komutativita $\circ$, tedy $\forall a,b\in G: a\circ b =b \circ a$, pak zveme grupu **Abelovská**.

*Definice:* Grupa $(H, \bullet )$ je podgrupou $(G,\circ)$, jestliže $H \subseteq G$ a $\forall a,b \in H: a \bullet b = a \circ b$, zapisujeme $(H, \bullet) \le (G, \circ).$

---
# Permutace
Definice: Permutace na množině $\{1, 2,\dots, n\}$ je bijektivní zobrazení $p : {1, 2,\dots , n} → {1, 2,\dots , n}$.
*Pozorování*: Množina $S_n$ všech permutací na $n$ prvcích s operací skládání $\circ$ tvoří symetrickou grupu $(S_n, \circ)$.
Zápis skládání: $(q \circ p)(i) = q(p(i))$.

---
# Tělesa
*Definice:* Těleso je množina $T$ spolu se dvěma binárními operacemi $+ \text{ a }\cdot,$ kde $(T,+)$ a $(T \setminus \{ 0 \}, \cdot)$ jsou (Abelovské) grupy a navíc $\forall a,b,c \in T: a \cdot(b+c) = (a \cdot b) + (a \cdot c)$.
Jinými slovy musí pro těleso platit:
1. $\forall a,b \in T: a+b =b+a$
2. $\forall a,b,c \in T: (a+b) +c = a+ (b+c)$
3. $\exists 0 \in T, \forall a \in T: a+0 =a$
4. $\forall a \in T, \exists - a \in T: a+ (-a) =0$
5. $\forall a,b \in T: a\cdot b = b \cdot a$
6. $\forall a,b,c \in T \setminus \{ 0 \} : (a\cdot b) \cdot c = a\cdot (b\cdot c)$
7. $\exists 1 \in T \setminus \{ 0 \}, \forall a \in T \setminus \{  0 \}: a \cdot 1 =a$
8. $\forall a \in T \setminus \{  0 \}, \exists a^{-1} \in T \setminus \{ 0 \} : a \cdot a^{-1} =1$
9. $\forall a,b,c \in T: a \cdot(b+c) = (a \cdot b) + (a \cdot c)$

*Věta:* $\mathbb{Z}_{p}$ je těleso $\iff$ $p$ je prvočíslo.
Důkaz všech axiomů je v modulární aritmetice triviální, díky vlastnostem $\mathbb{Z}$, až na existenci $a^{-1}$. Mějme $f_{a} : \{ 1,2,\dots,p-1 \} \to \{ 1,2,\dots,p-1 \}$ takovou, že $f_{a}(x)  = ax\mod(p)$, stačí nám ukázat, že je na, což ukáže i existenci takového $x$ které v modulární aritmetice vyjde $1$. Tvrdíme, že takové zobrazení je permutace a tedy prosté a na. Pro spor předpokládejme, že není prosté, pak existují $b,c: b>c$ takové, že $f_{a}(b) = f_{a}(c) \implies 0 = f_{a}(b) - f_{a}(c) \equiv a (b-c) \mod p$, což je ale spor s výběrem $p$ jako prvočísla.