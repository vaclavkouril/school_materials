# Převoditelnost
*Definice:* $L_{1}$ je převoditelný na $L_{2}$ v poly-čase, pokud existuje DTS transducer $M$, který pracuje v poly-čase a pro vstup $x$  platí $x\in L_{1} \iff M(x) \in L_{2}$.
- log-prostor je také jedna možnost převoditelnosti místo poly-času

*Definice:* $\mathcal{C}$ je třída jazyků, řekneme, že $L$ je **úplný** pro $\mathcal{C}$ vzhledem k převoditelnosti v poly-čáse (resp. log prostoru) pokud 
1. $L \in \mathcal{C}$
2. $\forall L'\in \mathcal{C}: L'$ je převoditelný na $L$ v poly-čase/log-prostoru

---
# PSPACE
Nechť $L$ je PSPACE úplný, potom $L\in \Sigma_{k} \implies \Sigma_{k}=\Pi_{k}=\mathcal{PH} = PSPACE$.

Protože víme $\Sigma_{k},\Pi_{k}\subseteq \mathcal{PH} \subseteq PSPACE$ tak stačí ukázat, že úplnosti jazyka dává $PSPACE \subseteq \Sigma_{k}$.

*Důkaz:* Nechť $L'\in PSPACE$ libovolný, $\exists M$ DTS, že v poly-čase $x\in L' \iff M(x)\in L$ a $\exists N$ NTS s oracle $A\in \Sigma_{k-1}$, že $L=L(N,A)$ a zřetězíme $M$ a $N$ do $M'$, takže 
$$
L'=L(M',A) \implies L' \in NP(\Sigma_{k-1})=\Sigma_{k}.
$$
Takže pokud $\mathcal{PH}= PSPACE$, tak $\exists k:\Sigma_{k}=PSPACE$.