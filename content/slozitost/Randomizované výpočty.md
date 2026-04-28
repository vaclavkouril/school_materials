# Pravděpodobnostní Turingův stroj
*Definice:* **PTS** je TS se dvěma přechodovými funkcemi $\delta_{1},\delta_{2}$. Při práci **PTS** $M$ na vstupu $x$ je v každém kroku s pravděpodobností $\frac{1}{2}$ použita $\delta_{1}$ a s pravděpodobností $\frac{1}{2}$ použita $\delta_{2}$. Každý výběr je proveden nezávisle na všech předchozích. $M$ vrací hodnotu $1$ ($x$ přijato), nebo $0$ ($x$ odmítnuto) a tuto náhodnou veličinu značíme $M(x)$.

Říkáme, že $M$ běží v čase $T(n)$ pokud $\forall$ vstupy $x$ PTS $M$ zastaví po $\leq T(|x|)$ krocích bez ohledu jaké náhodné bity byly vybrány.

*Značení:* Pro jazyk $L\subseteq \{ 0,1 \}^*$ a $x\in \{ 0,1 \}^*$ definujeme
$$
L(x) = 1 \iff x \in L \text{ a } L(x)=0 \iff x\not\in L.
$$
*Definice:* Říkáme, že PTS $M$ přijímá jazyk $L \subseteq \{ 0,1 \}^*$ v čase $T(n)$ pokud běží v $T(n)$ (stačí i *očekávaném čase*) a $\forall x\in \{ 0,1 \}^*: \Pr[M(x) = L(x)]\geq 2/3$ (klidně i libovolně v $(1/2, 1)$).

*Definice (**Bounded error probabilistic polynomial time**):* $\text{BPTIME}(T(n))$ je třída jazyků přijímaných PTS v čase $O(T(n))$.
$$
\mathcal{BPP} = \bigcup_{c\in \mathbb{N}} \text{BPTIME}(n^c). 
$$
## Alternativní definice $\mathcal{BPP}$
*Definice:* Mějme DTS $M$, který má posloupnost náhodných bitů jako svůj druhý vstup. $L\in \mathcal{BPP} \iff \exists\text{DTS } M$ běžící v poly $p(n)$ takový, že
$$
\forall x\in \{ 0,1 \}^*: \Pr[M(x,r) = L(x)]\geq \frac{2}{3},
$$
kde pravděpodobnost se počítá přes $r\in \{ 0,1 \}^{p(|x|)}$.

V čase $2^{\text{poly}(|x|)}$, lze vyčíslit všechna $M$ a tím pádem odsimulovat všechny větve výpočtu PTS $\implies \mathcal{BPP}\subseteq EXP = \bigcup_{c\in \mathbb{N}} DTIME(2^{n^c})$ obdobně $\mathcal{BPP} \subseteq PSPACE$.

---
# Redukce chyby pro $\mathcal{BPP}$
#### Černovova nerovnost: Nechť $X_{1},..,X_{n}$ jsou nezávislné náhodné proměnné, kde $X_{i}\in \{ 0,1 \}$ a nechť $\mu=\sum_{i=1}^n \mathbb{E}[X_{i}]$. Pak $\forall\delta>0: \Pr\left[ |\sum_{i=1}^n X_{i} - \mu| > \delta \mu\right]\leq 2\cdot e^{-\mu\min \{ \delta^2/4, \delta/2 \}}$.
$\frac{\delta^2}{4}$ se vybere pokud $\frac{\delta}{2}<1$.

### *Věta:* Nechť $L\subseteq \{ 0,1 \}^*$ je jazyk, $c>0$ konstanta a předpokládejme, že existuje PTS $M$, pracující v polynomiálním čase takový, že $\forall x\in \{ 0,1 \}^*: \Pr[M(x)=L(x)]\geq \frac{1}{2}+|x|^{-c}$. Pak $\forall d>0: \exists$ PTS $\tilde{M}$, pracující v polynomiálním čase takový, že $\forall x\in \{ 0,1 \}^*: \Pr[M(x)=L(x)]\geq 1-2^{-|x|^d}$.
*Důkaz:* $\tilde{M}$ pracuje na $x$ tak, že pustí $M$ opakovaně $k=32|x|^{2c+d}$ krát čímž získá výsledky $y_{1},\dots,y_{k} \in \{ 0,1 \}$, $\tilde{M}$ vydá výsledek dle majority. $\tilde{M}$ je tedy jistě v polynomiálním čase.

