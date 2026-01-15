# Random Access Machine
Uvažujme výpočetní model RAM:
- **Paměť** je nekonečné pole adresované $\mathbb{Z}$
- **Program** je posloupnosti instrukcí (aritmetika, logika, if then else, goto)
- Uvažujeme **word-RAM**, kde každá operace trvá $O(1)$ času a pracujeme jen s polynomiálně velkými čísly, tedy s $k \cdot \log n$ bity, pro nějakou konstantu $k$ a vstup $x$, kde $n:= |x|$.

---
# Potenciály
Máme-li binární čítač jeho increment je jednoduchý, zprava doleva měníme $1$ za $0$ a až najdeme nepravější $0$ tak ji vyměníme za $1$, to může pro délku $\ell$ čítače trvat až $O(\ell)$ času, ale to se neděje tak často, protože pokud sledujeme $i$-tý bit čítače pro $n$ inkrementů, tak ten se změní jen každou $2^{i-1}$-tou operaci.
#### *Tvrzení:* Provedení $n$ operací Inkrement trvá $O(n+\ell)$ času, kde $\ell$ je počtu bitů počítadla.
*Důkaz:* 
$$
\sum_{i=1}^{\ell} \left\lceil   \frac{n}{2^{i-1}}  \right\rceil \leq  
\sum_{i=1}^{\ell} \frac{n}{2^{i-1}} +1 = n \cdot \sum_{i=1}^{\ell} \frac{1}{2^{i-1}} + \ell \leq n \cdot \sum_{i=1}^{\infty} \frac{1}{2^{i}} + \ell \leq 2n +\ell
$$
## Potenciálová metoda
*Definice:* Potenciál je $\phi$ funkce přiřazující stavu datové struktury hodnotu.
- Typicky je to hodnota nezáporná.
- $\phi_{i}$ označuje potenciál po provedení $i$ operací.

*Definice:* $O_i$ ($i$-tá operace) má amortizovanou složitost $A_{i}$, pokud existuje potenciál $\phi$ takový, že skutečná cena (zdroje vydané na této konkrétní operaci RAM-em) operace $C_{i}$ splňuje
$$
C_{i} + \phi_{i}- \phi_{i-1} \leq A_{i} \qquad \sum A_{i} \geq \sum C_{i}.
$$
- Drahou operací potenciál musí klesnout
- Každá operace zvedne potenciál jen omezeně
- Potřebuje aby $\phi_{0} \leq \phi_{m}$, protože
$$
\sum^n_{i=1} A_{i} = \sum^n_{i=1} C_{i} + (\phi_{i} - \phi_{i-1}) = \sum^n_{i=1} C_{i} + \sum^n_{i=1} \phi_{i} - \sum^{n-1}_{i=0} \phi_{i} = \sum^n_{i=1} C_{i} +\phi_{n} - \phi_{0} \geq \sum^n_{i=1} C_{i}.
$$
Pro příklad s počítadlem je potenciál $\phi(stav) = \#$ souvislých jedniček zprava v počítadle.

---
# Lokální přestavění vyvažovaných stromů
Mějme značení pro binární strom
- $T(v)$ jako podstrom zakořeněný ve vrcholu $v$, $T(\emptyset) =\emptyset$,
- $s(v)$ značící velikost podstromu (počet vrcholů), $s(\emptyset) =0$,
- $l(v),r(v)$ jsou levý, respektive pravý podstrom uzlu $v$, pokud je prázdný, tak $l(v) = \emptyset$.

*Definice:* O stromu řekneme, že je **perfektně vyvážený** právě tehdy, když $\forall v: |s(l(v)) -s(l(r))| \leq 1$. 

*Definice:* Strom je **vyvážený**, když pro každý vrchol $v$ a jeho následníka $c$ platí $s(c) \leq \frac{2}{3} s(v)$.

#### *Lemma:* Výška vyváženého stromu s $n$ vrcholy je $O(\log n)$.
*Důkaz:* Vezmeme-li libovolnou cestu z kořene $r$ do listu $l$, tak pokud $s(r) = n$, tak každý další vrchol cest má maximálně $\frac{2}{3}$ jeho velikosti podstromu. Poslední je list, který má přirozeně $s(l) =1$. Tedy cesta má maximálně $\log_{2 / 3}\left( \frac{1}{n} \right) = \log_{3 / 2} n = O(\log n)$ hran.
### *Tvrzení:* Amortizovaná časová složitost Insert je $O(\log n)$ ve vyváženém stromě.
Operace $Insert$ přidá nový list a procházíme od kořene a po cestě k novému listu a přidáváme každému vrcholu $1$, pokud by nějaký podstrom měl být nevyvážený, tak najdeme nejvyšší takový $v$ a přestavíme ho celý vyváženě v $O(s(v))$ čase.

*Důkaz:* Definujeme potenciál a by perfektně vyvážené stromu neměli potenciál $1$ pro to kdy se liší o jedna, tak máme
$$
\phi := \sum_{v} \varphi(v), \text{ kde} \quad \varphi(v) \begin{cases}
|s(l(v)) -s(r(v))| &\text{pokud je rozdíl} \geq 2, \\
0 &\text{jinak}.
\end{cases}
$$
Kvůli definici, tak pokud přidáváme list, tak potenciály vrcholů na cestě do listu z kořene vyrostou zpravidla o $1$, ale vzhledem ke skoku u rozdílů $1$, tak mohou potenciály skočit z $0$ na $2$.

Pokud se nic nepřestavělo, tak přidání listu stálo $O(\log n)$ a to samé stálo přidat potenciály a tedy amortizovaná cena je $O(\log n)$.

Vezměme tedy případ, kdy se aktivuje přestavění v uzlu $v$, pak invariant z definice vyváženosti byl porušen nejen $v$, ale i jejím následníkem $c$ a BÚNO, nechť $c$ je levý. Takže $s(l(v)) > \frac{2}{3} s(v)$ a tedy $s(r(v)) < \frac{1}{3} s(v)$. Příspěvek $v$ je tedy
$$
\varphi(v) > \frac{1}{3} s(v).
$$
Po přestavění se příspěvek $v$ dostane na $0$ stejně jako všechny příspěvky jeho podstromů, ale příspěvky zbytku stromu se nezmění. Potenciál se tedy sníží alespoň o $\frac{1}{3} s(v)$ a reálná cena přestavění je $\Theta(s(v))$, tedy pokud vynásobíme potenciál příslušnou konstantou, tak reálná cena přestavění bude vyrušena změnou potenciálu a tedy nás přestavění nic amortizovaně nestojí.