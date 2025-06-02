*Definice:* **Množinový systém** je $\mathscr{M} =\{ M_{i}: i \in I, M_{i} \subseteq X \}$, kde $I,X$ jsou konečné množiny.
*Definice:* **systém různých reprezentantů** (SRR) je funkce $f:I \to X$ splňující:
1. $\forall i \in I: f(i) \in M_{i}$, tedy z každé množiny systému volí reprezentanta
2. $f$ je prostá, tedy nezvolí dvakrát stejného reprezentanta
*Definice:* **Incidenční graf** $G_{\mathscr{M}}$ je na vrcholech $I \cup X$, kde hrana je $(x,i) \in E(G_{\mathscr{M}})$ když $x \in M_{i}$.

*Pozorování*: $\mathscr{M}$ má SRR, právě tehdy když jeho incidenční graf má párování velikosti $|I|$. Tedy $F \subseteq E: e,e'\in F, e \neq e'$ tak $e \cap e' = \emptyset$, tedy hledáme takovou $|F| = |I|$. 

*Věta:* (Hallova): Systém různých reprezentantů existuje $\iff$ $\forall J \subseteq I: \left|\bigcup_{i \in j} M_{i}\right| \geq |J|$.
*Důkaz:* (SSR $\Rightarrow$ Hallova podmínka) Zvolíme-li libovolnou $J \subseteq I$, pak platí, že $\forall j \in J \exists p_{j} \in M_{j}, p_{j} = f(j)$, tak že prvky $p_{j}$ jsou vzájemně různé, díky prostosti funkce $f$. Takže platí 
$$
|J| = |\{p_{j} \in M_{j}\ |\ j \in J\}| \leq \left| \bigcup_{j \in J} M_{j}\right|.
$$
 (SSR $\Leftarrow$ Hallova podmínka) Vezmeme incidenční graf $G_{\mathscr{M}}$ a rozšíříme ho o $z$ zdroj jako souseda vrcholů $I$ a $s$ stok jako souseda vrcholů $X$ a orientuji hrany směrem $z \to I \to X \to s$, s jednotkovými kapacitami. 
 V síti nalezneme minimální řez $R$, b.ú.n.o. $R$ neobsahuje žádné hrany mezi $I$ a $X$ (nahraditelné předcházející, či následující). Vezmeme $A = \{ i\ |\ (z,i) \in R \}$ a $B = \{ x \ | \ (x,s) \in R \}$.
 *Pozorování:* Mezi $I \setminus A$ a $X \setminus B$ nevede žádná hrana, jinak by $R$ nebyl řez.
 Na základě pozorování, tedy hrany z $I\setminus A$ vedou výhradně do $B$ $\Rightarrow \bigcup_{i \in I \setminus A} M_{i} \subseteq B \Rightarrow \left|\bigcup_{i \in I \setminus A} M_{i}\right| \leq |B|$.
 Hallova podmínka nám pro $J = I \setminus A$ dává $\bigcup_{i \in I \setminus A} M_{i} \geq |I \setminus A|$.

Dle minimaxové věty máme velikost toku $u(f) = |R| = |A| + |B| \geq |A| + |I \setminus A| = |I|$. Ale žádný tok nemůže být větší $|I|$ protože bychom potřebovali více hran než jich vede ze zdroje $z$, tedy by vznikal spor s minimalitou řezu. A tedy tok má velikost $|I|$ a definuje nám párování.

# Polynomální algoritmus pro nalezení Systému různých reprezentantů (SRR)

**Cíl:** Mějme kolekci konečných množin $\mathcal{F} = \{S_1, S_2, \dots, S_n\}$, kde každé $S_i \subseteq U$ (univerzum prvků).  
Chceme efektivně (polynomiálně) rozhodnout, zda existuje **systém různých reprezentantů** (tzn. z každé $S_i$ vybrat právě jeden prvek tak, aby žádné dva vybrané byly stejné), a v případě kladného výsledku system i konstrukčně získat.

## 1. Transformace na bipartitní párování

1. **Definice bipartitního grafu $G=(X\;\dot\cup\;Y,\;E)$:**
   - **Vrcholová množina $X$:** indexy množin  
     $$
       X \;=\; \{\,1,\,2,\,\dots,\,n\}, 
       \quad\text{kde prvek }i\in X \text{ reprezentuje množinu }S_i.
     $$
   - **Vrcholová množina $Y$:** univerzum (podmnožina $U$)  
     $$
       Y \;=\; \bigcup_{i=1}^n S_i \;\subseteq\; U.
     $$
   - **Hrany $E\subseteq X\times Y$:**  
     $$
       (i,\,y) \;\in\; E
       \quad\Longleftrightarrow\quad
       y \;\in\; S_i.
     $$
   Každá hrana spojuje „množinu“ $i\in X$ s „potencionálním reprezentantem“ $y\in Y$.

