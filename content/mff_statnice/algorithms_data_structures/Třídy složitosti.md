*Definice:* Rozhodovací problém je funkce z množiny $\{ 0,1 \}^*$ všech řetězců nad binární abecedou do množiny $\{ 0,1 \}$.
*Definice:* Máme-li $A.B$ rozhodovací problémy tak $A$ lze **převést** na $B$, když existuje funkce $f: \{ 0,1 \}^* \to \{ 0,1 \}^*$ taková, že $\forall x \in \{ 0,1 \}^*$ platí $A(x) = B(f(x))$, navíc musí být $f$ spočitatelná v polynomiálním čase vzhledem ke vstupu $|x|$. $f$ zveme **převod** nebo **redukce**. 

---
# $P$ vs $NP$
*Definice:* $P$ je třída rozhodovacích problémů, které jsou řešitelné v polynomiálním čase. $L$ leží v $P$ právě tehdy když existuje algoritmus $A$ a polynom $f$, kde každý vstup algoritmu doběhne nejpozději v čase $f(|x|)$ a vydá výsledek $A(x) = L(X)$.

*Definice:* $NP$ je třída problémů $L$, které ji náleží právě, když existuje $K \in P$ a polynom $g$ přičemž pro každý vstup $x$ je $L(x)= 1$ právě tehdy, pokud pro nějaké $y$ ne delší než $g(|x|)$, je $K(x,y) = 1$

Jedná se tedy o třídu problémů, kde pro dosažení polynomiálního času řešení můžeme použít jakousi _nápovědu_ maximálně polynomiálně dlouhou.

*Příklad:* Splnitelnost logických formulí (SAT) je v $NP$ protože jako nápověda nám může posloužit ohodnocení proměnných.

---
# Těžkost a úplnost
*Definice:* Problém je $NP$-těžký pokud je na něj převoditelný každý problém v $NP$. Pokud je takový problém navíc v $NP$, tak ho zveme $NP$-úplný.

*Věta:* SAT je $NP$-úplný

--- 
# Převoditelnost
 Seznam zajímavých $NP$-úplných problémů
1. Logické problémy:
	- SAT: splnitelnost logických formulí v CNF
	- 3-SAT: každá klauzule obsahuje max. 3 literály
	- 3,3-SAT: navíc se každá proměnná vyskytuje nejvýše třikrát
	- SAT pro obecné formule: nejen v CNF (viz oddíl 19.4)
	- Obvodový SAT: splnitelnost booleovského obvodu (viz oddíl 19.4)
2. Grafové problémy:
	- Nezávislá množina: existuje množina alespoň k vrcholů, mezi nimiž nevede žádná hrana?
	- Klika: existuje úplný podgraf na k vrcholech?
	- Barvení grafu: lze obarvit vrcholy k barvami (přidělit každému vrcholu číslo od 1 do k) tak, aby vrcholy stejné barvy nebyly nikdy spojeny hranou)? To je NP-úplné už pro k = 3.
	- Hamiltonovská cesta: existuje cesta obsahující všechny vrcholy?
	- Hamiltonovská kružnice: existuje kružnice obsahující všechny vrcholy?
	- 3D-párování: máme tři množiny se zadanými trojicemi; zjistěte, zda existuje taková množina disjunktních trojic, ve které jsou všechny prvky právě jednou? (Striktně vzato, není to grafový problém, ale hypergrafový – hrany nejsou páry, ale trojice.)
3. Číselné problémy:
	- Součet podmnožiny: má daná množina přirozených čísel podmnožinu s daným součtem? 
	- Batoh: jsou dány předměty s váhami a cenami a kapacita batohu, chceme najít co nejdražší podmnožinu předmětů, jejíž váha nepřesáhne kapacitu batohu. Aby se jednalo o rozhodovací problém, ptáme se, zda existuje podmnožina s cenou větší nebo rovnou zadanému číslu.
	- Dva loupežníci: lze rozdělit danou množinu čísel na dvě podmnožiny se stejným součtem?
	- Ax = 1 (soustava nula-jedničkových lineárních rovnic): je dána matice $A \in \{0, 1\}^{m×n}$. Existuje vektor $x \in \{0, 1\}^n$ takový, že Ax je rovno vektoru samých jedniček?
