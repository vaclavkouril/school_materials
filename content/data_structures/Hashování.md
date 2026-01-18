# Notace
- Univerzum $\mathcal{U}$ je množina celých čísel $\{ 0,\dots,U-1 \}$ označená $[U]$.
- Množina přihrádek $B = [m]$.
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

---
# Konstrukce $\mathcal{L}$ a $\mathcal{L}'$
*Definice:* Pro libovolné prvočíslo $p$ a $m \leq p$, tak definujeme rodinu lineárních funkcí 
$$
\mathcal{L} = \{ h_{a,b} \mid a,b\in [p],\, h_{a,b} : [p] \to [m],\, \text{kde } h_{a,b}(x) = ((ax+b) \mod p) \mod m\}.
$$
### *Tvrzení:* Rodina $\mathcal{L}$ je $2$-univerzální.
*Důkaz:* Mějme $x,y$ dvě různá čísla v $[p]$ a pro libovolné $(a,b) \in [p]^2$ mějme
$$
\begin{align*}
r&= (ax+b) \mod p \\
s &=(ay + b) \mod p
\end{align*}
$$
To pro fixní $x,y$ definuje zobrazení a $(a,b)\in [p]^2$ do $(r,s)\in [p]^2$, je to dokonce bijektivní zobrazení, protože pro dané $(r,s)$ můžeme vyřešit rovnice a protože $\mod p$ tvoří těleso tak systém rovnic má unikátní řešení.

Tedy vzhledem k tomu, že je to bijekce, tak je uniformně náhodný výběr $(a,b)$ ekvivalentní uniformně náhodnému výběru $(r,s)$. Spočtěme teď špatné páry $h_{a,b}(x) = h_{a,b}(y)$ vůči modulo $m$. $(r,s)$, taková, že $r \equiv s \mod m$, rozdělíme $[p]$ na $\left\lceil  \frac{p}{m}  \right\rceil$ $m$-tic prvků za sebou v pořadí dle $<$, kde poslední je potenciálně nekompletní. Každá $m$-tice má  jeden prvek kongruentní s $r$, až na poslední, která může mít jeden nebo žádný. 

Tedy pro každé $r$ máme $\left\lceil  \frac{p}{m}  \right\rceil \leq \frac{p+m-1}{m}$ špatných párů. Protože $m \leq p$, tak $\frac{p+m-1}{m} \leq \frac{2p}{m}$. Různá $r$ můžeme zvolit jen $p$-krát, tedy celkem špatných je maximálně $2p^2 /m$.

Celkem je $p^2$ párů, tak jeden konkrétní pár $(r,s)$ je špatný je $2/m$. Z bijekce mezi páry platí to samé pro $(a,b)$ páry a tedy je to $2$-univerzální systém.

*Definice:* Pro libovolné prvočíslo $p$ a $m \leq p$ mějme
$$
\mathcal{L}' = \{ h_{a,b} \mid a,b\in [p],\, a\neq 0,\, h_{a,b} : [p] \to [m],\, \text{kde } h_{a,b}(x) = ((ax+b) \mod p) \mod m\}.
$$
### *Tvrzení:* Rodina $\mathcal{L}'$ je $1$-univerzální
*Důkaz:* Mějme $x,y$ a $(r,s)$ jako v předešlém důkazu a bijekce pořád platí, jen $a \neq 0$ se propíše na $r \ne s$ a tedy pro každé $r$ máme jen $\left\lceil  \frac{p}{m}  \right\rceil -1$ (nerovnají se a tedy i když jsou kongruentní tak nevzniknou jako špatné páry) a různých párů máme $p(p-1)$ a voleb $r$ je $p$, pak je **špatných párů**
$$
p \left( \left\lceil  \frac{p}{m}  \right\rceil -1  \right) \leq p \left(\frac{p+m-1}{m} -1\right) = \frac{p(p-1)}{m} \
$$
a pokud uniformně náhodně volíme páry, tak nám vychází pro dané $(a,b)$ pravděpodobnost $\frac{1}{m}$ na špatnost páru.

