*Definice:* $f:\mathbb{N}\to \mathbb{N}$, kde $f(n)\geq \log n$, nazveme **prostorově konstruovatelnou**, je-li funkce, která zobrazuje $1^n$ na binární reprezentaci $f(n)$ vyčíslitelná v prostoru $O(f(n))$.

Jsou to funkce, kterých výpočet je možný v prostoru, který je sám omezený tou funkcí, tedy počítáme-li si kolik alokovat, tak při výpočtu nealokujeme více paměti než program který tou funkcí omezujeme.

Tedy výpočet je (za předpokladu, že $M_{f}$ konstruuje $f(n)$) 
1. Vstup $x$ s $n=|x|$ sestavíme $w = 1^n$ (každý znak $x$ změníme na $1$)
2. Vypočítáme $k = f(n)$ pomocí $M_{f}$
3. Označíme $k$ buněk na pásce a v nich se bude konat výpočet využívající prostor $O(f(n))$.

*Věta:* (o deterministické prostorové hierarchii) Pro každou prostorově konstruovatelnou funkci $f: \mathbb{N} \to \mathbb{N}$ existuje jazyk $A$, který je rozhodnutelný v prostoru $O(f(n))$, nikoliv však v $o(f(n))$.

*Idea:* $A$ definujeme strojem $D$ který ho rozhoduje v prostoru $O(f(n))$ a pak ukážeme pomocí diagonalizace $L(M) \neq L(D)$ pro všechna $M$ s prostore $o(f(n))$.

*Důkaz:* Mějme TS $N$ pracující v prostoru $O(f(n))$ rozhodující $A$. Nechť $M$ pracuje v $g(n)$ prostoru, s $g(n) = o(f(n))$, tedy
$$
(\forall c \in \mathbb{R}^+)(\exists n_{0} \in \mathbb{N}) (\forall n \geq n_{0})[c \cdot g(n) \leq f(n)].
$$
Pro každý TS stroj $M$ tedy musí platit, že se liší alespoň v jednom řetězci $A$ od $L(M)$, takovým kandidátem může být $\langle M \rangle$ ale jeden odlišný kód se dá ošetřit, vezměme tedy $\langle M\rangle 10^*$. Aby mohl $N$ rozhodnout zda přijímá takový vstup $\langle M\rangle 10^*$, tak by musel odsimulovat $M(\langle M \rangle)$ a odpovědět opačně. Protože $M$ má $g(n) = o(f(n))$, tak k simulaci stačí $c_{M}g(n)$ buněk pracovní pásky ($c_M$ je závislá na $M$) a protože $N$ má $O(f(n))$ prostoru, tak to jistě stačí k dokončení simulace i pro $\langle M\rangle 10^*$ za předpokladu, že $M(x) \downarrow.$

Kdyby $M(x)\uparrow$ tak máme omezený počet konfigurací $M(x)$ a tedy můžeme na deterministickém TS odhalit cykly, pomocí čítače konfigurací a odmítnout.
### Hlavní konstrukce
Mějme tedy $N$ se vstupem $x$
1. Když $x \neq \langle M\rangle 10^*$ tak odmítneme.
2. Určíme hodnotu $f(|x|)$ (můžeme dle prostorové konstruovatelnosti)
3. Vyznačíme $f(x)$ pro vymezený prostor $N$ a vyjdeme-li mimo tak reject.
4. Simulujeme $M(x)$ a počítejme kroky simulace a pokud počet kroků $\geq 2^{f(n)}$ tak odmítneme
5. Když $M$ přijme $x$ tak odmítneme, jinak přijmeme.

Mějme tedy $A = L(N)$ a ten pracuje v prostoru $O(f(n))$ a protože velikost čítače je omezena konstantou, tak když ho dáme na separátní pásku tak nic nemění na $O(f(n))$ a ostatní kroky jsou na vyznačených $f(|x|)$. 

Předpokládejme tedy pro spor, že je $A$ rozhodnutelný v prostoru $o(f(n))$ a tedy existuje DTS $M$ rozhodující $A$ v prostoru $g(n)$. K simulaci potřebuje $N$ $c_{M}g(n)$ buněk pásky, kde $c_{M}$ je určena počtem konfigurací dle [lemma](Základní%20třídy%20složitosti#%20Věta%20o%20vztahu%20prostoru%20a%20času). Stroji $N$ stačí $c_{M}$ buněk k reprezentaci jednoho políčka pásky $M$. Protože $g(n) = o(f(n))$, tak existuje $n_{0}$, že $c_{M}g(n_{0}) \leq f(n)$. Mějme vstup $x = \langle M \rangle10^{n_{0}}$. Simulace $M(x)$ doběhne až dokonce a $N$, protože na ni vyznačený prostor stačí a počet kroků je méně než $2^{f(n)}$, protože bere $M(x)$ s konečným výpočtem. 

Dle **5.** máme $x\in L(M) \iff x\not\in L(N)$ a tedy $L(M) \neq A$, my ale předpokládali $M$ rozhodující $A$, $L(M) = A$ a tedy spor.

---
# Důsledky
$f_{1},f_{2}: \mathbb{N} \to \mathbb{N}$ prostorově konstruovatelné funkce a $f_{1} = o(f_{2})$, pak
$$
SPACE(f_{1}(n)) \subsetneq SPACE(f_{2}(n))
$$
Pro každá dvě $\epsilon_{1},\epsilon_{2}\in \mathbb{R}, 0\leq \epsilon_{1} < \epsilon_{2}$ platí
$$
SPACE(n^{\epsilon_{1}}) \subsetneq SPACE(n^{\epsilon_{2}})
$$
*Tvrzení:* Platí $NL  \subsetneq PSPACE  \subsetneq EXPSPACE = \bigcup_{k\in \mathbb{N}} 2^{n^{k}}$.

*Důkaz:* $NL=NSPACE(\log n)$ dle Savičovy věty tedy $NSPACE(\log n) \subseteq SPACE(\log^2 n)$ a dle věty o detereministické prostorové hierarchii pro $\log^2 n = o(n)$ máme $SPACE(\log^2 n) \subsetneq SPACE(n)$ a z definice $SPACE(n) \subseteq PSPACE \subseteq SPACE(2^n)$ a dle věty o detereministické prostorové hierarchii pro $n = o(n^2)$ máme $PSPACE  \subsetneq SPACE(2^{n^2}) \subseteq EXPSPACE$.