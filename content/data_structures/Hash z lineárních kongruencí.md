## Univerzalita
*Definice:* Mějme rodinu funkcí $\mathcal{H} = \{ f \mid f: \mathcal{U} \to [m]\}$, řekneme o ní, že je $c$-univerzální pro nějakou konstantu $c>0$, když
$$
\forall x,y \in \mathcal{U}, x \ne y : \Pr_{h \in \mathcal{H}} [h(x) = h(y)] \leq \frac{c}{m}.
$$
---
## Konstrukce $\mathcal{L}$
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

Tedy vzhledem k tomu, že je to bijekce, tak je uniformně náhodný výběr $(a,b)$ ekvivalentní uniformně náhodnému výběru $(r,s)$. Spočtěme teď špatné páry $h_{a,b}(x) = h_{a,b}(y)$ vůči modulo $m$. $(r,s)$, taková, že $r \equiv s \mod m$, rozdělíme $[p]$ na $\left\lceil  \frac{p}{m}  \right\rceil$ $m$-tic prvků za sebou v pořadí dle $<$, kde poslední je potenciálně nekompletní. Každá $m$-tice má jeden prvek kongruentní s $r$, až na poslední, která může mít jeden nebo žádný. 

Tedy pro každé $r$ máme $\left\lceil  \frac{p}{m}  \right\rceil \leq \frac{p+m-1}{m}$ špatných párů. Protože $m \leq p$, tak $\frac{p+m-1}{m} \leq \frac{2p}{m}$. Různá $r$ můžeme zvolit jen $p$-krát, tedy celkem špatných je maximálně $2p^2 /m$.

Celkem je $p^2$ párů, tak jeden konkrétní pár $(r,s)$ je špatný je $2/m$. Z bijekce mezi páry platí to samé pro $(a,b)$ páry a tedy je to $2$-univerzální systém.

---
## Konstrukce $\mathcal{L}'$
*Definice:* Pro libovolné prvočíslo $p$ a $m \leq p$ mějme
$$
\mathcal{L}' = \{ h_{a,b} \mid a,b\in [p],\, a\neq 0,\, h_{a,b} : [p] \to [m],\, \text{kde } h_{a,b}(x) = ((ax+b) \mod p) \mod m\}.
$$
---
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