### *Tvrzení:* Rodina $\mathcal{L}$ je $(2,4)$-nezávislá
*Důkaz:* Zafixujeme si $x,y\in [p]$ různá a $i,j \in [m]$, pro ověření nezávislosti potřebujeme, aby
$$
\Pr[h_{a,b}(x) = i \land h_{a,b}(y) = j] \leq \frac{4}{m^2}.
$$
Mějme opět bijekci mezi $(a,b)$ a $(r,s)$ dostáváme, že $h_{a,b}(x) = i$ je ekvivalentní s $i \equiv r \mod m$ a pro $h_{a,b}(y)=j$ obdobně $j \equiv s \mod m$ a vzhledem k nezávislosti, tak můžeme obě brát odděleně. 

Spočtěme hodnoty $r$ kongruentní s $i$, rozdělíme $[p]$ na $m$-tice, tak aby každá měla jen jedno takové $r$, tak jich je pro jedno $r$ je $\left\lceil  \frac{p}{m}  \right\rceil$ a pravděpodobnosti pro prvek $[p]$, že je kongruentní je nejvýše 
$$
\frac{\left\lceil  \frac{p}{m}  \right\rceil}{p} \leq \frac{p+m-1}{pm} \leq \frac{2p}{mp} = \frac{2}{m}. 
$$
Symetricky to samé platí pro $s$ a tedy pokud obě mají pravděpodobnost pro prvek $[p]$, že bude s nimi kongruentní v $\mod p$, tak dohromady máme $\frac{4}{m^2}$. 

---
# Lemma M&K&G
### *Lemma M:* (Kompozice modulo $m$) Mějme $\mathcal{H}$ $(2,c)$-nezávislou rodinu funkcí z $\mathcal{U}$ do $[r]$ a $m < r$, pak rodina $\mathcal{H} \mod m = \{ h \mod m \mid h \in \mathcal{H} \}$ je $2c$-univerzální a $(2,4c)$-nezávislá.
*Důkaz:* $2c$-univerzalita: Pokud nastane $h(x)\mod m \equiv h(y)\mod m$ pro dvě různá $x,y$ nastane když máme nějaká $i_{1} \equiv i_{2} \mod m$ a $h(x) = i_{1} \land h(y) = i_{2}$, a z $(2,c)$-nezávislosti máme
$$
\Pr[h(x) = h(y)] = \sum_{i_{1} \equiv i_{2} \mod m} \Pr[h(x) = i_{1} \land h(y) = i_{2}]
$$
ve kterém je každý člen maximálně $c/r^2$. Máme $r$ výběrů $i_{1}$ a pro e každou máme 
$$ 
\left\lceil  \frac{r}{m}  \right\rceil \leq \frac{m + r -1}{m} \leq \frac{2r}{m}
$$
$i_{2}$ kongruentních s $i_{1}$. Takže celá suma je omezena shora
$$
\Pr[h(x) = h(y)] \leq \frac{c}{r^2} \cdot \frac{2r}{m} \cdot r = \frac{2c}{m}.
$$
Tedy je $2c$-univerzální.

$(2,4c)$-nezávislost: Mějme $x_{1} \ne x_{2}$ a dvě přihrádky $j_{1},j_{2} \in [m]$ a omezujeme
$$
\Pr_{h\in \mathcal{H}} [h(x_{1}) \equiv j_{1} \mod m \land h(x_{2}) \equiv j_{2} \mod m] = \sum_{\substack{i_{1} \equiv j_{1} \mod m, \\ i_{2} \equiv j_{2} \mod m }} \Pr[h(x_{1}) = i_{1} \land h(x_{2}) = i_2].
$$
Každý člen je maximálně $c / r^2$ a je maximálně $\lceil r /m \rceil \leq (r+m-1)/m$ výběrů $i_{1}$ a stejně je i $i_{2}$, tedy suma je omezena
$$
\frac{c}{r^2} \left( \frac{r+m-1}{m} \right)^2 \leq \frac{c}{r^2} \frac{(2r)^2}{m^2} = \frac{2c}{m^2}.
$$
Tedy máme ověřenou $(2,4c)$-nezávislost.

### *Lemma K:* ($k$-nezávislé modulo $m$) Nechť $\mathcal{H}$ je $(k,c)$-nezávislá rodina funkcí z $\mathcal{U}$ do $[r]$, $m<r,2km < r$, pak $\mathcal{H} \mod m$ je $(k,2c)$-nezávislá.
