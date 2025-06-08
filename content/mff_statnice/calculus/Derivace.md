*Definice:* Nechť $f\colon M\to\mathbb{R}$, $b\in M$ a existuje $\delta>0$ tak, že $U(b,\delta)\subseteq M$. Derivace funkce $f$ v bodě $b$ je limita  
$$
f'(b)\;:=\;\lim_{h\to0}\frac{f(b+h)-f(b)}{h}
\;=\;\lim_{x\to b}\frac{f(x)-f(b)}{x-b}\,.
$$  
Derivace zprava (resp. zleva) je odpovídající jednostranná limita pro $h\to0^+$ (resp. $h\to0^-$). Funkce je v $b$ diferencovatelná právě tehdy, když obě jednostranné derivace existují a jsou si rovny. 

*Definice:* Derivace složené funkce:  
$$
(f\circ g)'(x) = f'(g(x))\cdot g'(x).
$$

*Základní pravidla diferenciace:*  
1. $(f+g)' = f' + g'$.  
2. $(c\,f)' = c\,f'$ pro konstantu $c$.  
3. $(f\,g)' = f'\,g + f\,g'$.  
4. $\bigl(\tfrac f g\bigr)' = \frac{f'\,g - f\,g'}{g^2}$ (pro $g\neq0$).  
5. $(f\circ g)' = (f'\circ g)\,g'$.  
---
# l’Hospitalovo pravidlo

*Věta (l’Hospitalovo pravidlo):* Nechť $a\in\mathbb{R}^*$, $f,g\colon P(a,\delta)\to\mathbb{R}$ mají vlastní derivace na $P(a,\delta)$ a $g'(x)\neq0$ tamtéž.  
1. Pokud $\lim_{x\to a}f(x)=\lim_{x\to a}g(x)=0$ a $\lim_{x\to a}\frac{f'(x)}{g'(x)}=A\in\mathbb{R}^*$, pak  
   $$
   \lim_{x\to a}\frac{f(x)}{g(x)} = A.
   $$
2. Pokud $\lim_{x\to a}|g(x)|=+\infty$ a $\lim_{x\to a}\frac{f'(x)}{g'(x)}=A\in\mathbb{R}^*$, pak též  
   $$
   \lim_{x\to a}\frac{f(x)}{g(x)} = A.
   $$

*Důkaz:*

**Základní myšlenka:**  
Když mají funkce $f$ a $g$ v bodě $a$ stejný „typ“ neurčitosti (např. $0/0$ nebo $\infty/\infty$), jejich poměr se pro $x\to a$ chová podobně jako poměr tečen k jejich grafům v bodě $a$. Tečnu každé funkce popisuje derivace, proto lze limitu $\frac{f(x)}{g(x)}$ nahradit limitou $\frac{f'(x)}{g'(x)}$.

Nechť $\lim_{x\to a}f(x)=\lim_{x\to a}g(x)=0$. Vezmeme libovolné $x\neq a$ v prstencovém okolí a definujeme na intervalu $[a,x]$ (nebo $[x,a]$, pokud $x<a$) pomocné funkce
$$
F(t) = f(t),\quad G(t) = g(t).
$$
Obě jsou spojité na uzavřeném intervalu a diferencovatelné na otevřeném, navíc $G'\neq0$. Podmínky Cauchyho věty o střední hodnotě (obecné MVT) říkají, že existuje bod $c$ mezi $a$ a $x$ tak, že
$$
\frac{F(x)-F(a)}{G(x)-G(a)}
=
\frac{F'(c)}{G'(c)}
\;=\;
\frac{f'(c)}{g'(c)}.
$$
Protože $F(a)=f(a)=0$ a $G(a)=g(a)=0$, máme
$$
\frac{f(x)}{g(x)}
=
\frac{f'(c)}{g'(c)}.
$$
Když $x\to a$, bod $c$ leží mezi $a$ a $x$, tedy $c\to a$. Z předpokladu
$$
\lim_{c\to a}\frac{f'(c)}{g'(c)} = A
$$
plyne
$$
\lim_{x\to a}\frac{f(x)}{g(x)}
= \lim_{c\to a}\frac{f'(c)}{g'(c)}
= A.
$$