1. **Interpretace:** Hledáme tzv. **perfektní (resp. úplné) párování** (párování) z $X$ do $Y$.  
   - párování je množina hran $M \subseteq E$ taková, že žádné dva různé páry v $M$ nesdílejí vrchol (tj. žádný vrchol je v několika hranách z $M$).
   - Perfektní párování relativně vůči $X$ znamená: každé $i \in X$ je „spárováno“ právě s jedním prvkem z $Y$.  
   - Pokud existuje párování $M$ velikosti $\lvert M\rvert = \lvert X\rvert = n$, pak z každé množiny $S_i$ bereme právě ten prvek $y\in Y$, který je spojen hraničkou $(i,y)\in M$. Tím dostaneme SRR.

1. **Závěr:** Problém "existuje SRR pro $\{S_i\}$" se redukuje na standardní problém bipartitního párování:  
   > Najít párování velikosti $n$ mezi vrcholy $X$ a $Y$ v bipartitním grafu $G$.  

   Pokud takový párování existuje, odpovídá právě potřebnému systému různých reprezentantů.

---

## 2. Algoritmus Hopcroft–Karp (pro maximální bipartitní párování)

Nejčastěji se v praxi používá pro bipartitní grafy **Hopcroft–Karpův algoritmus**, který má časovou složitost
$$
  O\bigl(\sqrt{|X| + |Y|}\;\cdot\;|E|\bigr)
  \quad\text{(resp. }O\bigl(\sqrt{n + |Y|}\;\cdot\;|E|\bigr)\text{).}
$$
Postup:

1. **Inicializace**  
   - Označíme si struktury:
     - $\mathrm{pairU}[i] = \text{–1}$ pro každý $i \in X$ („není dosud spárováno“).
     - $\mathrm{pairV}[v] = \text{–1}$ pro každý $v \in Y$.
     - $\mathrm{dist}[i] = \infty$ pro $i \in X$. (Pomocné pole pro „vrstvy“ v BFS.)

2. **Fáze BFS (vrstevnicový průchod)**  
   - Vytvoříme frontu $Q$. Pro každé $i\in X$:
     - Pokud $\mathrm{pairU}[i] = -1$ (volné), nastav $\mathrm{dist}[i] = 0$ a $Q.\mathrm{push}(i)$.
     - Jinak $\mathrm{dist}[i] = \infty$.
   - Úroveň „NIL“ (virtuální) nastavíme $\mathrm{dist}[\text{NIL}] = \infty$.
   - Klasický BFS:  
     ```
     while Q není prázdná:
       i = Q.pop()
       if dist[i] < dist[NIL]:
         for každé y ∈ Adj[i]:  # prohrany (i,y)
           pokud pairV[y] = –1:
             dist[NIL] = dist[i] + 1
           jinak:
             if dist[ pairV[y] ] = ∞:
               dist[ pairV[y] ] = dist[i] + 1
               Q.push( pairV[y] )
     ```
   - Cílem je najít nejkratší vzdálenost z nějakého volného vrcholu $i\in X$ do NIL pomocí střídání hran (alternating paths).

3. **Fáze DFS (hledání augmentačních cest)**  
   - Pro každé volné $i \in X$ (takové, že $\mathrm{pairU}[i] = -1$), zkusíme rekurzivně:
     ```
     function DFS(i):
       if i ≠ NIL:
         for každé y ∈ Adj[i]:
           pokud pairV[y] = –1 nebo (dist[ pairV[y] ] = dist[i] + 1 a zároveň DFS( pairV[y] ) == true):
             pairV[y] = i
             pairU[i] = y
             return true
         # pokud se nepovedlo najít augmentační cestu z i:
         dist[i] = ∞
         return false
       return true  # když i = NIL
     ```
   - Po dokončení DFS pro všechna volná $i$ máme nalezeny všechny augmentační cesty dané délky.  

4. **Opakování**  
   - Dokud _BFS_ najde, že „NIL“ je dosažitelné (tj. $\mathrm{dist}[\mathrm{NIL}] < \infty$), opakujeme _DFS_ pro každý volný $i \in X$.  
   - Po vyčerpání augmentačních cest dané délky, spustíme znovu BFS, abychom našli další nejkratší augmentační cesty, atd.  
   - Proces končí, když BFS už nenajde žádnou augmentační cestu (tj. $\mathrm{dist}[\mathrm{NIL}] = \infty$).  

5. **Výsledek**  
   - Po skončení máme sloupec $\mathrm{pairU}[i]$ definovaný pro takové $i\in X$, které jsou spárovány. 
   - Velikost párování je počet $i\in X$, pro které $\mathrm{pairU}[i] \neq -1$. Pokud je
     $$
       \bigl|\{\;i \in X : \mathrm{pairU}[i]\neq -1\}\bigr| \;=\; n,
     $$
     pak existuje perfektní párování přesně z $X$, a tedy i SRR.  
   - Pokud je velikost méně než $n$, SRR **neexistuje**.


## 3. Pseudokód (zjednodušeně)
```
function HopcroftKarp(G):
  for i in X:
    pairU[i] = –1
  for v in Y:
    pairV[v] = –1

  párování = 0
  while BFS():
    for each i in X do:
      if pairU[i] = –1:   # i je volné
        if DFS(i) = true:
          párování = párování + 1

  return párování
```