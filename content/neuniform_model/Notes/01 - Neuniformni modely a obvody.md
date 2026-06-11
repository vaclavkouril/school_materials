# Neuniformní modely a obvody
## Uniformní a neuniformní algoritmus
Uniformní algoritmus $A$ pro $f$:
$$
x \in \{0,1\}^{*} \mapsto A(x) = f(x).
$$
Neuniformní algoritmus pro $f$:

$$
f = \{f_n\}_{n \geq 0}, \qquad f_n : \{0,1\}^{n} \to \{0,1\}, \qquad f_n = f|_{\{0,1\}^{n}}.
$$

$$
A = \{A_n\}_{n \geq 0}, \qquad A_n \text{ počítá } f_n.
$$
Příklad:
1. $A_n$ má v sobě tabulku $f_n$.
2. $A_n$ má v sobě pravidlo pro načítání dat velikosti $n$.
3. $A_n$ používá již postup na vstup zadané/cílové délky.
## Neuniformní modely

### Booleovská formule
Formule je strom s hradly. Posloupnost formulí:
$$
\{\Phi_n\}_{n \geq 0}, \qquad \Phi_n \text{ počítá } f_n.
$$
### Booleovské obvody
Booleovský obvod je obecně DAG s hradly. Měříme hloubku. Posloupnost obvodů:
$$
\{C_n\}_{n \geq 0}, \qquad C_n \text{ počítá } f_n.
$$
### Další neuniformní modely
- branching programy,
- aritmetické výrazy,
- polynomy,

Zajímá nás velikost, hloubka, šířka, obvody, funkce. Jde o různé veličiny vstupu.

---
## Tvrzení: každá funkce má obvod s binárními hradly
Tvrzení:
$$
\forall f_n : \{0,1\}^{n} \to \{0,1\}
$$
existuje obvod s binárními hradly `AND`, `OR` a unárními `NOT` velikosti asi $10n2^n$, který počítá $f_n$.

Odhad lze zlepšit na $O\left(\frac{2^n}{n}\right)$.

Důkaz: obvod implementuje DNF nebo CNF formuli pro $f_n$.

Pro každý vstup $x \in \{0,1\}^{n}$, kde $f(x)=1$, vezmeme konjunkci literálů odpovídající tomuto vstupu. Všechny tyto konjunkce spojíme pomocí OR.

Jeden takový člen pro ohodnocení $a$ stojí nejvýše $n$ `NOT` hradel a $n-1$ hradel `AND` (na propojení $n$ listnatého podstromu) a tedy člen stojí $2n$.

Tedy existuje $\leq 2^n$ takových členů (počet modelů) a ty se musí stromem nejvýše $2^n -1$ vnitřních `OR` propojit.

## Dolní odhad počtem argumentů
Důkaz počítáním argumentů:
- existuje $2^{2^n}$ různých funkcí $f_n : \{0,1\}^{n} \to \{0,1\}$,
- počet obvodů velikosti $s$ lze shora omezit přibližně
$$
\leq s^{2s}(n+3)^s.
$$
protože máme nejvýše $s$ uzlů, každý má nejvýše 2 vstupy a každý z uzlů je připojen k nějakému z ostatních
- $s^2$ možností odkud se vezmou dva vstupy
- celkem je uzlů $s \implies s^{2s}$ možností propojení uzlů
- jako labely máme $n$ vstupních proměnných a $3$ (`AND`, `OR`, `NOT`) možností pro jeden uzel
- dohromady tedy $s^{2s}(n+3)^s$

Tedy pro
$$
s = \frac{2^n}{10n}
$$
je počet obvodů velikosti $s$ menší než počet funkcí. Proto většina funkcí potřebuje exponenciálně velké obvody.
## Polynomiální velikost obvodů
Závěr:

$$
\forall f : \{0,1\}^{*} \to \{0,1\}
$$
existuje posloupnost obvodů $\{C_n\}_{n \geq 0}$ velikosti
$$
C_n \leq \varphi\left(\frac{2^n}{n}\right).
$$
Otázka:
$$
f \in NP \Rightarrow f \text{ má posloupnost obvodů polynomiální velikosti?}
$$
Poznámka: SAT nemá známou polynomiální velikost obvodů.

