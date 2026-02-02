# Neexepanzivní zobrazení
*Definice:* Nechť $G$ a $H$ jsou grafy, $f: V(G) \to V(H)$ je neexpanzivní zobrazení, když $\forall u,v \in V(G) : d_{H}(f(u),f(v))\leq d_{G}(u,v)$.

Definice pomocí $\forall xy \in E(G): (f(u)f(v)\in E(H) )\lor (f(u)=f(v))$ je ekvivalentní.

*Definice:* Nechť $f$ je neexpanzivní zobrazení na $G$. O $x$ řekneme, že to je **fixed point**, pokud $f(x) = x$, množinu takových bodů značme $fix(f)$. O $x$ řekneme, že je **periodic point**, pokud $\exists p\in \mathbb{N}: f^{(p)}(x) =x$, nejmenší takové $p$ značí periodu bodu $x$ a množinu všech periodic bodů označíme $per(f)$.

*Definice:* Nazveme $f$ **retrakcí**, pokud je to endomorfismus na $G$  (je z $G$ na $G$) a **weak retrakcí** pokud je to neexpanzivní zobrazení na grafu $G$ takové, že $f^{(2)}(x) = f(x)$ pro každé $x$ (je tedy idempotentní). Jinými slovy platí $rng(f) = per(f) = fix(f)$.  Podgraf $G$ indukovaný $rng(f)$ je nazván **(weak) retraktem**.

*Pozorování:* Slabé retrakty (retrakty tedy také) jsou izometrické podgrafy.

*Důkaz:* Izometrický podgraf $H$ grafu $G$ je takový, kde
$$
\forall x,y \in V(H): d_{H}(x,y)= d_{G}(x,y).
$$
#### *Lemma 5:* Nechť $f$ je neexpanzivní zobrazení na $G = (V,E)$. Pak $f^{|V|!}$ je slabou retrakcí s odpovídajícím slabým retraktem indukovaném pomocí $per(f)$.
*Důkaz:* Nechť je $g:= f^{|V|!}$ a $x$ mějme periodickým bodem $f$. Pak $x$ je fixed pointem $g$, protože jeho perioda $p$ dělí $|V|!$ (ten je vlastně součin všech možných period). Navíc platí $\forall x \in V, k \geq |V|-1$ platí $f^{(k)}(x) \in per(f)$, dávající nám $g(x),per(f)$. V důsledku dostáváme $fix(g) = rng(g)= pef(f)$, a tedy $g$ je slabá retrakce a její retrakt je indukován body $per(f)$.

*Důsledek:* Nechť $f$ je neexpanzivní zobrazení na spojitém grafu $G$, pak $per(f)$ indukuje spojitý podgraf.

To platí, protože z definice nemůžeme pomocí $f$ prodlužovat cesty (tedy ani rozpojovat souvislé komponenty, ty by zvýšili délky cest na $+ \infty$) a lemma nám ukazuje jaké vrcholy určují podgrafy z $f$.

