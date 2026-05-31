Identické mašiny
# Greedy
Je $2$ aproximacni protože mějme job $p_{i}$ ten se schedulne na nejméně plnou mašinu, tedy na tu s loadem $L$, ten má teď $L+ p_{i}$ a ostatní měl load aspoň $L$, celková naplánovaná práce byla aspoň $m\cdot L$

Celková práce $P=\sum p_{j}$ je horní hranice na velikost loadu, tedy
$$
mL = P-p_{i}
$$
tedy
$$
L\leq \frac{P-p_{i}}{m}
$$
dohromady
$$
C_{max}^{ALG} \leq L + p_{i} \leq \frac{P}{m} + \left( 1-\frac{1}{m} \right)p_{i}
$$
a protože $OPT\geq\max\left( \frac{P}{m},p_{j} \right)$ tak i
$$
C_{max}^{ALG}\leq OPT + OPT
$$

---
# (F)PTAS
Mějme pseudopoly-dynamické programování
$$
DP[i,s]= 1\text{ když prvních }i \text{ jobů lze vybrat podmnožinu s} \sum s
$$
a $DP[0,0]=1$ a $DP[i,s]=DP[i-1,s] \lor DP[i-1,s-p_{i}]$ a na konci hledáme $s$, tak aby $max(s,P-s)$, tedy běžíme v $O(nP)$ a pro zobecnění $P(npP^{m-1})$

$LB=\max\left( \frac{P}{m},p_{j} \right)$ a definujeme $A_{\varepsilon}$ a $\varepsilon=\frac{1}{k}$, spočteme pro instanci $I$:
- $I'$ instance bez jobů $\leq \epsilon \cdot LB$
- $I''$ je instance $I'$ s velikostmi jobů zaokrouhlenými dolů na $k$ násobek $\varepsilon^2 \cdot LB$, tedy
$$
k \cdot \varepsilon^2 \cdot LB, (k+1)\varepsilon^2LB, \dots, k^2 \varepsilon^2 LB
$$
$$
\varepsilon LB, (\varepsilon+\varepsilon^2)LB, \dots, LB
$$

ALG pak
1. $ALG(I'')=OPT(I'')$ se spočítá díky DP
2. $ALG(I')$ použije stejné rozdělení jobů jako $I''$
3. $ALG(I)$ použije $ALG(I')$ hladově

Zjevně
$$
OPT(I)\geq OPT(I') \ge OPT(I'')
$$
$$
ALG(I') \leq (1+\epsilon) ALG(I'') \leq (1+\epsilon)OPT(I')
$$
$$
ALG(I)\geq ALG(I')\implies ALG(I)\leq LB + \varepsilon LB \leq (1+\varepsilon)OPT(I).
$$