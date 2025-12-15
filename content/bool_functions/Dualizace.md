#dualizace

*Definice:* Nechť $f(x_{1},\dots,x_{n})$ je booleovská funkce, pak její duální funkce $f^d$ je definovaná
$$
f^d(x_{1},\dots,x_{n}) = \neg f(\neg x_{1},\dots,\neg x_{n}) \qquad \left(\implies (f^d)^d = f\right).
$$
*Příklad:* $f(x_{1},\dots,x_{5}) = (x_{1} \lor x_{2}) \land (x_{3} \lor x_{4}) \land (x_{1} \lor x_{4} \lor x_{5}) \land (x_{2} \lor x_{3} \lor x_{5})$ pak
$$
\begin{align*}
f^d(x_{1},\dots,x_{5}) &= (x_{1} \land x_{2}) \lor (x_{3} \land x_{4}) \lor (x_{1} \land x_{4} \land x_{5}) \lor (x_{2} \land x_{3} \land x_{5}) \\
&= \big((x_{1} \lor x_{3})\land(x_{1} \lor x_{4}) \land (x_{2} \lor x_{3})\land(x_{2} \lor x_{4}) \big) \lor \\
&\qquad \lor \big((x_{1} \lor x_{3})\land(x_{1} \lor x_{2}) \land (x_{1} \lor x_{3})\land(x_{4} \lor x_{2}) \land (x_{4} \lor x_{3}) \land (x_{5}) \big) \\
&= (x_{1} \lor x_{3}) \land (x_{2} \lor x_{4}) \land (x_{1} \lor x_{4} \lor x_{5}) \land(x_{2} \lor x_{3} \lor x_{5})
\end{align*}
$$
#implikant 

*Pozorování:* Primární implikanty $f^d$ jsou minimální (s ohledem na $\subseteq$)  transversály implikantů $f$ (navzájem jsou minimální transversály). 

Transversála pro $A$ je množina $B$, že $\forall a \in A : a \cap B \ne \emptyset$. Minimální transversála vzhledem k $\subseteq$ je taková transversála, že už nemůžeme odebrat prvek aby stále byla transversála.
![[transversal.svg]] 
Klauzule $f$ jsou $s-t$-cesty a $f^d$ klauzule jsou $s-t$-řezy

---
# Složitost dualizace
V obecnosti je to těžké i pro pozitivní funkce, protože dual $f^d$ může být exponenciálně větší než $f$.

*Příklad:* $f(x_{1},\dots,x_{n},y_{1},\dots,y_{n}) = (x_{1} \lor y_{1}) \land \dots \land(x_{n} \lor y_{n})$, pak
$$
f^d(x_{1},\dots,x_{n},y_{1},\dots,y_{n}) = (x_{1} \land y_{1}) \lor \dots \lor (x_{n} \land y_{n}) = \bigwedge_{I \subseteq \{ 1,\dots,n \}} \left(\bigvee_{i\in I} x_{i} \lor \bigvee_{j \not\in I} y_{j} \right)
$$
a tedy velikost $|f| = 2n$ ale $|f^d| =n2^n$.

---
## Pozorování o regulárních funkcích
#regulární_funkce #cnf 

Můžeme ale ukázat, že dualizace může být v čase $O(n^2m^2)$ pro regulární funkce dané kanonickým CNF. 

*Definice:* Nechť $f(x_{1},\dots,x_{n})$ je pozitivní booleovská funkce, pak $X \in \{ 0,1 \}^n$ je minimální pravdivý bod (MTP, minimal true point) funkce $f$ 
$$
\iff f(X) = 1 \,\&\, \forall i \text{, kde } x_{i} = 1: f(X \setminus e_{i}) = 0.
$$
$X\in \{ 0,1 \}^n$ je maximal false point (MFP) funkce $f$
$$
\iff f(X) = 0 \,\&\, \forall i\text{, kde } x_{i} = 0 : f(X \cup e_{i}) = 1.
$$

