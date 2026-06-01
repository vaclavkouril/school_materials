# Algorithm for coloring 3-chromatic graphs by $\tilde O(n^{1/4})$ colors
$\tilde{O}$-ignorule logaritmické faktory

SDP: 
- ${v}_{i}\in \mathbb{R}^n$
- $||v_{i}||=1$
- $(\forall ij\in E)v_{i}^T v_{j}= - \frac{1}{2}$

ALG: Mějme $v_{i}$ jako feasible řešení SDP
1. $\alpha=\sqrt{ \frac{2}{3}\ln\Delta }$
2. $r$ náhodně s $r_{i}\in N(0,1)$
3. $S:=\{ i\in V \mid v_{i} r \geq \alpha\}$
4. $S':= \{ i \in S \mid (\forall i,ij\in E) j \not\in S \}$

Pak pro $N(0,1)$ máme $f(x)=\frac{1}{\sqrt{ 2\pi }} e^{- x^2/2}, F(x)=\int_{x}^\infty f(s) \,ds$

Lemma: $\Pr[i\in S]\geq F(\alpha)$, tedy $\mathbb{E}[|S|]\geq F(\alpha)\cdot n$


Lemma: $\forall ij\in E: \Pr[j\in S \mid i\in S]\leq F(\sqrt{ 3 }\alpha)\leq \frac{1}{2\Delta}$ 

Víme, že $v_{i}$ a $v_{j}$ mají $120^\circ$, a pokud vezmeme systém, kde máme $v_{i}$ a $u$, který je $v_{i}$ kolmý a zobrazíme $v_{j}$ na tento coordinate system $v_{j}$, tak má koordináty $-\frac{1}{2}$ ($\cdot v_{i}$) a $\frac{\sqrt{ 3 }}{2}$ ($\cdot u$) a zajímá nás v tomto vector space
$$
v_{j} \cdot r = \frac{\sqrt{ 3 }}{2} u\cdot r - \frac{1}{2}v_{i}r.
$$
$$
\Pr[v_{j}\cdot r \geq \alpha \mid v_{i} \cdot r \geq \alpha ] \leq \Pr[u \cdot r \geq \sqrt{ 3 }\alpha],
$$
Můžeme přepsat taky $u=\frac{2}{\sqrt{ 3 }}\left( \frac{1}{2}v_{i}+v_{j} \right)$ a máme podmínku výše protože
$$
u \cdot r \geq \frac{2}{\sqrt{ 3 }} \left( \alpha + \frac{1}{2}\alpha \right) = \sqrt{ 3 }\alpha
$$
protože je $u$ kolmé na $v_{i}$ a $u \cdot r$ je nezávislé na $v_{j}\cdot r$ a dle normálního rozdělení, tak když víme, že $v_{i} \cdot r \geq \alpha$ tak pravděpodobnost $v_{j} \cdot r\geq \alpha$ je nejvýše právě $\Pr[u \cdot r \geq \sqrt{ 3 }\alpha]$ a to je normálně distribuovaná proměnná, tedy je to přesně $F(\sqrt{ 3 }\alpha)$.

Lemma: $F(x)=\Theta(\frac{1}{x} f(x))$ pro $x\geq 1$
$$
\frac{1}{2x}f(x)\leq\frac{x}{1+x^2} f(x) \leq F(x) \leq \frac{1}{x} f(x)
$$
$$
f'(s) = -sf(s), \quad \left[ -\frac{1}{s}f(s) \right]' = \left( 1+\frac{1}{s^2} \right)f(s)
$$
a
$$
\int_{x}^{\infty} \left( 1+\frac{1}{s^2} \right) f(s)\,ds = \frac{1}{x}f(x)
$$
a integrál je omezen
$$
\geq \int_{x}^{\infty} f(s) \,ds=F(x)
$$
a taky je omezen z druhé strany
$$
\leq \int_{x}^{\infty}\left( 1+\frac{1}{x^2} \right)f(s) = \left( 1+\frac{1}{x^2} \right) F(X)
$$


Všechny lemma dohromady máme 
$$
F(\sqrt{ 3 }\alpha)\leq \frac{1}{\sqrt{ 3 }\alpha }f(\sqrt{ 3 }\alpha) = \frac{1}{\sqrt{ 3 }\alpha\sqrt{ 2 }\pi} e^{- (3\alpha^2)/2 } 
$$
a substitucí máme $e^{- (3\alpha^2)/2} = \frac{1}{\Delta}$ a platí lemma 2.
$$
F(\alpha) \geq \frac{1}{2\alpha} \cdot \frac{1}{2\pi} e^{- \alpha^2/2} = \dots e^{-\log\Delta/3} = \dots \Delta^{1/3}
$$
Protože $F(\sqrt{ 3 }\alpha)\approx F(\alpha)^3$ a protože $\frac{1}{2\alpha}$ tak máme pak log faktory, takže
$$
\mathbb{E}[|S|] \geq \text{poly-log}(\Delta) \Delta^{-1/3} \cdot n
$$
Tedy umíme obarvit tři obarvitelný graf s $\tilde{O}(n^{1/4})$ barvami.