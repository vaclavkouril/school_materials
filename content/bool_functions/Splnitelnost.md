# Unit rezoluce
Unit klauzule (s jedním literálem) vynucují hodnotu proměnné a tato hodnota může být substituována do ostatních klauzulí v CNF se zachování splnitelnosti.
Hrubou silou to umíme v $O(n\ell)$, kde $n$ je poček proměnných a $\ell$ je suma délek klauzulí.

## Efektivní Unit rezoluce
Snažíme se o čas $O(\ell)$.

_Vstup:_ CNF $F$

_Výstup:_ CNF $F'$ bez unit klauzulí

Pořídíme si datovou strukturu, kterou inicializujeme:
1. Vytvořme pole délky $n$ hlaviček dvojitě spojených listů (tam i zpět). (Jeden list pro každou proměnnou a konstantní přístup do pole) $O(n)$
2. Pro každou klauzuli v $F$:
	1. Vytvořme hlavičku pro dvojitě spojený list a počítadlo inicializované na délku klauzule.
	2. Pro každý literál v klauzuli vytvoříme strukturu se znaménkem literálu, pointer na odpovídající klauzuli a literál a vložíme ji do obou seznamů na konec. $O(\ell)$
3. Pro každou unit-klauzuli přidáme její strukturu do **fronty unit klauzulí**. $O(\ell)$.

Uděláme unit-rezoluci:
1. vezmeme klauzuli z fronty unit klauzulí a nastavíme její literál na $1$.
2. Projdeme list dané proměnné:
	1. Pokud je literál nastaven na $1$ tak odstraníme celou klauzuli (na kterou máme pointer).
	2. Jinak je literál nastaven na $0$ a odstraníme strukturu literálu a odebereme jedna z počítadla.
		1. Když je počítadlo 1, tak máme novou unit klauzuli a přidáme ji na konec fronty.
		2. Když je počítadlo 0, tak zastavíme a našli jsme $\square$ (nesplnitelnost).
3. Vydáme zbylé klauzule. 

Tedy taková procedura vždy skončí v čase $O(\ell)$, protože můžeme zredukovat maximálně počet klauzulí a iterujeme pres počet literálů v klauzulích.

Algoritmus skončí jen třemi možnostimi:
1. derivujeme $\square$,
2. splníme všechny klauzule a máme tedy i splňující ohodnocení,
3. zastavíme s CNF bez unit klauzulí.
---
# Hornovské CNF
*Definice:* Hornovské CNF je složené z Hornovských klauzulí, které mají každá nejvýše jeden kladný literál. Když mají každá právě jeden, tak jsou to čistě (pure) Hornovské.

*Pozorování:* Nemají-li Hornovské CNF žádné kladné literály tak $(0,\dots,0)$ splňuje.

## Horn-Sat
Stačí náme rozjet Unit-rezolution, kde si ve frontě necháme jen pozitivní unit klauzule.

*Poznámka:* Horn-Sat dá 1 jen tam kde musí, ostatním dá 0. Ostatní splňující ohodnocení mohou existovat, ale Horn-sat vydá řešení s nejmenším počtem jedniček.

---
# Kvadratické CNF
CNF $F$ je kvadratické, když každá klauzule v $F$ má $\leq 2$ literálů a čistě kvadratická, když má právě $2$. 

