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
Pro pevné $m$ máme pseudo-polynomiální dynamické programování přes zatížení strojů.  
Abychom z něj dostali FPTAS, zmenšíme délky prací.  
  
Nechť  
$$  
P_{\max}=\max_i p_i.  
$$  
Protože každé řešení musí zpracovat i největší práci, platí  
$$  
OPT\geq P_{\max}.  
$$  
  
Zvolíme  
$$  
K=\frac{\varepsilon P_{\max}}{n}  
$$  
a definujeme zaokrouhlené délky  
$$  
p_i'=\left\lfloor \frac{p_i}{K}\right\rfloor.  
$$  
  
Na instanci s délkami $p_i'$ spustíme přesné pseudo-polynomiální DP.  
Dostaneme optimální rozvrh pro zaokrouhlenou instanci a použijeme stejný rozvrh pro původní práce.  
  
Protože  
$$  
p_i < K(p_i'+1),  
$$  
tak se každá práce při návratu k původním délkám zvětší oproti zaokrouhlené verzi o méně než $K$.  
Na jedné cestě/stroji tedy celková chyba je nejvýše  
$$  
nK=\varepsilon P_{\max}\leq \varepsilon OPT.  
$$  
  
Proto  
$$  
ALG\leq OPT+\varepsilon OPT=(1+\varepsilon)OPT.  
$$  
  
Algoritmus je polynomiální v délce vstupu i v $\frac1\varepsilon$, tedy je to FPTAS.