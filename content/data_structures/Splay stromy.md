# Definice
Jsou to binární stromy, které se balancují pomocí operace splay, aby měli stále logaritmickou výšku. Vždy splayneme nejhlubší uzel, kterého se operace dotkne. 

![[double-rotations.svg]]

## Značení
- $T(v)$ je podstrom zakořeněný ve $v$,
- Velikost $s(v)$ je kardinalita $T(v)$, počet vrcholů,
- Rank je $r(v) = \log_{2} s(v)$, tedy hloubka podstromu,
- Potenciál je $\phi$ stromu je $\sum_{v \in V(T)} r(v)$,
- $n$ je počet uzlů ve stromu.
---
## Splay
Preferujme dvojité rotace, chceme $zig-zig$ pokud je $x$ levé dítě levého dítěte (symetricky pro pravé) a $zig-zag$ pokud je pravé dítě levého (a symetricky), pokud je to dítě kořene, tak jen jeden $zig$.
## Find
Hledáme, jako v normálním BST a najdeme-li $x$, tak $Splay(x)$.
## Insert
Hledáme $x$, pokud není tak ho vložíme pod poslední nalezený uzel a vždy splay na $x$ i kdyby tam už byl.
## Delete
Najdeme $x$, má-li $\leq 1$ dětí tak ho odstraníme a případně přepojíme na následníka. Splayneme rodiče odstraněného uzlu, nebo posledního nalezeného, pokud $x$ nenajdeme.

---
# Vlastnosti
*Tvrzení:* Všechny operace mají amortizovanou složitost $O(\log n)$ (protože tolik je Splay)

### Find
Mějme nalezené $x$ na hloubce $d$. Cestování do $x$ nás stálo $\Theta(d)$ a nezměnilo potenciál. $\Theta(x)$ stojí i splay a ten je amortizovaně $O(\log n)$. Tedy cena find je jen konstantně-krát větší než Splay a tedy $O(\log n)$ pro úspěšný find.

Neúspěšný find má stejný argument pro poslední nalezený node, tedy také $O(\log n)$.
### Insert
Přidání listu zvýší potenciál o $O(\log n)$.

Mějme $v_{1},\dots,v_{t+1}$ cestu z $v_{1}$ kořene do $v_{t+1}$ nového listu a $r(v_{i})$ je rank před přidáním a $r'$ rank po. Potenciál je
$$
\Delta \phi = r'(v_{t+1}) + \sum_{i=1}^t (r'(v_{i}) - r(v_{i})).
$$
Všechny listy mají rank $0$, ostatní máme $s'(v) =s(v) +1 \leq s(v_{i-1})$, tedy $i>1: r'(v_{i}) \leq r(v_{i-1})$. Suma se tedy redukuje
$$
\Delta \phi \leq r'(v_{1}) - r(v_{t}),
$$
opět $O(\log n)$, protože $r(x) \leq \log n$.

### Delete
Každý delete má Find ($O(\log n)$) a pak find náhradníka pro odstraňovaný vrchol, také v nejhorším $O(\log n)$, když máme tyto dva tak jen konstantní přehození a Splay s $O(\log n)$, tedy celé v $O(\log n)$.

---
# Výhody
- Jednoduchá implementace, nemusíme udržovat vyvažovací informace.
- Podobné pro cache, většinu času interagujeme s daty sekvenčně a nemusíme tedy tak často hluboko do stromu.
---
# Nevýhody
- Obyčejné čtení a hledání dělá zápisy, takže nevhodné pro paralelismus
- amortizace, některé operace mohou být pomalé

---
# Věta o amortizované složitosti operace Splay
*Lemma:* $\forall a,b > 0: \log \alpha + \log \beta \leq 2\log (\alpha + \beta) -2$.
*Důkaz:* Víme, že $4\alpha\beta = (\alpha + \beta)^2 - (\alpha - \beta)^2 \leq (\alpha+\beta)^2$, protože $(\alpha -\beta)^2 \geq {0}$, takže zlogaritmujeme-li to, tak
$$
\log 4 + \log \alpha + \log \beta \leq 2 \log (\alpha + \beta).
$$
*Tvrzení:* Amortizovaná cena $i$-tého kroku je nejvýše $3r_{i} (x) - 3r_{i-1}(x) +1$, kde to $+1$ je tam, když je to $zig$ krok. 

