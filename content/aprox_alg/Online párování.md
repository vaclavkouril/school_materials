- Bipartitní graf $(U \cup V, E)$
- Známe $V$ a dostáváme vrcholy $U$ po jednom a jejich $u\in U:N(u)$
- ALG musí vybrat hranu.
- Maximalizujeme velikost párování $M$
---
# GREEDY
Greedy je 2-kompetitivní.

Najde inclusion maximum párování, každá jeho jedna hrana může zablokovat jen dvě hrany z optima $\implies |M_{greedy}| \leq 2OPT$.

---
# Randomizované
Máme bipartitní graf $G=(L,R,E)$.    
## Algoritmus RANKING  
1. Náhodně zvolíme pořadí vrcholů z $R$.  
2. každému vrcholu $r\in R$ přiřadíme náhodnou hodnotu $y_r\sim U[-1,0]$ 
3. Definujeme cenu  $p_r=e^{y}$

Při příchodu vrcholu $\ell\in L$ ho algoritmus spáruje s volným sousedem $r$, který má nejmenší cenu $p_r$.
  
---  
## Rozdělení zisku na utility a revenue  
  
Nechť $M$ je párování nalezené algoritmem RANKING.  
  
Pro každý vrchol $r_j\in R$ definujeme revenue:  
$$  
\operatorname{rev}_j =  
\begin{cases}  
p_j, & r_j \text{ je v } M \text{ spárován},\\  
0, & r_j \text{ není v } M \text{ spárován}.  
\end{cases}  
$$
Pro každý vrchol $\ell_i\in L$ definujeme utility:  
$$  
\operatorname{util}_i =  
\begin{cases}  
1-p_j, & (\ell_i,r_j)\in M,\\  
0, & \ell_i \text{ není spárován}.  
\end{cases}  
$$
Pro každou hranu $(\ell_i,r_j)\in M$ tedy platí  
$$  
\operatorname{util}_i+\operatorname{rev}_j  
=  
(1-p_j)+p_j  
=  
1.  
$$
Proto  
$$  
|M|  
=  
\sum_i \operatorname{util}_i  
+  
\sum_j \operatorname{rev}_j.  
$$
Stačí tedy ukázat, že pro každou hranu optimálního párování dostaneme v očekávání alespoň $1-\frac1e$.  
  
---  
## Lemma: Nechť $(\ell_i,r_j)\in M^\star$, potom platí  $\mathbb E [\operatorname{util}_i+\operatorname{rev}_j]  \geq  1-\frac1e$.
Fixujme všechny náhodné hodnoty kromě hodnoty $y_j$ vrcholu $r_j$.  Tedy fixujeme pořadí/ceny všech vrcholů z $R\setminus\{r_j\}$ a měníme pouze $y_j\in[-1,0]$.  
Označme  
$$  
p_j=e^{y_j}.  
$$
Nechť $M'$ je párování, které by algoritmus RANKING našel, kdyby vrchol $r_j$ úplně chyběl.

Podíváme se na vrchol $\ell_i$ v tomto běhu bez $r_j$. Nechť $p=e^x$ jako cena matche $\ell_{i}$ v $M'$.
### Případ 1: $\ell_i$ je v $M'$ nespárovaný  
Pak pokud vrchol $r_j$ vrátíme, $\ell_i$ má dostupného souseda $r_j$, protože
$$  
(\ell_i,r_j)\in M^\star\subseteq E.  
$$
Algoritmus tedy může $\ell_i$ spárovat alespoň s $r_j$, případně s ještě lepším volným sousedem.
  
Dostaneme $\operatorname{util}_i\geq 1-p_j$.  
 
### Případ 2: $\ell_i$ je v $M'$ spárovaný  
Nechť je v $M'$ spárovaný s vrcholem ceny $p$. Pokud po vrácení $r_j$ platí  
$$  
p_j<p,  
$$
pak je $r_j$ pro $\ell_i$ lepší volba než původní partner.  

Tedy algoritmus při příchodu $\ell_i$ buď spáruje $\ell_i$ s $r_j$, nebo s ještě lepším vrcholem. Proto opět  
$$  
\operatorname{util}_i\geq 1-p_j.  
$$
Pokud $p_j\geq p$, tak tuto nerovnost garantovat nemusíme.  
  
---  
$$
\mathbb{E}_{p_{j}} [util_{i}+rev_{j}] \geq (1-p) + \int_{-1}^x e^t \,dt = 1- e^x + e^x - \frac{1}{e} = 1- \frac{1}{e}
$$
---  
## Dokončení důkazu věty    
Sečteme lemma přes všechny hrany optimálního párování $M^\star$.  
Dostáváme  
  
$$  
\sum_{(\ell_i,r_j)\in M^\star}  
\mathbb E[\operatorname{util}_i+\operatorname{rev}_j]  
\geq  
\left(1-\frac1e\right)|M^\star|.  
$$
Levá strana je nejvýše
$$  
\mathbb E\left[  
\sum_i \operatorname{util}_i  
+  
\sum_j \operatorname{rev}_j  
\right].  
$$
Ale víme, že  
$$  
|M|  
=  
\sum_i \operatorname{util}_i  
+  
\sum_j \operatorname{rev}_j.  
$$
Tedy 
$$  
\mathbb E[|M|]  
\geq  
\left(1-\frac1e\right)|M^\star|.  
$$