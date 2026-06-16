# $\Sigma_{i}-SAT$
*Definice:* 
- $\Sigma_{n}-SAT: \exists u_{1},\forall u_{2},\dots,Qu_n: \varphi(u_{1},\dots,u_{n})=1,$ kde $\varphi$ je CNF
- $\Pi_{n}-SAT:u_{1},\forall u_{1}, \exists u_{2}\dots,Q'u_n: \varphi(u_{1},\dots,u_{n})=1$
- $\forall i: u_{i}$ je vektor bool proměnných a $Q = \exists$ pro $i$ sudé a $Q=\forall$ pro $i$ liché a $Q'$ opačně

## $\Sigma_{k}-SAT$ je úplný pro $\Sigma_{k}$ a $\Pi_{k}-SAT$ je úplný pro $\Pi_{i}, \forall i\geq{1}.$
*Důkaz:* Nechť $L \in \Sigma_{i}$ libovolný $\implies \exists$ polynom $p$ a $L'\in P$:
$$
x \in L \iff \exists^{p(|x|)}y_{1}, \forall^{p(|x|)} y_{2},\dots,Q^{p(|x|)}y_{n}: \left\langle x,y_{1},\dots,y_{n} \right\rangle \in L'
$$
A $L'$ má DTS $M$, který ho rozhoduje v poly-čase. Takový výpočet lze zakódovat do CNF formule $\varphi_{M}$ přijímající stejné vstupy. Tedy
$$
x \in L \iff \exists^{p(|x|)}u_{1}, \forall^{p(|x|)} u_{2},\dots,Q^{p(|x|)}u_{n} \varphi_{M}(x,u_{1},\dots,u_{n}) = 1
$$
to je přesně charakterizace $\Sigma_{k}-SAT$.

Důkaz je totožný pro $\Pi_{k}$.

---
# $\mathcal{P}$-úplnost
*Definice:* $E$ je $\mathcal{P}$-úplný pokud
1. $E\in \mathcal{P}$,
2. $\forall E'\in \mathcal{P}$ je log-space převoditelný na $E$.

$$
L = LOG = DSPACE(\log n)
$$
## *Věta:* Nechť $X$ je $\mathcal{P}$-úplný a $X\in L$, pak $\mathcal{P}=L$.
$L \subseteq \mathcal{P}$ zjevně, protože simulace polynomiálně mnoha stavů pásky $\log n$ velikosti.

$\mathcal{P} \subseteq L$, mějme $X'\in \mathcal{P}$
1. (úplnost) existuje tedy DTS transducer $M$ (log-space) převádějící $y \in X'$ na vstupy $X$. Zjevně pracuje v poly čase, protože má polynomiálně omezený počet konfigurací.
2. ($X\in L$) existuje DTS akceptor $M'$ (log-space) rozpoznávající $X$.

Vyrobíme si $M''$, který si pamatuje jen jeden znak z výstupu $M$ ($y$) pod pracovní hlavou $M'$. Potřebujeme na to dvě počítadla a sice kolikátý znak $y$ je pod hlavou $M'$ a kolikátý znak $y$ je právě ten co se vygeneroval a ten se buď zahodí a nebo, pokud se počítadla rovnají, tak máme nový znak $y$ pod hlavu $M'$. Vždy, když se $M'$ pohne, tak se vynuluje druhé počítadlo a znovu spustí $M$.

Tedy máme akceptor $M''$ takový, že pracuje v log-prostoru pro $X'\in \mathcal{P}$.

---
# $NL$
$$
NL = NLOG = NSPACE(\log n)
$$
## Pokud $\exists X$, který $X\in co-NL$ a $X$ je $NL$-úplný (log-space převod) $\implies NL=co-NL$
Důkaz je totožný jako [(A) $L \in co-NP$, (B) $L\in NPÚ \implies co-NP = NP$.](Polynomiální%20hierarchie.md#Úplnost) a použití log-space transducer propojení s akceptorem.