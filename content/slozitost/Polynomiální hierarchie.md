# Polynomiální hierarchie
*Definice:* Pro třídu jazyků $\mathscr{C}$ definujeme $\text{co-}\mathscr{C}$ jako 
$$
\text{co-}\mathscr{C} = \{ \overline{L} \mid L \in \mathscr{C} \}, \text{pro } \overline{L} = \Sigma^* \setminus L.
$$
*Definice:* Třídy jazyků $\Sigma_{0}, \Sigma_{1},\Sigma_{2},\dots$, $\Pi_{0},\Pi_{1},\Pi_{2},\dots$, $\Delta_{0},\Delta_{1},\Delta_{2},\dots$ definujme přepisem
- $\mathcal{P} = \Sigma_{0} = \Pi_{0} = \Delta_{0}$,
- $\forall k\geq{0}: \Sigma_{k+1} = NP(\Sigma_{k})$,
- $\forall k\geq 0:\Pi_{k+1} = \text{co-}NP(\Sigma_{k})$,
- $\forall k\geq 0: \Delta_{k+1} = P(\Sigma_{k})$.

*Definice:* Strukturou, které říkáme **Polynomiální hierarchie**, rozumíme $\mathcal{PH}= \bigcup_{k=0}^\infty \Sigma_{k}$.
- $\Sigma_{1} = NP(\mathcal{P}) =\mathcal{NP}$, 
- $\Sigma_{2} = NP(\mathcal{NP})$
- Pokud $\mathcal{P} = \mathcal{NP}$, pak $\mathcal{PH}$ kolabuje a $\mathcal{PH}= \mathcal{P}$.

### *Věta:* $\mathcal{PH} \subseteq PSPACE$
*Důkaz:* Indukce na $k$, kde pro $k=0$ máme $\Sigma_{0} = \mathcal{P} \subseteq PSPACE$.

Předpokládejme, že $\Sigma_{k} \subseteq PSPACE$, pak máme $\Sigma_{k+1} \stackrel{\text{def.}}{=} NP(\Sigma_{k}) \stackrel{}{\subseteq} PSPACE(\Sigma_{k}) \stackrel{\text{IP}}{\subseteq} PSPACE(PSPACE) \stackrel{\text{?}}{=} PSPACE$, stačí tedy dokázat $PSPACE(PSPACE) \subseteq PSPACE$, protože druhá strana je triviální.

Mějme $B\in PSPACE(PSPACE)$, tedy pro něj existuje DTS $M$ s orákulem $A$, který ho v polynomiálním prostoru rozhoduje $B = L(M,A)$, protože $A\in NSPACE$, tak pro něj existuje DTS $M'$, který $A$ rozhoduje v polynomiálním prostoru. Zkonstruujme $M''$ s $L(M'') = B$, který
1. Simuluje $M$ dokud nedojde na $\text{DOTAZ}$.
2. Simuluje se $M'$ v poly-prostoru a vydá odpověď na $\text{DOTAZ}$, jako $\text{Ano}$/$\text{Ne}$. (smaže se páska)
3. Pokračujeme v simulaci $M$ s dotazy na simulované orákulum dokud přijme/odmítne.

$M$ z definice pracuje v polynomiálním prostoru, stejně jako $M'$, takže $M''$ rozhoduje jazyk $B$ v polynomiálním prostoru, protože i kdyby $M$ více než polynomiálně-krát vyvolalo $\text{DOTAZ}$ tak to nevadí, protože se vždy na oracle pásce jen znovu spustí $M'$, takže se jen znovu užívá stejného polynomiálně velkého prostoru.

Dostáváme tedy, že $\forall A \in PSPACE(PSPACE): A \in PSPACE$, takže platí indukční krok platí.

---
### *Věta:* $\mathcal{PH} = \bigcup_{k=0}^\infty \Sigma_{k} = \bigcup_{k=0}^\infty \Pi_{k} = \bigcup_{k=0}^\infty \Delta_{k}$.
*Důkaz:*