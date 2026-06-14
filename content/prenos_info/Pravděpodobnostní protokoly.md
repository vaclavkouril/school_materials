Náhodnost je zprostředkována **náhodnými bity** $r$, můžeme je mít *veřejné* pro $A$ i $B$.
*Soukromé* náhodné bity $r_A,r_{B}\in \{ 0,1 \}^*$, pak se soukromou náhodou vypadá protokol tak, že ($m_{v}: Y_{x}\to \{ 0,1 \}$)
- $A$ posílá zprávy $m_{u}(x,r_{A})$,
- $B$ posílá zprávy $m_{v}(y,r_{B})$.

Konverze mezi bity *veřejnými* a *soukromými* je $O(\log{n})$ na vzájemné posílání náhodných bitů.

Na vstupu $(x,y)$ chyba protokolu je
$$
\Pr_{r_{A},r_{B}}[\text{protokol vydá špatnou odpověď na } (x,y)] \leq \frac{1}{3}.
$$
Uvažujeme dvě míry
- průměrná délka přes $r_{A},r_{B}$,
- nejhorší délka protokolu
$$
R_{\varepsilon}(f)=\max{\Pi \text{ protokol, pro }f\text{ s chybou }\varepsilon} \text{délka protokolu } \Pi
$$
$R(f):=R_{1 /3}(f)$

- $EQ(x,y)=[x=y]$ - veřejné $O(1)$, $r$ veřejné a check $\left\langle x,r \right\rangle\to[\left\langle y,r \right\rangle=\left\langle x,r \right\rangle]$.
- soukromé $EQ$, pro $i\in [1,\dots,O(n)]$, pak $i,C(x)_{i}\to[C(y)_{i}=C(x)_{i}]$, kde $O(\log n)$.

### Lemma: Soukromé $R(f)\geq \Omega(\log D(f))$, kde $D$ je deterministický protokol.
*Důkaz v1.:* Vezměme pravděpodobnostní protokol pro $f$ se soukromými bity maximální délky $D$ a vyrobíme z něj deterministický protokol délky $O(D \cdot 2^D)$, který je $\ge D(f)$ a tedy
$$
\begin{align*}
D(f) &\le  c \cdot D \cdot 2^D \\
\log D(f) &\le \log D + D + \log c \leq 2D + \log c \\
\frac{1}{2} \log D(f) &\leq D + \log c
\end{align*}
$$
$$
R_{v}^{x,y} = \{ (r_{A},r_{B}) ; \text{na } (x,y)\text{ nás } r_{A}\&r_{B} \text{ vezme do } v \}.
$$
Pravděpodobnost toho, že protokol dojde do $v$ je $\Pr[x] \cdot p_{A}^{r,x} \cdot p_{B}^{r,{y}}$, kde $\Pr^{x,y}=p_{A}^{r,x}\cdot p_{B}^{r,y}= A_{v}B_{v}=R_{v}^{x,y}$.

To je $1+\underbrace{2^D \cdot (D+10)}_{p_{A}^{v_{1},x}\dots p_{A}^{v_{2^D},x}}$ bitů a tedy $2^D \cdot 2^{-(D+1-)}=\frac{1}{2^{10}}$.
#TODO: Předělat

*Důkaz v2.:*
Ekvivalentně ukážeme: pokud má $f$ soukromě randomizovaný protokol délky $c$, pak má deterministický protokol délky  
$$  
O(c2^c).  
$$
Mějme soukromě randomizovaný protokol $\Pi$ délky $c$ s chybou nejvýše $1/3$.  
  
Jeho komunikační strom má nejvýše $2^c$ listů. Pro každý list $v$ a vstup $(x,y)$ definujeme  
$$  
p_A^{v,x}  
=  
\Pr_{r_A}[\text{Alice je kompatibilní s cestou do }v],  
$$
$$  
p_B^{v,y}  
=  
\Pr_{r_B}[\text{Bob je kompatibilní s cestou do }v].  
$$
Protože $r_A,r_B$ jsou nezávislé, pravděpodobnost, že protokol skončí v listu $v$, je  
$$  
p_A^{v,x}p_B^{v,y}.  
$$
Nechť $L_1$ je množina listů, kde protokol odpovídá $1$. Potom  
$$  
\Pr[\Pi(x,y)=1]  
=  
\sum_{v\in L_1} p_A^{v,x}p_B^{v,y}.  
$$
Pokud $f(x,y)=1$, pak  
$$  
\Pr[\Pi(x,y)=1]\geq \frac23.  
$$ 
Pokud $f(x,y)=0$, pak  
$$  
\Pr[\Pi(x,y)=1]\leq \frac13.  
$$
Stačí tedy deterministicky aproximovat tuto sumu s chybou menší než $1/6$ a porovnat ji s $1/2$.  

