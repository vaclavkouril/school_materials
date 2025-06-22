*Definice:* Nechť $X \subseteq \mathbb{R}^n, Y \subseteq \mathbb{R}^m$, kde $n,m \in \mathbb{N}$. Potom **homeomorfismus** $f: X \to Y$ je spojité [zobrazení](mff_statnice/discrete_math/Funkce), bijekce a $f^{-1}$ je také spojitá. $X,Y jsou homeomorfní $X \cong Y$ existuje-li mezi nimi homeomorfismus.

*Definice:* **Plocha** je kompaktní (uzavřená, omezená), souvislá (např. oblouková – každé dva body můžeme propojit obloukem), $2$-rozměrná varieta bez hranice (dostatečně malé okolí každého bodu je homeomorfní otevřenému okolí v $\mathbb{R}^2$).

Příkladem je třeba sféra nebo torus v $\mathbb{R}^3$, naopak celá $\mathbb{R}^2$ do definice nezapadá kvůli kompaktnosti.

Každý druh plochy lze zkonstruovat přidáním
- *ucha*, kde vyřízneme dva kruhy v ploše, kde k těmto dvěma dírám přidám uzavřený plášť válce, na hranici dvou kruhů, který je jinak disjunktní se zbytkem.
- *křižítka*, kde vyříznu zase kruh a přidám jakýsi "teleport", jenž bod přemostí do bodu naproti přes křižítko.

Značme $\Sigma_{g}$ pro $g \in \mathbb{N}$, jež je plochou vzniklou ze sféry přidáním $g$ uší. Je to **orientovatelná plocha** rodu $g$.
Obdobně značíme $\Pi_{g}$ pro $g \in \mathbb{N}$ **neorientovatelnou plochu** rodu $g$ vzniklou přidáním $g$ křižítek ke sféře.

---
# Nakreslení grafu
*Definice:* Nakreslení grafu $G$ na plchu $\Gamma$ je zobrazení $\varphi$ takové že
- $\forall v \in V(G)$ přiřadí bod $\varphi \in \Gamma$
- $\forall e \in E(G)$ přiřadí prostou, tedy vzájemně neprotínající, křivku $\varphi(e) \in \Gamma$ spojující oba konce dané hrany
- žádné dva vrcholy se nepřekrývají
- hrany se překrývají jen ve sdílených vrcholech
- vrcholy které nepatří hraně se s ní neprotínají

*Definice:* Stěna nakreslení je souvislá komponenta $\Gamma \setminus \left( \bigcup_{x \in E(G) \cup V(G)} \varphi(x)\right)$.
*Definice:* Buňkové nakreslení je takové nakreslení, že každá jeho stěna je homeomorfní otevřenému kruhu v $\mathbb{R}^2$.

----
# Eulerova formule
*Definice:* **Eulerova charakteristika plochy** $\Gamma$ je 
$$
\begin{align}
\text{X}(\Gamma) &= \left\{ \begin{array}{lcl} 2-g & \Gamma \cong \Pi_{g} & \text{pro } g \geq 1 \\
2-2g & \Gamma \cong \Sigma_{g} & \text{pro } g \geq 0
\end{array} \right.  \\
&= 2 -\text{počet křižítek} - 2 \cdot \text{počet uší}.
\end{align}
$$
*Věta:* (Zobecněná Eulerova formule) Mějme nakreslení grafu $G$ na ploše $\Gamma$, které má $S$ množinu stěn. Pak $|V| - |E| + |S| \geq \text{X}(\Gamma)$. Pokud je zakreslení buňkové tak to platí s rovností.

*Důkaz:* Indukcí dle rodu $\Gamma$, pro $\Gamma \cong \Sigma_{0}$ toto platí, protože to je rovinná verze Eulerovi formule. 
Následující postup je analogický pro $\Gamma \cong \Sigma_{g}$, kde trháme ucha, nyní si označme $v(G), e(G),s(G)$ jako počty vrcholů hran a stěn. Mějme buňkové nakreslení $G$ na $\Gamma \cong \Pi_{g}$

Nechť $K$ je křižítko na $\Gamma$ a $x_{1},x_{2},\dots,x_{k}$ jsou body $K$ (ne nutně ale vrcholy grafu), kde $G$ hrany hraničí s $K$. Můžeme předpokládat $k \geq 1$, protože jinak by stěna s $K$ nebyla buňková.  Navíc b.ú.n.o. každý vrchol přímo na $K$ posuneme o trochu vedle aby byli incidentní jen hrany.

Vytvoříme si graf $G'$ přidáním dvou dělících vrcholů těšně vedle každého $x_{i}$ na příslušnou hranu. A skóre se pro $G'$ změnila tedy na
$$
\begin{align}
v(G') &= v(G) + 2k \\
e(G') &= e(G) + 2k \\
s(G') &= s(G)
\end{align}
$$
a tedy levá strana rovnice se nezměnila oproti původnímu $G$.

Nyní vytvoříme $G''$ přidáním cest délky 2 k sousedním vrcholům pro každý vrchol $x_{i}$, tím vyrobíme kružnici $V$ kolem $K$ a skóre se změní 
$$
\begin{align}
v(G'') &= v(G') + 2k \\
e(G'') &= e(G') + 4k \\
s(G'') &= s(G) + 2k \text{ (stěny skrze křižítko dělíme na 3)}
\end{align}
$$
a levá strana rovnice se opět nehnula.

Teď odebereme vše uvnitř $C$ a vytvoříme $G'''$ a skóre je nyní
$$
\begin{align}
v(G''') &= v(G'') \\
e(G''') &= e(G'') - k \text{ (podle k křížících se hran)} \\
s(G''') &= s(G) - k +1
\end{align}
$$
a levá strana se změnila o $1$ a tedy dle indukčního předpokladu máme
$$
v(G''') - e(G''') + s(G''') = \text{X}(\Pi_{g-1})
$$
jako platné a z konstrukce nám vychází
$$
\begin{align}
v(G''') - e(G''') + s(G''') &= v(G) - e(G) + s(G) +1 \\
\text{X}(\Pi_{g-1}) &= \text{X}(\Pi_{g}) + 1
\end{align}

$$
a to sedí s definicí.

*Důsledek*: Každý graf $G$ nakreslitelný na plochu $\Gamma$ splní $|E|\leq3\cdot|V|-3\text{X}(\Gamma)$, pokud $|V|\geq 4$.
*Důkaz:* Předpokládejme, že každá stěna je trojúhelník a dosadíme $|S| = \frac 2 3 |E|$.

*Věta:* Nechť $\Gamma$ je plocha $\Gamma \not\cong \Sigma_{0}$, nechť je $G$ nakreslený na $\Gamma$. Potom existuje vrchol v $G$, který má stupeň ($\delta(G)$ - nejmenší stupeň v $G$) 
$$
\delta(G) \leq \left\lfloor  \frac{5+\sqrt{ 49 +24 \text{X}(\Gamma) }}{2}  \right\rfloor 
$$
*Důkaz:* Mějme průměrný stupeň jako v *Důsledku* Eulerovi formule. Sice $\frac{2e(G)}{v(G)}$ a máme
$$
\begin{align}
e(G) &\leq 3v(G) - 3 \text{X}(\Gamma) \\
\frac{2e(G)}{v(G)} &\leq 6 - \frac{6\text{X}(\Gamma)}{v(G)}  \\

\end{align}
$$a vzhledem k tomu, že to je průměr. tak jistě existuje jeden menší.