Označíme $X_{i}\in \{ 0,1 \}$ náhodnou proměnnou, kde $X_{i}=1\iff y_{i}=L(x)$ a $X_{i}=0\iff y_{i} \not\in L(x)$. Zjevně $X_{1},\dots,X_{k}$ jsou nezávislé náhodné veličiny, pro které $\mathbb{E}[X_{i}]\geq p = \frac{1}{2} +|x|^{-c}$.

Zvolme $\delta=\frac{1}{2}|x|^{-c}$ a uvažujme nerovnost 
$$
\begin{align*}
\sum_{i=1}^k X_{i} &\geq pk - \delta pk = k\left( \frac{1}{2}-|x|^{-c} \right)\left( 1 - \frac{1}{2}|x|^{-c} \right) = \\
&= \frac{1}{2} k + \left( \underbrace{\frac{3}{4}|x|^{-c} - \frac{1}{2} |x|^{-2c}}_{>0} \right)k > \frac{1}{2}k
\end{align*}
$$
První nerovnost implikuje, že $\tilde{M}$ neudělá chybu, ostře více než půlka je správně.

$\implies$ aby $\tilde{M}$ mohl udělat chybu, tak musí platit $\sum X_{i} < pk-\delta pk$ a tedy
$$
\Pr[\tilde{M} \text{ chybuje}] \leq \Pr\left[ \sum_{i=1}^k X_{i}<pk-\delta pk \right] = \Pr\left[ pk - \sum X_{i} > \delta pk \right].
$$
Víme $\mathbb{E}[X_{i}]\geq p \implies \mu = \sum \mathbb{E}[X_{i}]\geq kp$ označme $\mu=kp+\epsilon$, pro $\epsilon\geq0$. 
$$
\begin{align*}
\Pr\left[ pk - \sum X_{i} > \delta pk \right] &\leq \Pr\left[ pk - \sum X_{i} + \underbrace{(1-\delta)\epsilon}_{>0} > \delta pk \right] =\\
&= \Pr\left[ pk+\epsilon - \sum X_{i} > \delta pk+\delta\epsilon \right] = \\
&= \Pr\left[ \mu-\sum X_{i}> \delta n \right] = \\
&= \frac{1}{2}\Pr\left[ |\sum X_{i} - \mu| > \delta n \right] \\
&\leq \frac{1}{2}\cdot 2 e^{-\mu \delta^2/4} \leq e^{-\frac{\delta^2}{4}pk}
\end{align*}
$$
Tedy máme
$$
\begin{align*}
\Pr[\tilde{M} \text{ chybuje}] &\leq e^{-\frac{1}{4} \delta^2 pk}=e^{- \frac{1}{4}\frac{1}{4} |x|^{-2c} (\frac{1}{2} + |x|^{-c}) 32|x|^{2c+d} }
\\&=  e^{-(\frac{32|x|^{2c+d}}{32|x|^{2c}} + \underbrace{\frac{32|x|^{2c+d}}{16|x|^{3c}}}_{\text{zanedbáme}})} \\
&\leq e^{-|x|^d} < 2^{-|x|^d}
\end{align*}
$$
tedy máme $\Pr[\tilde{M} \text{ odpoví správně}] > 1-2^{-|x|^d}$.

---
# Očekávaná časová složitost
*Definice:* Nechť $M$ je **PTS** a $x$ vstup, pak náhodná proměnná $T_{M,x}$ značí dobu běhu $M$ na $x$, tedy platí, že $\Pr[T_{M,x}=t]=p$ pokud $M$ zastaví na vstupu $x$ pro $t$ krocích s pravděpodobností $p$. $M$ běží v **očekávaném čase** $T(n)$ pokud $\forall x\in \{ 0,1 \}^*: \mathbb{E}[T_{M,x}] \leq T(|x|)$.

#### Markovova nerovnost: Nechť $X$ je nezáporná náhodná proměnná, pak $\Pr[X\geq k \cdot \mathbb{E}[X]] \leq \frac{1}{k}$. 

Mějme PTS $M$ pracující v očekávaném čase $T(n)$. Předěláme ho na PTS $M'$ pracujícího v čase $cT(n)$ (pro vhodné $c$) rozpoznávajícího stejný jazyk.

$M'$ simuluje $M$, ale pro $100\cdot T(n)$ výpočet ukončí odmítnutím.

