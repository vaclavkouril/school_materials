# Notace
- Univerzum $\mathcal{U}$ je množina celých čísel $\{ 0,\dots,U-1 \}$ označená $[U]$.
- Množina košů $B = [m]$.
- Množina $X \subset \mathcal{U}$ o celkem $n$ prvcích uložených v datové struktuře.
- Hashovací funkce $h: \mathcal{U} \to \mathcal{B}$,

*Definice:* Mějme rodinu funkcí $\mathcal{H} = \{ f \mid f: \mathcal{U} \to [m]\}$, řekneme o ní, že je $c$-univerzální pro nějakou konstantu $c>0$, když
$$
\forall x,y \in \mathcal{U}, x \ne y : \Pr_{h \in \mathcal{H}} [h(x) = h(y)] \leq \frac{c}{m}.
$$
Tedy pokud vybereme uniformě náhodně funkci z $\mathcal{H}$, tak pravděpodobnost kolize je jen $c$-krát horší než by byla u pravé plně náhodné funkce.

*Poznámka:* Uniformě náhodný výběr i vyhodnocení na libovolném vstupu předpokládejme konstantní. Typicky budeme volit $h_a(x)$ parametrizovanou pomocí $a$ a bereme $\mathcal{H}$, jako multimnožinu všech $h_{a}$ pro všechna $a$ a implementace výběru náhodné $h$ je plněná náhodností výběru $a$.
### *Věta:* Mějme $c$-univerzální rodinu funkcí $\mathcal{H}$ z $\mathcal{U}$ do $[m]$, mějme $X = \{ x_{1},\dots,x_{n} \} \subseteq \mathcal{U}$ množinu prvků datové struktury a $y \in \mathcal{U} \setminus X$. Pak máme $\mathbb{E}_{h\in \mathcal{H}}[\#i:h(x_{i}) = h(y)] \leq  \frac{cn}{m}$.
*Důkaz:* Mějme funkci $h\in \mathcal{H}$ vybranou uniformě náhodně a mějme indikátorovou veličinu
$$
A_{i} = \begin{cases}
1 &\text{když } h(x_{i}) = h(y) \\
0 &\text{jinak}
\end{cases}
$$
Taková náhodná veličina má střední hodnotu
$$
\mathbb{E}[A_{i}] = 1 \cdot \Pr[A_{i} = 1] = \Pr[h(x_{i}) =h(y)] \leq \frac{c}{m}
$$
Takových máme $n$ a z linearity střední hodnoty máme
$$
\mathbb{E}_{h\in \mathcal{H}}\left[ \sum_{i=1}^n A_{i} \right] = n \cdot \frac{c}{m}
$$
