# Definujte c-univerzální a k-nezávislé rodiny hešovacích funkcí. 
## Univerzalita
*Definice:* Mějme rodinu funkcí $\mathcal{H} = \{ f \mid f: \mathcal{U} \to [m]\}$, řekneme o ní, že je $c$-univerzální pro nějakou konstantu $c>0$, když
$$
\forall x,y \in \mathcal{U}, x \ne y : \Pr_{h \in \mathcal{H}} [h(x) = h(y)] \leq \frac{c}{m}.
$$
Tedy pokud vybereme uniformě náhodně funkci z $\mathcal{H}$, tak pravděpodobnost kolize je jen $c$-krát horší než by byla u pravé plně náhodné funkce.

## Nezávislost
*Definice:* Nechť $\mathcal{H}$ je rodina funkcí z $\mathcal{U}$ do $[m]$. Rodina je $(k,c)$-nezávislá, pro $1\leq k \leq |\mathcal{U}|$ a $c>0$ právě tehdy, když $\forall x_{1},\dots,x_{k} \in \mathcal{U}$ každou $k$-tici různých prvků a každou $k$-tici $a_{1},\dots,a_{k}$ přihrádek v $[m]$ platí
$$
\Pr_{h \in \mathcal{H}} [h(x_{1}) = a_{1} \land\dots \land h(x_{k}) = x_{k}] \leq \frac{c}{m^k}.
$$
*Pozorování:*
- Když je $\mathcal{H}$ $(k,c)$-nezávislá pro $k>1$, tak je i $(k-1,c)$-nezávislá.
- Když je $\mathcal{H}$ $(2,c)$-nezávislá, pak je $c$-univerzální.

---
# Uveďte příklady, kde nestačí c-univerzální rodina hešovacích funkcí, ale musíme použít k-nezávislou rodinu.
c-univerzalita kontroluje jen pravděpodobnost kolize _dvou_ prvků.  
Nekontroluje společné chování více než dvou náhodných proměnných.

V Bloom filtrech potřebujme $k$ nezávislé rodiny, pokud by byli jen univerzální, tak false pozitiva jsou silně korelovaná.

**TODO:**

---
# Formulujte a dokažte větu o střední hodnotě počtu kolizí nového prvku $y$ s reprezentovanou množinou v hešování s řetězci, tj. o střední délce řetězce, do kterého bychom přidali $y$ (jde o větu na str. 1 v \[L kap. 6\]).
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

---
# Ukažte příklady c-univerzálních a k-nezávislých rodin pro hešování přirozených čísel. Pro jeden příklad dokažte c-universalitu nebo k-nezávislost, pro $k \ge 2$.

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

## Polynomiální hashování
Chceme $k$-nezávislé rodiny funkcí, které si můžeme jednoduše vyrobit pomocí polynomů řádu $k$. 

*Definice:* Pro libovolné těleso $\mathbb{Z}_{p}$ a $k \geq 1$ definujeme **polynomiálních hash funkcí**
$\mathcal{P}_{k} = \{ h_{t} : \mathbb{Z}_{p} \to  \mathbb{Z}_{p} \mid t \in \mathbb{Z}_{p}^k \}$, kde $h_{t} = \sum_{i=0}^{k-1} t_{i}x^{i}$ a $k$-tice $t := (t_{0},\dots,t_{k-1})$ je indexovaná od $0$.

### *Lemma:* Rodina $\mathcal{P}$ je $(k,1)$-nezávislá.
*Důkaz:* Nechť $x_{1},\dots,x_{k} \in \mathbb{Z}_{p}$ jsou různé a $a_{1},\dots,a_{k} \in \mathbb{Z}_{p}$ jsou přihrádky. Víme, že máme přesně jeden polynom $h$ stupně $k$, takový aby $h(x_{i})= a_{i}$ pro každé $i$. Tedy pravděpodobnost, že náhodný polynom má tuto vlastnost je $\frac{1}{p^k}$.

*Důsledek:* Když $p\geq 2km$, tak $\mathcal{P}_{k} \mod m$ je díky *Lemma K* $(k,2)$-nezávislá.

Potřebujeme $\Theta(k)$ na výběr funkce z rodiny a na výpočet pro jedno $x$.

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