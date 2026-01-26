## Univerzalita
*Definice:* Mějme rodinu funkcí $\mathcal{H} = \{ f \mid f: \mathcal{U} \to [m]\}$, řekneme o ní, že je $c$-univerzální pro nějakou konstantu $c>0$, když
$$
\forall x,y \in \mathcal{U}, x \ne y : \Pr_{h \in \mathcal{H}} [h(x) = h(y)] \leq \frac{c}{m}.
$$
Tedy pokud vybereme uniformě náhodně funkci z $\mathcal{H}$, tak pravděpodobnost kolize je jen $c$-krát horší než by byla u pravé plně náhodné funkce.

---
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