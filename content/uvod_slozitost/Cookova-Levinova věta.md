Problém splnitelnosti (SAT) je zjevně v $NP$, protože jako certifikát můžeme použít pravdivé ohodnocení proměnných.

*Věta:* (Cook-Levinova) SAT patří do $P \iff P= NP$

---
# Polynomiální převoditelnost
*Definice:* Jazyk $B$ je polynomiálně převoditelný na jazyk $A$, ($B \leq_m^{P} A$), právě když existuje polynomiálně algoritmicky vyčíslitelná funkce $f$ (existuje pro ni TS $M$ počítající $f$ v čase $P$), že
$$
(\forall x \in \Sigma^*)[x \in A \iff f(x)\in B].
$$
*Lemma:* Pokud $A\in P, B \leq_{m}^PA$, pak $B \in P$.

*Důkaz:* Mějme $M_{A}$ rozhodující $L(M_{A}) =A$ v poly čase, pak $M_{B}$ se vstupem $x$:
1. $y \leftarrow f(x)$
2. Pustíme $M_{a}(y)$ a přijmeme dle něho.

*Lemma:* Pokud $A \in NP, B \leq_{m}^P A$, pak $B \in NP$

*Důkaz:* Konstrukce $V_{B}$ se vstupem $x$ a certifikátem $y$
1. $z \leftarrow f(x)$
2. Pustíme $V_{A}(z,y)$ a přijmi dle něho.

---
# NP těžkost
*Definice:* Jazyk $B$ je
- $NP$-těžký pokud $\forall A\in NP: A \leq_{m}^P B$,
- $NP$-úplný je-li v $NP$ a $NP$-těžký.

---
# *Věta:* SAT je NP-úplný problém
*Důkaz:* $NP$ těžkost SAT-u chceme ukázat tak, že je-li $A$ z $NP$ přijímán nějakým NTS $M$ v poly čase, tak modely $\varphi$ popisují přímo výpočty $M$ nad $w \in A$. 

Mějme NTS $M = (Q, \Sigma, \delta, q_{0}, F=\{ q_{1} \})$, s $Q \cap\Sigma = \emptyset$, pracující v čase $n^k - 3$ a $w$ je přijato $M$ pokud v posloupnosti konfigurací existuje přijímající konfigurace.

Definujme si **Tablo** jako $n^k \times n^k$ tabulku, kde řádky popisují konfigurace, tak aby byly ohraničeny $\#$ a stav je zapsané před políčkem, které je pod hlavou $M$ a konfigurace na řádku $i >1$ následuje z konfigurace na řádku $i-1$ pomocí $\delta$.

Přijímající tablo je takové, které obsahuje přijímající konfiguraci na nějakém řádku.

Buňka $T[i,j]$ je jedno políčko tabla.

$M$ přijímá $w \iff$ existuje přijímající tablo pro $M(w)$.

Chceme takové tablo kódovat do CNF formule $\varphi$, množina symbolů v buňkách tabla je $S= Q \cup \Sigma \cup  \{ \# \}$ a $\varphi$ má proměnné $x_{i,j,s}$ pro $i,j = 1,\dots,n^k$ a $s\in S$. Pak v modelu $\varphi$ má platit
$$
x_{i,j,s} = 1 \iff T[i,j] =s.
$$
Takové $\varphi$ můžeme charakterizovat 4 částmi:
1. $\varphi_{\text{cell}}$ unikátnost každé buňky
2. $\varphi_{\text{start}}$ 1. řádek jako startovní konfigurace výpočtu
3. $\varphi_{move}$ charakterizace validního přechodu mezi každými 2 řádky dle $\delta$
4. $\varphi_{\text{accept}}$ jeden z řádků obsahuje $q_{1}$ jako přijímající stav.

### $\varphi_{\text{cell}}$
$$
\varphi_{\text{cell}} = \bigwedge_{1 \leq i, j \leq n^k} \left[(\overbrace{\bigvee_{s \in S} x_{i,j,s})}^{\text{alespoň 1}} \land \big( \bigwedge_{s,t \in S, s\neq t} \neg x_{i,j,s} \lor \neg x_{i,j,t} \big)\right]
$$
### $\varphi_{\text{start}}$
$$
\varphi_{\text{start}} = x_{1,1,\#} \land x_{1,2,q_{0}} \land (\bigwedge_{i\in \{ 3,\dots,n+2 \}} x_{1,i,w_{i-2}}) \land (\bigwedge_{i \in \{ n+3,\dots,n^k-1 \}} x_{1,i,\lambda} ) \land x_{1,n^k, \#}
$$
### $\varphi_{move}$
Okno je $2\times 3$ podmatice $T$ a $(i,j)$-okno je takové, že levá horní buňka je na $i,j$. **Přípustné okno** je součástí nějakého přechodu dle $\delta$. 

*Lemma:* Předpokládejme, že 1. řádek tabla obsahuje počáteční konfiguraci se vstupem $w$ a všechna okna jsou přípustná, pak každá řádka table je konfigurací jež následuje předchozí konfiguraci dle $\delta$. 

*Důkaz:* Indukcí, ukážeme, že pokud $i$ je konfigurací tak i $i+1$ je konfigurací. Uvažme tedy každý symbol na $i$ řádku:
1. $\#$ přípustné okno ho jen okopíruje a jsou jen na okrajích.
2. $a \in \Sigma$ v buňce jenž nesousedí se stavem pak dle přípustnosti okna pokud je v prostředním sloupci okna tak zůstane ve stejném sloupci.
3. $a = q \in Q$ $q$ je uprostřed řady nějakého okna, z přípustnosti plyne, že stav i okolní symboly se změní jen dle $\delta$.

Tedy je-li na $i$ řádce konfigurace, pak na $i+1$ je také a to ta která následuje dle $\delta$.

Pro každou řádku je změna jen na 5 oknech a zbytek se okopíruje, a ověření dle $\delta$ se dá provést v $|S|^6$ konstantním čase, je-li $M$ pevně daný.

Stačí zakódovat přípustné okno
$$
legal_{i,j} = \bigvee_{s_{1},\dots,s_{6} \text{ je přípustné okno}} (x_{i,j,s_{1}} \land x_{i,j+1,s_{2}} \land x_{i,j+2,s_{3}} \land x_{i+1,j,s_{4}} \land x_{i+1,j+1,s_{5}} \land x_{i+1,j+2,s_{6}})
$$
distributivitou $\land,\lor$ můžeme udělat z konstantní velikosti $legal_{i,j}$ jeho konstantně velkou CNF verzi. 

A tedy
$$
\varphi_{\text{move}} = \bigwedge_{1 \leq i, j \leq n^k} legal_{i,j}
$$
### $\varphi_{\text{accept}}$
$$
\varphi_{\text{accept}} = \bigvee_{1 \leq i,j \leq n^k} x_{i,j,q_{1}}
$$
### Velikost $\varphi$ a korektnost
$$
\varphi = \varphi_{\text{cell}} \land \varphi_{\text{start}} \land \varphi_{\text{move}} \land \varphi_{\text{accept}}
$$
má $(n^k)^2 \cdot |S|$ proměnných, tedy $O(n^{2k})$ a konstrukci $\varphi$ lze provést v poly čase v $n$ a z konstrukce je $\varphi$ splnitelná, když $w\in A$.