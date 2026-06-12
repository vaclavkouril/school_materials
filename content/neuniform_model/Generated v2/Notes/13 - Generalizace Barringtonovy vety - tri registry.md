# Generalizace Barringtonovy věty: aritmetická formule se třemi registry

Zdrojové stránky: ![[page-25.png]], ![[page-26.png]], ![[page-27.png]], ![[page-28.png]]

## Okruhy a formule

Uvažujeme strukturu

$$
(R,+,\cdot).
$$

Nemusí jít nutně o těleso. Příklady:

$$
\mathbb{C},\ \mathbb{R},\ \mathbb{Z},\ \mathbb{Z}_n,\ GF[p].
$$

Aritmetická formule je strom s operacemi $+$ a $\cdot$.

## Registrový model

Máme pracovní registry

$$
r_1,r_2,r_3
$$

a vstupní proměnné

$$
x_1,\dots,x_n.
$$

Instrukce mohou mít tvar například

$$
r_i\leftarrow r_j\pm r_k,
$$

$$
r_i\leftarrow r_j\cdot r_k.
$$

Poznámky přecházejí k instrukcím vhodným pro důkaz:

$$
r_i\leftarrow r_i\pm r_jx_k
$$

nebo

$$
r_i\leftarrow r_i\pm x_k.
$$

## Věta Ben-Or-Cleve

Formuli hloubky $d$ nad okruhem $R$ lze vyhodnotit registrovým programem délky

$$
\leq 4^d
$$

se třemi registry.

## Cíl konstrukce

Pro formuli $f(x_1,\dots,x_n)$ chceme sestrojit program, který provede transformaci

$$
r_1\leftarrow r_1+r_2 f(x_1,\dots,x_n),
$$

případně opačnou transformaci

$$
r_1\leftarrow r_1-r_2 f(x_1,\dots,x_n).
$$

Když na začátku nastavíme

$$
r_1=0,\qquad r_2=1,
$$

pak na konci získáme

$$
r_1=f(x_1,\dots,x_n).
$$

## Indukce podle formule

### Proměnná

Pokud

$$
f=x_i,
$$

stačí instrukce

$$
r_1\leftarrow r_1+r_2x_i.
$$

### Součet

Pokud

$$
f=g+h,
$$

spustíme nejdřív program pro $g$ a potom program pro $h$:

$$
r_1\leftarrow r_1+r_2g(x),
$$

$$
r_1\leftarrow r_1+r_2h(x).
$$

Celkový efekt je

$$
r_1\leftarrow r_1+r_2(g(x)+h(x)).
$$

### Součin

Pokud

$$
f=g\cdot h,
$$

použije se pomocný registr $r_3$.

Schéma z poznámek:

1. přidej do $r_3$ hodnotu $r_2g(x)$,

$$
r_3\leftarrow r_3+r_2g(x),
$$

2. použij $r_3$ jako koeficient pro $h$:

$$
r_1\leftarrow r_1+r_3h(x),
$$

3. odstraň pomocnou hodnotu z $r_3$:

$$
r_3\leftarrow r_3-r_2g(x),
$$

4. korekční krok zajišťuje, že pomocný registr je obnoven a čistý.

Poznámkový tvar:

$$
r_3\leftarrow r_3+r_2g(x),
$$

$$
r_1\leftarrow r_1+r_3h(x),
$$

$$
r_3\leftarrow r_3-r_2g(x),
$$

$$
r_1\leftarrow r_1-r_3h(x).
$$

Výsledkem je transformace odpovídající $r_2g(x)h(x)$ a registry se vrátí do potřebného stavu.

Délka se v násobení zvětší faktorem nejvýše $4$, proto pro hloubku $d$ vyjde

$$
4^d.
$$

## Vztah k Barringtonově větě

Nad $GF[2]$ má trojice registrů jen $8$ stavů. Registrový program lze chápat jako branching program šířky $8$.

To dává důkaz slabší verze Barringtonovy věty. Klasická věta má šířku $5$.