Pravděpodobnost, že $M$ běží v čase $100T(n)$ je $\leq \frac{1}{100}$ a tím pádem chybovat $M'$ je nejvýše o $\frac{1}{100}$ větší než u $M$. Díky [Větě o redukci chyby](#*Věta%20*%20Nechť%20$L%20subseteq%20{%200,1%20}%20*$%20je%20jazyk,%20$c>0$%20konstanta%20a%20předpokládejme,%20že%20existuje%20PTS%20$M$,%20pracující%20v%20polynomiálním%20čase%20takový,%20že%20$%20forall%20x%20in%20{%200,1%20}%20*%20Pr[M(x)=L(x)]%20geq%20frac{1}{2}+%20x%20{-c}$.%20Pak%20$%20forall%20d>0%20exists$%20PTS%20$%20tilde{M}$,%20pracující%20v%20polynomiálním%20čase%20takový,%20že%20$%20forall%20x%20in%20{%200,1%20}%20*%20Pr[M(x)=L(x)]%20geq%201-2%20{-%20x%20d}$.) lze $M'$ předělat na PTS s chybovostí $<1/3$ (stejnou jako $M$).

---
# Cinknuté mince
#### *Lemma:* Minci s $\Pr[\text{panna}] = \rho \in (0,1)$ lze simulovat na PTS $M$ v očekávaném čase $O(1)$ pokud $i$-tý bit čísla $\rho$ lze generovat v čase $poly(i).$
*Důkaz:* Nechť $\rho$ v binárním zápisu $\rho=0,p_{1}p_{2}\dots$ a PTS $M$ generuji posloupnost náhodných bitů $b_{1},b_{2},\dots$ tak, že v čase $i$ generuji $b_i$ (a platí $\forall i:\Pr[b_{i}=1] =\Pr[b_{i}=0]=\frac{1}{2}$) Pokud v $i$-tém kroku:
- $b_{i}<p_{i}\implies M$ vrací "panna" a zastaví,
- $b_{i}>p_{i}\implies M$ vrací "orel" a zastaví,
- $b_{i}=p_{i}\implies M$ jde na krok $i+1$.

$M$ dojde do kroku $i$ s pravděpodobností $\frac{1}{2^{i-1}}$. Pravděpodobnost, že $M$ vrátí v $i$-tém kroku "panna" je 
- $\frac{1}{2^{i-1}} \cdot \frac{1}{2}$ pokud $p_i=1$, ale 
- $0$ pokud $p_{i}=0$
$$
\Pr[M \text{ vrátí "panna"}] = \sum_{i} \frac{1}{2^i} p_{i} = \rho.
$$
Časová složitost je $\mathbb{E}[\text{počet kroků } M]$ a to je
$$
\frac{1}{2}\sum_{i} i^c \frac{1}{2^{i}} \leq d,\quad d \text{ je konstanta}
$$
Podílové kritérium pro konvergenci posloupnosti částečných součtů $\sum_{i=1}^n a_{i}$, $\lim_{ n \to \infty } \frac{a_{i+1}}{a_{i}} <1$. Aplikujeme na 
$$
\lim_{ i \to \infty } \frac{(i+1)^c/2^{i+1}}{i^i / 2^i} = \frac{1}{2} \lim_{ i \to \infty } \left( \frac{i+1}{i} \right)^c \to \frac{1}{2} 1^c.
$$

#### *Lemma:* Minci s $\Pr[\text{panna}] = \frac{1}{2}$ lze simulovat pomocí PTS s přístupem k sekvenci $\rho$-biased mincí v očekávaném čase $O(1)$ pro jakékoli $0<\rho<1$
*Důkaz:* 1 kolo jsou dva hody a rozhodneme
- panna+orel $\to$ vrátí panna s $\rho(1-\rho)$
- orel+panna $\to$ vrátí orel s $(1-\rho)\rho$
- jinak do dalšího kola $1-2\rho(1-\rho)$

tedy vrací panna i orel s pravděpodobností $\frac{1}{2}$. 

Časová složitost: PTS zastaví v každém kole $c=2\rho(1-\rho)$, takže očekávaný počet kol do zastavení je $\sum_{i} i\cdot(1-c)^i c = c \sum_{i} (\frac{1}{d})^i$ pro $0 < \frac{1}{d}<1$ a stejný argument jako v předešlém lemma a tedy konverguje ke konstantě.

