# Systémy Hash funkcí
## Notace
- Univerzum $\mathcal{U}$ je množina celých čísel $\{ 0,\dots,U-1 \}$ označená $[U]$.
- Množina přihrádek $B = [m]$.
- Množina $X \subset \mathcal{U}$ o celkem $n$ prvcích uložených v datové struktuře.
- Hashovací funkce $h: \mathcal{U} \to \mathcal{B}$,

---
## Univerzalita
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
- Hledání nexesitujícího $y$ ve struktuře odlišné od všech $x_{i}$ se podívá na všechny prvky přihrádky $h(y)$. Dle tvrzení je očekávané množství v takové přihrádce $cn/m$.
- Vložení nového prvku $y$ do její přihrádky $h(y)$ je konstantní, ale musíme překontrolovat, zda je $y$ opravdu nové. Pokud tam doopravdy není tak je to ekvivalentní předešlému hledání.
- V případě úspěšného hledání $x_{i}$, tak všechny prvky $x_{i}$ přihrádky které jsme museli projít, než jsme našli $x_{i}$ tak tam byli ještě než jsme $x_{i}$ přidali. Tedy očekávaná časová složitost úspěšného hledání je omezena časovou složitosti předešlého přidání $x_{i}$.
- Neúspěšné přidání $y$ (tedy, že už tam bylo) zabere stejně času jako úspěšné hledání.
- Smazání je vlastně stejně rychlé jako přidávání.

Pokud je $m = \Omega(n)$, tak je vše konstantní. Pokud nevíme jaké bude $n$ (kolik toho budeme vkládat) tak můžeme měnit velikost tabulky a znovu hashovat všechny prvky, když $n$ se moc zvětší. Obdobně jako u dynamického pole.

---
## Nezávislost
*Definice:* Nechť $\mathcal{H}$ je rodina funkcí z $\mathcal{U}$ do $[m]$. Rodina je $(k,c)$-nezávislá, pro $1\leq k \leq |\mathcal{U}|$ a $c>0$ právě tehdy, když $\forall x_{1},\dots,x_{k} \in \mathcal{U}$ každou $k$-tici různých prvků a každou $k$-tici $a_{1},\dots,a_{k}$ přihrádek v $[m]$ platí
$$
\Pr_{h \in \mathcal{H}} [h(x_{1}) = a_{1} \land\dots \land h(x_{k}) = x_{k}] \leq \frac{c}{m^k}.
$$
*Pozorování:*
- Když je $\mathcal{H}$ $(k,c)$-nezávislá pro $k>1$, tak je i $(k-1,c)$-nezávislá.
- Když je $\mathcal{H}$ $(2,c)$-nezávislá, pak je $c$-univerzální.

