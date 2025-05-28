
```
Jak velká (nebo naopak jak malá) může být struktura vyhovující určité vlastnosti, pokud jiná nežádoucí vlastnost nesmí nastat?
```
v případě grafů a hypergrafů se jedná hlavně o
```
Kolik nejvíce hran může mít graf, který splňuje danou vlastnost a ideálně i jak vypadá.
```
Ještě konkrétněji se jedná třeba o
```
Kolik nejvíc hran může mít graf, který neobsahuje jiný graf jako podgraf.
```
*Značení:* Pro graf $H$, $ex(n,H)$ je největší $m$ takové, že existuje graf s $n$ vrcholy a $m$ hranami neobsahující $H$ jako podgraf. 

*Definice (Turánův graf):* Pro $k,n \in \mathbb{N}$ označme $T_{k}(n)$ úplný $k$-partitní graf  na $n$ vrcholech, jehož všechny partity mají velikost $\left\lfloor \frac{n}{k} \right\rfloor$ nebo $\left\lceil  \frac{n}{k}  \right\rceil$.

*Pozorování:* $\forall n \in \mathbb{N}, r \geq 2: ex(n,K_{r})\geq T_{k-1}(n)$


### Turánova věta
$\forall r \geq 2: ex(n,K_{r})= T_{k-1}(n)$


### Erdös-Ko-Radoova věta 
*Definice:* $k$-uniformní hypergraf je dvojice $(V,E)$, kde $E\subseteq\binom{V}{k}$)
- $f(k,n):= \max m$ t.ž. $\exists$  $k$-uniformní hypergraf $H=(V,E)$ t.ž. $∣V∣=n,∣E∣=m$ a $E$ je „pronikající systém množin“ (t.j. $\forall e,e′\in E:e\cap e' \neq \emptyset$)
    - braní všech hran nemusí fungovat (musí se protínat všechny dvojice)

*Věta:* $\forall k,n \in \mathbb{N}: n\geq 2k \implies f(k,n)=\binom{n-1}{k-1}$
