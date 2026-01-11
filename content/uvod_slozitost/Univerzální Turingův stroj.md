*Definice:* Jednopáskový deterministický turingův stroj $M = (Q,\Sigma,\delta,q_{0},F)$, kde 
1. $Q$ je *konečná* množina stavů,
2. $\Sigma$ je konečná pásková abeceda, která značí $\lambda$ jako prázdné políčko,
3. $\delta : Q \times \Sigma \to Q\times\Sigma \times \{ L,N,R \} \cup \{ \perp \}$, kde $L,R$ značí posun vlevo/vpravo, $N$ nechává hlavu automatu na stejné buňce pásky, $\perp$ značí  nedefinovaný přechod.
4. $q_{0}\in Q$ počáteční stav a
5. $F \subseteq Q$ množina přijímajících stavů.

TS sestává z řídící jednotky, obousměrně neomezené pásky, hlavy čtoucí obsah buněk pásky, pohybující se oba směry.

- *Displej* je dvojice $(q,a)$ na základě které se volí další krok.
- *Konfigurace* je aktuální informaci o stavu výpočtu, sestává se ze stavu řídící jednotky, slova na pásce (od nejlevější neprázdné části k nejpravější) a pozice hlavy na pásce (v rámci slova).
- *Výpočet* začíná v počáteční konfiguraci, dle displeje $(q,a)$ probíhá *krok výpočtu* následovně:
	1. $\delta(q,a)=\perp$ výpočet $M$ končí.
	2. $\delta(q,a)=(q',a',Z)$, kde $q' \in Q, a'\in \Sigma,Z \in \{ L,N,R \}$, $M$ přejde do stavu $q'$ přepíše $a$ na $a'$ a hlava se pohne dle $Z$.

Je-li $K$ konfigurace TS $M$, tak $\delta(K)$ označuje konfiguraci, která vznikne po aplikaci $\delta$ na konfiguraci $K$. Konfigurace $\delta(K)=\perp$ označme *koncové*.

*Definice:* 
- TS $M$ přijímá slovo $w$ pokud výpočet se vstupem $w$ skončí v nějakém ze stavů $F$.
- Slovo odmítá, když výpočet skončí v $Q \setminus F$.
- $M(w) \downarrow$ označuje, že $M$ na $w$ skončí (konverguje).
- Nekončící výpočet (divergentní) značíme $M(w)\uparrow$. 
- $L(M)$ označuje množinu slov, pro kterou $M(w)\downarrow$ a přijme. Jazyk $L$ je *rozhodován* TS $M$ když $L =L(M)$ a $M$ se zastaví nad každým vstupem.

---
# Varianty Turingova stroje
## $k$-páskový TS
Jediným rozdílem je 
$$
\delta: Q \times \Sigma^k \to Q \times \Sigma^k \times \{ L,N,R \}^k \cup \{ \perp \}.
$$
## Nedeterministický TS
Opět je jiná jen $\delta$:
$$
\delta: Q \times \Sigma \to \mathcal{P}(Q \times \Sigma \times \{ L,N,R \}) \cup \{ \perp \}.
$$
*Definice:* Strom výpočtu nedeterministického TS $M$ nad vstupem $x\in \Sigma^*$ je dvojice $T, \mathcal{L}$, kde 
- $T=(V,E)$ je orientovaný zakořeněný strom, kde hrany jsou orientované od kořene k listům.
- $\mathcal{L}$ je funkce, která $\forall v\in V$ přiřadí konfiguraci $M$ splňující:
	1. kořenu $r\in V$ je přiřazena počáteční konfigurace výpočtu $M(x)$,
	2. pokud $(u,v)\in E$, pak $\mathcal L(v) \in \delta(\mathcal{L}(u))$,
	3. pokud $u\in V$ je uzel stromu, pak pro každou konfiguraci $K \in \delta(\mathcal{L}(u))$ musí $\exists v\in V: \mathcal{L}(v) = K \land (u,v)\in E$.

---
# Kódování TS
**Omezení:** TS které mají jen jeden přijímající stav a mají pouze binární vstupní abecedu $\{ 0,1 \}$.
Pracovní abeceda není omezená a libovolný TS jde upravit tak aby splňoval obé podmínky.

