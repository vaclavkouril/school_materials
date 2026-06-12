# $ACC^0$ vs $CC^0$

Zdrojové stránky: ![[page-12.png]], ![[page-13.png]], ![[page-17.png]], ![[page-18.png]]

## $AC^0$

$AC^0$:

- konstantní hloubka,
- polynomiální velikost,
- hradla $\wedge,\vee,\neg$,
- neomezený fan-in pro $\wedge,\vee$.

## $ACC^0$

$ACC^0$ je rozšíření $AC^0$ o modulo hradla.

Poznámky používají zápis

$$
ACC^0=\bigcup_{m\geq 1}AC^0[m].
$$

Třída $AC^0[m]$ dovoluje hradla $MOD_m$ vedle booleovských hradel.

Intuice:

- $AC^0$ neumí paritu,
- $AC^0[2]$ ji umí díky hradlu $MOD_2$,
- $ACC^0$ dovoluje pevný modul $m$.

## $CC^0$

$CC^0$ je counting-circuit třída, kde výpočet stojí hlavně na modulo/counting hradlech. Přesná definice se liší podle zdroje, ale v poznámkách je důležitá intuice:

- $ACC^0$ = konstantní hloubka + booleovská hradla + pevná modulo hradla,
- $CC^0$ = konstantní hloubka založená na counting/modulo hradlech.

V části o branching programech je důležité, že funkce typu

$$
\sum_i x_i \bmod p
$$

lze počítat branching programem konstantní šířky $p$.

To vysvětluje, proč modulo hradla přirozeně souvisejí s výpočty konstantní šířky.

## Symetrické funkce

Symetrická funkce závisí pouze na počtu jedniček na vstupu, ne na jejich rozmístění.

Funkce

$$
f:\\{0,1\\}^m\to\\{0,1\\}
$$

je symetrická, pokud existuje

$$
g:\\{0,1,\dots,m\\}\to\\{0,1\\}
$$

takové, že

$$
f(x)=g(|x|).
$$

Obecných booleovských funkcí na $m$ bitech je

$$
2^{2^m},
$$

protože volíme hodnotu pro každý z $2^m$ vstupů.

Symetrických funkcí je jen

$$
2^{m+1},
$$

protože volíme hodnoty pouze pro váhy

$$
0,1,\dots,m.
$$

Asymptoticky se píše zhruba $2^m$.
