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

*Důkaz:* Rozdělíme na dvě části $TS$ a turingovsky vyčíslitelná funkce převedeme na RAM $R$ a RAM vyčíslitelnou funkci a poté druhou stranu ekvivalencí. Očekávejme, že stroj $M$ má pásku jen doprava.
## TS na RAM
Mějme TS $M=(Q,\Sigma,\delta,q_{0}, F)$, kde $Q=\{ q_{1},\dots,q_{r} \}$ pro $r \geq 0$ s $q_0$ počátečním stavem a $\Sigma = \{ \sigma_{0},\dots \sigma_{s} \}$ s $\sigma_{0} = \lambda$ a chceme ekvivalentní $R$ a počítající $f_M$. Pro $R$ si pořiďme
1. Proměnná $q$ označující index aktuálního stavu $M$
2. Proměnná $h$ označuje index buňky na kterou ukazuje hlava $M$
3. Pole $T$, které reprezentuje obsah pásky $M$, tedy aktuální obsah buňky je $T[h]$

Načtení vstupu je pro RAM procedura, kde vstup $T[0],\dots,T[n-1]$ a $n$ je počet nenulových indexů. 

Přechod $\delta(q_{i},\sigma_{j}) = (q_{k}, \sigma_{l}, Z)$ se provede pomocí podmíněných skoků na které převedeme:
1. Když $q = i$ a $T[h]=j$ pak
2. $q\leftarrow j$
3. $T[h]\leftarrow l$ 
4. Pro $Z=R:$ $h \leftarrow h+1$; $Z =L:h\leftarrow h-1$; $Z=N: h \leftarrow h$.

Pokud by měl turingův stroj skončit, tak jen ověříme, zda je $q$ v $F$ a vypíšeme $1$ na výstup. Pokud nás zajímá $f_{M}$ tak vypíšeme obsah pole $T$ na první buňku, buď $T$ k první prázdné buňce, nebo nejdále kam se $M$ při výpočtu dostal. 

## RAM na TS
Mějme RAM $R$ a vyrobíme $4$-páskový $TS$, které mají funkce:
1. Vstupní páska oddělující vstupní čísla pomocí $\#$, jen čte
2. Výstupní, sem zapisuje TS $M$ čísla, která by dal $R$ na výstup a odděluje je $\#$, jen zapisuje
3. Paměť RAM
4. Pomocná páska pro výpočet součtu, rozdílu, nepřímých adres, posunů pásky atd.

Předpokládejme binární zápis na vstupu TS $M$ čísel vstupu $R$.

Pro paměť RAM-u si stačí pamatovat využité registry v rostoucím pořadí čísel registrů. Za každý registr dodáme na pásku dvojici indexem $i$ a číslem $[r_i]$, ta jsou oddělen $|$ a binárně zapsaná a dvojice jsou od sebe oddělena $\#$.  

 Mějme instrukce $P=I_{0},\dots,I_{\ell}$ a $\delta$ musí udržovat pořadí instrukcí, ale $\ell$ je konstanta tedy program counter (čítač instrukcí) se dá uložit do stavu. Pro danou instrukci $I_{j}$ si vyrobíme stavy které se chovají dle tabulky a sice, 
 1. $LOAD$ přepíše paměť konstantou
 2. $ADD, SUB$ si druhý registr přepíše na pomocnou pásku a provede binární počítání přepisující paměť na daném registru
 3. $COPY$ si vytáhne co má být kopírováno na pomocnou pásku a přepíše to na označené místo
 4. $JNZ$ ověří podmínku a případně přepíše $j$ v $I_{j}$

Existují tedy zjevně převody oběma směry a tedy jsou ekvivalentní.