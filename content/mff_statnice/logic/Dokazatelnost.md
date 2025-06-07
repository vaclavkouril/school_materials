## [[Dokazatelnost]]

*Definice:* Formální důkaz formule $ϕ$ z teorie $T$ v daném dokazovacím systému je konečná posloupnost  
$$
ϕ_0,\dots,ϕ_n = ϕ
$$  
taková, že každá položka je buď logický axiom, axiom teorie $T$, nebo je odvozena z předchozích pomocí příslušného odvozovacího pravidla.

*Definice:* Zamítnutím formule $ϕ$ (refutation) rozumíme formální důkaz kontradikce z teorie $T$ nebo z $T\cup\{\negϕ\}$.

1. **Tablo metoda:**  
Tablo důkaz formule $ϕ$ z teorie $T$ je sporné tableau s kořenem obsahujícím všechny axiomy $T$ jako pravdivé a formuli $ϕ$ jako nepravdivou ($Fϕ$). 
Příklad pro $T=\{p\to q,\;p\}$ a cíl $q$:  
   - Kořen: $T(p\to q),\;T(p),\;F(q)$  
   - Pravidlo pro $T(φ→ψ)$ rozvětví na $F(φ)\mid T(ψ)$  
     1. Větev $F(p)$ se uzavře proti $T(p)$.  
     2. Větev $T(q)$ se uzavře proti $F(q)$.  
Všechny větve se uzavřely, takže tableau je refutující a $T\models q$. 

2. **Rezoluční metoda:**  
Rezoluční důkaz je refutace množiny klauzulí pomocí rezolučního pravidla tak, že se odvodí prázdná klauzule $\Box$.  
Příklad pro $T=\{p\to q,\;p\}$ a cíl $q$:  
   - Přepište do CNF:  
      - $p\to q\;\sim\;\neg p\lor q\;\to\;\{\neg p,q\}$  
      - $p\;\to\;\{p\}$  
      - Přidejte $\{\neg q\}$.  
   - Rezoluční kroky:  
$$
\{\neg p,q\} \cup_{res}\{\neg q\}\;\to\;\{\neg p\},
$$
$$
\{\neg p\}\cup_{res}\{p\}\;\to\;\emptyset.
$$  
Dosáhli jsme prázdné klauzule, tudíž $T\vdash_\text{res}\bot$ a tedy $T\models q$. 
2. **Hilbertovský kalkulus:**  
*Definice:* Schémata logických axiomů (pro libovolné výroky $φ,ψ,χ$):  
$$
   \begin{aligned}
   &φ\to(ψ\toφ)\\
   &(φ\to(ψ\toχ))\to((φ\toψ)\to(φ\toχ))\\
   &(\negφ\to\negψ)\to(ψ\toφ)
   \end{aligned}
$$
*Definice:* Modus ponens: z $φ$ a $φ\toψ$ odvoď $ψ$. 
*Definice:* Hilbertovský důkaz $ϕ_0,\dots,ϕ_n=ϕ$ je konečná posloupnost, kde každé $ϕ_i$ je logický axiom, axiomatická formule, nebo je získáno modus ponens.
Příklad pro $T=\{p\to q,\;p\}$ a cíl $q$:  
- $p\to q$ (axiom teorie)  
- $p$       (axiom teorie)  
- $q$       (modus ponens z 1. a 2.)  
Tudíž $T\vdash_H q$.