Věta:
$$
f \in P \Rightarrow f \text{ má posloupnost velkých/polynomiálních obvodů.}
$$
Důkaz (zadrátování Kachlíkování): tabulka výpočtu stroje. Každé políčko závisí pouze na třech předcházejících. Pro čas $n^k$ vznikne obvod velikosti zhruba
$$
O(n^{2k}).
$$
Důsledek:
$$
NP \text{ nemá polynomiální veliké obvody } \Rightarrow P \neq NP.
$$
## Kolmogorovský nejlepší odhad
Domněnka: funkce v $P$ mají i lineárně velké obvody.

Nejlepší známý odhad:
$$
f \in P \qquad |C_n| \geq 5n
$$
---
## $P/poly$

Třída $P/poly$: jazyk řešitelný polynomiálním algoritmem s radící funkcí.

Radící funkce:
$$
g : \mathbb{N} \to \{0,1\}^{*}.
$$
Máme:
- algoritmus $A$,
- radící funkci $g$,
- při výpočtu na vstupu velikosti $n$ dostaneme zdarma $g(n)$,
- algoritmus běží na dvojici $(x,g(|x|))$.

Měřena je délka $|g(n)|$.

Funkce je v $P/poly$, pokud existuje algoritmus pracující v poly-čase s radou $g$, kde
$$
|g(n)| \leq n^k
$$
pro nějaké konstantní $k$.

Věta:
$$
\forall f \qquad f \in P/poly \iff f \text{ má obvody polynomiální velikosti.}
$$
Důkaz:
- „$\Leftarrow$“: $g(n)$ je popis obvodu $C_n$, algoritmus vyhodnotí $C_n$ na daném vstupu.
- „$\Rightarrow$“: $g(n)$ zadrátujeme do obvodu simulujícího výpočet $A$.

Věta:
$$
\forall k \; \exists L \in EXP \quad L \notin SIZE(n^k,k)
$$
nebo obecně jazyk mimo danou velikost obvodů.

Důkazový algoritmus pro $L$ na vstupu $x$ délky $n$:
1. seřadíme všechna slova délky $n$: $a_1=0^n,a_2=0^{n-1}1,\dots,a_{2^n}=1^n$,
2. vezmeme $C_{0} = \{ \text{obvody vel.} \leq n^k+k\}$,
3. $i:=0$
4. Opakujeme dokud $C_{i}\neq \emptyset$:
	1. Pokud většina obvodů $C_{i}$ dává na $a_{i}$ výstup $0$, tak definujeme $t_{i}:=1$ jinak $t_{i}:=0$.
	2. $C_{i+1}= \{ C\in C_{i}; C(a_{i}) =t_{i} \}$
	3. $i:=i+1$
5. pokud $x=a_j$, kde $j<i$ výstup je $t_{j}$, jinak je výstup $0$ 

Algoritmus $A$ je sice v $EXP$, je v $DTIME(2^{n^{2k}})$, ale žádná rodina obvodů velikosti $\leq n^k+k$ nepočítá stejnou funkci jako $A$.

V každé iteraci se zbavíme shodnosti s $\geq \frac{1}{2}$ obvodů a máme $s=(s^2(n+3))^s$ obvodů velikosti $s:= n^k +k$ tedy máme iterací celkem
$$
\begin{split}
\log |C_{0}| \leq 2s \log s + s \log (n+3) \\ \leq (n^k+k)2 \log (n^k+k) + (n^k+k) \log (n+3) \\ 
\leq O(n^k \log n) \leq n^{2k}
\end{split}
$$
a tedy proběhne $n^{2k}$ iterací a dostaneme se na $0$ obvodů. Tedy se každý z obvodů liší od naší funkce. Tedy $C(a_{j})\ne t_{j}$ a tedy funkce má přesně $f_{n}(a_{j})=t_{j}$ a zjevně ji žádný z obvodů nespočítá.

Jazyk $L$ je složen z těchto funkcí.

---
Věta:
$$
\forall k \; \exists L \in PSPACE \quad L \notin SIZE(n^k,k).
$$
Důkaz je totožný s důkazem pro $EXP$.