*Definice:* Zásobníkový automat $A = (Q,\Sigma,\Gamma,\delta,q_{0},Z_{0},F)$, kde 
- $Q$ - množina stavů
- $\Sigma$ - vstupní abeceda
- $\Gamma$ - zásobníková abeceda
- $\delta: Q \times (\Sigma \cup \{  \epsilon \}) \times \Gamma \to \mathscr{P}(Q \times \Gamma^*)$, kde přechod $\delta(q,a,X) \in (p,\gamma)$ znamená, že na zásobníku se $X$ nahradí za $\gamma$.
- $q_{0}$ - počáteční stav
- $Z_{0}$ - počáteční zásobníkový symbol
- $F$ - nepovinná množina přijímacích stavů
Rozlišujeme dva typy přijímaných jazyků a sice $L(A)$ jako jazyk přijímaný koncovými stavy a $N(A)$ jazyk přijímaný prázdným zásobníkem.

[Bezkontextové gramatiky](Regulární%20jazyky#Gramatiky) jsou ekvivalentní jazykům definovaných pomocí zásobníkových automatů. Konstrukčně můžeme každou takovou gramatiku na zásobníkový automat převést