Pro případ $\infty/\infty$ stačí uvést substituci $\tilde f(t)=f(1/t)$, $\tilde g(t)=g(1/t)$ a zredukovat limitu $x\to a$ na $t\to0$, poté použít předchozí argument. Tím je důkaz kompletní.

---

# Vyšetření průběhu funkcí

*Definice:* Funkce $f\colon J\to\mathbb{R}$ (interval $J$) má v bodě $a$  
- **lokální minimum**, pokud existuje $\delta>0$ takové, že $\forall x\in J\cap U(a,\delta): f(x)\ge f(a)$,  
- **lokální maximum**, pokud $\forall x\in J\cap U(a,\delta): f(x)\le f(a)$. 

*Věta:* (Lagrangeova) Nechť $-\infty < a < b < +\infty$ a funkce $f\colon [a,b]\to\mathbb{R}$ je spojitá na $[a,b]$ a diferencovatelná na $(a,b)$. Pak existuje bod $c\in(a,b)$ takový, že  
$$
f'(c) \;=\; \frac{f(b)-f(a)}{b-a}.
$$

*Věta:* (Derivace a monotonicita) Nechť $J\subseteq\mathbb{R}$ je interval, $f$ je na $J$ spojitá a diferencovatelná na vnitřku.  
- Pokud $f'(x)>0$ pro všechna $x$ ve vnitřku $J$, pak je $f$ na $J$ (strictly) rostoucí.  
- Pokud $f'(x)<0$, pak je $f$ klesající.  
- Případy $f'\ge0$, $f'\le0$ vedou k neklesající / nerostoucí.  
*Důkaz:* Pro libovolná $a<b$ v $J$ aplikuje se Lagrangeova věta (Rolleova věta) na úsečku $[a,b]$: existuje $c\in(a,b)$ s  
$$
\frac{f(b)-f(a)}{b-a} = f'(c)\,.
$$  
Pak z $b-a>0$ a znaménka $f'(c)$ plyne $f(b)-f(a)$ kladné či záporné dle potřeby.

*Věta:* (Konvexita a konkávita a druhá derivace) Nechť $I\subset\mathbb{R}$ otevřený interval a $f\colon I\to\mathbb{R}$ má spojitou druhou derivaci.  
- Je-li $f''(x)\ge0$ pro všechna $x\in I$, pak je $f$ konvexní na $I$.  
- Je-li $f''(x)\le0$, pak je $f$ konkávní.  

*Definice:* Funkce má **inflection point** v $a$ právě tehdy, pokud $f'(a)$ existuje a graf mění konvexitu v $a$. 

---

## Taylorův polynom (limitní forma)

*Definice:* Nechť $a\in\mathbb{R}$, $n\in\mathbb{N}_0$ a $f$ má v okolí $a$ všechny derivace až do řádu $n$. Taylorův polynom řádu $n$ v bodě $a$ je  
$$
T_{f,a}^n(x)\;=\;\sum_{i=0}^n\frac{f^{(i)}(a)}{i!}(x-a)^i.
$$

*Věta:* (Charakterizace Taylorova polynomu) Pro takovou $f$ a $T(x)=T_{f,a}^n(x)$ platí  
$$
\lim_{x\to a}\frac{f(x)-T(x)}{(x-a)^n} = 0,
$$  
a $T$ je jediný polynom stupeň $\le n$ s touto vlastností. 

*Důkaz:* Indukcí podle $n$. Pro $n=0$ plyne z continuity. Při kroku z $n-1$ na $n$ aplikujeme l’Hospitalovo pravidlo na  
$\lim\frac{f(x)-T(x)}{(x-a)^n}$ a pak indukční předpoklad na zbylou limitu nižšího řádu. Unikátnost vyplývá z lemmatu, že pokud polynom $Q$ stupně $\le n$ splňuje $\lim Q(x)/(x-a)^n=0$, pak $Q\equiv0$.
