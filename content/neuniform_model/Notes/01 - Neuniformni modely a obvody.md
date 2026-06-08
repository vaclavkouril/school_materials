# Neuniformní modely a obvody

Zdrojové stránky: ![[../Assets/pages/page-01.png]], ![[../Assets/pages/page-02.png]], ![[../Assets/pages/page-03.png]], ![[../Assets/pages/page-04.png]]

## Výpočetní složitost

- $2/0$ zk.
- zkouší se z probrané látky
- letní přednáška: strukturální složitost
  - od příštího roku strukturní složitost + výpočetní složitost algoritmů v létě

Výpočetní složitost:

- kolik kroků je potřeba k nalezení řešení problému,
- kolik prostoru, nákladovost, ...

Význam mimo informatiku:

- algoritmické procesy,
- fyzika, biologie, ekonomie, ...

Tato semestr: neuniformní výpočetní modely.

Výpočetní problém:

$$
f : \{0,1\}^{*} \to U
$$

kde vlevo je vstup a vpravo výstup.

Příklady oborů hodnot:

$$
U = \{0,1\}
$$

booleovské funkce, rozhodovací problém.

$$
U = \mathbb{Z}, \mathbb{Q}
$$

obecně číselná funkce, optimalizace, nejkratší cesta, ...

$$
U = \{0,1\}^{*}
$$

Částečná funkce: promise problems, gap problems, ...

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

Formule je strom s hradly. Příklad výpočtu:

$$
f(x_1,x_2,x_3)=\cdots
$$

Posloupnost formulí:

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
- ...

Zajímá nás velikost, hloubka, šířka, obvody, funkce. Jde o různé veličiny vstupu.

## Tvrzení: každá funkce má obvod s binárními hradly

Tvrzení:

$$
\forall f_n : \{0,1\}^{n} \to \{0,1\}
$$

existuje obvod s binárními hradly `AND`, `OR` a unárními `NOT` velikosti asi $10n2^n$, který počítá $f_n$.

Odhad lze zlepšit na

$$
O\left(\frac{2^n}{n}\right).
$$

Důkaz: obvod implementuje DNF nebo CNF formuli pro $f_n$.

Pro každý vstup $x \in \{0,1\}^{n}$, kde $f(x)=1$, vezmeme konjunkci literálů odpovídající tomuto vstupu. Všechny tyto konjunkce spojíme pomocí OR.

Tedy existuje $\leq 2^n$ takových členů a hloubku lze vyvážit na $O(n)$ nebo $O(\log n)$ podle tvaru stromu.

## Dolní odhad počtem argumentů

Důkaz počítáním argumentů:

- existuje $2^{2^n}$ různých funkcí $f_n : \{0,1\}^{n} \to \{0,1\}$,
- počet obvodů velikosti $s$ lze shora omezit přibližně

$$
\leq s^{2s}(n+3)^s.
$$

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

Důkaz: tabulka výpočtu stroje. Každé políčko závisí pouze na třech předcházejících. Pro čas $n^k$ vznikne obvod velikosti zhruba

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
f \in P + \overline{x}, \qquad |C_n| \geq 5n
$$

pro některé explicitní funkce.

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

1. seřadíme všechna slova délky $n$: $a_1,a_2,\dots,a_{2^n}$,
2. vezmeme množinu obvodů velikosti $
leq n^k+k$,
3. postupně vylučujeme obvody, které se neshodují s konstruovanou funkcí,
4. pokud $x=a_j$, vypíšeme opačnou hodnotu než daný obvod.

Závěr: algoritmus $A$ je sice v $EXP$, ale žádná rodina obvodů velikosti $
leq n^k+k$ jej nemůže počítat.
