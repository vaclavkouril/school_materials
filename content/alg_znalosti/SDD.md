# Sentential Decision Diagram
- $f: X,Y\to \{ 0,1 \}$, kde $X,Y$ jsou proměnné, 
- uvažujme $f(X,Y)$, kde jsou $X,Y$ **non-overlapping**, tedy $X \cap Y=\emptyset$.
- Když můžeme rozepsat $f(X,Y)=(p_{1}(X) \land s_{1}(Y)) \lor \ldots \lor(p_{n}(X) \land s_{n}(Y) )$, ($n$ je odlišné od jak počtu proměnných tak i klauzulí), pak máme $\{ (p_{1},s_{1}),\dots,( p_{n},s_{n}) \})$ a to zveme **$X,Y$-dekompozicí** funkce $f$.
- Když $\forall i\ne j: p_{i} \land p_{j}= false$ tak o dekompozici řekneme, že je **strongly deterministic** na $X$, pak je každý pár $(p_{i},s_{i})$ prvkem dekompozice a navíc nazveme
	- každé $p_{i}$ jako prime,
	- každé $s_{i}$ jako sub.
- Velikost dekompozice je počet jejích prvků.

*Definice:* Nechť $\alpha = \{ (p_{1},s_{1}),\dots,(p_{n},s_{n}) \}$ je $(X,Y)$-dekompozicí funkce $f$, která je strongly deterministic na $X$. Pak $\alpha$ zveme **$X$-partition funkce $f$** právě tehdy, když je primes dělají partition (každý prime je konzistentní, každý pár různých primes jsou mutually exclusive (tedy $p_{i}\ne false$,  $p_{i} \land p_{j}=false$ a $\bigvee p_{i} =true$), navíc $\alpha$ je **compressed** právě tehdy, když $\forall i \ne j: s_{i}\ne s_{j}$.

Pro $f=A \land B$ jsou $A,B$-dekompozice 
- $\{ (A,B) \}$, není $\{ A \}$-partice, protože nemáme ohodnocení tak aby při $A=0$, tak $\bigvee p_{i}$ není $true$.
- $\{ (A,B), (\neg A,false) \}$ je $\{ A \}$-partice.

### *Věta 1:* Nechť $\circ$ je Booleovský operátor  a nechť $\{ (p_{1},s_{1}),\dots,(p_{n},s_{n}) \}$ a $\{ (q_{1},r_{1}),\dots,(q_{m},r_{m}) \}$ jsou $X$-partice dekompozic $f(X,Y)$ a $g(X,Y)$. Pak $\{ (p_{i}\land q_{j},s_{i} \circ r_{j}) \mid p_{i} \land q_{j} \ne false \}$ je $X$-partice funkce $f\circ g$.
*Důkaz:* Protože $p_{i}, q_{i}$ jsou prvky particí tak i všechny podmínky na primes jsou splněná i pro $p_{i} \land q_{i}$, protože pak $\land$ nic nepřidá v tomto kontextu. 

Mějme dosazení $xy$ do proměnných $X,Y$. Musí existovat unikátní $i,j$, že $x \models p_{i}$ a $x \models q_{j}$. Dokonce dostáváme $f(xy)=s_{i}(y)$ a $g(xy)=r_{j}(y)$ a tedy $[f\circ g](xy)=s_{i}(y)\circ r_{j}(y)$ a zjevně vyhodnocení dekompozice na daném $xy$ odpovídá $s_{i}\circ r_{j}$.

Dle Věty 1. je $X$-partice $f \circ g$ velikosti $O(mn)$.

### *Věta 2:* Funkce $f$ má jen jednu compressed $X$-partici.
*Důkaz:* Mějme všechna možná ohodnocení $x_{1},..,x_{k}$ proměnných $X$, pak $\{ (x_{1},f|_{x_{1}}),\dots,(x_{k},f|_{x_{k}}) \}$ je $X$-partice. Označme $s_{1},\dots,s_{n}$ různé unikátní podfunkce z $f|_{x_{1}},\dots,f|_{x_{k}}$ a pro každé $s_{i}$ definujeme $p_{i}=\bigvee_{f|_{x_{j}}=s_{i}} x_{j}$. Pak $\alpha=\{ (p_{1},s_{1}),\dots,(p_{n},s_{n}) \}$ je compressed $X$-partice $f$.

Předpokládejme další $\beta=\{ (q_{1},r_{1}),\dots,(q_{m},r_{m}) \}$ compressed $X$-partice, pak $\alpha,\beta$ musí mít jiné partice, navíc musí existovat prime $p_{i}$ v $\alpha$, který je přes dvě primes $q_{j},q_{k}$ v $\beta$, tedy $x \models p_{i},q_{j}$ a $x' \models p_{i}, q_{k}$ pro $x\ne x'$. Máme
- $f|_{x} = \alpha|_{x} = s_{i} = r_{j}= \beta|_{x}$
- $f|_{x'} = \alpha|_{x'} = s_{i} = r_{k}= \beta|_{x'}$

a tedy $r_{j}=r_{k}$ tedy je nemožné aby taková $\beta$ byla comprossed.

---
# vtree
*Definice:* Vtree pro proměnné $X$ je binární strom, kde každý vnitřní uzel má všechny syny a jeho listy jsou jedna-k-jedné odpovídající proměnným v $X$.