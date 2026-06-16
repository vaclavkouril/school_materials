# Barringtonova věta

Zdrojové stránky: ![[page-24.png]], ![[page-25.png]], ![[page-26.png]], ![[page-27.png]]

## Věta

Barringtonova věta říká, že booleovské formule logaritmické hloubky lze počítat branching programy konstantní šířky.

Poznámky uvádějí:

$$
\text{formuli hloubky }d\text{ lze počítat branching programem délky }\leq 4^d
$$

a konstantní šířky, v klasické verzi šířky $5$.

Důsledek:

$$
NC^1
$$

souvisí s branching programy konstantní šířky a polynomiální délky, protože pro $d=O(\log n)$ je

$$
4^d=poly(n).
$$

## Idea přes registrový model nad $GF[2]$

Poznámky nejprve dokazují obecnější tvrzení Ben-Or-Cleve pro aritmetické formule se třemi registry.

Nad

$$
GF[2]
$$

lze booleovská hradla vyjádřit aritmeticky:

$$
\neg x = 1+x,
$$

$$
x\wedge y=xy,
$$

$$
x\vee y=x+y+xy.
$$

Proto booleovskou formuli lze převést na aritmetickou formuli nad $GF[2]$, přičemž hloubka se zvětší jen konstantně.

Registrový program se třemi registry nad $GF[2]$ má jen

$$
2^3=8
$$

možných konfigurací. Každá instrukce odpovídá přechodu mezi konfiguracemi, tedy branching programu konstantní šířky.

Tím dostaneme verzi:

$$
\text{formule hloubky }d\Rightarrow \text{BP délky }\leq 4^{O(d)}\text{ a šířky }8.
$$

Klasická Barringtonova věta zlepšuje šířku na $5$.