---
## Konstrukce $\mathcal{L}$ a $\mathcal{L}'$
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
p \left( \left\lceil  \frac{p}{m}  \right\rceil -1  \right) \leq p \left(\frac{p+m-1}{m} -1\right) = \frac{p(p-1)}{m}
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
## Lemma M&K&G
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
*Důkaz:* V minulém důkazu jsme argumentovali pro $2$, pokud ale máme pravděpodobnost $h(x_{j})  = i_{j}$ pro všech $k$ hodnot $j$, je omezená
$$
\frac{c}{r^k} \cdot \left( \frac{r+m-1}{m} \right)^k = \frac{c}{m^k} \cdot \left( \frac{r+m-1}{r} \right)^k \leq \frac{c}{m^k} \cdot \left( 1+ \frac{m}{r} \right)^k.
$$
Tedy $\mathcal{H} \mod m$ je $(k,c')$-nezávislá pro
$$
c'=c \cdot \left( 1+\frac{m}{r} \right)^k.
$$
Protože $\forall x\in \mathbb{R}: 1+x \leq e^x$ získáváme $(1+m / r)^k \leq (e^{m / r})^k = e^{mk/r}$. A z předpokladu $km/r < \frac{1}{2}$ tak máme $e^{mk/r} \leq e^{1/2} \leq 2$. Tedy $c' \leq 2c$.

*Poznámka:* Dle *lemma M* je $\mathcal{L}$ 2-univerzální a také $(2,4)$-nezávislá, protože bijekce mezi $(a,b)$ a $(r,s)$ nám dává $(2,1)$-nezávislost bez modula $m$. Pro $p > 4m$ je dokonce $(2,2)$-nezávislá dle *lemma K*.

### *Lemma G:* (Obecné skládání) Nechť $\mathcal{F}$ je $c$-univerzální rodina funkcí z $\mathcal{U}$ do $[r]$. Nechť $\mathcal{G}$ je $(2,d)$-nezávislá rodina funkcí z $[r]$ do $[m]$. Pak $\mathcal{H} = \mathcal{F} \circ \mathcal{G} = \{ f \circ g \mid f \in \mathcal{F}, g \in \mathcal{G} \}$ je $(2,c')$- nezávislá pro $c'=(cm/r + 1)d$.
*Důkaz:* Pro různá $x_{1},x_{2} \in \mathcal{U}$ a $i_{1},i_{2} \in [m]$ chceme omezit
$$
\Pr_{h \in \mathcal{H}} [h(x_{1}) = i_{1} \land h(x_{2}) = i_{2}] = \Pr_{\substack{f \in \mathcal{F}\\ g \in  \mathcal{G}}} [g(f(x_{1})) = i_{1}) \land g(f(x_{2})) = i_{2}].
$$
Nechť $M$ označuje že platí $g(f(x_{1})) = i_{1}) \land g(f(x_{2})) = i_{2}$ a $C$ značí kolizi a sice $f(x_{1}) = f(x_{2})$, pak
$$
\Pr[M] = \Pr[M \land \neg C] + \Pr[M \land C] = \Pr[M \mid \neg C] \cdot \Pr[\neg C] + \Pr[M \mid C] \cdot \Pr[C].
$$
Pro $\Pr[C] = 0$, nebo $\Pr[\neg C]=0$ jsou nedefinované podmíněné pravděpodobnosti, ale to pak triviálně platí lemma. Můžeme rozebrat jednotlivé členy:
- $\Pr[M \mid \neg C] \leq d/m^2$ z $(2,d)$-nezávislosti $\mathcal{G}$,
- $\Pr[\neg C] \leq 1$,
- $\Pr[M \mid C] \leq d/m$, protože pokud $i_{1} \ne i_{2}$ je levá strana $0$ a jinak $(2,d)$-nezávislost implikuje $(1,d)$-nezávislost,
- $\Pr[C] \leq c/r$ z $c$-univerzality $\mathcal{F}$.

Takže $\Pr[M] \leq d/m^2 + cd/mr$, přepišme 
$$
\frac{d}{m^2} + \frac{cd}{mr} = \frac{d}{m^2} + \frac{cdm}{m^2r} = \left( \frac{1 +c \frac{m}{r}}{m^2} \right)d
$$
a máme $c'=(1+cm/r)d$ pro které je rodina $\mathcal{H}$ chtěných $(2,c')$-nezávislá.

