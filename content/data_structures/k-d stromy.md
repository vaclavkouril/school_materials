Rozšíříme (chceme statickou DS) BVS na $k$ dimenzionální stromy následovně:
- Klíče uloženy v uzlu jsou body v $\mathbb{R}^k$.
- Uzly na $\ell$-té úrovni porovnávají $\ell \mod k$ tý index. (hledáme medián a roztřídíme ostatní dle něj)

Pro $2-d$ tedy máme body $(x,y)$ v $0$-té úrovni vyhledáme medián dle $x$ a roztřídíme vlevo a vpravo ostatní vrcholy, a zarekurzíme se nyní porovnávaje dle $y$.

## RangeQuery(Q)
Uchováváme-li interval podstromu v kořeni podstromu, tak se postupně zeptáme, zda nepatří interval náhodou celý do query, pokud ne tak se podíváme za $Q$ má průnik s levým nebo pravým synem (případně oběmi) a zarekurzíme se při hledání vrcholů, které interval obsahuje dle neprázdnosti průniku na dané podstromy.

---
# Range query to $2$-d strom je v nejhorším případě $\Omega(\sqrt{ n })$.
*Důkaz:* Mějme množinu bodů $(i,i)$ pro $i = 1,\dots,n$ pro $n =2^t -1$. Takový má BVS s $t$ úrovněmi. Pokud se zeptáme na range query $\{ 0 \} \times \mathbb{R}$ (nebo hodně velkou konstantu z $\mathbb{R}$), tak tam kde se ptáme na $x$ jdeme vždy doleva protože $0$ je menší než $i$, ale pro $y$ úrovně musíme oba podstromy překontrolovat, protože máme interval $[0,K]$ a průnik v $y$ souřadnici je u obou. Na každé druhé úrovni se dvojí počet navštívených uzlů.

Až algoritmus doběhne tak navštívil $2^{t / 2} = \sqrt{ n }$ uzlů.