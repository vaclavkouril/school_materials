# Algoritmický problém
*Definice:* **Výpočetní problém** je $f: \{ 0,1 \}^* \to \mathcal{U}$ pro
- $\mathcal{U} = \{ 0,1 \}$ rozhodovací problém,
- $\mathcal{U}=\mathbb{Z},\mathbb{Q}$ obecný číselný problém, optimalizace, (nejkratší cesta, MAXSAT,...),
- $\mathcal{U}= \{ 0,1 \}^*$.
---
# Uniformní modely
Mějme algoritmus $A$ spočitatelný na RAM, nebo Turingově stroji, pak pokud platí
$$
(\forall x \in \{ 0,1 \}^*)[A(x) = f(x)],
$$
tak je $A$ **uniformní algoritmus** pro výpočetní problém $f$.

---
# Neuniformní modely
*Definice:* Pro výpočetní problém $f$ zkracujeme přepis $f\mid_{\{ 0,1 \}^n}$ na $f_{n}$, tedy pak 
$$
f_{n} : \{ 0,1 \}^n \to \mathcal{U}, \quad (\forall x \in \{ 0,1 \}^n) [f_{n}(x) = f(x)].
$$

*Definice:* Pokud pro všechna $n \in \mathbb{N}$ existuje algoritmus $A_{n}$ řešící $f_{n}$, tak je $A = \{ A_{n} \}_{n\geq_{0}}$ **neuniformní algoritmus** pro $f$.

## Booleovské formule
Formule mějme jako strom s uzly označenými logickými symboly a listy proměnnými. Mějme pak výpočetní problém $f$ a posloupnost $\{ \phi_{n} \}_{n\geq 0}$, kde $\phi_{n}$ počítá $f_{n}$. 

Mějme $f:\{ 0,1 \}^* \to \{ 0,1 \}$ rozhodovací problém, pak pro všechna $f_{n}:\{ 0,1 \}^n \to \{ 0,1 \}$ existuje $\psi_{n}$ počítající $f_{n}$ (přinejmenším DNF jako disjunkci všech $1$ výsledků $f_{n}$, tedy modelů). Takových je maximálně $2^n$ a pro vyrobení stromu booleovské formule je potřeba ještě $n$-krát řetězit $\lor$, takže dohromady každá funkce $f:\{ 0,1 \}^* \to \{ 0,1 \}$ je spočitatelná s $\{ \psi_{n} \}_{n\geq{0}}$, kde $\psi_{n}\equiv f_{n}$ s $|\psi_{n}|\leq O(n{2}^n)$.

![bool_dnf_tree.excalidraw](bool_dnf_tree.excalidraw.svg)

## Booleovské obvody
- Zobecnění booleovských formulí ze stromů na DAG-y (directed acyclic graph).
- Obvod značen $C_{n}$ pro $f_{n}$

Pokud bychom měli nějaký algoritmu $D$, který pro $n \in \mathbb{N}$ vyrobí obvod řešící $f_{n}$, tak se nejedná o neuniformní model, ale uniformní, protože to bychom uměli na TS simulovat.

*Věta:* $\forall f_{n}: \{ 0,1 \}^n\to \{ 0,1 \}$ existuje obvod s binárními $\land,\lor$ a unárním $\neg$ velikosti $10n{2}^n$.

*Důkaz:* Implementuje CNF nebo DNF daného $f_{n}$ a pro DNF $\lor$ má hloubku zhruba $n$ aby spojilo všech $2^n$ modelů a $\land$ v modelech je potřeba $\log n$ hloubku, tedy máme $n$ za každý model (konjungce literálů) spojené pomocí $2^n$ $\lor$ uzly.

*Věta:* $f \in P \implies f$ má polynomiálně velké obvody.

*Důkaz:* Mějme tabulku výpočtu $f_{n}$, kde $f\in P$, tedy jeho běh je na TS s jednou páskou v čase $t(n) = O(n^k)$. Tabulka maximálně šířku (velikost použité pásky) $t(n)$ a výšku $t(n)$ (počet kroků). Musíme vše zakódovat binárně, ale to navýší složitost maximálně konstantně, velikost jedné buňky bude
$$
\ell = \lceil \log \Gamma \rceil + \lceil \log Q \rceil + I.
$$
Každá buňka ale závisí jen na $3$ buňkách pod ní, protože přechodová funkce kouká jen na maximálně tři buňky, tedy instrukce přechodové funkce pro dané okno $C_{M}: \{ 0,1 \}^{3\ell} \to \{ 0,1 \}^\ell$ je vlastně jen konstantně velký obvod. 

Tedy $C_{n}$ jen pro každou buňku rozhodne, zda je validním přechodem/přepisem na základě konstantního obvodu a celkem buněk je $O(t(n)^n)$ pro spočtení dané $f_{n}$.

*Důsledek:* $NP$ nemá polynomiálně velký obvod $\implies P \neq NP$.