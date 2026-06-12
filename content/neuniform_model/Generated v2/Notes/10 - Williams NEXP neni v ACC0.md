# Williams: $NEXP$ není v $ACC^0$

Zdrojové stránky: ![[page-19.png]], ![[page-20.png]]

## Výsledek

Poznámky uvádějí:

$$
\text{Williams 2010}:\qquad NEXP\not\subseteq ACC^0.
$$

Silnější formulace v poznámkách:

$$
ENP\not\subseteq ACC^0
$$

nebo obdobná varianta s exponenciální třídou; ručně psané značení je částečně nečitelné.

## Hlavní princip důkazu

Používá se nepřímý důkaz přes rychlý algoritmus pro $ACC^0$-SAT.

Schéma:

1. Předpokládejme, že $NEXP\subseteq ACC^0$.
2. Potom lze výpočty jazyků v $NEXP$ reprezentovat malými $ACC^0$ obvody.
3. Pokud navíc máme netriviální algoritmus pro splnitelnost $ACC^0$ obvodů, dostaneme rychlejší než očekávaný algoritmus pro problém úplný pro $NEXP$.
4. To je ve sporu s nedeterministickou časovou hierarchií.

## Co je potřeba za algoritmus

Poznámky před Williamsovým výsledkem uvádějí, že splnitelnost $ACC^0$ obvodu lze rozhodovat v čase přibližně

$$
DTIME(2^{n-g(n)}),
$$

kde $g(n)$ je superlogaritmická úspora vzniklá z redukce hloubky.

Intuice:

Po redukci hloubky má $ACC^0$ obvod tvar

$$
SYM\circ AND.
$$

Splnitelnost takového obvodu lze zkoušet rychleji než hrubou silou, protože:

- spodní AND hradla mají malý fan-in,
- horní symetrická funkce závisí jen na počtu splněných AND hradel,
- lze použít dynamické / meet-in-the-middle sčítání počtů splněných monomů.

## Nástin ze stránky 19-20

Poznámky zapisují:

- z tabulky lze získat obvod $C_x$ pro daný vstup $x$,
- obvod $C_x$ kóduje výpočet / splnitelnost určité formule $\varphi_x$,
- pokud by $NEXP\subseteq ACC^0$, pak existuje ekvivalentní $ACC^0$ obvod $W_x$,
- $W_x$ bere jako vstup index pozice / obvodu a odpovídá, zda daný kousek splňujícího ohodnocení nebo výpočtu je správný.

Ručně psaná poznámka: pro dané $x\in L$ lze v $E^{NP}$ najít splňující ohodnocení $\varphi_x$ binárním vyhledáváním na proměnných.

Tím vznikne lokální verifikátor:

$$
T_x
$$

který pomocí obvodů $W_x$ kontroluje, zda zakódované ohodnocení splňuje všechny požadavky.

## Spor

Pokud by $C_x$ byl $ACC^0$ obvod, pak hledaný obvod / výpočet $T_x$ by také šel reprezentovat v $ACC^0$.

Pomocí algoritmu pro $ACC^0$-SAT lze v čase menším než $2^n$ rozhodnout, zda $T_x$ dává $1$ pro všechny potřebné indexy.

Poznámky formulují závěr ve tvaru:

$$
NTIME(o(2^n))
$$

pro problém, který podle nedeterministické hierarchie vyžaduje čas $2^n$.

To dává spor.

## Stručné shrnutí

Williamsův důkaz používá princip:

$$
\text{dolní mez} \Leftarrow \text{rychlejší algoritmus pro satisfiability dané třídy obvodů}.
$$

Konkrétně:

- redukce hloubky dá strukturální tvar $SYM\circ AND$ pro $ACC^0$,
- z toho plyne netriviální algoritmus pro $ACC^0$-SAT,
- kdyby $NEXP\subseteq ACC^0$, tento algoritmus by porušil nedeterministickou časovou hierarchii.

Proto

$$
NEXP\not\subseteq ACC^0.
$$