Pokud máme hyperkrychli a v ní seřadím vrcholy do vrstev podle jedniček, kde $0^n$ je na spodku a $1^n$ navrchu, tak True pointy jsou uzavřené směrem nahoru (cesta mezi TP a $1^n$ má všechny vrcholy jako true pointy) a obraceně False pointy jsou uzavřené směrem dolů.
![[hypercube-truepoint.svg|right|300]]
Na obrázku jsou MTP $010, 101$ a MFP $100,001$. Odpovídá to $f(x_{1},x_{2},x_{3}) = (\neg x_{1} \lor x_{2} \lor x_{3}) \land (x_{1} \lor x_{2} \lor \neg x_{3})$ 

*Pozorování 1:* Množinovou reprezentací pro pozitivní funkci $f$ máme: Kanonická CNF pro $f$ $\iff$ seznam všech MFP funkce $f$. Tedy
$$
\text{klauzule } C \iff MFP \text{ nastaví její literály na 0 a vše ostatní na } 1.
$$
*Důkaz:* $\implies$ nechť $X$ je MFP, pak musí nějaká klazule $C$ být False a má tedy $0$ nastavené na svých proměnných, $X$ je maximální, takže nemůže nastavit $0$ mimo $C$, protože kdyby ano, tak ji můžeme nastavit na 1 a z maximality bychom měli dostat True point, ale nedostaneme protože $C$ je stále se všemi $0$.

$\impliedby$ Nechť $C$ je klauzule v $F$, a nechť $X$ je vektor definován $x_{i} =0 \iff x_{i} \in C$. Zjevně je to False point, protože celá $C$ je $0$, navíc, protože vše mimo $C$ je splněno nastavením $X$ (žádná jiná klauzle v kanonickém CNF není podmnožinou $C$) a pokud prohodíme libovolnou $0$ na $1$ tak máme True point tak je $X$ i maximální False point.

*Lemma 1:* Nechť $f$ je pozitivní funkce a $F^d$ je kanonická CNF pro $f^d$, pak 
$$
\text{klauzule } F^d \stackrel{1 - 1}{\iff} \text{Jedničky v } MTP \text{ funkce} f.
$$
*Důkaz Lemma 1:* 
$$
C = \bigvee_{i \in I \subseteq [n]} x_{i} \in F^d \iff X \text{ je } MFP \text{ funkce } f^d (x_{i} = 1 \iff i \in I),
$$
kde množina $0$ v $X$ je minimální a $I$ je nejmenší takové aby to bylo splněno. Pak pokračuje ekvivalence
$$
\neg f(\neg X) = 0 \iff f(Y)= 1 \text{ pro } (y_{i} =1 \iff i \in I)
$$
a množina jedniček v $Y$ je opět minimální, takže máme $\iff Y$ je MTP funkce $f$.

*Pozorování:* Dualizace pozitivni funkce $f$ dané její kanonickou CNF $\leftrightarrow$ S daným seznamem MFP vyrobme všechna MTP.

---
## Regularita a složitost

*Lemma 2:* Nechť $f(x_{1},\dots,x_{n})$ je regulární funkce s $x_{1} \succeq_{f} x_{2}\succeq_{f} \dots \succeq_{f} x_{n}$ a nechť $X \in \{ 0,1 \}^{n-1}$, pak
$$
(X,0) \text{ je } MFP \text{ funkce } f \iff (X, 1) \text{ je } MTP \text{ funkce}  f.
$$
*Důkaz Lemma 2:* $\implies$ mějme $(X,0)$ MFP, pak $(X,1)$ je True point z maximality, mějme $(X \setminus e_{i}, 1)$, pak z regularity $f(X \setminus e_{i}, 1) \leq (X, 0) = 0$ a tedy je $(X,1)$ MTP.