---
# $\mathcal{RP}, co-\mathcal{RP}, \mathcal{ZRP}$
*Definice:* $\text{RTIME}(T(n))$ je třída jazyků, pro které $\exists$ PTS $M$ (očekávaně) pracující v čase $T(n)$ takový, že
- $x\in L \implies\Pr[M(x)=1]>2 /3$,
- $x\not\in L \implies\Pr[M(x)=0]=1$.

Třída *randomized polynomial time* je
$$
\mathcal{RP} = \bigcup_{c} \text{RTIME}(n^c). co-\mathcal{RP} = \{ L \mid \overline L \in \mathcal{RP} \}.
$$

*Definice:* $\text{ZTIME}(T(n))$ je třída jazyků, pro které existuje PTS $M$ pracující **v očekávaném čase** $T(n)$ takový, že
$$
\left.\begin{array}{lr}
x\in L &\implies \Pr[M(x)=1]  \\
x\not\in L &\implies \Pr[M(x)=0]
\end{array}\right\} \implies \Pr[M(x)=L(x)] = 1
$$
Třída zero-error probabilistic polynomial time
$$
\mathcal{ZPP} = \bigcup_{c} \text{ZTIME}(n^c).
$$
## $\mathcal{RP}\subseteq \mathcal{NP}$ (triviálně $\mathcal{RP} \subseteq \mathcal{BPP}$)
Stejný strom pro NTS i PTS a pro $x\in L$, pro NTS stačí jedna větev, ale pro PTS je potřeba mnohem více.

## $\mathcal{BPP} = co-\mathcal{BPP}$
Nechť $L\in \mathcal{BPP} \iff \overline{L} \in co-\mathcal{BPP}$ chceme, že $\bar{L}$ lze rozpoznat pomocí PTS $\bar{M}$, který pracuje stejně jako PTS $M$ rozpoznávající $L$ pouze vždy odpoví opačně.

$\Pr[\bar{M}=\bar{L}(x)]=\Pr[1-M(x) = 1-L(x)] =\Pr[M(x)=L(x)]$.

## $\mathcal{ZPP} = \mathcal{RP} \cap co-\mathcal{RP}$
$\mathcal{ZPP} \subseteq \mathcal{RP} \cap co-\mathcal{RP}$ u $\mathcal{BPP}$ použijeme trik na očekávaný čas. S $\mathcal{RP}$ je podmnožina z definice a protože $\mathcal{ZPP} = co-\mathcal{ZPP}$ a tedy i $L \in\mathcal{ZPP}\implies \bar{L} \in \mathcal{ZPP} \implies \bar{L}\in \mathcal{RP} \implies L \in co-\mathcal{RP}$.

$\supseteq$ Nechť $L\in RP \cap co-\mathcal{RP} \implies M,\bar{M}$ PTS pracující v poly čase takové, že 
- $x\in L(\iff x\not\in \bar{L}): \Pr[M(x)=1] \geq {2} /3$ a $\Pr[\bar{M}(x)=0]=1$ 
- $x\not\in L (\iff x\in \bar L) : \Pr[M(x)=0]=1$ a $\Pr[\bar{M}(x)=1]\geq {2}/3$

Tedy platí: pokud $M(x)=1\implies x\in L$ a $\bar{M}(x)=1\implies x\in \bar{L}\iff x \not\in L$.

Tedy můžeme zkonstruovat PTS $\tilde{M}$ v každém kole spustí na vstup $x$ jak $M$ tak $\bar{M}$ 
- pokud $M(x)=1 \implies \tilde{M}=1$,
- pokud $\bar{M}(x)=1 \implies \tilde{M}(x)=0$,
- $M(x)=0 \lor \bar{M}=0$ tak $\tilde{M}$ jde do dalšího kola.

Zjevně vždy odpoví správně $\Pr[\tilde{M}(x)=L(x)]=1$ a stačí ukázat, že $\tilde{M}$ tvoří v očekávaném čase $p(n)$ pro nějaký polynom.

Pravděpodobnost, že $M(x)=0 \land \bar{M}(x)=0$ je 
$$
\begin{align*}
\Pr[M(x)=0 \land \bar{M}(x)=0 \mid x\in L (x\not\in \bar{L})] &\leq \frac{1}{3} \cdot 1
 \\
