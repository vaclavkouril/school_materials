# Obvody konstantní hloubky

Zdrojové stránky: ![[page-08.png]], ![[page-09.png]], ![[page-10.png]], ![[page-11.png]]

## Třída $AC^0$

$AC^0$ jsou booleovské obvody:

- konstantní hloubky $O(1)$,
- polynomiální velikosti,
- s hradly $\wedge,\vee,\neg$,
- AND a OR mají neomezený fan-in.

Příklady úloh, které lze dělat v $AC^0$:

- jednoduché lokální testy,
- rozhodnutí, zda existuje jednička,
- rozhodnutí, zda všechny bity splňují vlastnost,
- přibližné počítání ve smyslu velké mezery.

Poznámky uvádějí, že $AC^0$ umí rozhodnout například prahové úlohy s velkou mezerou:

$$
\sum_i x_i\leq \frac14 n
$$

oproti

$$
\sum_i x_i\geq \frac34 n.
$$

Neumí ale paritu:

$$
\sum_i x_i\bmod 2.
$$

## Třída $AC^0[p]$

$AC^0[p]$ je rozšíření $AC^0$ o hradla $MOD_p$.

Hradlo $MOD_p$ testuje hodnotu součtu vstupů modulo $p$. V poznámkách se používá varianta, která vrací $1$, když součet není $0$ modulo $p$, případně ekvivalentní negovaná varianta.

Razborov-Smolenskyho výsledek říká, že pro různá prvočísla $p,q$ nelze $MOD_q$ počítat v $AC^0[p]$.

Speciálně:

$$
PARITY=MOD_2\notin AC^0.
$$

## Přístup přes polynomy

Hlavní metoda pro dolní odhad:

1. Každý malý konstantně hluboký obvod v $AC^0[p]$ lze aproximovat nízkostupňovým polynomem nad $GF[p]$.
2. Funkce $MOD_q$ pro $q\neq p$ takovým polynomem aproximovat nejde.

To dá spor a tedy dolní mez.
