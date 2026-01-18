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
Náhodných veličin máme $n$ a z linearity střední hodnoty máme
$$
\mathbb{E}_{h\in \mathcal{H}}\left[ \sum_{i=1}^n A_{i} \right] = n \cdot \frac{c}{m}
$$
*Důsledky:* Mějme hashovací tabulku (tedy pole přihrádek velikosti $m$) s řetězením (spojový seznam v každé buňce) používající $m$ přihrádek a hash funkci $h$ vybranou uniformně náhodně z $c$-univerzální rodiny funkcí. Mějme v tabulce $x_{1},\dots,x_{n}$.
- Hledání nexsitujícího $y$ ve struktuře odlišné od všech $x_{i}$ se podívá na všechny prvky přihrádky $h(y)$. Dle tvrzení je očekávané množství v takové přihrádce $cn/m$.
- Vložení nového prvku $y$ do její přihrádky $h(y)$ je konstantní, ale musíme překontrolovat, zda je $y$ opravdu nové. Pokud tam doopravdy není tak je to ekvivalentní předešlému hledání.
- V případě úspěšného hledání $x_{i}$, tak všechny prvky $x_{i}$ přihrádky které jsme museli projít, než jsme našli $x_{i}$ tak tam byli ještě než jsme $x_{i}$ přidali. Tedy očekávaná časová složitost úspěšného hledání je omezena časovou složitosti předešlého přidání $x_{i}$.
- Neúspěšné přidání $y$ (tedy, že už tam bylo) zabere stejně času jako úspěšné hledání.
- Smazání je vlastně stejně rychlé jako přidávání.

Pokud je $m = \Omega(n)$, tak je vše konstantní. Pokud nevíme jaké bude $n$ (kolik toho budeme vkládat) tak můžeme měnit velikost tabulky a znovu hashovat všechny prvky, když $n$ se moc zvětší. Obdobně jako u dynamického pole.

*Definice:* Nechť $\mathcal{H}$ je rodina funkcí z $\mathcal{U}$ do $[m]$. Rodina je $(k,c)$-nezávislá, pro $1\leq k \leq |\mathcal{U}|$ a $c>0$ právě tehdy, když $\forall x_{1},\dots,x_{k} \in \mathcal{U}$ každou $k$-tici různých prvků a každou $k$-tici $a_{1},\dots,a_{k}$ přihrádek v $[m]$ platí
$$
\Pr_{h \in \mathcal{H}} [h(x_{1}) = a_{1} \land\dots \land h(x_{k}) = x_{k}] \leq \frac{c}{m^k}.
$$
*Pozorování:*
- Když je $\mathcal{H}$ $(k,c)$-nezávislá pro $k>1$, tak je i $(k-1,c)$-nezávislá.
- Když je $\mathcal{H}$ $(2,c)$-nezávislá, pak je $c$-univerzální.

