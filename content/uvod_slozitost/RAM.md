# Random Access Machine
*Definice:* RAM se skládá z řídící jednotky a neomezené paměti. Paměť je rozdělená do registrů $r_{i}, i\in \mathbb{N}$ a v každém může být libovolné přirozené číslo (start s $0$). $[r_{i}]$ je obsah $r_{i}$, nepřímou adresaci značíme $[[r_{i}]] = [r_{[r_{i}]}]$ a programem pro $RAM$ je konečná posloupnost instrukcí $P=I_{0},I_{1},\dots,I_{\ell}$ a instrukce jsou vykonané v pořadí předepsaném v $P$. Instrukce jsou
- $LOAD(C,r_{i}): r_{i} \leftarrow C$
- $ADD(r_{i},r_{j},r_{k}): r_{k} \leftarrow [r_{i}]+[r_{j}]$
- $SUB(r_{i},r_{j},r_{k}): r_{k} \leftarrow \max([r_{i}]-[r_{j}],0)$
- $COPY([r_{i}],r_{j}): r_{j} \leftarrow [[r_{i}]]$
- $COPY(r_{i},[r_{j}]): r_{[r_j]} \leftarrow [r_{i}]$
- $JNZ(r_{i},I_{z}):\text{if } [r_{i}] \text{ then goto } z$
- $READ(r_{i}): r_{i} \leftarrow \text{input}$
- $PRINT(r_{i}): \text{output } \leftarrow [r_{i}]$

tedy je ekvivalentní procedurálnímu jazyku, můžeme udělat proměnné, cykly, skoky i inline makra jako funkce i pomocí copy nepřímo adresovat.

*Definice:* Mějme $\Sigma = \{ \sigma_{i_{0}},\dots,\sigma_{i_{n}} \}$ konečnou abecedou, $R(w)$ značí že RAM-u předáme jako vstup $w=\sigma_{i_{0}}\sigma_{i_{1}}\dots\sigma_{i_{n}}$ a předáme k výpočtu $i_{0},\dots,i_{n},0$, první $READ$ nuly tedy značí konec výpočtu. $R$ přijímá když $w\in \Sigma^*: R(w)\downarrow$ a $R$ použije aspoň jednou $PRINT$ a první je $1$, pokud jen $R(w)\downarrow$ a první $PRINT$ není $1$, tak slovo odmítá.

*Definice:* $f: \mathbb{N}^* \to \mathbb{N}$ je RAM vyčíslitelná, právě tehdy když existuje RAM $R$, který pokud $f(w) \uparrow$, tak $R(w)\uparrow$, nebo nevydá žádný výstup. Pokud $f(w)\downarrow$, tak $R(w)\downarrow$ a vydá výstup, tak tento výstup je roven $f(w)$.

---
# Ekvivalence s Turingovým strojem
*Věta:* Nechť $L \subseteq \Sigma^*$ je jazyk a $f: \Sigma^* \to \Sigma^*$ je řetězová funkce. Potom platí:
1. Jazyk $L$ je přijímaný nějakým TS $M$, právě když je přijímaný nějakým RAM $R$.
2. Funkce $f$ je turingovsky vyčíslitelná, právě když je RAM vyčíslitelná.

*Důkaz:* Rozdělíme na dvě části $TS$ a turingovsky vyčíslitelná funkce převedeme na RAM $R$ a RAM vyčíslitelnou funkci a poté druhou stranu ekvivalencí.
## TS na RAM
