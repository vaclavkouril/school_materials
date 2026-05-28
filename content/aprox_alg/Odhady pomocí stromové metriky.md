# Stromová metrika
Dostáváme metrický prostor $(V,d)$ s $d_{u,v}\geq 1$, která je celočíselná.

Jako výstup dostaneme strom $(V',T)$ se vzdálenostmi $V\subseteq V'$ takovými, že $\forall uv: d_{uv}\leq T_{uv} \land E[T_{uv}]\leq \alpha d_{uv}$.

Objective: minimalizace "stretch faktoru" $\alpha$.

Strom se vyrábí:
1. Každý vrchol má bag vrcholů v jeho podstromu.
2. Přidáme kořen a rozdělíme jeho bag na podmnožinové disjunktní bagy a ty se přidělí každý vrcholu připojenému ke kořeni.
3. Každý uzel pokračuje s rozdělováním.

- Každé úrovni stromu přidělíme poloměr $r_{0}$ u listů až pro $r_{k}$ pro kořen.
- Všechny vrcholy bagu se musí vejít do koule o průměru $r_{i}$ kolem libovolně zvoleného bodu.
- Rozdělení se budují top-down způsobem.

Když poběžíme konstrukční algoritmus tak zvolíme
- $r_{0}\in [\frac{1}{2}, 1)$ uniformně náhodně $\implies$ máme vždy jen jeden vrchol v poslední vrstvě
- $r_{i}= 2^i r_{0}$
- $\Delta$ je mocnina $2$, tak aby to bylo nejmenší splňující $\Delta \geq 2\max_{u,v} d_{uv}$.
- $k=2\cdot \log \Delta$
- Pro takovou volbu $k$ je pak $r_{k} \geq 2^2 \cdot 2^{\log \Delta}\cdot r_{0}$ a tedy $r_{k}\geq \Delta$ a proto mohou být všechny bodu v bagu kořene.
- Určíme vzdálenosti mezi vrcholy tak, že vzdálenosti mezi úrovní 
	- $0$ a $1$ je vzdálenost $2$,
	- $1$ a $2$ vzdálenost $4$,
	- $i$ na $i+1$ tak je to $2^{i+1}$
	- $r_{k-1}$ a $r_{k}$ je vzdálenost $2^{k} = {\Delta}$.

---

*Pozorování:* $u,v\in V$ a nechť  na $j$ úrovni je jejich least common ancestor a 
$$
T_{uv}\geq d_{uv}, \quad T_{uv}\leq 2^{i+2}.
$$
*Důkaz:* Pokud by $u$ a $v$ ležely ve stejném bagu na úrovni $\lfloor \log d_{uv}\rfloor -1$, pak by tento bag byl obsažen  v kouli o poloměru  
$$  
r_{\lfloor \log d_{uv}\rfloor -1}  
<  
2^{\lfloor \log d_{uv}\rfloor -1}.  
$$
Proto by vzdálenost libovolných dvou bodů v tomto bagu byla menší než  
$$  
2\cdot 2^{\lfloor \log d_{uv}\rfloor -1}  
=  
2^{\lfloor \log d_{uv}\rfloor}  
\leq d_{uv},  
$$
což je spor s tím, že vzdálenost těchto dvou bodů je právě $d_{uv}$. Tedy $u$ a $v$ se mohou poprvé potkat nejdříve na úrovni  $\lfloor \log d_{uv}\rfloor.$ Cesta ve stromu z $u$ do $v$ proto musí vystoupat alespoň do této úrovně a pak zase sestoupit.    
$$  
T_{uv}  
\geq  
2\sum_{i=1}^{\lfloor \log d_{uv}\rfloor}2^i  
=  
2(2^{\lfloor \log d_{uv}\rfloor+1}-2).  
$$
Tento odhad je pro větší vzdálenosti dostatečný přímo. Pro kratší vzdálenosti stačí použít, že $d_{uv}\geq 1$ a nejmenší nenulová stromová vzdálenost mezi dvěma různými listy je alespoň $4$.  
Celkově tedy platí $T_{uv}\geq d_{uv}$. 

Pokud je nejnižší společný předek $u$ a $v$ na úrovni $j$, pak cesta z $u$ do $v$ jde z listu $u$ nahoru přes úrovně $1,\dots,j$ a potom stejně dolů do $v$.  
Proto  
$$  
T_{uv} =  2\sum_{i=1}^{j}2^i  =  2(2^{j+1}-2)  =  2^{j+2}-4 \leq 2^{j+2}.
$$
---
## Věta: Nechť $(V,d)$ jsou vrcholy s metrikou vzdálenosti, takovou, že $d_{uv}\geq 1, \forall u \neq v,\, u,v\in V$, pak existuje randomizovaný, poly-time algoritmus, který vydá stromovou metriku $(V', T), V\subseteq V'$, takovou, že $\forall u,v\in V: d_{uv}\leq T_{uv}$ a $\mathbb{E}[T_{uv}]\leq O(\log n)d_{u,v}$.
(Lépe to dokonce ani nejde)

**Algoritmus:** 
- Vyberme náhodnou permutaci $V$ vrcholů $\pi$, 
- nastavíme $\Delta$ tak aby to byla nejmenší mocnina $2$ větší než $2\max_{u,v}d_{uv}$,
- vybereme $r_0\in\left[ \frac{1}{2},1 \right)$ uniformně náhodně; nastavíme $\forall 1\leq i \leq \log\Delta: r_{i}=2^ir_{0}$
- $\mathcal{C}(i)$ označuje bagy na úrovni $i$, které rozdělují disjunktně $V$.
1. $\mathcal{C}(\log \Delta)=\{ V \}$
2. Vyrobíme uzel stromu odpovídající $V$
3. Pro $i \leftarrow \log \Delta$ až k $1$:
	1. $C_{i-1}\leftarrow \emptyset$
	2. Pro všechny $C\in \mathcal{C}(i)$:
		1. $S \leftarrow C$
		2. Pro $j\leftarrow 1$ až $n$:
			1. Když $B(\pi(j),r_{i-1})\cap S \neq \emptyset$ tak
				1. Přidáme $B(\pi(j),r_{i-1})\cap S$ do $\mathcal{C}(i-1)$
				2. Odstraníme $B(\pi(j),r_{i-1})\cap S$ z $S$
		3. Vyrobíme uzly odpovídající všem množinám (bagům) v $\mathcal{C}(i-1)$, které jsou podmnožiny $C$
		4. Propojíme tyto uzly s uzlem odpovídajícímu $C$ hranou délky $2^i$

*Důkaz:* Dle pozorování výše platí, že takový strom $T_{uv}\geq d_{uv}$, pak pokud $u,v$ mají $lca(u,v)$ na úrovni $i+1$ tak z pozorování máme $T_{u,v}\leq 2^{i+3}$, pak říkáme
- $w$ z $i$-té úrovně **settles** $u,v$ pokud $B(w,r_{i}) \cap \{ u,w \}\ne \emptyset$ a $w$ je první takové v $\pi(1),\pi(2),\dots,\pi(j)$,
- $w$ z $i$-té úrovně **cuts** $u,v$ pokud $|B(w,r_{1})\cap \{ u,w \}|=1$.
- Nechť $X_{iw}$ je jev, že $w$ **cuts** $(u,v)$ na úrovni $i$ a 
- nechť $S_{iw}$ je jev, že $w$ **settles** $(u,v)$ na úrovni $i$.

Pak mějme $\mathbb{1}$ jako indikátor, pak
$$
T_{uv} \leq \sum_{w\in V} \sum_{i=0}^{\log \Delta -1} \mathbb{1}(X_{iw} \land S_{iw}) \cdot 2^{i+3}.
$$
A pro střední hodnotu máme
$$
\mathbb{E}[T_{uv}] \leq \sum_{w\in V} \sum_{i=0}^{\log \Delta -1} \Pr(X_{iw} \land S_{iw}) \cdot 2^{i+3}.
$$
Máme dvě tvrzení, která pomohou
- $\sum^{\log \Delta}_{{i=1}} \Pr[X_{iw}] \cdot 2^{i+3}\leq 16d_{uv}$
- $\Pr[S_{iw}\mid X_{iw}]$ je omezeno $b_{w}$, které záleží jen na $w$ a je to $\leq \frac{1}{j}$, kde $w$ je $j$ tý nejbližší bod k $\{u,v\}$.

Pak máme 
$$
\begin{align*}
\mathbb{E}[T_{uv}] &\leq \sum_{w\in V} \sum_{i=0}^{\log \Delta -1} \Pr[S_{iw}\mid X_{iw}] \cdot \Pr[X_{iw}] \cdot 2^{i+3} \\
&= \sum_{w\in W} b_{w} \sum_{i=0}^{\log \Delta -1} \Pr[X_{i{w}}] \cdot 2^{i+3} \\
&\leq 16d_{uv} \cdot \sum_{w\in W} b_{w}
\end{align*}
$$
a už jen zbývají odhady, protože jestli platí, tak $\sum_{w\in V} b_{w}= \sum_{j=1}^{n} \frac{1}{j} = H(n) = O(\log n)$.

BÚNO nechť $d_{uw}\leq d_{vw}$, pak to že $w$ cuts $u,v$ znamená, že se $r_{i}$ trefí tak, aby
- $u\in B(w,r_{i})$, 
- ale $v \not\in B(w,r_{i})$,
- jinak také, že $d_{uw}\leq r_{i}< d(vw)$

Protože je uniformně náhodně na $r_{i}\in [2^{i-1}, 2^i)$, tak je to vlastně $\frac{1}{2^i-2^{i-1}}=2^{-(i-1)}$ krát $[2^{i-1}, 2^i) \cap[d_{uw},d_{vw})$, tedy
$$
\Pr[X_{iw}] = \frac{|[2^{i-1}, 2^i) \cap [d_{uw},d_{vw})|}{2^{i-1}}.
$$
Pak dostáváme
$$
2^{i+3}\Pr[X_{iw}] = 16 |[2^{i-1}, 2^i) \cap [d_{uw},d_{vw})|
$$
$[2^{i-1},2^i)$ pro $i=0,\dots,\log \Delta-1$ dělají disjunktní rozklad intervalu $\left[ \frac{1}{2}, \frac{\Delta}{2} \right)$ a tedy
$$
\sum_{i=0}^{\log \Delta -1} \Pr[X_{iw}] \cdot 2^{i+3} \leq 16 |[d_{uw}-d_{vw})| = 16 (d_{vw}-d_{uw}) \leq 16 d_{uv}.
$$

Seřadíme vrcholy $w\in V$ dle vzdáleností od $u,v$, když nastane $X_{iw}$, tak jeden z $u,v$ je v kouli $B(w,r_{i})$, tedy každý z vrcholů blíže k $u,v$ než $w$ má ve své kouli také jeden z nich, tedy, aby $w$ **settles**, když je na úrovni $i$ i **cuts**, tak musí byt dříve v náhodné permutaci než bližší vrcholy.

$w$ je $j$-tý nejbližší bod, pak to že bude v permutaci první je $1 / j=: b_{w}$, pak
$$
\Pr[S_{iw}\mid X_{iw}] \leq \frac{1}{j} = b_{w}.
$$

---
## Odebrání vrcholů $V'\setminus V$
Můžeme větu upravit tak aby z $(V',T)$ bylo $(V,T')$, kde v $T$ jsou $V$ prvky listy, pak dokonce $T_{uv}\leq T'_{uv}\leq 4 T_{uv}$.

Pro každé $v\in V$ takové, že $w$ uzel-rodič není ve $V$, tak skontrahujeme hranu $vw$ a původní uzel $w$ označíme $v$ a opakujeme dokud zbývají vrcholy mimo $V$, poté všechny zbývající hrany přenásobíme $4$ a získáváme $T'$.

Zjevně $T'_{uv}\leq 4T_{uv}$ protože kontrakce se vzdálenosti mezi $u,v$ mohli jen zmenšit a nakonec byli zvětšeny 4-krát. 

Mějme $u,v$ v $T$, s $lca(u,v) =w$ na úrovni $i$, tak dle pozorování $T_{uv}\leq 2^{i+2}$ tak, protože kontrakce posune jen jeden z $u$, nebo $v$ v $T$ až na $w$, tak nakonec se musí lišit alespoň $4$-krát délka hrany mezi úrovněmi $i$ a tedy $2^{i}$, dohromady
$$
T'_{uv}\geq 4\cdot 2^i = 2^{i+2}\geq T_{uv}.
$$
---
# Aplikace: Buy-at-bulk network
##### Vstup:
- $G=(V,E)$ s délkami $l_{e} \geq 0, e\in E$, 
- $k$ zdrojů a stoků, dvojice $s_{i}-t_{i}$, pro $s_{i},t_{i}\in V$ a každý má poptávku $d_{i}$,
- $f$ jako cost function, kde $f(c)$ je cena nákupu kapacity $c$ za jednotku délky, je **subadditive**:
$$
f(a+b)\leq f(a) + f(b)
$$
##### Výstup
- $c_{e}, e\in E$ jako kapacity dostatečné k přenosu všech požadavků
- Cena řešení je $\sum_{e\in E} f(c_{e}) \ell_{e}$ a to chceme minimalizovat.

# Řešení na stromu
- mezi $s_i,t_{i}$ je jen jedna unikátní cesta $P_{i}$ v $T$
- nastavíme $c_{e} := \sum_{i: e\in P_{i}}d_{i}$ pro všechny $e\in T$
- menší řešení neexistuje protože by nesplnilo demands

## Převod
1. Najdeme stromovou metriku $(V,T')$ aproximující $d$
2. Najdeme nejkratší cestu $P_{xy}$ v $G$ pro každé $(x,y)\in T'$
3. Nechť $P'_{s_{i}t_{i}}$ je unikátní $s_{i}-t_{i}$ cesta v $T'$ pro všechna $i$.
4. Nechť $P_{i}$ je konkatenací cest $P_{xy}$ pro všechna $(x,y)\in P'_{s_{i},t_{i}}$ pro všechna $i$.
5. Nastavme $c_{e}:= \sum_{i:e\in P_{i}}d_{i}$ pro každé $e\in E$.

#### Lemma 1: Nechť $c'_{x,y}$ je kapacita vydaná algoritmem na $T$, cena řešení je $ALG\leq \sum_{xy\in T'} T'_{xy} \cdot f(c'_{xy})$.
$\forall xy\in T'$ ALG najde nejkratší cestu v $G$, $P_{xy}$ a každý demand $i$, který používá $x,y\in T'$ tak pošle demand i po této cestě $P_{xy}$ a tedy $c'_{xy}$ demand je poslán po této cestě za ceny $d_{xy} \cdot f(c'_{xy}) \leq T_{xy}\cdot f(c'_{xy})$.

Je možné, aby $e$ bylo ve více nejkratších cestách ($xy,uv$), ale protože subaditivita, tak $f(c'_{xy} + c'_{uv})\leq f(c'_{xy})+f(c'_{uv})$ a nemůže se navýšit celková cena řešení, protože vedení více cest přes jednu hran nám nic nezhorší.

$$
\begin{align*}
\sum_{xy\in T'} T'_{xy}f(c'_{xy}) &\geq \sum_{xy\in T'} d_{xy}f(c'_{xy}) \\
&= \sum_{xy\in T'} f(c'_{xy}) \sum_{e\in P_{e}} \ell_{e} \\
&= \sum_{e\in E} \ell_{e} \sum_{xy\in T': e\in P_{xy}} f(c'_{xy}) \\
&\stackrel{\text{subadditivita}}{\geq}\, \sum_{e\in E} \ell_{e} f \left(\sum_{xy\in T': e\in P_{xy}} c'_{xy}\right) \\
&= \sum_{e\in E} \ell_{e} f \left(c_{e}\right).
\end{align*}
$$
#### Lemma 2: $\mathbb{E}\left[ \sum_{xy\in T'} T'_{xy} f(c'_{xy}) \right] \leq O(\log n) OPT$
Vezměme $OPT= \sum_{e=xy\in E}f(c^*_{e})\ell_{e}$ a každá hrana z optima se dle algoritmu přeloží na cestu v $T'$ a protože ve stromu je pak řešení optimální, tak máme
$$
\mathbb{E}\left[\sum_{e=xy\in E}T'_{xy}f(c'_{e})\right] \leq \mathbb{E}\left[\sum_{e=xy\in E}T'_{xy}f(c^*_{e})\right]
$$
a protože $f(c^*_{xy})$ není závislé na náhodném stromu, takže
$$
\sum_{e=xy\in E}f(c^*_{e}) \mathbb{E}\left[T'_{xy}\right].
$$
Z věty o aproximaci stromovou metrikou poměrem $O(\log n)$ máme
$$
\mathbb{E}[T'_{xy}]\leq O(\log n) d_{xy}
$$
a proto
$$
\begin{split}

\mathbb{E}\left[\sum_{e=xy\in E}T'_{xy}f(c'_{e})\right] \leq O(\log n) \sum_{e=xy\in E}f(c^*_{e}) \underbrace{d_{xy}}_{\text{vzdálenost}} \\
\leq  O(\log n) \sum_{e=xy\in E}f(c^*_{e}) \ell_{e} = O(\log n)OPT.
\end{split}
$$
