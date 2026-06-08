# Decision trees a sensitivity

Zdrojové stránky: ![[../Assets/pages/page-30.png]], ![[../Assets/pages/page-31.png]], ![[../Assets/pages/page-32.png]]

## Decision trees and other measures of complexity

Mějme booleovskou funkci

$$
f : \{0,1\}^{n} \to \{0,1\}.
$$

Pro vstup

$$
x\in\{0,1\}^{n}
$$

definujeme citlivost:

$$
s_x(f)=\left|\{i;\; f(x) \neq f(x\oplus e_i)\}\right|.
$$

Tedy $s_x(f)$ je sensitivity of $f$ at $x$.

Celková sensitivita:

$$
s(f)=\max_x s_x(f).
$$

Příklad:

$$
s(PARITY)=n.
$$

## Block sensitivity

Definice:

$$
bs_x(f)=\max \{b;\; \exists B_1,
\dots,B_b\subseteq \{1,
\dots,n\},\; B_i \text{ disjoint},
$$

$$
\text{s. t. } \forall i:\; f(x) \neq f(x^B)\}.
$$

Kde

$$
x^B = x \oplus \bigoplus_{i\in B} e_i.
$$

Celková block sensitivity:

$$
bs(f)=\max_x bs_x(f).
$$

Intuice:

- flipping any of the bits flips the value,
- flipping any of the blocks flips the value.

## Příklad rozdílu sensitivity a block sensitivity

Funkce:

$$
f(\overline{x}_1,
\dots,
\overline{x}_{\sqrt n})=1
$$

právě tehdy, když v některém bloku $\overline{x}_i$ jsou dvě konsekutivní jedničky a zbytek bloku je $0$.

$$
\overline{x}_i\in\{0,1\}^{\sqrt n}.
$$

Pak podle poznámek:

$$
s(f)=2\sqrt n,
$$

zatímco

$$
bs(f)=\frac n2.
$$

## Základní nerovnosti

Claim:

$$
s(f) \leq bs(f).
$$

Tvrzení (Huang 2019, „sensitivity conjecture“):

$$
bs(f) \leq (s(f))^4.
$$

## Certificate complexity

Certifikát:

$$
C:S\to\{0,1\}, \qquad S\subseteq\{1,
\dots,n\}.
$$

$C$ je certifikát pro $f$ na vstupu $x$, pokud pro všechna $x'$ konzistentní s $C$ platí

$$
f(x)=f(x').
$$

Certificate complexity:

$$
C(f)=\max_x C_x(f).
$$

Claim:

$$
bs(f) \leq C(f),
$$

protože

$$
bs_x(f) \leq C_x(f).
$$

Claim:

$$
C(f) \leq bs(f)\cdot s(f).
$$

Důkaz:

Pro dané $x\in\{0,1\}^{n}$ zvažme bloky $B_1,
\dots,B_b$ takové, že $b=s_x(f)$ nebo $b=bs_x(f)$ podle poznámek. Bereme je tak, aby

$$
\sum_i |B_i|
$$

byl minimální.

Sjednocení bloků nastavíme podle hodnot ve vstupu $x$ a dostaneme certifikát pro $x$. Kdyby ne, existoval by další blok disjunktní od předchozích, což by dalo větší block sensitivity. Navíc každý blok má velikost nejvýše $s(f)$, jinak by změna příliš mnoha bitů porušila definici sensitivity.

## Decision tree complexity

Decision tree complexity $D(f)$: minimální počet dotazů na bity vstupu v deterministickém rozhodovacím stromu, který spočítá $f$.

Claim:

$$
C(f),\; bs(f) \leq D(f).
$$

Důkaz: rozhodovací strom dává certifikát a musí se dotázat na každý citlivý blok.

Claim:

$$
D(f) \leq C(f)\cdot bs(f) \leq (bs(f))^3.
$$

Důkazová konstrukce:

Opakujeme $bs(f)$-krát:

1. vybereme $1$-certifikát $C$ konzistentní s dotazy dosud položenými,
2. dotážeme se na všechny jeho proměnné,
3. pokud je vstup konzistentní s $C$, vrátíme $1$,
4. jinak pokračujeme.

Pokud už neexistuje žádný konzistentní $1$-certifikát, výstup je $0$.

Na konci algoritmus pro libovolné $y$ konzistentní se všemi dotazy vrátí stejnou hodnotu $f(y)$.

## Klíčový claim v důkazu rozhodovacího stromu

Claim:

V kroku 2 platí pro všechna $y,y'$ konzistentní s dotazy:

$$
f(y)=f(y').
$$

Důkaz sporem: předpokládejme, že existují $y,y'$ s

$$
f(y)=0, \qquad f(y')=1.
$$

Nechť $C_{b+1}$ je $1$-certifikát pro $y'$. Pro $i=1,
\dots,b+1$ nechť $B_i$ je množina proměnných, na kterých se $y$ a $C_i$ rozcházejí.

Potom

$$
f(y^{B_i})=1,
$$

tedy $y$ je citlivý v blocích $B_i$.

Tyto bloky jsou disjunktní, což dává spor s $bs(f)=b$.

## Nisan-Szegedy

Theorem (Nisan-Szegedy):

$$
D(f) \leq \deg(f)^2 \cdot bs(f) \leq 2\deg(f)^4.
$$

Poznámky:

- $bs(f) \leq 2\deg(f)^2$,
- $bs(f) \leq 6\deg(f)^2$ `či podobný odhad`,
- používá se approximate degree:

$$
|\widetilde f(x)-f(x)| \leq \frac13
$$

pro všechna

$$
x\in\{0,1\}^{n}.
$$
