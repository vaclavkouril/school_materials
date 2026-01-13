*Definice:* Funkce $f: \Sigma^* \to \mathbb{N}$ patří do třídy $\#P$ pokud existuje polynomiální verifikátor $V$ a polynom $p(n)$ takové, že pro každý $x \in \Sigma^*$ platí
$$
f(x) = |\{ y\in \{ 0,1 \}^{p(|x|)}) \mid V(x,y) \text{ přijme} \}|.
$$
Alternativně to znamená počet přijímajících výpočtů $M(x)$ pro nějaký $NTS$ $M$, který pracuje v poly čase.

---
*Definice:* Funkce $f$ je polynomiálně převoditelná na funkci $g(f \leq_{P} g)$, pokud lze $f$ vyčíslit v polynomiálním čase algoritmem, který má přístup k orákulu funkce $g$.

Tedy pokud orákulum $g$ umí odpovídat na vstupy $y$, tak mu můžeme dát polynomiální počet dotazů, tak algoritmus dopočte $f$ v poly čase.

 *Definice:* $g \in \#P$ je $\#P$-úplná, pokud $f\leq_{P} g$ pro každou $f \in \#P$,

*Věta:* $\#SAT$ je $\#P$-úplná

*Důkaz:* Mějme $f \in \#P$ a $V$ je poly verifikátor a $p(n)$ polynom, které splňují
$$
f(x) = |\{ y\in \{ 0,1 \}^{p(|x|)}) \mid V(x,y) \text{ přijme} \}|.
$$
tak uvažme NTS $M$  se vstupem $x$
1. Nedeterministicky vyber $y\in \{ 0,1 \}^{p(|x|)}$
2. Pusť $V(x,y)$ a přijmi dle něho

pak $f(x)$ je počet přijímající výpočtů $M(x)$

Z důkazu Cook-Levinovy věty jsme popsali CNF $\varphi$, která s každým ohodnocením $a$ splňuje
$$
\varphi(a) = 1 \iff a \text{ reprezentuje přijímací výpočet } M(x)
$$
a máme bijekci mezi modely $\varphi$ a přijímajícími výpočty $M$ a tedy platí $f(x) = \#SAT(\varphi)$ a tedy algoritmus
1. poly zkonstruuj $\varphi$
2. vrať $\#SAT(\varphi)$

je polynomiální, tedy
$$
f \leq_{P} \#SAT.
$$

---
*Definice:* Pokud poly převod $\#A$ na $\#B$ zachovává počet certifikátů, tak je parsimonious.

---
# Počítání cyklů
*Definice:* $\#CYCLE$: Mějme $G = (V,E)$ orientovaný graf, pak chceme spočítat počet cyklů v $G$.

Volně předpokládejme $NP$-úplnost Hammiltonovské kružnice.

*Věta:* Pokud $\#CYCLE$ lze vyčíslit v poly čase, tak $P =NP$.

*Důkaz:* Předpokládejme $n = 2^k$, pokud by nebyla tak mějme $k = \lceil \log n \rceil$ a vyberme $s \in V$ nahradíme ho dvěma vrcholy $s_{in},s_{out}$ s hranami co šlo do $s$ tak jde do $s_{in}$ pak $s_{in}$ mezi $s_{out}$ nacpeme vrcholy aby vyšlo $n= 2^k$. 

Každou hranu nahradíme podgrafem o $m = n \log n$ úrovních, že úroveň 1 maji oba vrcholy hrany do obou dalsich, tak aby $G'$ měl $2^m$ orientovaných cest z $u$ do $v$ a cyklus v $G$ délky $\ell$ dává vzniknout $2^{m\ell}$ cyklům v $G$.

Obsahuje-li $G$ hamiltonovský cyklus, tak $G'$ má alespoň $2^{m \cdot n} = n^{n^2}$ cyklů.

Pokud $G$ nemá hamiltonovskou kružnici, tak každý cyklus v $G$ má délku maximálně $n-1$ a vezměme $n^\ell$ jako horni odhad na počet cyklů velikosti $\ell$
$$
\#CYCLE(G') \leq \sum^{n-1}_{\ell=2} n^\ell \cdot 2^{m\ell} \leq \sum^{n-1}_{\ell = 2}(n \cdot n^{n})^\ell \leq (n-2) \cdot (n n^n)^{n-1} < n \cdot (n n^n)^{n-1}   = n^{n^2} 
$$
tedy pokud $\#CYCLE$ lze vyčíslit, tak rozhodujeme v poly čase existenci Hammiltonovské cesty.