Alice pošle Bobovi aproximace všech hodnot $p_A^{v,x}$ pro všechny listy $v$. Každou hodnotu pošle s přesností $2^{-(c+10)}.$

Protože listů je nejvýše $2^c$, celková chyba v sumě je nejvýše  
$$  
2^c\cdot 2^{-(c+10)}  
=  
2^{-10}  
<  
\frac16.  
$$
Bob zná $y$, takže si dopočítá všechna $p_B^{v,y}$ a spočítá  
$$  
S=  
\sum_{v\in L_1} \widetilde p_A^{v,x}p_B^{v,y}.  
$$
Pokud  
$$  
S>\frac12,  
$$
odpoví $1$, jinak odpoví $0$. Díky mezeře mezi $1/3$ a $2/3$ je odpověď správná.  
  
Alice posílá nejvýše $2^c$ čísel, každé na $c+10$ bitů, tedy délka deterministického protokolu je 
$$  
O(2^c(c+10))=O(c2^c).  
$$
Proto  
$$  
D(f)\leq O(c2^c).  
$$
Logaritmováním dostaneme  
$$  
\log D(f)  
\leq  
O(\log c+c)  
=  
O(c).  
$$
Tedy  
  
$$  
c\geq \Omega(\log D(f)).  
$$
Protože $c$ byla délka soukromě randomizovaného protokolu, dostáváme  
$$  
R^{priv}(f)\geq \Omega(\log D(f)).  
$$
---
# Mějme $r$ veřejných bitů, chceme je simulovat soukromými.

Mějme veřejný protokol $\Pi$ pro $f$ s chybou nejvýše $1/3$.  
Nejprve jej konstantní amplifikací převedeme na protokol s chybou nejvýše $1/10$.  
  
Náhodně nezávisle vybereme veřejné bity
$$  
r_1,\dots,r_t,\qquad t=n^{10}.  
$$
Pro pevný vstup $(x,y)$ označme  
$$  
X_i^{x,y}  
=  
\begin{cases}  
1, & \Pi(x,y;r_i)\neq f(x,y),\\  
0, & \text{jinak.}  
\end{cases}  
$$
Pak  
$$  
\mathbb E[X_i^{x,y}]\leq \frac{1}{10}.  
$$
[Chernoffovou nerovností](Shannonovy%20věty.md) dostáváme
$$  
\Pr\left[  
\sum_{i=1}^t X_i^{x,y}>\frac{t}{3}  
\right]  
\leq  
2e^{-ct}  
$$
pro nějakou konstantu $c>0$.  

Počet vstupů $(x,y)$ je nejvýše $2^{2n}$, tedy podle union boundu  
$$  
\Pr\left[  
\exists (x,y):  
\sum_{i=1}^t X_i^{x,y}>\frac{t}{3}  
\right]  
\leq  
2^{2n}\cdot 2e^{-ct}.  
$$
Pro $t=n^{10}$ je tato pravděpodobnost menší než $1$.  
Proto existuje pevný seznam $r_1,\dots,r_t$, který je dobrý pro všechny vstupy.  
  
Soukromý protokol potom funguje tak, že Alice náhodně vybere index $i\in[t]$, pošle jej Bobovi pomocí $O(\log t)=O(\log n)$ bitů a oba spustí veřejný protokol s $r_i$.  

Protože pro každý vstup je špatných nejvýše $\frac{1}{3}$ indexů, chyba  
nového protokolu je nejvýše $\frac{1}{3}$.  

Tedy  
$$  
R^{priv}_{1/3}(f)  
\leq  
O(R^{pub}_{1/3}(f)+\log n).  
$$
---
# Data streams
- $\dots(i, \pm cnt_{i})\dots$
- $\dots(add_{{src}}, add_{dest})\dots$
1. pro každé $i\to$ celkový count neumíme, protože $\Omega(n)$.
2. celkový count - umíme $O(\log n)$
3. průměr - umíme $O(\log n)$
4. \# prvků s nenulovým count - umíme $O(\log n)$
5. nejčastější a kolikrát se vyskytl $\Omega(n)$
6. $DISJ$ (pro $x,y: \exists i;x_{i}=y_{i}=1$) tak $D(DISJ)=n+1$ a $R(DISJ)\geq \Omega(n)$.

Mějme paměť $M$, pak protokol
- A i B udělají $\forall i,x_{i}=1\to (i,1)$(respektive $i,y_{i}=1\to(y_{i},1)$, $\to$ je poslání druhému) a pošle je do $M$ a pak se využije nejčastější $i$ a jeho počet
- tím získáme, zda mají jedničku oba.
