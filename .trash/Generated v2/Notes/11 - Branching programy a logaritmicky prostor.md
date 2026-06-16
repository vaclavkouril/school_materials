# Branching programy, vztah k logaritmickému prostoru

Zdrojové stránky: ![[page-23.png]], ![[page-24.png]]

## Definice branching programu

Branching program je orientovaný acyklický graf s:

- jedním počátečním vrcholem `Init`,
- dvěma koncovými vrcholy `ACCEPT`, `REJECT`,
- vnitřními vrcholy označenými proměnnou,
- z každého vnitřního vrcholu vedou dvě hrany označené $0$ a $1$.

Výpočet:

1. začneme v `Init`,
2. ve vrcholu označeném $x_i$ přečteme hodnotu $x_i$,
3. pokračujeme hranou označenou touto hodnotou,
4. skončíme v `ACCEPT` nebo `REJECT`.

Měříme:

- velikost = počet vrcholů,
- délku = délka nejdelší cesty,
- šířku = maximální počet vrcholů v jedné vrstvě.

## Příklady

### Parita

Funkce

$$
x_1\oplus x_2\oplus\cdots\oplus x_n
$$

má branching program šířky $2$ a délky $n$.

Stav reprezentuje aktuální paritu:

- stav $0$ = dosavadní součet sudý,
- stav $1$ = dosavadní součet lichý.

### Součet modulo $p$

Funkce

$$
\sum_i x_i\bmod p
$$

má branching program šířky $p$.

Stav reprezentuje dosavadní zbytek modulo $p$.

## Kombinování branching programů

Pro $f\wedge g$:

- nejdřív spustíme program pro $f$,
- pokud $f$ odmítne, rovnou odmítneme,
- pokud $f$ přijme, pokračujeme programem pro $g$.

Pro $f\vee g$ analogicky.

## Vztah k logaritmickému prostoru

Poznámky uvádějí větu:

$$
f\in L/poly \iff f \text{ je počitatelná branching programy polynomiální velikosti.}
$$

### Směr $L/poly\Rightarrow$ branching programy

Konfigurace logaritmicky prostorového stroje má polynomiálně mnoho možností, protože pracovní páska má $O(\log n)$ bitů.

Pro pevnou délku vstupu $n$ a pevnou radu $g(n)$ vytvoříme graf konfigurací stroje.

- vrcholy = konfigurace,
- hrany = možné přechody podle čteného vstupního bitu,
- přijímající konfigurace vedou do `ACCEPT`, odmítající do `REJECT`.

Tím vznikne branching program polynomiální velikosti.

### Směr branching programy $\Rightarrow L/poly$

Rada obsahuje popis branching programu pro délku $n$.

Log-space algoritmus na vstupu $x$:

- drží index aktuálního vrcholu,
- podle proměnné ve vrcholu přečte odpovídající bit vstupu,
- přejde do dalšího vrcholu.

Index vrcholu potřebuje pouze $O(\log |BP_n|)=O(\log n)$ bitů, pokud má program polynomiální velikost.

Tedy výpočet je v $L/poly$.