*Důkaz:* s $'$ značíme ty po akci a bez před akcí.
### Zig-zag
Jediné potenciály co se mohou změnit v celém stromě jsou $x,y,z$, (obrázek výše). potenciál se zvýší $(r'(y) -r(y))+(r'(z) -r(z)) + (r'(x) -r(x))$, reálná cena operace je $2$, tedy
$$
A = 2+ r'(z) + r'(y) + r'(x) - r(z) - r(y) - r(x).
$$
Dle *Lemma* máme
$$
r'(z) + r'(y) = \log s'(z) + \log s'(y) \leq 2\log(s'(z)+s'(y)) -2
$$
$T'(z),T'(y)$ jsou celá v $T'(x)$, tedy $\log(s'(z)+s'(y)) \leq \log s'(x) =r'(x)$, tedy
$$
r'(z) + r'(y) \leq 2\log(s'(z)+s'(y)) -2 \leq 2r'(x) -2.
$$
Protože $T(z) \supseteq T(x), T(y) \supseteq T(x)$, tak $r(z)  \geq r(x), r(y)\geq r(x)$ a dohromady máme
$$
A \leq 2+ r'(x) + 2r'(x) -2 - 3r(x) = 3r'(x)-3r(x).
$$

### Zig-Zig
Opět máme 
$$
A = 2+ r'(z) + r'(y) + r'(x) - r(z) - r(y) - r(x).
$$
Teď ale chceme lemma aplikovat na dvojice podstromů jenž dohromady berou skoro všechny vrcholy ale jsou disjunktní, takové $T(x)$ a $T'(z)$, kde 
$$
\begin{align}
r(x) + r'(z) &= \log s(x) + \log s'(z) \\
&\leq 2\log (s(x) + s'(z)) - 2 \\
&\leq 2 \log(s'(x)) -2 = 2 r'(x) -2 
\end{align}
$$
což se dá přepsat $r'(z) \leq 2r'(x) - r(x) -2$ a navíc máme
- $r'(x) = r(z)$ protože $T'(x) = T(z)$,
- $r'(y) \leq r'(x)$, protože $T'(y) \subseteq T'(x)$,
- $r(y) \geq r(x)$, protože $T(y) \supseteq T(x)$.

Dohromady
$$
A \leq 2 + 2r'(x) + r'(x)+r'(x) - 2r(x) - r(x) - r'(x) = 3r'(x) -3r(x).
$$
### Zig
Má cenu $1$ a rank se mění jen u $x,y$, tedy
$$
A= 1 + r'(x) + r'(y) - r(x) -r(y).
$$
dle inkluzí máme $r'(y) \leq r'(x), r(y) \geq r(x)$, tedy
$$
A \leq 1 + 2r'(x) - 2r(x) \leq 1 + 3r'(x) - 3r(x).
$$
---
*Věta:* **Amortizovaná cena** $Splay(x)$ operace je nejvýše $3\cdot(r'(x) -r(x)) +1$, kde $r(x)$ je rank $x$ před operací a $r'(x)$ rank po ní.
*Důkaz:* Amortizovaná cena je suma individuálních kroků, nechť $r_{1}(x),\dots,r_{t}(x)$ jsou ranky $x$ po každém kroku a $r_{0}(x)$ je před prvním krokem. Z tvrzení výše máme garanci na cenu jednoho kroku a dostáváme
$$
A \leq \sum^t_{i=1}(3r_{i}(x) - 3r_{i-1}(x))+1.
$$
Teleskopická suma vyjde $A \leq 3r_{t} - 3r_{0} +1$, tedy přesně to co říká věta.

Navíc $r(x) \leq \log n$ a tedy cena Splay(x) je $O(\log n)$.