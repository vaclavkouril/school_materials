- Máme předměty velikostí $1>a_1,\dots,a_n>0$. 
- Kapacita každého binu je $1$.   
- Cíl: minimalizovat počet binů.  

Dolní odhad:   
$$ 
OPT(I)\ge SIZE(I)=\sum_i a_i.  
$$
---
# FIRST fit
Algoritmus:  
1. Procházíme předměty v daném pořadí.  
2. Každý dáme do prvního binu, kam se vejde.  
3. Pokud se nevejde nikam, otevřeme nový bin.  
  
Označme počet použitých binů $FF(I)=\ell$.  
  
Spárujeme biny: $(1,2),(3,4),\dots$ Každá dvojice má celkovou velikost alespoň $1$.  
  
Jinak by první předmět v druhém binu dvojice šel dát do předchozího binu. Proto: $SIZE(I)\ge \left\lfloor\frac{\ell}{2}\right\rfloor$. Tedy: $\ell\le 2SIZE(I)+1$.    
A protože  
$$  
SIZE(I)\le OPT(I),  
$$
dostáváme:
$$
FF(I)\leq 2 \cdot OPT(I) +1
$$
---
# asymptotic PTAS

Definujeme $\varepsilon=\frac1k$.
Rozdělíme itemy na:
- malé $a_i\leq \frac{\varepsilon}{2},$
- velké $a_i>\frac{\varepsilon}{2}.$

Označme $I'$ instanci obsahující pouze velké itemy.

Protože každý velký item má velikost alespoň $\varepsilon/2$, do jednoho binu se vejde nejvýše $\frac{2}{\varepsilon}$ itemů.

---
## Linear grouping

Velké itemy seřadíme sestupně.

Rozdělíme je do skupin po $k=\lfloor \varepsilon SIZE(I)\rfloor$ kusech: $G_1,G_2,\dots$

První skupinu zahodíme.

V každé další skupině zaokrouhlíme všechny itemy nahoru na velikost největšího itemu skupiny.

Vznikne instance $I''$.

Počet různých velikostí je nyní nejvýše
$$
\frac{n}{k}
\leq
\frac{2}{\varepsilon^2},
$$
protože
$$
SIZE(I)\geq \frac{\varepsilon n}{2}.
$$
Máme tedy jen konstantně mnoho různých velikostí.

---
## Dynamické programování
Stav:
$$
DP[n_1,\dots,n_t]
$$
kde $n_i$ je počet itemů $i$-té velikosti.

Protože:
- velikostí je konstantně mnoho,
- v jednom binu je konstantně mnoho itemů,
- existuje konstantně mnoho konfigurací binu.

DP spočítá optimální packing instance $I''$.
Tedy $ALG(I'')=OPT(I'')$.

---
## Převod zpět
Packing $I''$ převedeme na packing $I'$:
- největší skupinu $G_1$ dáme zvlášť,
- ostatní skupiny posuneme o jednu dolů.

Tím přidáme nejvýše $k$ binů.

Tedy
$$
OPT(I'')\leq OPT(I')
$$
a
$$
ALG(I')\leq OPT(I'')+k.
$$
Protože
$$
k=\lfloor \varepsilon SIZE(I)\rfloor
\leq
\varepsilon OPT(I),
$$
platí
$$
ALG(I')
\leq
OPT(I)+\varepsilon OPT(I)
=
(1+\varepsilon)OPT(I).
$$

---
## Doplnění malých itemů
Malé itemy doplníme pomocí First Fit. Pokud vznikne nový bin, pak všechny předchozí biny mají zaplnění alespoň
$$
1-\frac{\varepsilon}{2}.
$$
Proto
$$
SIZE(I)\geq
\left(1-\frac{\varepsilon}{2}\right)k.
$$
Tedy počet nových binů je nejvýše
$$
\frac{SIZE(I)}{1-\varepsilon/2}+1.
$$
A protože

$$
SIZE(I)\leq OPT(I),
$$
a
$$
\frac{1}{1-\varepsilon/2}\leq 1+\varepsilon,
$$
dostáváme

$$
ALG(I)
\leq
(1+\varepsilon)OPT(I)+1.
$$

