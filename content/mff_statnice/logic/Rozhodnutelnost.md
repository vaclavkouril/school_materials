*Definice:* O teorii $T$ říkáme, že je **rozhodnutelná**, pokud existuje algoritmus, který pro každou vstupní formuli $φ$ doběhne a odpoví, zda  
$$
T\models φ.
$$  
a **částečně rozhodnutelná**, pokud existuje algoritmus, který pro každou vstupní formuli $φ$:
1. pokud $T\models φ$, doběhne a odpoví “ano”,
2. pokud $T\not\models φ$, buď nedoběhne, nebo doběhne a odpoví “ne”. 

*Definice:* Teorie $T$ je **kompletní**, pokud je bezesporná a pro každou uzavřenou formuli $φ$ platí buď  
$$
T\models φ
$$
nebo  
$$
T\models \neg φ
$$
Ekvivalentně to znamená, že neexistuje žádná formule $φ$, která by byla vůči $T$ *nezávislá*, tj. pro niž neplatí ani  
$$
T\models φ
\quad\text{ani}\quad
T\models \neg φ.
$$
(Nezávislá formule by byla taková, že její pravdivost vůči $T$ nelze rozhodnout ani v jednom směru.)

*Definice:* Teorie $T$ je **rekurzivně axiomatizovaná**, pokud existuje algoritmus, který pro každou vstupní formuli $φ$ doběhne a odpoví, zda $φ∈T$.  
(tj. množina axiomatických formulí $T$ je rozhodnutelná.)

*Tvrzení:* Nechť $T$ je rekurzivně axiomatizovaná. Potom:
1. $T$ je částečně rozhodnutelná,
2. je-li $T$ navíc kompletní, potom je rozhodnutelná. 
---
1. **Diskrétní lineární uspořádání** $\langle\mathbb{Z},\le\rangle$  
   Axiomatizace obsahuje:
$$
\forall x\forall y\,(x\le y \lor y\le x),\quad 
   \forall x\forall y\forall z\,(x\le y\land y\le z\to x\le z),
$$
   $$
   \forall x\,\exists y\,\bigl(\text{Succ}(x,y)\bigr)\quad\text{(diskrétnost)},
   $$
   kde $\text{Succ}(x,y)$ vyjadřuje, že $y$ je bezprostřední následník $x$. Tato teorie je úplná a umožňuje kvantorové eliminace do kombinací atomických formulí, takže existuje algoritmus na rozhodnutí každé formule v tomto jazyce.

2. **Husté lineární uspořádání bez konců** $\langle\mathbb{Q},\le\rangle$  
   Axiomy zahrnují lineární uspořádání, hustotu:
$$
\forall x\forall y\,(x<y\to \exists z\,(x<z<y)),
$$
   a absenci krajů:
$$
\forall x\,\exists y\,(y<x),\quad \forall x\,\exists y\,(x<y).
$$
   Podle Cantora je to úplná teorie (všechny spočetně nekonečné husté LO bez konců jsou izomorfní) a má kvantorové eliminace, což dává rozhodnutelnost.

4. **Presburgerova aritmetika** $\langle\mathbb{N},S,+,0\rangle$  
   Axiomy definují:
$$
   \forall x\,\neg(S(x)=0),\quad \forall x\forall y\,(S(x)=S(y)\to x=y),
$$
   a vlastnosti sčítání (nuly a následníka). Presburger dokázal, že každá formule v tomto jazyce je ekvivalentní formuli bez kvantifikátorů, což poskytuje efektivní algoritmus na kontrolu její validity, tedy rozhodnutelnost.

5. **Teorie reálně uzavřených těles** $\langle\mathbb{R},+,-,\cdot,0,1\rangle$  
   Tarski ukázal, že teorie reálně uzavřených polí má kvantorovou eliminaci v jazyce uspořádaných těles, a proto je rozhodnutelná — každou formuli lze algoritmicky převést na bezkvantorový tvar a ověřit její pravdivost.

---

1. **Platnost formulí prvního řádu**  
   Churchova–Turingova věta o nerozhodnutelnosti platnosti říká, že neexistuje algoritmus rozhodující, zda je libovolná formule prvního řádu logicky platná ($⊨φ$). Tento problém je nerozhodnutelný.

2. **Teorie přirozených čísel** $\mathrm{Th}(\mathbb{N})$  
   Standardní model aritmetiky  
$$
\langle\mathbb{N},S,+,\cdot,0,≤\rangle
$$  
   nemá rekurzivně axiomatizovatelnou teorii, tj. množina všech vět platných v tomto modelu není rozhodnutelná. To plyne z Gödelovy první věty o neúplnosti.

3. **Řešitelnost diofantických rovnic (Hilbertův desátý problém)**  
   Matiyasevičova věta (Davis–Putnam–Robinson–Matiyasevič): neexistuje algoritmus, který by pro danou Diofantickou rovnici  
$$
p(x_1,\dots,x_n)=0
$$
   rozhodl, zda má celočíselné řešení. Problém je tedy nerozhodnutelný.