Máme tedy $M=(Q, \Sigma, \delta, q_{0}, F=\{ q_{1} \})$ a chceme přepsat $\delta$ pomocí $v_{M}$ v abecedě $\Gamma =\{ 0,1,L,N,R,|,\#,;\}$, takové se dají zapsat pomocí $3$ bitů na $\langle M\rangle$ reprezentující $M$.

Máme $Q = \{ q_{0},q_{1},\dots,q_{r} \}$ pro $r \geq {1}$, $\Sigma =\{ X_{0}=0,X_{1}=1,X_{2}=\boldsymbol{\lambda},\dots,X_{s} \}$ pro $s \geq {2}$, každý index stavu i znaku přepíšeme binárně a $\delta(q_{i},X_{j}) = (q_{k},X_{l},Z)$, kde $Z \in \{ L,N,R \}$ se zakóduje na kód
$$
C_{m}=(i)_{B}|(j)_{B}|(k)_{B}|(l)_{B}|Z
$$
Takové kódy $C_{1},\dots,C_{n}$ zapíšeme 
$$
\langle M \rangle = C_{1}\#C_{2}\#\dots\#C_{n}
$$
Gödelovo číslo definujeme jako $index(\langle M\rangle)$ a to je unikátní číslo přiřazené k danému TS $M$.

Pokud máme nesprávné kódování, tak ho interpretujeme jako TS $M$ s $\delta =\emptyset$ a tedy $L(M) = \emptyset.$

Každý TS má zjevně nekonečně mnoho různých kódů a tedy i G. čísel. 

---
# Nerozhodnutelnost univerzálního jazyka 

*Definice:* Jazyk univerzálního turingova stroje je
$$
L_{u} = \{ \langle M,x \rangle \mid x \in L(M) \}.
$$
Stroj $\mathcal{U}$ o 3 páskách na $L_{u}$ 
1. páska obsahuje $\langle M,x \rangle$,
2. páska drží uložený obsah pracovní pásky $M$, symbol $X_{j}$ zapsán jako $(j)_{B}$, s bloky jednotné délky $b$ bitů,
3. páska obsahuje $(i)_{B}$ reprezentující aktuální stav $q_{i}$ stroje $M$. 

Výpočet probíhá následovně: 

Inicializace:
1. Syntaktická kontrola
2. Určení délky $b$ bloku pro znak na druhé pásce (maximální $X_{i}$ v rámci instrukce)
3. Přepis vstupu z 1. na 2. pásku (převod na bloky délky $b$ oddělených $|$)
4. Zápis $0$ na 3, pásku
5. Reset hlav na začátky slov

Simulace:
1. V $\langle M \rangle$ hledáme instrukce pro displej $(q_{i}, X_{j})$
2. Když se nalezne $(q_k,X_{l}, Z)$, tak se 3. páska přepíše na $q_{k}$, 2. páska se přepíše blok pod hlavou na $(l)_{B}$ ($b$ bitů reprezentující $X_{l}$) a 2. páska se přesune na další blok dle $Z$
3. Pokud je hlava přesunem mimo použitou část pásky, tak $\mathcal{U}$ přidá $0^{b-2}10$ ($X_{2}=\lambda$) blok.
4. Uklizení hlav na pozice kde mají být po případném přidání a dočtení 3. pásky
5. Opakujme

Zastavili-li jsme a 3. páska má číslo $1$ tak se přijme dle $F=\{ q_{1} \}$, jinak odmítneme, navíc druhá páska má zakódovaný výstup pokud $M$ mělo počítat nějakou funkci.

## Jazyk $L_{u}$ je částečně rozhodnutelný, ale není rozhodnutelný.
*Důkaz:* Reprezentujme $L_{u} = \{ \langle M,x \rangle \mid x \in L(M) \}$ nekonečnou maticí $A$, kde sloupce jsou indexované $j$, kde $w_j$ označuje binární řetězec s indexem $i$ a řádky jsou označeny G. čísly TS $M_{i}$ a platí $w_{i} =\langle M_{i}\rangle$ a $A_{i,j} = 1 \iff w_{j} \in L(M_{i})$. 

Doplněk diagonály matice $A$ určuje **diagonální jazyk** 
$$
DIAG = \{ \langle M\rangle  \mid \langle M\rangle \not\in L(M)\}
$$
Takový $DIAG$ není částečně rozhodnutelný. (Neexistuje pro něj TS)
*Důkaz:* sporem, nechť TS $M_{D}$, která přijímá $DIAG = L(M_{D})$, pak ale zeptáme-li se, zda $\langle M_{D} \rangle \in DIAG$, tak
1. z definice $DIAG$ do $DIAG$ jazyk patří, jen když $\langle M_{D}\rangle \not\in L(M_{D})$,
2. z definice $M_{D}$ máme $DIAG = L(M_{D})$ a tedy můžeme ekvivalentně přepsat $\langle M_{D}\rangle \in L(M_{D})$.

Tedy jsme našli spor, protože nám vlastně vyšlo:
$$
\langle M_{D} \rangle \in DIAG \iff \langle M_{D}\rangle \not\in L(M_{D}) \iff \langle M_{D}\rangle \in L(M_{D}) \iff \square.
$$

Vraceje se k $L_{u}$, dá se k němu zkonstruovat TS, takže je částečně rozhodnutelný, ale předpokládejme pro spor, že je rozhodnutelný, tedy existuje TS $M_{\mathcal{U}}$, který se vždy zastaví a vydá odpověď zda $x \stackrel{?}{\in}M_{\mathcal{U}}$, a tedy
$$
\langle M \rangle \in DIAG \stackrel{\text{definice } DIAG}{\iff} \langle M \rangle \not\in L(M) \stackrel{\text{definice } L_{u}}{\iff} \langle M, \langle M \rangle\rangle \in L_{u}
$$
tedy můžeme $M_{\mathcal{U}}$ užít na rozhodnutí $DIAG$, to je ale spor s nerozhodnutelností $DIAG$.

---

Jedna z řádek i jeden ze sloupců matice jsou dokonce shodné s její diagonálou ale $DIAG$ se z definice od každého řádku liší určitě alespoň v jedné (té diagonální) pozici, tedy kdyby k němu šel udělat TS $M$ tak se musí lišit sám se sebou. Dokonce se $DIAG$ s ostatními odlišuje v nekonečně mnoha pozicích, protože, každý řádek je v nekonečné matici nekonečně mnohokrát, tedy se nekonečně mnohokrát různě vybírá index diagonály.