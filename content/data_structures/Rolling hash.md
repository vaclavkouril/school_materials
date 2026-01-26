*Definice:* Mějme rodinu funkcí $\mathbb{Z}_{p}^d \to \mathbb{Z}_{p}$, které řekneme rolling hash $\mathcal{R}=\{ r_{a} \mid a \in \mathbb{Z}_{p} \}$, kde $a$ je náhodné a $r_{a} (x)= \sum_{i=1}^d x_{i} a^{i-1} \mod p$.

---
# $\mathcal{R}$ je $d$-univerzální.
Mějme dva různé prvky $x,y$, tak
$$
\Pr_{a \in \mathbb{Z}_{p}} [r_{a}(x) \equiv r_{a}(y) \mod p]
$$
jak často se stane
$$
\begin{align*}
r_{a}(x) &\equiv r_{a}(y) \mod p \\
\sum_{i=1}^d x_{i} a^{i-1} &\equiv \sum_{i=1}^d y_{i} a^{i-1} \mod p \\
\sum_{i=1}^d (x_{i} - y_{i}) a^{i-1} &\equiv 0 \mod p

\end{align*}
$$
za různosti $x,y$ je $\sum_{i=1}^d (x_{i} - y_{i}) a^{i-1}$ nenulový polynom a polynom omezeného stupně (maximálně $d$) má omezený počet kořenů (a sice maximálně $d$), tak máme pravděpodobnost toho, že $a$ je kořen je $d/p$, tedy je $\mathcal{R}$ je $d$-univerzální.

---
### *Lemma G:* (Obecné skládání) Nechť $\mathcal{F}$ je $c$-univerzální rodina funkcí z $\mathcal{U}$ do $[r]$. Nechť $\mathcal{G}$ je $(2,d)$-nezávislá rodina funkcí z $[r]$ do $[m]$. Pak $\mathcal{H} = \mathcal{G} \circ \mathcal{F} = \{ g \circ f \mid f \in \mathcal{F}, g \in \mathcal{G} \}$ je $(2,c')$- nezávislá pro $c'=(cm/r + 1)d$.
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

*Důsledek:* Když $r\geq m$, tak $\mathcal{G} \circ \mathcal{F}$ je $(2,c')$-nezávislý pro $c'=(c+1)d$.
 
 ---
Složíme-li $\mathcal{L} \circ \mathcal{R}$, tak dle lemma G máme $2$-nezávislou rodinu.

*Definice:* Pro libovolné prvočíslo $p$ a $m \leq p$, tak definujeme rodinu lineárních funkcí 
$$
\mathcal{L} = \{ h_{a,b} \mid a,b\in [p],\, h_{a,b} : [p] \to [m],\, \text{kde } h_{a,b}(x) = ((ax+b) \mod p) \mod m\}.
$$

*Tvrzení:* Rodina $\mathcal{L}$ je $(2,4)$-nezávislá.

---
# Výhoda oproti jiným hash funkcím
Rolling hash umožňuje udržovat hash posuvného okna v konstantním čase, přičemž poskytuje silnou univerzalitu a je ideální pro algoritmy nad řetězci a podřetězci.