\Pr[M(x)=0 \land \bar{M}(x)=0 \mid x\not\in L (x\in \bar{L})] &\leq \frac{1}{3} \cdot 1
\end{align*}
$$
Dohromady tedy
$$
\Pr[M(x)=0 \land \bar{M}(x)=0] \leq \frac{1}{3}.
$$
Očekávaný počet kol než $\tilde{M}$ zastaví je $\leq \sum_{i} i \left( \frac{1}{3} \right)^{i-1} = const$ a každé spuštění $M,\bar{M}$ trvá $p'(|x|)$ a tedy očekávaná časová složitost $\tilde{M}$ je $const \cdot p'(|x|) = p(|x|)$. 
## $\mathcal{BPP} \subseteq \mathcal{P}/\text{poly}$
Nechť $L\in \mathcal{BPP}$ libovolný a ukážeme, že $L\in \mathcal{P}/\text{poly}$.

V (\*) vezmeme $d=2$, pak platí
$$
2^{-n^2}= \frac{1}{2^{n^2}} < \frac{1}{2^{n+1}}.
$$
Tedy máme DTS pro $L$ s chybou $\frac{1}{2^{n+1}}$.

Řekneme, že $r\in \{ 0,1 \}^m$ je **dobrý** pro $x$ pokud $M(x,r)=L(x)$ a **špatný** naopak.

Pro pevné $x$ máme $< \frac{2^m}{2^{n+1}}$ špatných $r$ $\implies$ máme $2^n \cdot \frac{2^m}{2^{n+1}} = \frac{1}{2} \cdot 2^m$, takových $r$, která jsou špatná pro nějaké $x$ a tedy $\exists r_{0}$, které je dobré $\forall x$. 

Z věty $\mathcal{P}\subseteq \mathcal{P} / \text{poly}$ (TODO: link) víme, že k DTS $M$ existuje poly-size rodina obvodů $\{ C_{k} \}_{k=1}^\infty$ která $C_{n+m}(x,r)=M(x,r)$. V této rodině obvodů zadrátujeme $r=r_{0}$ vstup napevno.
$$
C_{n+m}(x,r) = C_{n+m}(x,r_{0})= M(x,r_{0}) = L(x) \text{ dobré } r_{0}:\forall x
$$
a tedy příslušná rodina obvodů rozpoznává $L$.
## (Věta Sigson-Gáes) $\mathcal{BPP} \subseteq \Sigma_{2} \cap \Pi_{2}$
Už víme $\mathcal{BPP} = co-\mathcal{BPP}$ a tedy stačí $\mathcal{BPP} \subseteq \Sigma_{2}$. V \* vezmeme $d=1$, takže chyba je $<\frac{1}{2^n}$. 

$L\in\mathcal{BPP}\implies$ platí (díky \* s $d=1$) 
- $x\in L\iff \Pr[M(x,r)\text{ přijímá}]\geq{1}-\frac{1}{2^{n}}$
- $x\not\in L\iff \Pr[M(x,r)\text{ přijímá}]<\frac{1}{2^{n}}$

Značení: 
- $\forall x\in \{ 0,1 \}^n:S_{x}=\{ r\in \{ 0,1 \}^m\mid M(x,r)\text{ přijímá} \}$,
- Pro $r,u\in \{ 0,1 \}^m:r+u= r XOR u$.
- Pro $S\subseteq \{ 0,1 \}^m: S+{u}=\{ r+u\mid r\in S \}$
- Zvolíme $k:= \left\lceil  \frac{m}{n}+1  \right\rceil$

Platí 
- $x\in L \implies |S_{x}|\geq (1-\frac{1}{2^n}) 2^m$,
- $x\in L \implies |S_{x}|< \frac{1}{2^n} 2^m$

*Myšlenka důkazu:* TODO OBRÁZEK

#### Lemma 1: Nechť $S\subseteq \{ 0,1 \}^m$ taková, že $|S|<2^{m-n}$ a nechť $u_{1},\dots,u_{k}\in \{ 0,1 \}^m$. Pak $\bigcup_{i=1}^k (S+u_{i})\subsetneqq \{ 0,1 \}^m$.
*Důkaz Lemma 1:* $\forall i: |S+u_{i}|=|S|\implies$ 
$$
|\bigcup_{i=0}^k(S+u_{i})| \leq k|S| < \left( \left\lceil  \frac{m}{n}  \right\rceil +1  \right) \frac{1}{2^n} 2^m
$$
kde poslední $<$ $\forall n\geq n_{0}$ platí pro vhodně zvolené $n_{0}$.

