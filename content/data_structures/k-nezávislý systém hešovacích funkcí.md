## Nezávislost
*Definice:* Nechť $\mathcal{H}$ je rodina funkcí z $\mathcal{U}$ do $[m]$. Rodina je $(k,c)$-nezávislá, pro $1\leq k \leq |\mathcal{U}|$ a $c>0$ právě tehdy, když $\forall x_{1},\dots,x_{k} \in \mathcal{U}$ každou $k$-tici různých prvků a každou $k$-tici $a_{1},\dots,a_{k}$ přihrádek v $[m]$ platí
$$
\Pr_{h \in \mathcal{H}} [h(x_{1}) = a_{1} \land\dots \land h(x_{k}) = x_{k}] \leq \frac{c}{m^k}.
$$
*Pozorování:*
- Když je $\mathcal{H}$ $(k,c)$-nezávislá pro $k>1$, tak je i $(k-1,c)$-nezávislá.
- Když je $\mathcal{H}$ $(2,c)$-nezávislá, pak je $c$-univerzální.
---
## *Lemma M:* (Kompozice modulo $m$) Mějme $\mathcal{H}$ $(2,c)$-nezávislou rodinu funkcí z $\mathcal{U}$ do $[r]$ a $m < r$, pak rodina $\mathcal{H} \mod m = \{ h \mod m \mid h \in \mathcal{H} \}$ je $2c$-univerzální a $(2,4c)$-nezávislá.
---
# Polynomiální hash
Chceme $k$-nezávislé rodiny funkcí, které si můžeme jednoduše vyrobit pomocí polynomů řádu $k$. 

*Definice:* Pro libovolné těleso $\mathbb{Z}_{p}$ a $k \geq 1$ definujeme **polynomiálních hash funkcí**
$\mathcal{P}_{k} = \{ h_{t} : \mathbb{Z}_{p} \to  \mathbb{Z}_{p} \mid t \in \mathbb{Z}_{p}^k \}$, kde $h_{t} = \sum_{i=0}^{k-1} t_{i}x^{i}$ a $k$-tice $t := (t_{0},\dots,t_{k-1})$ je indexovaná od $0$.

# *Věta:* $\mathcal{P}_{k} \mod m$ je $k$-nezávislá pro $p \geq 2km$.
Přímo plyne z kombinace následujících Lemma.
## *Lemma:* $\mathcal{P}_{k}$ je $(k,1)$-nezávislá.
*Důkaz Lemma:* Nechť $x_{1},\dots,x_{k} \in \mathbb{Z}_{p}$ jsou různé a $a_{1},\dots,a_{k} \in \mathbb{Z}_{p}$ jsou přihrádky. Víme, že máme přesně jeden polynom $h$ stupně $k$, takový aby $h(x_{i})= a_{i}$ pro každé $i$. Tedy pravděpodobnost, že náhodný polynom má tuto vlastnost je $\frac{1}{p^k}$.

## *Lemma K:* Nechť $\mathcal{H}$ je $(k,c)$-nezávislá rodina funkcí z $\mathcal{U}$ do $[r]$, $m<r,2km < r$, pak $\mathcal{H} \mod m$ je $(k,2c)$-nezávislá.
*Důkaz Lemma K:* Vyberme $k$-různých prvků $x_{i}$ a hodnot $j_{i}$, počítaje
$$
\Pr[\bigwedge_{i \in [m]} h(x_{i}) \equiv j_{i}] = \sum_{y_{1},\dots,y_{k} \in [r], \forall y_{i} \equiv j_{i} \mod n} \Pr[\bigwedge_{i \in [m]} h(x_{i}) = y_{i}].
$$
máme $\left\lceil  \frac{r}{m}  \right\rceil \leq \frac{r+m-1}{m}$ kongruentních hodnot k $j$ k $y$. Sčítáme přes $k$-tice $y$ a máme počet možností pro $i$ a dle předpokladu je pravděpodobnost, že to nastane pro $y$ je $\frac{c}{r^k}$, tedy 
$$
\begin{split}
\sum_{y_{1},\dots,y_{k} \in [r], \forall y_{i} \equiv j_{i} \mod n} \Pr[\bigwedge_{i \in [m]} h(x_{i}) =  y_{i}] \leq \frac{c}{r^k} \cdot \left( \frac{r+m -1}{m} \right)^k = \\ = \frac{c}{m^k} \cdot \left( \frac{r+m-1}{r} \right)^k \leq \frac{c}{m^k} \cdot \left( 1+ \frac{m}{r} \right)^k
\end{split}
$$
Tedy $\mathcal{H} \mod m$ je $(k,c')$-nezávislá pro
$$
c'=c \cdot \left( 1+\frac{m}{r} \right)^k.
$$
Protože $\forall x\in \mathbb{R}: 1+x \leq e^x$ získáváme $(1+m / r)^k \leq (e^{m / r})^k = e^{mk/r}$. A z předpokladu $km/r < \frac{1}{2}$ tak máme $e^{mk/r} \leq e^{1/2} \leq 2$. Tedy $c' \leq 2c$.