*Důsledek:* Když $r\geq m$, tak $\mathcal{F} \circ \mathcal{G}$ je $(2,c')$-nezávislý pro $c'=(c+1)d$.

---
## Polynomiální hashování
Chceme $k$-nezávislé rodiny funkcí, které si můžeme jednoduše vyrobit pomocí polynomů řádu $k$. 

*Definice:* Pro libovolné těleso $\mathbb{Z}_{p}$ a $k \geq 1$ definujeme **polynomiálních hash funkcí**
$\mathcal{P}_{k} = \{ h_{t} : \mathbb{Z}_{p} \to  \mathbb{Z}_{p} \mid t \in \mathbb{Z}_{p}^k \}$, kde $h_{t} = \sum_{i=0}^{k-1} t_{i}x^{i}$ a $k$-tice $t := (t_{0},\dots,t_{k-1})$ je indexovaná od $0$.

### *Lemma:* Rodina $\mathcal{P}$ je $(k,1)$-nezávislá.
*Důkaz:* Nechť $x_{1},\dots,x_{k} \in \mathbb{Z}_{p}$ jsou různé a $a_{1},\dots,a_{k} \in \mathbb{Z}_{p}$ jsou přihrádky. Víme, že máme přesně jeden polynom $h$ stupně $k$, takový aby $h(x_{i})= a_{i}$ pro každé $i$. Tedy pravděpodobnost, že náhodný polynom má tuto vlastnost je $\frac{1}{p^k}$.

*Důsledek:* Když $p\geq 2km$, tak $\mathcal{P}_{k} \mod m$ je díky *Lemma K* $(k,2)$-nezávislá.

Potřebujeme $\Theta(k)$ na výběr funkce z rodiny a na výpočet pro jedno $x$.

---
## Multiply-shift hash
Mějme *bit-slice* operaci $x \left\langle a:b\right\rangle = \lfloor x / 2^a \rfloor \mod 2^{b-a}$, tedy se vezmou jen bity mezi pozicemi $a$ a $b-1$ a posunou se na least significant bit.

*Definice:* Pro libovolné $w$ (délka slova v počítači) a $\ell$ (šířku výsledku), definujeme **multiply-shift** rodinu $\mathcal{M} = \{ h_{a} : [2^w] \to [2^\ell] \mid a \in [2^w],\text{ kde }a \text{ je liché} \}$ a $h_{a}(x) =(ax)\left\langle w -\ell : w\right\rangle$.

### *Tvrzení:* $\mathcal{M}$ je $2$-univerzální.

*Definice:* Mějme $\mathcal{U} = [2^w],\ell \geq 1$ a $w' \geq w + \ell -1$. Definujme multiply-shift rodinu funkcí $\mathcal{M'} =\{ h_{a,b} \mid a,b\in [2^{w'}], a \text{ liché} \}$ z $[2^{w}]$ do $[2^\ell]$, kde $h_{a,b}(x) = (ax +b)\left\langle w' - \ell: w'\right\rangle$.

Takovou rodinu jednoduše implementujeme pro $32$-bitová slova a $\ell \leq32$, nastavme $w' = 64$. spočteme $ax+b$ s $64$-bitovým výsledkem a extrahujeme $\ell$ nejvyšších bitů shiftem doprava o $64- \ell$ bitů.

### *Tvrzení:* $\mathcal{M}'$ je $2$-nezávislá.

---
## Hash tabulkou
Mějme univerzum $\mathcal{U} = [2^{kt}]$ pro nějaké $t\geq1$ (počet částí) a $k\geq1$ (velikost částí) a $[2^\ell]$ množinu přihrádek. Vygenerujeme náhodné tabulky $T_{0},\dots,T_{t-1}$ s $2^k$ řádky s $\ell$ bity.

Rozdělíme si pro vyhodnocení funkce $x$ na části $x\left\langle ik: (i+1)k \right\rangle$ pro $0 \leq i <t$ a spočteme výsledek
$$
h(x) = \bigoplus_{0 \leq i <t} T_{i}[x\left\langle ik : (i+1)k \right\rangle].
$$
Vybrání funkce zabere $\Theta (t \cdot 2^k)$ času pro inicializaci tabulek a výpočet pro jedno $x$ zabere $\Theta(t)$.

### *Tvrzení:* Tabulkové hashování je $3$-nezávislé, ale ne $4$-nezávislé pro $t \geq 2$.

---
## Hashování vektorů použitím skalárního násobení
Mějme vstupu $d$-dimenzionální vektory nad $\mathbb{Z}_{p}$.

*Definice:* Pro prvočíslo $p$ a velikost vektorů $d\geq{1}$, definujeme rodinu skalární násobků jako $\mathcal{S}=\{ h_{t} : \mathbb{Z}_{p}^d \to \mathbb{Z}_{p} \mid t \in \mathbb{Z}_{p}^d \}$, kde $h_{t}(x)=t \cdot x$.

### *Tvrzení:* Rodina $\mathcal{S}$ je $1$-univerzální. Funkce může být vybrána z $\mathcal{S}$ náhodně v čase $\Theta(d)$ a vyhodnocena ve stejném čase.
*Důkaz:* Mějme různé vektory $x,y \in \mathbb{Z}_{p}^d$. Nechť $k$ je index, kde $x_{k} \ne y_{k}$, na pořadí nezáleží, BÚNO $k=d$.

Pro náhodný parametr $t$ máme při počítání na $\mathbb{Z}_{p}$
$$
\begin{split}
\Pr[h_{t}(x) = h_{t}(y)] = \Pr[x \cdot t = y \cdot t] = \Pr[(x-y) \cdot t = 0] = \\
= \Pr\left[ \sum_{i=1}^{d} (x_{i} -y_{i})t_{i} =0 \right] = \Pr\left[ (x_{d}-y_{d})t_{d} = - \sum_{i=1}^{d-1} (x_{i} -y_{i}) t_{i} \right].
\end{split}
$$
pro všechny výběry $t_{1},\dots,t_{d-1}$ máme právě jednu hodnotu $t_{d}$, takovou aby rovnost vyšla, tedy pravděpodobnost je $1 / p$.

---
## Rolling Hash z polynomů

---
## Hashování řetězců

---
# Kukačkové hashování


---
# Linear probing


---
# Bloomovy filtry