Lze uvažovat, že $L=L_{1}\cup L_{2}$, kde $L_{1}=\{ x\in L \mid |x| \le u_{0} \}$. Jistě $L_{1}\in \mathcal{P} \subseteq\Sigma_{2}$ a tím pádem $L\in \Sigma_{2}\iff L_{2}\in \Sigma_{2}$. Tedy lemma platí pro jazyk $L_{2}$. 

#### Lemma 2: Nechť $S \subseteq \{ 0,1 \}^m$ takové, že $|S|\geq (1-\frac{1}{2^n}) 2^m$. Pak existují $u_{1},\dots,u_{k}\in \{ 0,1 \}^m$ takové, že $\bigcup_{i=1}^k (S+u_{i})=\{ 0,1 \}^m$.
*Důkaz:* Stačí ukázat, že při náhodném výběru $u_{1},\dots,u_{k}$ platí, že
$$
\Pr[\bigcup_{i=1}^k (S+u_{i})=\{ 0,1 \}^m]>0 \iff \Pr[\bigcup_{i=1}^k (S+u_{i})=\{ 0,1 \}^m]<1
$$
a to je vlastně ekvivalentní
$$
\Pr[\exists r\in \{ 0,1 \}^m: r\not\in \bigcup_{i=1}^k (S+u_{i})]<1.
$$
Definujme $r$ je **špatné** pro $i\iff r\not\in S+u_{i}\iff r+u_{i}\not\in S$. Protože
$$
a (XOR)b=c \iff a=b(XOR)c.
$$

Pokud $u_1,\dots,u_k$ vybrány náhodně uniformně, tak také $r+u_{i},\dots,r+u_{k}$ mají náhodnou uniformní distribuci v $\{ 0,1 \}^m$. 

Pro pevné $r\in \{ 0,1 \}^m$ libovolně zvolené:
$$
\Pr[r+u_{i}\in S] \geq 1-\frac{1}{2^n} \implies \Pr[r \text{ špatné pro }i]< \frac{1}{2^n}
$$
- $\implies \Pr[r \text{je špatnépro všechna }i]< \left( \frac{1}{2^n} \right)^k=2^{-nk}$
- $\implies$ $\Pr[\exists r: r \text{ je špatné } \forall i]< 2^m \cdot 2^{-nk}$

Poslední bod je ekvivalentní s $\Pr[\exists r\in \{ 0,1 \}^m: r\not\in \bigcup_{i=1}^k (S+u_{i})]<1.$ a potřebujeme, aby $2^m \cdot 2^{-nk}\leq 1$ pro důkaz a to vychází pro naši volbu $k$, protože
$$
n\left( \left\lceil  \frac{m}{n}  \right\rceil  +1\right)\ge \left( n\left( \frac{m}{n}+1 \right) \right)= m+\frac{1}{n} \geq m \implies 2^m2^{-nk}\leq 2^{m}2^{-m} =1.
$$

Důkaz Věty: Lemma 1+2 implikují
$$
x\in L \iff \exists u_{1},\dots,u_{k}\in \{ 0,1 \}^m \forall r\in \{ 0,1 \}^m:r\in \bigcup_{i=1}^k (S_{x} +u_{i})
$$
zleva doprava 1. a obráceně lemma 2.

Můžeme přepsat
$$
x\in L \iff \exists u_{1},\dots,u_{k}\in \{ 0,1 \}^m \forall r\in \{ 0,1 \}^m: \underbrace{\bigvee_{i=1}^k (M(x,r+u_{i})\text{ přijímá})}_{\text{predikát v }\mathcal{P}}.
$$
"Vezmeme-li libovolné $r$, tak ho máme pokrytý." 

a tedy poly velký predikát a tedy $L\in \Sigma_{2}$.


---
$L\in \mathcal{BPP}\implies \forall d \exists$PTS $M$: 
- $\Pr[L(x) = M(x)]\ge 1- 2^{-|x|^d}$
- $\Pr[L(x)\ne M(x)]<2^{|x|^d}$

\* $\iff \forall d\exists$ DTS $M \Pr[L(x)\ne M(x,r)] < 2^{|x|^d}$, kde $r$ je řetězec náhodných bitů délky $m=poly(n), |x|=n$. 