---
# Neexpanzivní zobrazení na hyperkrychli
#### *Lemma 7:* Nechť $S \subseteq V(Q_{n})$ indukuje spojitý podgraf $Q_{n}$, nechť $g:S \to V(Q_{n})$ je zobrazení takové, že $\forall x,y \in S: d_{H}(g(x),g(y)) = d_{H}(x,y)$. Pak $g$ může být rozšířeno na automorfismus $g'$ hyperkrychle $Q_{n}$.
*Důkaz:* Zafixujme $x \in S$. Najdeme $\pi \in S_{n}$ aby platilo $g(x \oplus z) = g(x) \oplus z_{\pi}$ pro každé $x \oplus z \in S.$ Postupně budeme rozšiřovat částečné injektivní zobrazení $\pi' \subseteq [n]\times[n]$ dle úrovní vzdálenosti o $x$.
1. Začneme $\pi' = \emptyset$.
2. Když $y'=y \oplus e_{i}$ pro $y'$ na aktuální hladině a $y$ na hladině pod ním tak, že platí $g(y') = g(y) \oplus e_{j}\implies$ do $\pi'$ přidáme $(i,j)$.

Konstrukce neporuší injektivitu, protože $g$ zachovává vzdálenosti a $S$ je spojitá. Finální $\pi'$ nemusí být permutací, ale je injektivní, takže ji na $\pi$ permutaci můžeme rozšířit. 

Automorfismus rozšiřující $g$ je
$$
g'=r_{\pi} t_{x_{\pi}\oplus g(x)} \implies g'(y) = y_{\pi}  \oplus x_{\pi} \oplus g(x)
$$
kde $r$ je rotace dle $\pi$ a $t$ je translace $t(y) = y \oplus x_{\pi} \oplus g(x)$.

Zjevně $g' \restriction S = g$.

1. Jdeme-li po úrovních vzdáleností, tak je to jako BFS průchod souvislou komponentou a každý vrchol má o $1$ bližšího souseda $x$.
2. Tedy vlastně v každé úrovni přepínáme osu přemapujeme jen jaká to je osa po zobrazení.
3. Pro $y:= x \oplus z \in S$ máme 
$$
g'(y) = (x \oplus z)_{\pi}  \oplus x_{\pi} \oplus g(x) = x_{\pi} \oplus z_{\pi}  \oplus x_{\pi} \oplus g(x) = g(x) \oplus z_{\pi} = g(y).
$$

### *Tvrzení:* Nechť $f$ je neexpazivní zobrazení na $Q_{n}$. Existuje $g\in Aut(Q_{n})$ takový, že $f(x) = g(x)$. Navíc $g \restriction per(f)$ je automorfismus na podgrafu $Q_{n}$ indukované na $per(f)$.
*Důkaz:* Dle [*Lemma 5*](Medianové%20množiny%20a%202-SAT.md#*Lemma%205%20*%20Nechť%20$f$%20je%20neexpanzivní%20zobrazení%20na%20$G%20=%20(V,E)$.%20Pak%20$f%20{%20V%20!}$%20je%20slabou%20retrakcí%20s%20odpovídajícím%20slabým%20retraktem%20indukovaném%20pomocí%20$per(f)$.) máme, že $per(f)$ indukuje slabý retrakt a víme že ty jsou spojené. Navíc $d_{H}(f(x),f(y)) = d_{H}(x,y)$ pro každé $x,y \in per(f)$. Dle Lemma 7 máme $f(x) = g(x)$ ($f$ sice může nějaké vrcholy sloučit, ale to jen udělá souvislý podgraf a můžeme pak najít $g$).

Protože pro každý periodic point $x$ máme $f(x) = g(x) \in per(f)$ tak $g$ je automorfismem i na $Q_{n}[per(f)]$.

---
# Medianové grafy
*Definice*: $G$ je medianový graf pokud pro každou trojici $x,y,z$ vrcholů $G$ vyjde operace $med$ jako jednoprvková množina:
$$
\exists! a \in V(G):  med(x,y,z) = I(x,y) \cap I(y,z) \cap I(x,z) = \{ a \}.
$$
O $Q_{n}$ víme, že je to mediánový graf.

#### *Lemma 9:* Nechť $f$ je neexpanzivní zobrazení na medianovém grafu $G$ a $x,y,z$ jsou **fixed points**, pak i $a \in med(x,y,z)$ je fixed point $f$.
*Důkaz:* Nechť $m$ je $med(x,y,z) = \{ m \}$, pak máme tyto nerovnosti:
$$
\begin{split}
d_{H}(x,y) \stackrel{\Delta\text{ ineq.}}{\leq} d_{H}(x,f(m)) + d_{H}(f(m),y) \stackrel{x,y \text{ fixed pointy}}{=} d_{H}(f(x),f(m)) + d_{H}(f_{m},f(y)) \\
\stackrel{f \text{ neexpanzivní}}{\leq} d_{H}(x,m) + d_{H}(m,y) \stackrel{m \in I(x,y)}{=} d_{H}(x,y).
\end{split}
$$
Ostatní kombinace platí úplně stejně, tedy $d(x,m)$ a tedy je vynuceno aby $f(m)$ byl medianem pro $x,y,z$, ale tam máme z předpokladu jen $m$, takže $f(m) =m$.

*Poznámka:* *Lemma 9* platí i pro $per(f)$.

---
# Medianové množiny
*Definice:* Řekneme o $S \subseteq V(Q_{n})$, že je medianová množina pokud je uzavřena na operaci $med$. (v případě $Q_{n}$ vlastně na operaci majority)

*Lemma 9* tedy vlastně říká, že pro neexpanzivní zobrazení $f$ na $Q_{n}$ je $fix(f)$ medianovou množinou.

*Pozorování:* Každá spojitá medianová množina $Q_{n}$ indukuje medianový graf. (Definice medianové množiny)

*Důsledek Lemma 9:* Každý slabý retrakt medianového grafu je medianový graf. Každý slabý retrakt $Q_{n}$ je indukovaný spojitou medianovou množinou.

## Korespondence 2-CNF, medianových množin a grafů
Ve $Q_{n}$ máme
$$
\text{Množina řešení 2-CNF} \stackrel{\text{je}}{\iff} \text{medianová množina} \stackrel{\text{je}}{\iff} fix(f) \text{ neexpanzivního }f.
$$
$$
\begin{split}
 \text{Množina řešení 2-CNF, bez ekvival. proměnných} \stackrel{je}{\iff} \text{spojitá medianová množina} \\ \stackrel{\text{indukuje}}{\iff} \text{medianový graf}
\end{split}
$$
$$
\begin{split}
 \text{Množina řešení 2-CNF, bez ekvival. proměnných} \stackrel{\text{indukuje, pokud není } K_{1}}{\implies} \text{retrakt hyperkrychle} \\ \stackrel{\text{je}}{\implies}\text{slabý retrakt hyperkrychle} \stackrel{\text{je indukován}}{\implies} \text{spojitá medianová množina}
 \end{split} 
$$
---
# 2-SAT
- Předpokládejme formule bez prázdných klauzulí.
- Modely formule $\varphi$ jsou $M(\varphi)$.
- $S \models \varphi$ znamená, že každé kladné ohodnocení $S$ je kladným ohodnocením $\varphi$.
- Mějme $a\in \{ 0,1 \}$ a nechť $p^a_{i}$ je literál $p_{i}$ pokud $a=1$ a $\neg p_{i}$ když $a=0$.
#### *Lemma 13:* Množina $S \subseteq V(Q_{n})$ je medianová právě tehdy, když $S = M(\varphi)$ pro nějakou 2-CNF formuli $\varphi$ s $n$ proměnnými.
*Důkaz:* ($\impliedby$) Nechť $S$ jsou všechny modely $\varphi$. Vezměme libovolné $x,y,z \in S$, $m$ označme jejich medián (majoritu po bitech z trojice). Každá klauzule $C$ má dvě proměnné a tedy mějme $p_{i},p_{j}$. $m_{i},m_{j}$ ohodnocení se může odlišit maximálně od dvou ze $(x_{i},x_{j}),(y_{i},y_{j}),(z_{i},z_{j})$. Tedy alespoň jedno z $x,y,z$ se na $i,j$ rovná $m$. Protože každé z ohodnocení splňuje $C$, tak i $m$ splňuje $C$ a tedy $S$ je uzavřeno na $med$.

($\implies$) Nechť $S$ je medianová množina. Nechť
$$
\varphi = \{ C \mid S \models \varphi, C \text{ je 1-klauzule nebo 2-klauzule} \}.
$$
Zjevně volbou $\varphi$ platí $S \subseteq M(\varphi)$, protože plní $\varphi$ z definice. Musíme tedy dokázat, že neexistuje nic v $M(\varphi)$, co by nebylo v $S$.

Mějme $a\in M(\varphi)$, tvrdíme že musí být nutně v $S$. Pro každé $1 \leq i \leq j \leq n$ dokážeme, že máme nějaké $b^{i,j} \in S$ takové, že $b^{i,j}_{k}=a_{k}$ pro všechna $k \in [i,j]$. To uděláme indukcí začínaje na $j-i$.
1. ($i=j$) Protože $a$ splňuje $\varphi$, dostáváme  $S \not\models \neg p_{i}^{a_{i}}$ (jinak by bylo v $\varphi$, ale pak $a$ nemůže být modelem). Musí být nějaké $b^{i,i}\in S$, takové, že $b^{i,i} \not\models \neg p_{i}^{a_{i}}$ a to je $b^{i,i}_{i}=a_{i}$.
2. ($i<j$) Z indukčního předpokladu mějme $b^{i,j-1}$ a $b^{i+1,j}$ v $S$ shodující se s $a$ v daných částech. Protože $a$ splňuje $\varphi$ dostáváme $S \not\models \neg p_{i}^{a_{i}} \lor \neg p_{j}^{a_{j}}$. Tedy musí existovat $x\in S$, že $x \not\models \neg p_{i}^{a_{i}} \lor \neg p_{j}^{a_{j}}$ a sice tedy $x_{i}=a_{i}$ a $x_{j}=a_{j}$. Definujme si $b^{i,j}=med(b^{i,j-1},x,b^{i+1,j})$, z indukčního předpokladu máme rovnost $a$ a $b^{i,j}$ v každém indexu od $i$ do $j$, protože $b_{i}^{i,j-1}=x_{i}=a_{i}$, $a_{k}=b^{i,j-1}_{k}=b^{i+1,j}$ pro každé $i+1\leq k \leq j-1$ a $b^{i+1,j}=x_{j}=a_{j}$ a $b^{i,j}$ je medianem z těchto 3 vrcholů a protože $S$ je medianová množina, tak i $b^{i,j}\in S$.

Pro $i=1,j=n$ máme $b_{k}^{1,n}=a_{k}$ pro každé $k$, tedy $b^{1,n}=a$ a tedy $a$ musí nutně být také v $S$. $M(\varphi )=S$.

*Důsledek:* Nechť $S \subseteq V(Q_{n})$ je medianová množina, taková, že $\forall i,j \in[n]$ a $a,b\in \mathbb{Z}_{2}$ existuje $u\in S$ s $u_{i}=a$ a $u_{j}=b$. Pak $S=V(Q_{n})$.

*Důkaz důsledku:* Odpovídající 2-CNF $\varphi$ nemá žádné klauzule, jinak by $(x_{i}^a \lor x_{j}^b)\in \varphi$, pak pro každé $u$ máme $u_{i}=a$ nebo $u_{j}=b$.

---
Triviální proměnná $p_i$ v $\varphi$ pokud je její hodnota stejná v každém splňujícím ohodnocení, tedy $\varphi \models p_{i}$ nebo $\varphi \models \neg p_{i}$. Dvě netriviální proměnné nazveme ekvivalentní, pokud $\varphi \models p_{i} \leftrightarrow p_{j}$ nebo $\varphi \models p_{i} \leftrightarrow \neg p_{j}$. 

#### *Lemma 15:* Množina $S \subseteq V(Q_{n})$ je spojitá medianová množina právě tehdy, když $S= M(\varphi)$ pro nějakou 2-CNF formuli $\varphi$ s $n$ proměnnými, která nemá žádné ekvivalentní proměnné.
*Důkaz:* ($\implies$) nechť je $\varphi$ 2-CNF formule s ekvivalentními proměnnými $p_{i},p_{j}$, vezměme $\varphi \models p_{i} \leftrightarrow p_{j}$ (druhý způsob ekvivalence je to podobné) a nechť $S = M(\varphi)$. 
- Protože $p_{i},p_{j}$ jsou z definice ekvivalence netriviální tak máme dvě ohodnocení $a,b \in S$ s $a_{i}=a_{j}\ne b_{i} =b_{j}$, 
- Předpokládejme souvislost $S$, pak máme nějaké $c \in S$, která má stejné ohodnocení jako $a$ v jedné z $i,j$ a v druhé s $b$ (tedy je na cestě mezi $a,b$).
- $c$ ale je spor s ekvivalencí $p_{i},p_{j}$ a tedy $S$ je nespojitá.

($\impliedby$) Nechť $M(\varphi) =S$ je nespojitá pro nějakou 2-CNF (dle Lemma 13 je $S$ medianová množina). Nechť $a,b\in S$ takové aby v indukované podkrychli $Q_{n}[S]$ nebyli spojité a $d_{H}(a,b)\geq 2$ je minimální. Nechť $i,j$ jsou pozice, kde se $a,b$ liší a předpokládejme $a_{i}=a_{j} \ne b_{i} = b_{j}$ (případ pro $a_{i} \ne a_{j} = b_{i}\ne b_{j}$ je podobný) pak tvrdíme $\varphi \models p_{i} \leftrightarrow p_{j}$.
- Předpokládejme $x\in S$, že $a_{i}=x_{i}$ a $b_{j}=x_{j}$ a nechť $m \in med(a,b,x)$ (je jen jeden protože $S$ je medianová množina dle Lemma 13).
- Dle výběru $x$ platí $m_{i} =x_{i} = a_{i}$ a $m_{j}=x_{j}=b_{j}$, tedy $m$ je na nejkratší $a,b$-cestě, protože $S$ je medianová množina ale $m\ne a,b$ a to je spor s minimalitou vzdálenosti mezi $a,b$, tedy $\varphi$ nemá žádné ekvivalentní proměnné.

---
# 2-CNF a retrakty
## Implikační graf
Implikační graf 2-CNF formule $\varphi$ je $G$ s literály jako vrcholy a pro každou klauzuli $p^a \lor q^b$ máme dvě hrany $(p^{1-a},q^b),(q^{1-b},p^a)$.

*Definice:* 2-CNF formule $\varphi$ je acyklická (tranzitivně uzavřená), když její implikační graf je acyklický.

Každá (vyřešitelná) 2-CNF formule je převoditelná na acyklickou, protože můžeme vyměnit komponenty silné souvislosti za novou proměnnou.

*Pozorování:* Implikační graf 2-CNF formule bez dvou ekvivalentních proměnných je skoro acyklický, až na silně souvislé komponenty odpovídající ekvivalentním proměnným.
## Retrakty
#### *Lemma 3:* (Netriviální) množina řešení 2-CNF formule $\varphi$ na $n$ proměnných indukuje retrakt na $Q_{n}$.
*Důkaz:* Předpokládejme, že  $\varphi$ je trazitivně uzavřené. Vezměme nejdříve případ, kde $\varphi$ nemá triviální proměnné, tedy je acyklická (nemá ani ekvival.). Pro klauzuli $C = (x_{i}^a \lor x_{j}^b)$ formule $\varphi$ definujeme *gate*
$$
g_{C}(x)=\begin{cases}
x &\text{když } x \models C, \\
x \oplus e_{i} \oplus e_{j} &\text{jinak.}
\end{cases}
$$
$g_{c}$ je vlastně retraktem na $Q_{n}$. 

Protože je $\varphi$ acyklické, tak můžeme seřadit klauzule $C_{1} \land C_{2}\land \dots\land C_{r}$ tak aby $C_{1},\dots,C_{j-1}\not\models C_j$ pro každé $j\leq r$. Zobrazení $f= g_{C_{1}} g_{C_{2}}\dots g_{C_{r}}$ (booleovský obvod) je endomorfismus na $Q_{n}$. Pro $S=M(\varphi)$ zjevně
$$
u \in S \implies \forall i \in \{ 1,\dots,r \} : g_{C_{i}}(u) = u \implies f(u)=u,
$$
tedy každé řešení $\varphi$ je fixed pointem $f$ a tedy stačí ukázat, že $rng(f) \subseteq S$.

*Pomocné tvrzení:* (v netriviální 2-CNF $\varphi$) Pro každé $l\geq0$, když $u\in rng(g_{C_{1}}g_{C_{2}}\dots g_{C_{l}})$ pak $u \models C_{1} \land C_{2} \land\dots \land C_{l}$.

*Důkaz pomocného tvrzení:* Indukce na $l$. Pro $l=0$ je tvrzení prázdné. Nechť $C_{l} = (x_{i}^a \lor x^b_{j})$ a $v \in rng(g_{C_{1}}g_{C_{2}}\dots g_{C_{l-1}})$ a $u= g_{C_{l}}(v)$, tedy $u \models C_{l}$, Musíme ukázat, že $u\models C_{p}$ pro všechna $p\leq l$. Oddělujeme následující možnosti:
1. $C_{p}$ neobsahuje $x_{i},x_{j}$, pak vezmeme redukci $v=u$.
2. $C_{p}=(x_{i}^a \lor x_{k}^c)$ pro nějaké $k \ne j$ a $c \in \{ 0,1 \}$. Pak $v_{i}=a \Rightarrow u_{i} =a$ nebo $v_{i}=c \Rightarrow u_{k}=v_{l}=c$.
3. $C_{p}=( \neg x_{i}^a \lor x_{k}^c)$ pro nějaké $k \ne j$ a $c \in \{ 0,1 \}$. Pak $C_{p},C_{l}\models ( x_{j}^b \lor x_{k}^c)$. Protože je $\varphi$ tranzitivní a dle seřazení klauzulí, tak je toto již splněné pomocí $v$ dle indukce, takže $v_{j}=b \Rightarrow u_{j}=v_{j}=b$ nebo $v_{k}=c \Rightarrow u_{k}=v_{k}=c$.
4. $C_{p}=(x_{i}^a \lor \neg x_{j}^b)$, tak $C_{P},C_{l} \models x_{i}^a$ a tedy by $x_{i}$ bylo triviální proměnná a taková dle předpokladu nemůže být, stejně i pro $C_{p}=(\neg x_{i}^a \lor x_{j}^k)$.
5. $C_{p}=(\neg x_{i}^a \lor \neg x_{j}^b)$, pak máme $C_{p},C_{l} \models x_{i}^a \leftrightarrow x_{j}^b$. Tedy máme ekvivalentní proměnné a to se dle předpokladu nestane.

Aplikujeme-li pomocné tvrzení pro $l=r$, tak máme $u \in rng(f) \implies r\in S$. Tedy $rng(f)=fix(f)=S$ a $f$ je retrakce na $Q_{n}$.

Pokud máme triviální proměnnou $x_{i}^a$, tak ji můžeme díky netrivialitě $\varphi$ odstranit a aplikovat endomorfismus
$$
h_{i,j}(x) = \begin{cases}
x \oplus e_{i} \oplus e_{j} &\text{když } x_{i} \ne a, \\
x &\text{jinak.}
\end{cases}
$$
kde $j$ je index nějaké netriviální proměnné.

---
# Vztahy
### *Věta 5:* Nechť $S \subseteq V(Q_{n})$ netriviální. Následující výroky jsou ekvivavalentní:
1. $S$ je spojitá medianová množina,
2. $S$ indukuje medianový graf,
3. $S$ je množina řešení 2-CNF formule bez ekvivalentních proměnných,
4. $S=rng(f)$ pro nějakou retrakci $f$ na $Q_{n}$ (indukuje retrakt).

*Důkaz:*
- $1. \stackrel{\text{Lemma 15}}{\iff}  3. \stackrel{\text{Lemma 3}}{\implies} 4.,4. \implies 1.$,
- $1\implies 2$ dle *Pozorování:* Každá spojitá medianová množina $Q_{n}$ indukuje medianový graf. (Definice medianové množiny),
- $2\implies 1$ z definice, protože medianový graf je daný majoritou a pokud je indukovaný graf medianový tak je uzavřen na majoritu a tedy je to i množina.
### *Věta 6:* Množina $S \subseteq V(Q_{n})$ je medianová množina $\iff$ $S=fix(f)$ pro nějaké neexpanzivní zobrazení $f$ na $Q_{n} \iff$ $S$ je množina řešení nějaké 2-CNF formule.

--- 
# Fixed cube věta
*Definice:* Distance center spojitého grafu $G=(V,E)$ je množina vrcholů $x$, která minimalizuje sumu $\sum_{y\in V} d(x,v)$. 

#### *Lemma 8:* Distance center spojité medianové množiny $S \subseteq V(Q_{n})$ je podkrychle $Q_{n}$.
*Důkaz:* Nechť $S = rng(f)$ odpovídající retrakce $f$. Nechť $C$ je množina vrcholů $x$ z $Q_{n}$, minimalizující $\sum_{y\in S} d(x,y)$ pro každé $x \in V(Q_{n})$, 
$$
\sum_{y\in S} d(f(x),y) = 
\sum_{y\in S} d(f(x),f(y)) \leq 
\sum_{y\in S} d(x,y).
$$
Když $x \not\in S$, tak $d(f(x),f(x))=0 < d(x,f(x))$, takže $x\not\in C$. Takže $C \subseteq S$. Můžeme ale přepsat $\sum_{y\in S}d(x,y)=\sum_{i\in[n]} d(x_{i},y_{i})$ definujme $s\in \{ 0,1,* \}^n$ pomocí
$$
s_{i} = \begin{cases}
x_{i} &\text{když } \sum_{y\in S} d(x_{i},y_{i}) < \sum_{y\in s} d(\overline{x}_{i},y_{i}), \\
* &\text{když } \sum_{y\in S} d(x_{i},y_{i}) = \sum_{y\in s} d(\overline{x}_{i},y_{i}).
\end{cases}
$$
Pak $C= Q_{n}[s]$, což je podkrychle $Q_{n}$ ($*$ jsou ty kde je celá podkrychle a $0,1$ jsou zafixované, tedy nejsou relevantní pro pokrychli).

*Definice:* Fixed cube $C$ neexpanzivního zobrazení $f$ na $Q_{n}$ je podkrychle taková, že $f(C)=C$ (ne nutně bod po bodu).

### *Věta 10:* Každé neexpanzivní zobrazení $f$ na $Q_{n}$ má fixed cube.
*Důkaz:* Díky [Lemma 9](#*Lemma%209%20*%20Nechť%20$f$%20je%20neexpanzivní%20zobrazení%20na%20medianovém%20grafu%20$G$%20a%20$x,y,z$%20jsou%20**fixed%20points**,%20pak%20i%20$a%20in%20med(x,y,z)$%20je%20fixed%20point%20$f$.) a jeho aplikovatelnosti i na $per(f)$ máme, že je to spojitá medianová množina a $f \restriction S$ je automorfismus na $\left\langle S \right\rangle$. Distance centrum $C$ je invariantní vůči automorfismům. Tedy $f \restriction C$ je automorfismus na $\left\langle C \right\rangle$, Dle *Lemma 8* je to podkrychle a tedy i fixed cube $f$.

*Důsledek:* Každý medianový graf obsahuje podkrychli invariantní vůči všem automorfismům (neexpanzivním zobrazením).