# $k$-server problem
- $M$ a metric space (diskr étní), kde máme $k=\#$ číšníků
- Vstupem je $r_{1},\dots,r_{n}\in M$ requesty na číšníka
- Výstupem je po $r_i$ posuň  _ číšníka na $r_i$
- objective is to minimize distance traveled by all servers.

Když máme uniform space (všechny vzdálenosti 1) tak je to [Paging](Paging.md). Pokud máme body ve hvězdici a cena hrany je $w_{i} / 2$ tak je weighted paging problém.

---
## Věta: Lower bound $\Omega(\log^2 k)$ for randomized algorithm
Harmonic: pro $r$ req. posuneme $x$ na $r$ s pravděpodobností proporčně k inverz vzdálenosti $\frac{1}{d(x,r)}$ a komp ratio je $\geq \Omega(\log^2 k)$ a $\leq O(2^k \log k)$

---
- existuje l.b na libovolný $M$ jako $O(\log k/ \log \log k)$ a unif má $H_{k}=\Theta(\log k)$
- upper bound $\leq poly\log k$ na general $M$ a $O(\log k)$ na weighted caching

---
## Věta: For any $M, |M|>k$, there is no better than $k$-competitive deterministic algorithm.
*Důkaz:* Předpokládejme $|M|=k+1$ a vždy requestneme bod který není covered.
- definujme konfiguraci jako pozici "díry" (nepokrytého bodu)
- definujeme $k$ offline řešení, které mají díru na různých bodech, ale nemají nikdy díru na requestu $r_{t}$
- Definujeme konfigurace a přeneseme díru na další $t$ vrstvu, ale pokud by to znamenalo přenést díru na request $r_{t}$ tak místo toho dáme pro čas $t$ díru na $r_{t-1}$, začneme každé z $k$ díru na různých místech
- cost of $k$ offline solutions mají cenu $\sum_{t=1}^{N}d(r_{t-1},r_{t}) +init$ cost.
- $\implies$ existuje řešení $\frac{1}{k}\sum_{t=1}^{N}d(r_{t-1},r_{t}) + const$ cenou
- $ALG$ víme, že pokud byl zvolen $r_{t}$, tak tam měl díru v $t-1$ a díra v čase $t$ je na $r_{t+1}$
- $\implies ALG =\sum_{t=1}^{N}d(r_{t},r_{t+1})$
- pro spor předpokládejme, že ALG by byl lepší než $k$, pak ale můžeme najít dostatečně velké $N$ pro spor (pokrýt additivní konstanty)

---
## *Věta:* For any $M$, $(2k-1)$-competitive deterministic algorithm.
*Bez důkazu, algoritmus:* 
Mějme $w_{\sigma}(C)= \text{cost optimal service for req. seq. }\sigma\text{ in config. }C$ work function

pak $\min_{C}w_{\sigma}(C)$ je optimal cost.

WFA (work function algorithm) přesune na request $r$ číšníka $s\in S$, kde $\sigma$ jsou předešlé requesty
$$
s= arg\min_{x\in S} (d(x,r)+w_{\sigma r}(S\setminus \{ x \} \cup \{ r \}))
$$


---
## Věta: Předpokládejme, že $M$ je přímka, pak existuje $k$-competitive algorithm.
*Intuice:* Vlastně ski rental problem, proto chceme body priblizovat k sobě.

*Algoritmus:* DC (double coverage)
- posouváme bližšího číšníka k requestu, z číšníka přímo vlevo a vpravo od requestu, ale o stejnou rychlostí přiblížíme i druhého číšníka dokud aspoň jeden není u requestu
- pokud request je mimo segmenty ohraničené číšníky, tak do něj přesuneme ten nejbližší

###### Potenciál
- $\Phi(A,S) \geq{0}$ - $A$ adversary číšníci, $S$ číšníci ALG
- přemýšlet jako nad penězmi, move ADV tak dostaneme $R$ peněz a z nich platíme, pokud na konci peníze stačili tak je to $R$ komp.
- $\Phi(A_{t+1}, S_{t+1}) - \Phi(A_{t}, S_{t}) \leq R\cdot \text{cost}(ADV,t+1) - \text{cost}(ALG,t+1)$.

ALG je $R$-kompetitivní pokud potenciál existuje.

*Důkaz:* 
$$
\Phi(A_{fin},S_{fin}) - \Phi(A_{0}, S_{0}) \leq R \cdot ADV - ALG
$$
protože potenciál je nezáporný tak
$$
ALG \leq R \cdot ADV + \Phi(A_{0},S_{0})
$$
kde potenciál na začátku je konstanta $\implies$ máme omezení. 


Pro $S\to S'$ stejná analýza jako dole, jen $\ell=2$, takže se vždy jen sesunou k sobě a dist se nemění, protože se vzájemně vyruší.
## *Věta:* For a tree metric, there exists a $k$-competitive deterministic algorithm.
DC pro stromy:
- posuneme všechny číšníky, kteří vidí na request point (tedy jsou první v daném podstromu směrem od $r$) stejnou rychlostí.
- diskrétnost opravíme tak že implementuje "lazy" verzi kde se předpočítá kdo kde je.

Mějme $\text{dist}(A,S)$ jako vzdálenosti nutnou přejít aby se dostali z$A$ do $S$.
- předpokládejme, že $S=\{ s_{1},\dots,s_{k} \}$
- pak potenciál je
$$
\Phi(A,S) = k \cdot \text{dist}(A,S) + \sum_{i<j} d(s_{i},s_{j})
$$
zjevně je $\Phi(A,S) \geq 0$.

Mějme request $r$ a rozdělíme platby potenciálu dle $ADV$ a $ALG$
- $A\to A'$ je pohyb nepřítele:
$$
\begin{align*}
\Phi(A',S) - \Phi(A,S) &= k \cdot(dist(A',S)-dist(A,S))
\\ &\stackrel{\Delta-\text{ineq}}\leq k \cdot dist(A',A) = k\cdot\text{cost}(ADV)
\end{align*}
$$
- $S\to S'$ rozdělíme na fáze, předpokládejme pohyb $\ell$ číšníků se pohnulo o $\delta$, pak
$$
\Delta \Phi=\Phi(A',S')- \Phi(A',S) \leq -\text{cost}(ALG) = -\ell d
$$
protože tak jak máme zvolený potenciál a první se hnul $ADV$, tak ten už má číšníka v requestu a my máme jeden bod, který je mu přidělen (jako ten nejbližší pomocí $\text{dist}$) pak $\Delta \Phi\leq k \cdot(\ell -2 )\delta$, protože určítě aspoň jeden se přiblíží bodu na $r$ ($\ell-1$ jich roste a jeden klesá v nejhorším)($k$ se to násobí kvůli definici potenciálu).

Pro $\sum_{i<j} d(s_{i},s_{j})$ máme, že $\ell$ se hýbe k sobě a potenciál se zmenšuje $2\delta \binom{\ell}{2}$ a pro $k-\ell$ serverů co se nehýbe, tak máme jeden co se vzdaluje $+(k-\ell)\delta$ a ostatní co se přibližují $-(k-\ell)(\ell-1)\delta$
$$
\Delta \Phi \leq k \cdot (\ell-2)\delta - 2\delta \binom{\ell}{2} + (k-\ell)\delta - (k-\ell)(\ell-1)\delta = -\ell(\ell-1)\delta -\ell\delta + \ell(\ell-1)\delta = -\ell\delta
$$

Dohromady máme 
$$
\Phi(A',S')- \Phi(A',S) \leq k \cdot dist(A',A) -\ell d
$$