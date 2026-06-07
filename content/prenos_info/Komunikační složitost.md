Mějme Alenku s $x\in \{ 0,1 \}^n$ a Boba s $y\in \{ 0,1 \}^n$, kteří si chtějí vyměnit data, zda se shodují $x,y$.

$f:X\times Y \to Z$, kde $X=\{ 0,1 \}^n = Y, Z=\{ 0,1 \}$, $EQ(x,y)=[x=y]$.

Chceme přenést $\leq n+1$ bitů komunikace aby se nemusela posílat celá slova. Chceme __pravděpodobností__ protokol pro $EQ$ s $O(\log n)$ bity.

*Protokol:* kdo komunikuje, by to měl říci. $m_{v}: X\to \{ 0,1 \}, m_{u}: Y\to \{ 0,1 \}$
- strom
- každý vrchol přiřazen buď $A$, nebo $B$: $A$-vrchol $u$, $m_{u}:X\to \{ 0,1 \}$ a $B$-vrchol $v$, $m_{v}:Y\to \{ 0,1 \}$.
- každý list je ze $Z$.

Tedy $f:X\times Y\to Z$, zajímá nás $D(f)=\min_{\pi \text{ protokol, počítající }f} \text{hloubka } \pi$ a $D(f)\leq n+1$.

Zkoumané problémy jsou
- $GT(x,y)=[x\geq y]$
- $DISJ(x,y) = [\exists i,x_{i}=y_{i}=1]$
- $IP(x,y)=\sum_{i=1}^n x_i \cdot y_{i} \mod 2$

*Příklad:* $x,y\subseteq \{ 1,\dots,n \}$ a $f_{min}(x,y)= \min x \cup y$ pak každý pošle nejmenší prvek $D(f_{min})\leq 2\log n$.

$x,y\subseteq \{ 1,\dots,n \}$, kde $x$ je pouze ze sudých čísel a $y$ z lichých, zajímá nás $f_{med}(x\cup y)=med(x \cup y)$.
- $2k=|x\cup y| \approx 2\log n$ bitů.
- Hledám $k$-tý prvek binárním vyhledáváním (kolik je prvků vpravo/vlevo) a tedy $\log n$ vrstev a na každé $2\log n$ poslaných bitů $\implies O(\log^{2}n)$.
- Dá se ušetřit a je známý (složitý) protokol $D(f_{med})=O(\log n)$.

---

Kombinatorický obdélník pro $X,Y: A\subseteq X,B \subseteq Y$ je $A \times B$.

### *Tvrzení:* $R\subseteq X \times Y$, $R$ je kombinatorický obdélník $\iff \forall (x,y), (x',y')\in R; (x,y')\in R \land (x',y)\in R$.
*Důkaz:* $\implies$ je triviální a pro $\impliedby$ mějme $A=\{ x;(x,y)\in R \}, B=\{ y\mid \exists x:(x,y)\in R \}$ a $R \subseteq A \times B$ zjevně. Pro $A\times B\subseteq R$ máme $\exists y:(x,y)\in R \land\exists x':(x',y')\in R$ a protože platí 
$$
\forall (x,y), (x',y')\in R; (x,y')\in R \land (x',y)\in R,
$$
tak dostáváme $(x',y),(x,y')\in R$ a tedy $A\times B=R$ a tedy je to kombinatorický obdélník.

### *Tvrzení:* $\forall v, Rv$ je kombinatorický obdélník.

**Motivace** pro kombinatorické obdélníky máme $Rv =\{ (x,y), \text{které nás dovedou do }v \}$, kde $v$ je vrcholem stromu protokolu.

*Důkaz:* Pro kořen platí  
$$  
R_{\mathrm{root}}=X\times Y,  
$$
což je kombinatorický obdélník.  
  
Nechť $u$ je vrchol a $R_u=A\times B.$
Pokud ve vrcholu $u$ mluví Alice, potom její zpráva závisí pouze na $x\in A$ a dosavadním transcriptu, který je ve vrcholu $u$ už fixní. Definujeme 
$$  
A_0=\{x\in A: \text{Alice ve vrcholu }u\text{ pošle }0\},  
$$
$$  
A_1=\{x\in A: \text{Alice ve vrcholu }u\text{ pošle }1\}.  
$$
Pak  
$$  
A=A_0\dot\cup A_1.  
$$
Synové vrcholu $u$ tedy odpovídají množinám  
$$  
R_{u_0}=A_0\times B,  
$$
$$  
R_{u_1}=A_1\times B.  
$$
Obě jsou kombinatorické obdélníky.  

Pokud ve vrcholu $u$ mluví Bob, analogicky rozdělíme $B$:  
$$  
B_0=\{y\in B: \text{Bob ve vrcholu }u\text{ pošle }0\},  
$$
$$  
B_1=\{y\in B: \text{Bob ve vrcholu }u\text{ pošle }1\}.  
$$
Pak  
$$  
R_{u_0}=A\times B_0,  
$$
$$  
R_{u_1}=A\times B_1.  
$$

- Na konci máme $\forall (x,y), (x',y') \in R: f(x,y)=f(x',y')$
- Pokud protokol stojí $t$ hloubku, tak můžeme rozdělit $M_{f}$ na nejvýše $2^t$ monochromatických obdélníků.

---
Pro $EQ$, pro každé $(x,y),(x',y')$, kde $EQ(x,y)=1, EQ(x',y')=1$ musí ležet v různých obdélnících. Navíc máme $2^n$ 1-obdélníků a $\geq{1}$ $0$-obdélníků, tedy aspoň $2^n+1$ obdélníků $\implies$ protokol pro $EQ$ má hloubku $\log(2^n+1)>n$ $\implies D(EQ)=n+1$.
- Protokol pro $f$ rozřeže matici na jednobarevné obdélníky, jejich počet je $k$ a tedy hloubka je $\log k$.

$DISJ$: (obrázek TODO:) $\forall x\ne 0^n:DISJ(x,x)= 1$, pokud vezmeme $(x,x),(x',x')$ tak $DISJ(x,x')=?(1/0)$.
- $x\ne0^n,1^n:(x,x),(\bar{x},\bar{x})$ je $DISJ(x,\bar{x})= DISJ(\bar{x},x)=0$, ale $DISJ(x,x)=DIS(\bar{x},\bar{x})=1$.
- $DISJ(x,\bar{x})=0$ a mějme $(x,\bar{x}),(x',\bar{x'})$ a tedy aspoň jeden ze $DISJ(x,\bar{x'}),DISJ(x',\bar{x})$ je jedna
- $\implies$ $D(DISJ)\geq n+1$. Protože $(x,\bar{x}), (x',\bar{x}')$ nemohou být ve stejných obdélnících, tedy $\log 2^n +1$.

$IP:$ Matice $M_{f}$, její $\text{rank}(M_{f}) \leq R$ (počet 1 údajů) (rank je nad $\mathbb{R}$) 

---
