Mějme značení pro binární strom
- $T(v)$ jako podstrom zakořeněný ve vrcholu $v$, $T(\emptyset) =\emptyset$,
- $s(v)$ značící velikost podstromu (počet vrcholů), $s(\emptyset) =0$,
- $l(v),r(v)$ jsou levý, respektive pravý podstrom uzlu $v$, pokud je prázdný, tak $l(v) = \emptyset$.

*Definice:* O stromu řekneme, že je **perfektně vyvážený** právě tehdy, když $\forall v: |s(l(v)) -s(l(r))| \leq 1$. 

*Definice:* Strom je **vyvážený**, když pro každý vrchol $v$ a jeho následníka $c$ platí $s(c) \leq \frac{2}{3} s(v)$. Potenciálně libovolné $\alpha \in (\frac{1}{2},1)$.

BB\[$\alpha$\]-stromy jsou pro $\frac{1}{2} < \alpha <1$ přesně jako ten vyvážený výše s $\frac{2}{3}$.
#### *Lemma:* Výška vyváženého stromu s $n$ vrcholy je $O(\log n)$.
*Důkaz:* Vezmeme-li libovolnou cestu z kořene $r$ do listu $l$, tak pokud $s(r) = n$, tak každý další vrchol cest má maximálně $\frac{2}{3}$ jeho velikosti podstromu. Poslední je list, který má přirozeně $s(l) =1$. Tedy cesta má maximálně $\log_{2 / 3}\left( \frac{1}{n} \right) = \log_{3 / 2} n = O(\log n)$ hran.
### *Tvrzení:* Amortizovaná časová složitost Insert je $O(\log n)$ ve vyváženém stromě.
Operace $Insert$ přidá nový list a procházíme od kořene a po cestě k novému listu a přidáváme každému vrcholu $1$, pokud by nějaký podstrom měl být nevyvážený, tak najdeme nejvyšší takový $v$ a přestavíme ho celý vyváženě v $O(s(v))$ čase.

*Důkaz:* Definujeme potenciál aby perfektně vyvážené stromy neměli potenciál $1$ pro to kdy se liší o jedna, tak máme
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

---
# Příklad využití
Implementace množin a zobrazení v Haskell-u a jiných funkcionálních jazycích.