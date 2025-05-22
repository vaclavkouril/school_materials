# Konečná Ramseyova věta
Pro každé $t$ a $p$ existuje $N$ takové, že pro každou funkci $c: \binom{[n]}{2} \mapsto [t], n\geq N$ existuje množina $A \in \binom{[n]}{k}$ pro níž je $c$ ma $\binom A 2$ konstantní.

Co to znamená?
- $t$ udává, kolik barev používáme
- $k$ předepisuje, jak velkou kliku si přejeme najít
- $N$ říká, jak velký graf je už „dost velkýˇ
-  $n$ je počet vrcholů grafu, který se chystáme obarvit
- $[n] = {1, . . . , n}$ očíslujeme vrcholy tohoto grafu
- $c$ je obarvení hran grafu $t$ barvami
- $A$ je $k$-tice vrcholů, která indukuje jednobarevnou kliku

Věta je velmi podobná principu holubníku. V něm ovšem nebarvíme hrany, nýbrž vrcholy samotné:
*Věta: (princip holubníku)* Pro každé $t$ a $k$ existuje $N$ takové, že pro každou funkci $c : [n] → [t], n \geq N$ existuje množina $A \in \binom{[n]}{k}$, na níž je funkce c konstantní. 
*Důkaz:* Stačí zvolit $N = t(k − 1) + 1$. 
# Nekonečná Ramseyova věta
$\forall p, t \in \mathbb{N}$ a $\forall c:\binom{\mathbb{N}}{2}\mapsto [t]$, tak $\exists A \subseteq \mathbb{N}$ nekonečná že $c$ je na $\binom{A}{2}$ konstantní.
*Důkaz*: 
Sestrojme posloupnost nekonečných množin $A_{1},A_{2},A_{3}, \dots$ . Položme $A_{1} = \mathbb{N}$ a opakujme následný krok pro $i=1,2,3,4,\dots$:
	Zvolíme $v_{i} \in A_{i}$ libovolně. Rozdělíme do ekvivalenčních tříd ostatní vrcholy, tedy $A'_{i} = A_{i} \setminus \{v_{i}\}$, dle toho jakou barvu mají hrany z $v_{i}$ do daného vrcholu a třídy označíme $B^1_{i}, B^2_{i}, B^3_{i},\dots, , B^t_{i}$. $A'_{i}$ je nekonečná a tedy alespoň jedna z tříd musí být taky, nechť je to $B^j_{i}$. Položme nyní $b_{i} = j$ a $A_{i+1} = B_{j}^i$ a znovu iterujme.
*Pozorování:* Posloupnost vybraných $v_{1}, v_{2},\dots$ má vlastnost, že kdykoliv $i<j$, tak hrana $\{v_{i}, v_{j}\}$ má barvu $b_i$.
V nekonečné posloupnosti vybraných barev $b_{1},b_{2},\dots$ je ale jen konečně mnoho hodnot. Takže některá se musí nekonečněkrát opakovat. Označme ji $b_{i}$ a její výskyty $b_{i_{1}}, b_{i_{2}}, \dots$ Z *pozorování* tedy plyne, že vrcholy $v_{i_{1}},v_{i_{2}},v_{i_{3}},\dots$ indukují námi hledanou nekonečnou jednobarevnou kliku $A$. 

*Důkaz konečné verze:*
Potřebujeme zajistit, aby vybraná podposloupnost obsahovala $k$ vrcholů. Z principu holubníku ví-
me, že k tomu stačí zaručit, aby posloupnost, ze které vybíráme, obsahovala alespoň
$tk$ prvků (neboť v ní je nejvýše $t$ různých hodnot).

Musíme tedy upravit výběr $A_{i+1}$ z $A_{i}$ a sice za $A_{i+1}$ zvolíme největší ze tříd $A_{i}$. Tedy $|A_{i+1}| \geq |A_{i}|-1/t$.
Tedy je nutné zařídit, aby konstrukce jela $tk$ kroků, tedy $|A_{tk}| \geq 1$. To nastane, když  $|A_{tk-1}| \geq t+1, |A_{tk-2}| \geq t^2 + t+1, \dots, |A_{1}| \geq \sum^{tk}_{i=0} t^i = (t^{tk+1}-1) / (t-1)$.
Stačí mít tedy $N = t^{tk+1}$ a konstrukce vytvoří dostatečně dlouhou posloupnost, abychom v ní našli jednobarevnou kliku na $k$ vrcholech.
# Nekonečná Ramseyova věta pro $p$-tice
Pro každé $t, p$ a $k$ existuje $N$ takové, že pro každou funkci $c: \binom{[n]}{p} \mapsto [t], n\geq N$ existuje nekonečná množina $A \subseteq \mathbb{N}$, pro níž je $c$ ma $\binom A p$ konstantní.
Ke státnicím je potřeba jen verze s $p=2$, která je extra výše, avšak [Důkaz](https://mj.ucw.cz/papers/ramsey.pdf) je linknut.

# Konečná Ramseyova věta pro $p$-tice
Pro každé $t, p$ a $k$ existuje $N$ takové, že pro každou funkci $c: \binom{[n]}{p} \mapsto [t], n\geq N$ existuje množina $A \in \binom{[n]}{k}$ pro níž je $c$ ma $\binom A p$ konstantní.