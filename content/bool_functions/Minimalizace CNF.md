Máme danou CNF $F$ a chceme CNF $F'$, která je jí ekvivalentní ale $|F|$ je minimum, kde $|F|$ může značit 2 věci:
1. $|F|_{c}$ je počet klauzulí,
2. $|F|_{\ell}$ je celkový počet literálů v klauzulích.

## Optimalizace $\to$ Rozhodovací problém
_Vstup:_ CNF $F$, $k\in \mathbb{N}$
_Otázka:_ $\exists F'$ takové, že $F \equiv F'$ a $|F| \leq k$
Problém je ale v tom, že kdybychom pro $NP$ brali certifikát $F'$ tak stejně nemáme jak v poly-čase ověřit $F \equiv F'$.

_Podproblém:_ Test ekvivalence (EQ)
_Vstup:_ CNF $F, G$
_Otázka:_ Je $F \equiv G$?

Je v $co-NP$, dokonce je $co-NP$ kompletní.
Protože certifikát negativní odpovědi, je ohodnocení, kde se liší. 
$co-NP$-těžkost, protože $F \equiv \square$ je doplněk k SAT problému.

*Tvrzeni:* $\exists F' \forall X: (|F'| \leq k \text{ a } F(X) = F'(X)) \in \Sigma^P_{2}$

\*$\Sigma_{2}^P$ je $NP^{coNP}$ protože po nedeterministické volbě $F'$, ještě ověřujeme ekvivalenci, která je v $co-NP$. (Dokonce kompletní)

---
# Tractable
*Definice:* Třída $\mathcal{C}$ CNF je tractable, když 
1. je uzavřená na částečnou substituci (vezmu-li CNF ze třídy a substituuji, tak jsem stále v $\mathcal C$),
2. SAT je řešitelný v poly čase na $\mathcal C$
*Příklady takových tříd:* kvadratické, Hornovské, Hidden Horn, $\dots$

*Lemma:* Nechť CNF $F$ je z tractable třídy a $C$ je klauzule, pak umíme v poly-čase zjistit, zda je implikátem.

*Důkaz:* Vezmeme implikáty $C$, vynutíme dosazení takové, aby $C$ bylo $0$ a dosadíme do $F$ a zeptáme se SAT na splnitelnost dosazené $F$ a pokud někde vyjde, že ano tak není implikátem.

*Pozorování:*
1. $F\equiv G \iff F \leq G \text{ a } G \leq F$. 
2. $F \leq G \iff$ Každá klauzule $G$ je implikátem $F$.

*Věta:* EQ je v poly-čase pro tractable třídy.
*Důkaz:* Z lemma překontrolujeme, zda klauzule $G$ jsou implikáty $F$ a obráceně, pokud jsou to vždy implikáty tak jsou ekvivalentní.

*Lemma:* Nechť $F$ je CNF v tractable třídě. Umíme v poly-čase zkonstruovat prime CNF $F'$ takové, že $F' \equiv F$.
*Důkaz:* Pro klauzuli $C$ v $F$, si zvolíme literál $l$ a otestujeme, zda je $C \setminus \{ l \}$ implikátem a takhle zredukujeme každou klauzuli na prime implikát.

Aby to fungovalo pro každou tractable, tak by se musela doplnit definice o garanci prime implikátů uvnitř třídy.

---

*Definice:* Irredundantní CNF $F$ je takové, pro které zahození klauzule změní funkci, kterou $F$ reprezentuje.

*Pozorování:* Pro CNF $F$ z tractable třídy umíme v poly-čase redukovat na irredundantní CNF.

---
# Kvadratické CNF
*Lemma 1:* Nechť $F$ je čistě kvadratická CNF. Pak $F$ je Hidden Horn $\iff$ $F$ je splnitelná.

*Lemma 2:* Mějme $F,G$ prime Hornovské a $F_{H}, G_{H}$ jejich čisté Horn pod-CNF (zahodíme klauzule bez pozitivního literálu) pak
$$
F \equiv G \implies F_{H} \equiv G_{H}.
$$
*Důkaz:* Rezoluce se chová na $H$ hornovských klauzulí a $N$ negativních následovně:
$$
\mathrm{Res}(H,H) = H, \quad \mathrm{Res}(H,N) = N, \quad \mathrm{Res}(N,N) \text{ je nemožná.}
$$
Když na $F$ spustíme rezoluci tak máme kanonickou $C$ a obdobně pro $G$ máme $C$, protože předpokládáme ekvivalenci. Vezmeme-li $C_{H}$, tak ty mohli vzniknout jen z $F_{H}$ a také z $G_{H}$ a vzhledem k tomu, že se redukují na totožné primární implikáty ($F_{H} \subseteq C_{H}, G_{H} \subseteq C_{H}$), tak jsou ekvivalentní.

Díky *Lemma 2* můžeme redukovat Horn klauzule po částech $F_{H}$ na $F'_{H}$ a $F_{N}$.

*Lemma 3:* Nechť $F,G$ jsou prime, irredundantní Horn CNF reprezentující funkci $f$, a nechť 
$$
F = F_{H} \land F_{N}, \quad G = G_{H} \land G_{N},
$$
pak $|F_{N}|_{c} = |G_{N}|_{c}$.

*Pozorování:* Každý negativní primární implikant $f$ může být získán rezolucí z $F_{H}$ a přesně jednou klauzulí z $F_{N}$ (to samé pro $G$).

*Důkaz lemma 3:* Definujme orientovaný graf $D_{f}$, kde vrcholy jsou negativní primární implikáty a hrany $C_{1}C_{2}$, pokud $C_{2}$ je implikátem $f_{H} \land C_{1}$ ($f_{H}$ je funkce reprezentovaná $F_{H}$ i $G_{H}$)
Když máme prime irredundantní reprezentaci $f$, tak má právě jeden vrchol z každé zdrojové SCC komponenty jako reprezentanta, kdyby ne, tak nemá jak vytvořit prime implikáty v nějaké zdrojové komponentě rezolucí a tedy nereprezentuje $f$ a je vždy jen jeden reprezentant z irredundantnosti, protože zbytek si odvodí rezolucí, tedy musí mít stejné velikosti, protože počet reprezentantů je stejný.

---
## Algoritmus pro minimalizaci kvadratických CNF
_Vstup:_ Kvadratická CNF $F$
1. Zkonstruujeme primární irredundantní CNF $F \equiv F'$ a oddělme $F' = F_{q} \land F_{L}$ (čistě kvadratické a lineární, jsou na různých proměnných)
2. Když $F_{q} \equiv 0$ tak to bylo odhaleno v kroku 1. Tedy $F_{q}$ je Hidden Horn. Změňme $F_{q}$ na $\hat{F}$ Horn a nechť $\hat{F} = \hat{F}_{H} \land \hat{F}_{N}$, kde $\hat{F}_{N}$ je minimální (v kroku 1. z lemma 3).
3. Minimalizujeme $\hat{F}_{H}$ (1 pozitivní a 1 negativní literál) vyřešme grafovým algoritmem pro tranzitivní redukci.
### Grafový algoritmus pro implikační graf
Vezmeme implikační graf a předěláme ho na takový, který má stejný tranzitivní uzávěr, ale minimalizuje počet hran. Takže detekujeme v našem případě SCC a změníme je na cyklus, tím minimalizujeme počet hran a tedy počet klauzulí.