$\impliedby$ mějme MTP $(X,1)$, pak z minimality $(X,0)$ je False point, mějme $(X \cup e_{i}, 0)$, pak pro každé $i$ máme z regularity $f(X \cup e_{i}, 0) \geq f(X,1) = 1$ a tedy je $(X,0)$ maximální (stačí přehodit jeho libovolnou 0 na 1 mále True point).

*Definice:* Mějme $f(x_{1},\dots,x_{n})$ booleovskou funkci a $1 \leq i \le n$, pak $f_{i}$ značí omezení $f$ nastavením $x_{i},x_{i+1},\dots,x_{n} = 0$, tedy $f_{i}$ je funkce v $x_{1},\dots,x_{i-1}$ proměnných a $f_{n+1} = f$.

*Pozorování 2:* Mějme $f(x_{1},\dots,x_{n})$ pozitivní funkci a $X \in \{ 0,1 \}^{n-1}$. Pak
$$
(X,0) \text{ je } MTP \text{ funkce } f \iff X \text{ je } MTP \text{ funkce } f_{n}.
$$
Kombinací *Lemma 1,2* a *Pozorování 1,2* máme návrh iterativního algoritmu generujícího všechna MTP funkce $f$.

##### *Algoritmus (Hledání všech MTP regulární funkce $f$ a $F^d$):* 
0. $i\leftarrow n+1$
1. Pro každou klazuli v kanonické CNF $F_{i}$ funkce $f_{i}$ obsahující $x_{i-1}$ ($\leftrightarrow$ MFP $f_i$ s poslední částí 0 s proměnnou $x_{i-1}$) vygenerujeme odpovídající $MTP$ a odpovídající primární implikáty $f^d$.
2. Nastavíme $x_{i-1} := 0$ a absorbcemi vyrobíme $F_{i-1}$
3. $i \leftarrow i-1$ a když $i > 1$ _goto_ 1.

###### Časová složitost algoritmu
Kroky _0._ a _3._ zaberou $O(1)$, krok _1._ zabere $O(mn)$ - jeden průchod $F_{i}$ je v pohodě a krok _2._ musíme pro $m$ klauzulí udělat $O(mn)$ kontrol absorbce. Celý algorimus iterujeme $n$ krát, takže $O(m^2n^2)$.

---
*Příklad:* $f(x_{1},x_{2},\dots,x_{5}) = (x_{1} \lor x_{2})(x_{1} \lor x_{3})(x_{1} \lor x_{4})(x_{2} \lor x_{3})(x_{2} \lor x_{4} \lor x_{5}) = F_{6}$.

