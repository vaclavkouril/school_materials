L-redukce $\Pi$ na $\Pi'$ je $f:I\to I'$ a $g(S',I') = S$, kde 
$$
OPT'(f(I))\leq \alpha \cdot OPT(I)
$$
a
$$
|g(S,f(I)) - OPT(I)| \leq b\cdot|S'-OPT(f(I))|
$$
Věta: Pokud existuje L-redukce s $a,b$ a $(1+\varepsilon)$ nebo $(1-\varepsilon)$ aprox.alg. pro $\Pi'$ pak existuje $(1-ab\varepsilon)$ nebo $(1+ab\varepsilon)$ aprox.alg pro $\Pi$

PCP: Jazyk $L$ patří do třídy $PCP_{c,s}[r(n),q(n)]$ pro $0\leq s< c \leq 1$ pokud existuje polynomiální verifikátor $V$ splnující:
1. používá nejvýš $r(n)$ random bitů a čte nejvýše $q(n)$ bitů certifikátu,
2. $\forall x\in L \exists y$ certifikát, že $\Pr_{{0,1}^{r(n)}} [V(x,y)=1]\geq c$,
3. $\forall x \not\in L \forall y$ certifikát : $\Pr_{\{ 0,1 \}^{r(n)}}[V(x,y)=1]\leq s$.
## PCP věta: $NP = PCP_{1,1/2}[O(\log n), O(1)]$
Protože $O(\log{n})$ tak je polynomiálně mnoho náhodných voleb.

$PCP \ni 3-SAT$ mějme $\varphi$ a tu převedeme na $T(\varphi)$, kde 
- $\varphi \in 3-SAT \implies T(\varphi)\in SAT$
- $\varphi \not\in3-SAT \implies MAXSAT(T(\varphi))\leq 1- 2^{-q-1}$

Pro $q$ konstantu, kterou je kolik bitů důkazu př€čte Verifier.

Vyrobíme si funkce $v_{1}(\Pi_{i_{1}},\dots,\Pi_{i_{q}})$ (počítající to samé co verifier), kde ta $\Pi$ jsou bity důkazu, které byli vybrány verifierem s náhodou $r_1$, těchto náhodných bitů je ale polynomiálně a pro každý vyrobíme klauzuli co čte konstantně bitů z důkazu. $R=2^r =2^{O(\log n)}$
$$
T(\varphi) = \bigwedge_{i=1}^{R} v_{i} 
$$
Každá funkce má konstantní velikost, tedy $T(\varphi)$ je polynomiálně velké. 

Když není v SATu tak u $T(\varphi)$ je více než $\frac{1}{2}$ nesplněných constraintů (fcí $v_i$) a tedy máme rozlišitelnost. (Splněnost odpovídá pravděpodobnosti přijetí)

---  
## Gap verze 3-SAT  
Z PCP věty tedy dostaneme NP-těžký gap problém: Rozlišit mezi případy:  
$$  
OPT(\psi)=1  
$$
a  
$$  
OPT(\psi)\le 1-\varepsilon.  
$$
---  
## Proč z toho plyne neexistence PTAS pro MAX-SAT  
Předpokládejme, že MAX-SAT má PTAS.  
  
Pak pro libovolné $\delta>0$ existuje polynomiální algoritmus, který najde řešení s hodnotou alespoň  
  
$$  
(1-\delta)OPT.  
$$  
Zvolíme  
$$  
\delta < \varepsilon.  
$$ 
Teď vezmeme gap instanci $\psi$.   
### Pokud $OPT(\psi)=1$  
PTAS najde řešení hodnoty alespoň  
  
$$  
1-\delta.  
$$
### Pokud $OPT(\psi)\le 1-\varepsilon$    
Žádné řešení nemá hodnotu větší než  
$$  
1-\varepsilon.  
$$
Protože  
  
$$  
1-\delta > 1-\varepsilon,  
$$
umíme tyto dva případy rozlišit.  
  
Tedy bychom uměli v polynomiálním čase rozhodnout NP-těžký problém.  