**2-SAT** je řešitelný rezolucí v poly-čase, ale můžeme ho vyřešit i lineárně:
1. Můžeme pro každou unit-klauzuli $x$ přidat $y$ a nahradit ji s $(x \lor y)(x \lor \bar {y})$. (Konstantně-krát zvětšíme vstup)
2. Na upravené CNF pustíme [2-SAT pro kvadratické CNF](#2-SAT%20pro%20kvadratické%20CNF)

Pro každé kvadratické CNF $F$ můžeme definovat $G=(V_{F},E_{F})$, kde
1. $V_{F} = \{ x_{1},\bar{x}_{1},\dots,x_{n},\bar{x}_{n} \}$ pro $x_{i} \in F$
2. $E_F = \{ \bar u v, \bar v u \mid u \lor v \in F \}$, jinými slovy literály mají hranu, když jsou spolu v jedné klauzuli. 

Idea je, že pokud máme nějaký bod s ohodnocením 1, tak i všechny z něj dosažitelné musejí mít $1$ a jinak bychom měli nesplnitelnost.

*Poznámka:* Definice $E_{F}$ implikuje symetrii v $G_{F}$, máme cestu z $x$ do $y$ $\iff$ existuje cesta z $\bar{ y}$ do $\bar{ x}$. Takže pokud $C=\{ u_{1},\dots,u_{k} \}$ je silná komponenta souvislosti grafu, tak i $\bar{C}$ je silná komponenta souvislosti a buď $C = \bar{ C}$ nebo $C \cap \bar{C} = \emptyset$.

*Lemma:* Ohodnocení $e: V_{F} \to \{ 0,1 \}$ odpovídá pravdivému ohodnocení pro které $F$ má hodnotu 1 $\iff$
1. $\forall x\in V_{F}: e(x) \neq e(\bar{x})$,
2. $\not \exists x,y \in V_{F}: e(x) = 1, e(y)=0$ a existovala by v grafu $xy$-cesta.

*Důkaz lemma:* 
1. jen odpovídá tomu aby jedna proměnná nebyla zároveň 0 i 1.
2. je ekvivalentní s $F=1$, protože garantuje splnitelnost všech klauzulí.

*Věta:* $F$ je splnitelné $\iff \forall x$ proměnné $x$ a $\bar{x}$ nepatří do stejné komponenty silné souvislosti.

*Důkaz:* $\implies$ Pro spor předpokládejme splnitelnost a $x,\bar{x}$ ve stejné SCC. Takže máme cestu z $x$ do $\bar{x}$ a obráceně, z lemma 1. máme, že $e(x) \ne e(\bar{x})$, ale existují cesty a tedy by mělo být $e(x) = e(\bar{x})$, tedy spor.

$\impliedby$ Zkonstruujme splňující ohodnocení následovně:
1. Vyberme topologicky poslední komponentu silné souvislosti (nevedou z ní hrany ven) a všechny její literály nastavme na $1$ a to nastaví všechny literály v topologicky první (nejdu do ní hrany) $\bar{C}$ (ze symetrie) na 0. 
2. Odstraňme $C, \bar{C}$ z $G_{F}$ a pokud graf není prázdný opakujme.
Zkonstruované ohodnocení určilo všechny proměnné a když nejsou komplementy v jedné SCC (z předpokladu), tak se splnilo 1 i 2 z lemma.
## 2-SAT pro kvadratické CNF
Pomocí věty máme $O(\ell)$ algoritmus:

_Vstup:_ CNF $F$, kde každá klauzule $|C| = 2$.

_Výstup:_ Ne/Ano+Ohodnocení proměnných
1. Zkonstruujeme $G_{F}$
2. Najděme SCC grafu v topologickém seřazení a ubíráme odpovídající první a poslední komponenty konstruujíce ohodnocení.

---
# Přejmenovatelné Hornovské CNF (Hidden Horn CNF)
*Návodný příklad:*
$$
F = (\overline{x}_{1} \vee x_{2} \vee x_{3}) (\overline{x}_{1} \vee x_{4}) (\overline{x}_{2} \vee \overline{x}_{3} \vee x_{4}) (\overline{x}_{1} \vee \bar {x}_{3} \vee \overline{x}_{4}) (\overline{x}_{1} \vee \overline{x}_{2} \vee \bar{x}_{3}) (x_{1} \vee x_{2} \vee x_{4})
$$
není Hornovská, ale pokud převedeme $x_{2} \leftrightarrow \bar{x}_{2}$ a $x_{4} \leftrightarrow \bar{ x}_{4}$, tak máme
$$
F' = (\overline{x}_{1} \vee \bar {x}_{2} \vee x_{3}) (\overline{x}_{1} \vee \bar {x}_{4}) (x_{2} \vee \overline{x}_{3} \vee \bar {x}_{4}) (\overline{x}_{1} \vee \bar {x}_{3} \vee x_{4}) (\overline{x}_{1} \vee x_{2} \vee \bar {x}_{3}) (x_{1} \vee \bar {x}_{2} \vee  \bar{ x}_{4}),
$$
která už Hornovská je.

*Definice:* Pro CNF $F$ definujme kvadratickou CNF $F_{q}$ následovně:
$$
(u \lor v) \text{ je klauzule v }F_{q} \iff \exists C \text{ klazule v } F \text{ taková, že } u,v \text{ jsou obě v } C.
$$

*Poznámka:* $F_{q}$ je jen čistě kvadratická a nezávisí na lineárních klauzulích $F$, to je ale v pořádku, protože takové klauzule nemají vliv na hornovskost klauzule.

*Lemma:* CNF $F$ je Horn $\equiv$ $(0,\dots,0)$ splňuje $F_{q}$.
*Důkaz:* $\implies$ $F$ je Horn $\implies$ každá $F_{q}$ má maximálně jeden kladný literál $\implies$ $(0,\dots,0)$ splňuje každou klauzuli.

$\impliedby$ pro spor $F$ není Horn $\implies$ aspoň jedna klauzule mám 2 kladné literály $\implies$ kombinací v konstrukci $F_{q}$ máme klauzuli s těmi dvěmi a ty nejsou splnitelné $(0,\dots,0)$.

*Věta 1:* CNF $F$ je přejmenovatelně Hornovská $\equiv$ $F_{q}$ je splnitelná.
Navíc pokud $t$ splňuje $F_{q}$, tak substituce ($x \leftrightarrow \bar{x} \iff t(x) = 1$) transformuje $F$ na Hornovskou klazuzuli $F'$.

*Důkaz:* $\implies$ $F$ je Hidden Horn $\implies$ existuje $S$ takové, že $F'$ vzniklé z komplementovaní proměnných z $S$ v $F$ je Horn $\implies$ $F'_{q}$ je splnitelná $(0,\dots,0)$ $\implies$ $F_{q}$ je splnitelné pomocí $(0,\dots,0)$, kde pro $x\in S$ nastavíme $t(x) = 1$, jinak necháme 0.

$\impliedby$ $F_{q}$ je splnitelná $t$ $\implies$ $F'_{q}$ získaná z $F_{q}$ pomocí komplementování proměnných množiny $S = \{ x \mid t(x) = 1 \}$ je splněná $(0,\dots,0)$ $\stackrel{Lemma}{\implies}$ $F'$ je Hornovská $\implies$ $F$ je hidden Horn.

*Důsledek 1:* Pro kvadratickou CNF máme 
$$
F \text{ je splnitelné } \implies F \text{ je Hidden Horn}.
$$
Vzhledem k tomu, že pokud je $F$ hidden horn tak nemáme údaj o unit klauzulích, takže může to být Hidden Horn ale nesplnitelné. Takže pro čistě kvadratickou $F$ máme ekvivalenci.

*Důsledek 2:* Věta nám dává algoritmus v čase $O(|F|^2)$ (klazule délky $n$ generuje $\binom{n}{2} = O(n^2)$ kvadratických klauzulí v $F_{q}$) na zjištění zda je CNF Hidden Horn.

Jednoduchý nápad na algoritmus v lineárním čase:
1. Problém je v dlouhých klauzulích, tak použijeme trik $SAT\to3-SAT$ (klauzuli vezmu první literál a ten dám $\lor$ s novou proměnnou $x$ a v původní klauzuli odeberu první dva literály a nahradím je $\bar{x}$)  ta zachová splnitelnost ta musíme ověřit Hidden Horn vlastnost
2. Aplikujeme algoritmus daný *větou 1*
Oba kroku jen lineárně zvětší velikost CNF.

Nechť $F = \bigwedge_{p=1}^m C^P$, kde $C^P =(u_{1}^P \lor \dots \lor u^{p}_{k_{p}})$ je CNF s $m$ klazulemi.

Definujme:
1. $F_{q} = \bigwedge_{p=1}^m C_{q}^P$, kde $C_{q}^P = \bigwedge_{1 \leq i<j \leq k_{p}} (u_{i}^P \lor u_{j}^P)$,
2. $\hat{F} = \bigwedge_{p=1}^m \hat{C}^P$, kde $\hat{C}^P = (u_{1} \lor y_{1}) \land\left[ \bigwedge_{j = 2}^{k_{p}-1} ( \bar{y}_{i-1}^P \lor u_{i}^P \lor y_{i}^P) \right] \land (\bar{y}_{k_{p} -1} \lor u_{k_{p}})$, kde $y$ jsou nové pomocné proměnné,
3. $\hat{F}_{q} = \bigwedge_{p=1}^m \hat{C}_{q}^P$, kde $\hat{C}_{q}^P = (u_{1} \lor y_{1}) \land\left[ \bigwedge_{j = 2}^{k_{p}-1} ( \bar{y}_{i-1}^P \lor u_{i}^P) \land (\bar{y}_{i-1}^P \lor y_{i}^P) \land ( u_{i}^P \lor y_{i}^P) \right] \land (\bar{y}_{k_{p} -1} \lor u_{k_{p}})$ z definice musíme brát dvojice v klauzuli, ale my jen vybíráme z trojic.

Máme z věty 1: $F$ je Hidden Horn $\equiv$ $F_{q}$ je splnitelná $\stackrel{\text{dokážeme}}{\equiv}$ $\hat{F}_{q}$ je splnitelná. Z věty 1 i pak dostáváme, že $\hat{F}$ je Hidden Horn. (Tedy že redukce zachovává Hidden Horn vlastnost)

*Důkaz:* ($F_{q}$ je splnitelná $\equiv$ $\hat{F}_{q}$ je splnitelná)

Stačí nám dokázat pro jednotlivé hodnoty $P$
1. Splňující ohodnocení $C^P_{q}$ se dá rozšířit na splňují $\hat{C}_{q}^P$
2. Omezení splňujícího ohodnocení $\hat{C}_{q}^P$ na původní proměnné z $C_{q}^P$ je splňující ohodnocení $C_{q}^P$.

Bod 1. nechť $t$ je splňující ohodnocení $C_{q}^P \implies \exists$ maximálně jedno $i$ takové že $t(u_{i}^P) = 0$ (protože každá klauzule má jen 2 prvky)(není-li tak nechť $i$ je libovolné) definujme: $t(y_j^P) =0$ pro $1 \leq j \leq i-1$ a $t(y_{j}^P) = 1$ pro $i \leq j \leq k_{P}$. 
Pro taková $t$ je pak splněno $C_{q}^P$, protože všechny před nulou mají vždy $y_{j}^P$ s negací a nula je tedy splní a $i$-tá je nastavena $y^P_{i}$ a zbytek zase víme, že $u_{j}^P$ jsou $1$, jinak spor se splnitelností $C_{q}^P$

Bod 2. nechť $t$ splňuje $\hat{C}_{q}^P$ a nechť $1 \leq i<j \leq k_{P}$ jsou libovolná. Mějme klauzule
$$
X = \{ ( u^P_{i} \lor y_{i}^P ), ( \bar{y}_{i}^P \lor y_{i+1}^P ),\dots,(\bar{y}_{j-2}^P \lor y_{j-1}^P), (\bar{y}_{j-1}^P \lor u_{j}^P) \} \subseteq \hat{C}_{q}^P
$$
Sporem, když $t(u_{i}^P) = t(u_{j}^P)=0$, tak rezolucí na $X$ máme $\{ (u_{i}^P \lor u_{j}^P) \}$ a ta by dávala spor $\implies$ $(u_{i}^P \lor u_{j}^P)$ je implikát $\hat{C}_{q}^P$ a tedy musí bý pravda v libovolném modelu $\hat{C}_{q}^P$ $\implies$ musí libovolná $i,j$ $t(u_{j}^P)=1$ nebo $t(u_{i}^P)=1$ a tedy $t$ splňuje $C_{q}^P$.

 Celkem tedy máme redukci, kde původní algoritmus vzal dvojice pro $F_{q}$ a měl $O(n^2)$ dvojic a složitost, ale teď se nám $n$ zvětší jen zhruba $6$-krát a můžeme ověřovat splnitelnost v $\hat{F}_{q}$ na kteru spustíme lineální 2-SAT a lineárně umíme ověřit, zda je nějaká CNF formule Hidden Horn.