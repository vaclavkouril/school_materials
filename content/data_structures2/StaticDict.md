# Statický slovník
- $S \subseteq \mathcal{U}$ je množina konstatně velký prvků ($\mathcal{U}$ je univerzum)
- $n = |S|$
- Dotazem je zda $x\in S$

Umíme kukačkové hashování (**TODO: odkaz**) v konstatně rychlých dotazech a expected $O(n)$ build.

## FKS
Mějme systém funkcí $\mathcal{S}$ s prvky $h: \mathcal{U} \to [m]$.

*Definice:* $\mathcal{S}$ je $c$-univerzální ($m$ je velikost obrazu $h$):
$$
\forall x,y \in \mathcal{U}, x \neq y: \Pr_{h\in \mathcal{S}}[h(x)=h(y)] \leq \frac{c}{m}.
$$

*Definice:* Pro $S \in \binom{\mathcal{U}}{m}$, $h\in \mathcal{S}$ kolize je $\{x,y\}\in \binom{S}{2}: h(x) = h(y)$

*Lemma:* Pro $h \in_R \mathcal{S}: \mathbb{E}[\# \text{ kolizí}] < \frac{c \cdot n^2}{2m}$, kde $\mathcal{S}$ je $c$-univerzální.

*Důkaz:* Indikátorovými proměnnými, mějme $\forall x,y \in \mathcal{U}, x \neq y:C_{xy}$, kteráje jedna, pokud $x,y$ koliují. Pak
$$
\mathbb{E}[\# \text{ kolizí}] = \mathbb{E}[\sum C_{xy}] = \sum \mathbb{E}[C_{xy}] = \sum_{x,y} \Pr_{h\in \mathcal{S}}[h(x)=h(y)] \leq \sum_{x,y} \frac{c}{m} = \binom{n}{2} \frac{c}{m} < \frac{cn^2}{2m}.
$$ 


## HMP
