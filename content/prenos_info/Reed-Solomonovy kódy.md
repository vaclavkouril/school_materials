## Motivace
Chceme parametry
- $d\approx \epsilon n$
- $k\approx (1-\epsilon) n$
# Definice
Mějme $g\ge n$ a $GF[g]$, $\alpha_{1},\dots,\alpha_{n}\in GF[g], \alpha_{i}\ne \alpha_{j}, k\leq n$. Pak zpráva $GF[g]^k\ni m=m_{0}m_{1}\dots m_{k-1}$, pro kterou definujeme polynom $p_{m}(x)=m_{0}+m_{1}x+\dots+ m_{k-1}x^{k-1}$ a pro zakódování mějme
$$
C(m) = \left\langle p_{m}(\alpha_{1}),p_{m}(\alpha_{2}),\dots,p_{m}(\alpha_{n}) \right\rangle.
$$
*Pozorování:* Je to lineární kód 

Zjevně $m\ne m': p_{m}(x)+ p_{m'}(x)=p_{m+m'}(x)$ a také $\alpha p_{m}(x)=p_{\alpha m}(x)$

Protože polynom je stupně $k-1$ tak to je i maximum kořenů polynomu a protože $d=\min_{z\in C,z \ne{0}} wt_{Ham}(z)$. Jen kořeny mohou vyjít $0$ a těch je omezeně, takže $d \geq n-k+1$

---
# Berlekamy-Welch
Chceme chybový polynom $E(x)$, kde chyba $\alpha_{i}\implies E(\alpha_{i})=0$. $E(x)\equiv 0$, stupeň $E(x)\leq$ počet chyb $\approx d /2$.

$$
\forall i\in \{ 1,\dots,n \}: p(\alpha_{i})\ne r_{i}\implies E(\alpha_{i})=0
$$
$$
\forall i\in \{ 1,\dots,n \}: r_{i}E(\alpha_{i}) = p(\alpha_{i}) \cdot E(\alpha_{i})
$$
$$
\forall i: (r_{i}-p(\alpha_{i}))E(\alpha_{i})=0
$$
hledáme tedy $\text{deg } p(x)\le k-1$ a $\text{deg }E(x)\leq \frac{n-k-1}{2}\approx \frac{d}{2} \pm 1$. Z rovnic hledáme $q(x)$ se stupněm $\leq \frac{n+k-3}{2}$.
$$
q(x) = \sum_{i=0}^{\frac{n+k-3}{2}} c_{i}' x^i \quad E(x) = \sum_{i=0}^{\frac{n-k-1}{2}} c_{i} x^i
$$
$c$ neznáme a tedy neznámých je $2+\frac{n+k-3}{2} + \frac{n-k-1}{2}=n$ a tedy
$$
j\in \{ 1,\dots,n \}: r_{j}\sum_{i=0}^{\frac{n-k-1}{2}} c_{i} \alpha^i = \sum_{i=0}^{\frac{n+k-3}{2}} c_{i}' \alpha^i 
$$
a to je soustava $n$-lineárních rovnic s $n$ neznámými $c'_{i},c_{i}$.

Tedy $\exists$ netriviální řešení $E(x),q(x)$, kde $E(x)\not\equiv{0}$. Mějme pak $p(x)=\frac{q(x)}{E(x)}$, které failne pokud máme příliš mnoho chyb. Pokud $\left\langle p(\alpha_{1}),\dots,p(\alpha_{n}) \right\rangle$ a $\left\langle r_{1},\dots,r_{n} \right\rangle$ se liší na více než $\frac{n-k-1}{2}\implies$ fail.

#### *Tvrzení:* Pokud $(E_{1}(x),q_{1}(x))$ a $(E_{2}(x),q_{2}(x))$ řeší $\forall j:r_{j}\sum_{i=0}^{\frac{n-k-1}{2}} c_{i} \alpha^i = \sum_{i=0}^{\frac{n+k-3}{2}} c_{i}' \alpha^i$, tak $E_{1}(x)\not\equiv 0,E_{2}(x)\not\equiv 0$, pak $\frac{q_{1}(x)}{E_{1}(x)} = \frac{q_{2}(x)}{E_{2}(x)}$.
*Důkaz:* Stupně $q_{2}(x)E_{1}(x)$ a $q_{1}(x)E_{2}(x)$ jsou nejvýše $n-2$. Tvrdíme, že polynomy splňují
$$
\forall j\in \{ 1,\dots,n \}: g_{2}(\alpha_j) E_{1}(\alpha_j) = q_{1}(\alpha_j) E_{2}(\alpha_j).
$$
A v každém bodě $j$ platí taky
$$
r_{j} E_{1} (\alpha_j) = q_{1}(\alpha_j),\quad r_{j}E_{2}(\alpha_j) = q_{2}(\alpha_j).
$$
Tedy pro dané $j$, je-li $r_{j}=0$, tak se rovnají $q_{1},q_{2}$ a pro $r_{j}\ne 0$, tak můžeme zkrátit rovnici a tedy platí
$$
\forall j\in \{ 1,\dots,n \}: g_{2}(\alpha_j) E_{1}(\alpha_j) = q_{1}(\alpha_j) E_{2}(\alpha_j).
$$
A oba polynomy se rovnají v $n$ bodech a taky $q_{2}(x)=p_{2}(x)E_{2}(x)$ a tedy se rovná
$$
p_{2}(x)E_{2}(x)E_{1}(x) = p_{1}(x)E_{1}(x)E_{2}(x).
$$
Kde se v nenulových bodech vytknou $E_{1}(x)E_{2}(x)$.