---
1. **SAT $\to$ 3‑SAT**  
   - Každou klauzuli delší než 3 literály rozdělíme pomocí pomocných proměnných. Vzniknou klauzule velikosti $\leq$ 3. Převod v polynomiálním čase.

2. **Nezávislá množina $\iff$ SAT**  
   - Problém nezávislé množiny lze převést na SAT tím, že pro každý vrchol vytvoříme proměnnou a pro každou hranu klauzuli „ne oba konce současně vybrané“.
## Převod Circuit‑SAT → SAT
## 1. Proměnné
- Pro každý vstup i vnitřní uzel (výstup hradla) zavedeme booleovskou proměnnou.
- Tj. každému vodiči v obvodu odpovídá proměnná.
---
## 2. Klauzule pro hradla
Každé hradlo nahradíme množinou klauzulí v CNF, které zachytí logický vztah mezi vstupy a výstupem hradla.
#### a) NOT
Brána: `z = NOT x`  
Přidáme ekvivalentní CNF klauzule:
$$
(x \lor z) \land (\neg x \lor \neg z)
$$
#### b) AND
Brána: `z = x AND y`  
CNF klauzule:
$$
(\neg z \lor x) \land (\neg z \lor y) \land (z \lor \neg x \lor \neg y)
$$
#### c) OR
Brána: `z = x OR y`  
CNF klauzule:
$$
(z \lor \neg x) \land (z \lor \neg y) \land (\neg z \lor x \lor y)
$$
### 3. Fixace hodnot
- Pokud je některý vstupní vodič fixován (např. vstup má být 0), přidáme jednotkovou klauzuli:
	- vstup = 0 → klauzule: `¬x`
	- vstup = 1 → klauzule: `x`
- Výstup obvodu (kořen) musí být 1 → klauzule: `z`, kde `z` je výstupní proměnná.
### 4. Korektnost převodu
Každé hradlo je přeloženo do pevného počtu CNF klauzulí (nejvýše 3). Celkový počet proměnných a klauzulí je:
- lineární v počtu bran
- převod probíhá v polynomiálním čase
Formule je splnitelná právě tehdy, když existuje vstup, pro který obvod vrací hodnotu 1.
---
## Převod z 3‑SAT na 3‑COLORING
### Konstrukce:
1. Založíme **výchozí trojici barev**: TRUE, FALSE a BASE (spojovací).
2. Pro každou proměnnou $x$ vytvoříme **vrchol** $v_x$, propojený s vrcholy BASE a s jeho negací.
3. Pro každou klauzuli $C = (ℓ₁ ∨ ℓ₂ ∨ ℓ₃)$ vytvoříme **klauzulový vrchol** $v_C$, který se připojí k vrcholům odpovídajícím literálům a k BASE.
4. Dodáme hrany tak, že:
   - $v_C$ musí mít barvu TRUE právě tehdy, když alespoň jeden literál je TRUE.
   - Hrany mezi literály zajistí, že nesprávná kombinace barvitelných stavů neumožňuje obarvit graf 3 barvami, pokud klauzule není splněná.

Graf je 3‑obarvitelný $\iff$ existuje přiřazení proměnných, které formuli splňuje.

---
## Převod z Ax = 1 (0‑1 matice) na Hamiltonovskou kružnici
### Konstrukce:
1. Pro každou proměnnou $x_j$ vytvoříme **výběrový podgraf** s možností 0 nebo 1.
2. Pro každý řádek (rovnici) indexovanou $i$ vytvoříme **uzel $r_i$**, který musí být dosažen právě jednou.
3. Hrany mezi volbami v podgrafech a uzly $r_i$ vytvoříme tam, kde $a_{ij}=1$.
4. Hamiltonovská kružnice může obejít právě ty segmenty, které odpovídají výběru $x_j=1$, splňující všechny $r_i$.

Graf má Hamiltonovskou kružnici právě když existuje řešení $Ax=1$.
