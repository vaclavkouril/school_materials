Definice: (bod) je prvek $\mathbb{R}^2$

Definice: (křivka) je prostá a spojitá množina bodů

Definice: (jednoduchá křivka = oblouk) je $f:[0,1]↦\mathbb{R}^2$ spojitá a prostá.
- jednoduchá **uzavřená** křivka je kružnice: prostá až na $f(0)=f(1)$

*Definice:* **Rovinné nakreslení** multigrafu $(V,E,K)$ je $\nu: V \to \mathbb{R}^2$ a $\{ C_{e} \ | \ e \in E \}$ množina oblouků/kružnic takových že:
1. $(\forall e\in E)K(e) = \{ u,v \} \implies C_{e}$ je oblouk s konci $\{ \nu(u), \nu(u)\}$
2. $(\forall e\in E)K(e) = u \implies C_{e}$ je kružnice obsahující $\nu(u)$
3. $(\forall e,f\in E, e \neq f) \implies C_{e} \cap C_{f} = \nu[K(e) \cap K(f)]$, takové průniky jsou jen vrcholy
4. $(\forall v \in V,\forall e\in E)\nu(v) \in C_{e} \implies v \in K_{e}$, protíná-li kružnice vrchol, pak je vrchol na té hraně

*Definice*: Graf je **rovinný**, pokud existuje nějaké jeho rovinné nakreslení.

*Definice:* Topologický rovinný graf je daný graf a jeho nakreslení na rovinu.

Definice: Topologická kružnice dělí (Jordanova věta) rovinu na 2 části, tyto části jsou **stěny nakreslení**. 

# Eulerova formule pro rovinné grafy
*Věta:* (Eulerova formule, [zobecněná](mff_statnice/discrete_math/graph_theory/Kreslení%20grafů%20na%20plochách#Eulerova%20formule)) V souvislém topologickém rovinném grafu platí
$$
|V| + |S| = |E| + 2,
$$
kde $V$ je množina vrcholů, $E$ množina hran a $S$ množina stěn nakreslení. 
*Důkaz:* Zafixujeme si $v = |V|$ pevné a libovolné a indukce dle $e = |E|$.
1. $e = v-1$ a graf je strom máme jen jednu stěnu $f = 1 =|S|$. Máme$$
v+1 = v -1 +2
$$
2. Indukční krok $e \to e+1$ je na základě zafixovaného $v$ ne-strom a mám cyklus. Zvolme hranu $h$ na cyklu a mějme $G' := G-h$ a máme $v' = v$, $e' = e$, $f' = f-1$ a dle indukčního předpokladu máme$$
\begin{align}
v' +f' &= e' + 2 \\
v + f -1 &= e +2 \\
v + f &= (e+1) +2
\end{align}
$$
kde $e+1$ je počet hran $E(G)$ a tedy hotovo.
*Intuice:* Přidání, odebrání hrany na kružnici posune obě strany rovnosti o jedna stejným směrem.