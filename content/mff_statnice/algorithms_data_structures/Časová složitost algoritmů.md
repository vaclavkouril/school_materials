Složitost algoritmu měříme jako funkci závislou na vstupu algoritmu. Když algoritmy analyzujeme tak postupujeme
1. Zjistíme jak vlastně změřit vstup, jsou-li vstupem dvě čísla tak třeba zda se hodí algoritmus odvíjet od jejich maxima, či třeba počtu cifer, atd.
2. Určíme maximální možný počet _elementárních operací_ $f(n)$ provedených na vstupu velikosti $n$, pokud nedokážeme určit přesný počet, tak se snažíme o co nejtěsnější horní odhad.
3. Z $f(n)$ odebereme všechny části polynomu, až na nejrychleji rostoucí člen.
4. Z $f(n)$ odebereme **multiplikativní** konstanty.
Postupem nám zbude jen jakási funkce $g(n)$ a řekneme, že algoritmus je asymptoticky $O(g(n))$ složitý, tedy v nejhorším případě mu roste složitost pomocí $g(n)$ funkce. 

Můžeme též zavést průměrnou časovou složitost, kdy vezmeme vstupy velikosti $n$ a analyzujeme kolik zdrojů (výpočetního času) spotřebuje v průměru. 

Asymptotické složitostí třídy se dají měřit také pro prostorovou složitost a pro její zjištění se dá stejně jako v úvodním postupu, jen nahradíme _elementární operace_ za využité _triviální prostorové buňky_.

---
# Asymptotická notace
*Definice:* Nechť $f,g: \mathbb{N} \to \mathbb{R}$ jsou funkce, řekneme že $f(n) \in O(g(n))$, tedy $f$ patří do složitostní třídy $O(g(n))$, když platí $\exists c \in \mathbb{R}^+: f(n)\leq cg(n)$ pro skoro všechny vstupy (existuje jen konečně mnoho výjimek.)

*Definice:* Mějme $f,g: \mathbb{N}\to \mathbb{\mathbb{R}}$, pokud $\exists c \in R^+$ taková, že $f(n) \geq c g(n)$ pro skoro všechna $n$, tak řekneme, že $f(n) \in \Omega(g(n))$, a $g$ je asymptotický dolní odhad funkce $f$. 

*Definice:* Pokud pro $f,g: \mathbb{N}\to \mathbb{R}$ platí $f \in O(g)$ a $f\in\Omega(g)$, pak je $f$ třídy $\Theta(g)$. Tedy $\Theta(g) = \Omega(g) \cap O(g)$.
