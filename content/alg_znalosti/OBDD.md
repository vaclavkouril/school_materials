*Definice Binary Decision Tree:* Mějme $f(x)$ Booleovskou funkci na proměnných $x_{1},\dots,x_{n}$, které jsou fixně seřazené
- Kompletní binární strom s $n+1$ úrovněmi.
- Listy mají label $true$ nebo $false$.
- Vnitřní uzly na úrovni $i$ mají label proměnnou $x_{i}$ a dva následníci reprezentují ohodnocení $a(x_{i})=0$ a $a(x_{i})=1$.
- Hodnota $f$ je na ohodnocení $a: x\to \{ 0,1 \}$ podle cesty z kořene do listu dle $a$ a $f(a)$ je v listu kam dojdeme.

*Definice OBDD:* Ordered Binary decision diagram je vyroben z BDT úplnou aplikací následující redukcí:
- Sloučení isomorfních uzlů, pokud dva uzly se stejným labelem mají isomorfní levého syna s levým a pravého s pravým, tak jsou isomorfní a sloučí se.
- Pokud je isomorfní levý syn s pravým u uzlu, tak je redundantní a může se přeskočit.