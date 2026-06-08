# Karp-Lipton a polynomiální hierarchie

Zdrojové stránky: ![[../Assets/pages/page-05.png]], ![[../Assets/pages/page-06.png]], ![[../Assets/pages/page-07.png]], ![[../Assets/pages/page-08.png]]

## Karp-Liptonova věta

Věta:

$$
\forall k \; \exists L \in PSPACE \quad L \notin SIZE(n^k,k).
$$

Otázka: Pro kterou významnou třídu lze dokázat podobný výsledek?

Věta (Karp-Lipton):

$$
\forall L \; \exists L \in NP^{NP} \quad \text{t. ž. } L \notin SIZE(n^k,k).
$$

Jiný zápis v poznámkách: je-li $NP \subseteq P/poly$, pak kolabuje polynomiální hierarchie.

## Alternující Turingovy stroje

Alternující Turingovy stroje zobecňují nedeterminismus.

Strom možností výpočtu na daném vstupu $x$:

- konfigurační vrchol typu $\exists$ je přijímající, pokud alespoň jeden následník přijímá,
- konfigurační vrchol typu $\forall$ je přijímající, pokud všichni následníci přijímají.

Tento popis dává přirozené vrstvení tříd:

- $NP$ - na začátku existenciální větev,
- $coNP$ - univerzální větev,
- $NP^{NP}$ - střídání kvantifikátorů s polynomiální hloubkou.

## Oracle

Oracle pro jazyk $A \subseteq \{0,1\}^{*}$:

- zvláštní páska pro $A$,
- dotazy $u \in A$ se vyřizují v jednom kroku.

Třídy:

$$
NP^A
$$

je nedeterministický výpočet v poly-čase s orákulem $A$.

$$
P^A
$$

je deterministický výpočet v poly-čase s orákulem $A$.

## Úplné problémy pro úrovně hierarchie

Definice:

$$
\Sigma_k^p\text{-SAT}=\{\varphi; \varphi \text{ je pravdivá } \Sigma_k\text{-SAT formule}\}.
$$

Příklad:

$$
\Sigma_3^p\text{-SAT}:
\exists x_1,\\dots,x_n\; \forall y_1,\dots,y_n\; \exists z_1,\dots,z_n\; \varphi(x,y,z).
$$

$\Sigma_k^p$-SAT je jazyk s alternujícími kvantifikátorovými bloky.

Poznámky:

- $\Sigma_3^p$-SAT je úplný pro $NP^{NP^{NP}}$.
- $\Sigma_1^p = NP$.
- $\Pi_1^p = coNP$.
- $PH = \bigcup_k \Sigma_k^p$ je polynomiální hierarchie.
- $PH \subseteq PSPACE$.

## Karp-Liptonův důkazový náčrt

Uvažujme jazyk

$$
S = \{ a01^n01^m ; a \text{ je počáteční úsek pravdivostní tabulky funkce } f : \{0,1\}^n \to \{0,1\},
$$

která je počitatelná obvody velikosti $m \}$.

Tento jazyk je v $NP$:

- pro vstup $x = a01^n01^m$ uhádneme obvod velikosti $
leq m$,
- ověříme, že $a$ odpovídá první části tabulky.

Idea pro jazyk $L$:

Na vstupu $x$, $|x|=n$, uhádneme prefix $a \in \{0,1\}^{n^{2k}+k}$ takový, že:

- $a$ není počitatelný obvodem velikosti $n^k+k$,
- $a01^n01^m \notin S$,
- pokud $x$ je $j$-tý řetězec, $j<|a|$, přijmi podle $a_j$,
- jinak odmítni.

Problém: $a$ volíme jednoznačně, algoritmus může přijímat všechno.

Řešení: definujeme jazyk $S'$ tak, že buď platí $a01^n01^m \in S$, nebo existuje lexikograficky menší $a'<a$ splňující odpovídající vlastnost.

Tím získáme $S' \in NP^{NP}$ a použitím předchozího algoritmu dostaneme oddělení.

## Důkaz větou a kolaps hierarchie

Věta:

$$
\forall k\geq 0 \; \exists L \in NP^{NP} \quad \text{t. ž. } L \notin SIZE(n^k+k).
$$

Důkaz má dvě možnosti:

1. $NP \nsubseteq PSIZE = \bigcup_{k>0} SIZE(n^k+k)$; pak závěr plyne automaticky.
2. $NP \subseteq PSIZE$; pak

$$
NP^{NP} \subseteq NP^{NP^{NP}} \subseteq NP^{NP}
$$

a dojde ke kolapsu úrovní hierarchie.

V důkazu se používá, že pokud booleovská formule $\varphi(x_1,\dots,x_n)$ je splnitelná, pak

$$
\varphi(x_1,\dots,x_{n-1},0) \quad \text{nebo} \quad \varphi(x_1,\dots,x_{n-1},1)
$$

je splnitelná.

Tedy existují obvody $C_1,C_2,\dots,C_k$, které pomáhají řešit SAT: umí určit, zda formule zůstává splnitelná po dosazení proměnné.

Pro formuli velikosti $
leq n$ lze určit splnitelnost pomocí obvodů $C_{\varphi}$.

Pokud formule nemá žádné proměnné, zhodnotí se přímo.

Toto je $coNP$ test. Schéma převádí úroveň $\Sigma_3$ na nižší úroveň.

## AC0 obvody

$AC^0$ obvody:

- konstantní hloubka $O(1)$,
- polynomiální velikost,
- hradla $\wedge, \vee, \neg$ s neomezeným fan-inem.

Příklady úloh:

- sečíst dvě čísla v binárním zápisu,
- spočítat počet jedniček, pokud je jich nejvýše $\log n$,
- rozhodnout, zda

$$
\sum x_i \leq \log n,
$$

- rozhodnout, zda

$$
\sum x_i \geq \frac34 n \quad \text{nebo} \quad \sum x_i \leq \frac14 n.
$$

Neumí: spočítat paritu vstupu $b$:

$$
\sum_i x_i \bmod 2.
$$