#### Test regularity
Zkonstruujme $W$, pak máme 
$$
W_{f} = \begin{pmatrix}
0 & 3 & 0 & 0 & 0 \\
0 & 2 & 1 & 0 & 0 \\
0 & 2 & 0 & 0 & 0 \\
0 & 1 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 & 0
\end{pmatrix}
$$
Řádky jsou dokonce i seřazené a máme 
$$
\begin{align*}
f(1,0, x_{3},x_{4},x_{5}) &= (x_{3})(x_{4} \lor x_{5}) \\
f(0,1, x_{3},x_{4},x_{5}) &= (x_{3})(x_{4})
\end{align*}
$$
a tedy $x_{1} \succ_{f} x_{2}$,
$$
\begin{align*}
f(x_{1},1, 0,x_{4},x_{5}) &= x_{1} \\
f(x_{1},0, 1,x_{4},x_{5}) &= (x_{1})(x_{4} \lor x_{5})
\end{align*}
$$
a máme $x_{2} \succ_{f} x_{3}$,
$$
\begin{align*}
f(x_{1},x_{2}, 1,0,x_{5}) &= (x_{1})(x_{2} \lor x_{5}) \\
f(x_{1},x_{2}, 0,1,x_{5}) &= (x_{1})(x_{2})
\end{align*}
$$
a tedy $x_{3} \succ_{f} x_{4}$,
$$
\begin{align*}
f(x_{1},x_{2}, x_{3},1,0) &= (x_{1} \lor x_{2})(x_{1} \lor x_{3})(x_{2} \lor x_{3}) \\
f(x_{1},x_{2}, x_{3},0,1) &= (x_{1})(x_{2} \lor x_{3})
\end{align*}
$$
a tedy $x_4 \succ_{f} x_{5}$ a máme ověřenou regularitu.
#### Běh algoritmu
$$
f_{6}(x_{1},\dots,x_{5}) = (x_{1} \lor x_{2})(x_{1} \lor x_{3})(x_{1} \lor x_{4})(x_{2} \lor x_{3})(x_{2} \lor x_{4} \lor x_{5})
$$
dostaneme $MFP -(10100)$ a $MTP - (10101)$(protože kouknene na incidentní klauzule s $x_{5}$ a najdeme MFP které vygenerují, každá jeden, dle *Pozorování 1* a pak změna v $x_{5}$ dáva přesně MTP) a tedy $(x_{1} \lor x_{3} \lor x_{5}) \in F^d$, $x_{5}:= 0$
$$
f_{5}(x_{1},\dots,x_{4}) = (x_{1} \lor x_{2})(x_{1} \lor x_{3})(x_{1} \lor x_{4})(x_{2} \lor x_{3})(x_{2} \lor x_{4})
$$
máme $MFP - (01100), (10100)$ a $MTP - (01110), (10110)$ takže $(x_{2} \lor x_{3} \lor x_{4})(x_{1} \lor x_{3} \lor x_{4}) \in F^d$, $x_{4} := 0$
$$
f_{4}(x_{1},x_{2},x_{3}) = x_{1} \land x_{2}
$$
žádná klauzule neobsahuje $x_{3}$, takže žádné MTP, MFP, $x_{3}:= 0$,
$$
f_{3}(x_{1},x_{2}) = x_{1} \land x_{2}
$$
pak $MFP - (10000)$ a $MTP - (11000)$ a tedy $(x_{1} \lor x_{2}) \in F^d$, $x_{2}:=0$.
$$
f_{2}(x_{1}) = 0
$$
nemáme žádnou klauzuli s $x_{1}$, takže žádné MTP, MFP, $x_{1} := 0$,
$$
f_{1}() = 0
$$
a zastavíme  s $F^d = (x_{1} \lor x_{3} \lor x_{5})(x_{2} \lor x_{3} \lor x_{4})(x_{1} \lor x_{3} \lor x_{4})(x_{1} \lor x_{2})$.
#### Regularita $f^d$
Pro $F^d$ máme $W$
$$
W_{f^d} = \begin{pmatrix}
0 & 1 & 2 & 0 & 0 \\
0 & 1 & 1 & 0 & 0 \\
0 & 0 & 3 & 0 & 0 \\
0 & 0 & 2 & 0 & 0 \\
0 & 0 & 1 & 0 & 0
\end{pmatrix}
$$
a zase vychází regularita.

---
# Duály a regularita
*Věta:* Mějme regulární $f$ s $x_{1} \succeq_{f} x_{2}\succeq_{f} \dots \succeq_{f} x_{n}$, pak $f^d$ je také regulární s $x_{1} \succeq_{f^d} x_{2}\succeq_{f^d} \dots \succeq_{f^d} x_{n}$.
*Důkaz:* Stačí nám ukázat, že libovolný pár je identický, třeba $x_{1},x_{2}$, a symetrií dostaneme zbytek. 
$$
f^d(1,0,x_{3},\dots,x_{n}) = \neg f(0,1,\neg x_{3},\dots, \neg x_{n}) \geq \neg f(1,0,\neg x_{3},\dots, \neg x_{n}) =  f^d(0,1,x_{3},\dots,x_{n}),
$$
kde nerovnosti u negací platí, protože pro $x_{1} \succeq_{f} x_{2}$ máme
$$
f(0,1,\neg x_{3},\dots, \neg x_{n}) \leq f(1,0,\neg x_{3},\dots, \neg x_{n}).
$$
