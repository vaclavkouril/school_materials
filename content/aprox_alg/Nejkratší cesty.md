# S-t cesta
Mějme $\mathcal{S}= \{ S \subseteq  V: s \in S, t \not\in S \}$ množina řezů.
$$
\min \sum_{e \in E} c_{e}x_{e}
$$
lineární podmínky
$$
\forall S\in \mathcal{S}: \sum_{e\in \delta(S)} x_{e}\geq 1
$$
$$
\forall e\in E: x_{e} \in \{ 0,1 \}, \text{pro relaxaci } \geq 0
$$
kde $\delta$ jsou hrany mezi $S$ a $S^c$, pak duál relaxace je
$$
\max \sum_{S\in \mathcal{S}} y_{S}
$$
s podmínkami
$$
\forall e\in E: \sum_{S\in \mathcal{S}: e \in \delta (S)} y_{S} \leq c_{e}
$$
$$
\forall S \in \mathcal{S}: y_{S} \geq 0
$$
Pak máme algoritmus, že 
1. $y\leftarrow{0}, F \leftarrow \emptyset$
2. Dokud není $s-t$ cesta ve $(V,F)$ tak
	1. Nechť $C$ je souvislá komponenta grafu $(V,F)$ obsahující $s$
	2. Zvětšujeme $y_{C}$ dokud není nějaká z rovnic s $c_{e}$ splněna s rovností a takovou hranu $e'$ přidáme do $F$
3. Nechť $P\subseteq F$ cesta $s-t$ ve $(V,F)$, tu vydáme za výstup

#### Invariant $F$ je vždy strom s vrcholem $s$
Induktivně, vždy přidáme hranu mezi stromem a vrcholem se kterým není propojen, tedy stále strom.

#### Lemma $y_{S}>0\implies|P \cap \delta(S)|=1$
Pro spor předpokládejme, že je to jiné než $1$, tedy máme pod-cestu $P'$ mezi dvěma body toho průniku, dle $y_{s}>0$ víme, že jsme ho museli zvětšit, to děláme jen když pak hledáme hranu a protože $F$ byl tou dobou strom tak by $F\cup P'$ musela být s cyklem, ale to je spor.

### Věta: algoritmus najde nejkratší cestu 
Máme $c_{e}=\sum_{S:e\in\delta(S)} y_{S}$
$$
\sum_{e\in P}c_{e} = \sum_{e\in P} \sum_{S:e\in\delta(S)} y_{S} = \sum_{S: s\in S, t\not\in S} |P \cap \delta(S)|y_{S}
$$
Když je $y_{S}>1$ tak platí Lemma a tedy dle slabé věty o dualitě máme
$$
\sum_{e\in P}c_{e} =  \sum_{S: s\in S, t\not\in S}  y_{S} = OPT.
$$

---
# $s_{i}-t_{i}$ cesty pro více $i$
Mějme $\mathcal{S_{i}}= \{ S_{i} \subseteq  V: |\{s_{i}, t_{i}\} \cap S_{i} |=1\}$, pak máme 
$$
\min \sum_{e \in E} c_{e}x_{e}
$$
podmínky
$$
\forall S \in \mathcal{S_{i}} \text{pro nějaké }i: \sum_{e\in \delta(S)} x_{e}\geq 1
$$
$$
\forall e\in E: x_{e} \in \{ 0,1 \}, \text{pro relaxaci } \geq 0
$$
a duál
$$
\max \sum_{S \subseteq V: \exists i, S \in \mathcal{S}_{i}} y_{S}
$$
podmínky
$$
\forall e\in E: \sum_{S:e\in \delta(S)} y_{S}\leq c_{e},
$$
$$
(\exists i) S\in \mathcal{S}_{i}: y_{S}\geq 0
$$
ALG:
1. $y\leftarrow {0}, F\leftarrow \emptyset, \ell \leftarrow 0$
2. Dokud nemáme všechna $s_{i},t_{i}$ propojená v $(V,F)$ tak
	1. $\ell\leftarrow \ell+1$
	2. Nechť $\mathcal{C}$ jsou komponenty souvislosti $C$ grafu $V(F)$, že mají průnik s aspoň jedním z konců co hledáme
	3. Zvýšíme $y_{c}$ pro všechna $C\in \mathcal{C}$ najednou dokud se nějaké $e_{\ell}\in\delta(C'), C'\in <\mathcal{C}$ $c_{e_{\ell}}=\sum_{S: e\in \delta(S)}y_{S}$
	4. $F\leftarrow F\cup  \{ e_\ell \}$
3. $F' \leftarrow F$
4. Pro $k$ od $\ell$ do $1$
	1. Když $F'-e_{k}$ je stále přípustné řešení tak $e$ odstraníme
5. Vrátíme $F'$ 

#### Lemma: Pro libovolné $\mathcal{C}$ v libovolné iteraci algoritmu platí $\sum_{C\in \mathcal{C}} |\delta(\mathcal{C}) \cap F|\leq 2|\mathcal{C}|$
Mějme $F_{i}=\{ e_{1},\dots,e_{i-1} \}$ a $H= F'-F_{i}$, zjevně $H \cup F_{i} = F' \cup F_{i}$, tvrdíme, že hrany $H$ jsou hrany které se nesmí odstranit, aby řešení bylo přípustné.

Mějme $(V,F_{i})$, kde každá komponenta souvislosti se nahradí jedním vrcholem. $H$
má v takovém grafu $(V')$ hrany jen mezi komponentami souvislosti (žádná uvnitř komponent, ty byli odebrány při def.).

V takovém grafu obarvěme vrcholy na červené $R$, když v této iteraci jsou v $\mathcal{C}$ (tedy když $\exists i:|C \cap \{ s_{i},t_{i} \}|=1$) a ostatní modré $B$. 

Pak můžeme přepsat
$$
\sum_{C \in \mathcal{C}} |\delta(C) \cap F| \leq 2|\mathcal{C}|
$$
pomocí definovaného lesa $(V',H)$. (Modré vrcholy mají deg větší než $1$, 1 může mít jen ten vrchol kde cesty končí a ne jen procházejí, ale modrými můžou jen procházet)  **Levá strana** nebude nikdy větší než $\sum_{v\in R} deg(v)$ a pravá strana je $2|R|$
$$
\sum_{v\in R}deg(v) = \sum_{v\in R \cup  B}deg(v) - \sum_{v\in B}deg(v)
$$
Protože total degree je menší než 2krát počet vrcholů, tak máme
$$
\sum_{v\in R}deg(v) \leq 2(|R|+|B|) - 2|B| = 2|R|.
$$

### ALG je $2$-aproximační
Když vezmeme duální proměnné, tak máme
$$
\sum_{e\in F'}c_{e} = \sum_{e\in F'} \sum_{S:e\in\delta(S)} y_{S} = \sum_{S} |F' \cap \delta(S)|y_{S}
$$
potřebujeme dokázat
$$
\sum_{S} |F' \cap \delta(S)|y_{S} \leq 2 \sum y_{s}
$$
a dle slabé duality, lemma a indukcí máme pro $y_{S}=0$ tedy base case platí a v iteraci všechna $y_{C}$ zvýšíme o $\epsilon$ a to zvýší levou stranu o
$$
\epsilon \sum_{S} |F' \cap \delta(S)|y_{S}
$$
a pravou o
$$
2 \varepsilon|\mathcal{C}|
$$
a tedy obě strany vyrostou o stejnou hodnotu $\implies$ nerovnost platí.