# Prohledávání do šířky BFS
$$
\begin{align}
&\text{BFS} \\
&\text{Vstup: Graf } G=(V,E) \text{ a počáteční vrchol } v_{0} \\
&\text{1.  Pro všechny vrcholy } v \in V:\\
&\text{2.  }\quad stav(v) \leftarrow nenalezený \\
&\text{3.  }\quad D(v) = \emptyset, P(v) =\emptyset \\
&\text{4.  }stav(v_{0}) \leftarrow otevřený \\
&\text{5.  } \text{Založíme frontu } Q \text{ s vrcholem }v_{0} \\
&\text{6.  Dokud není fronta } Q \text{ prázdná}:\\
&\text{7.  }\quad \text{Odebereme vrchol z } Q \text{ a označíme ho }v: \\
&\text{8.  }\quad \forall w, \text{ následníky v}: \\
&\text{9.  }\quad\quad \text{Je-li } stav(w) = nenalezený:  \\
&\text{10.  } \quad\quad\quad stav(w) \leftarrow oteveřený \\
&\text{11.  } \quad\quad\quad D(w) \leftarrow D(v)+1, P(w) \leftarrow v \\
&\text{12.  } \quad\quad\quad \text{Přidáme }w \text{ do fronty } Q \text{.} \\
&\text{13.  } \quad\quad stav(v) \leftarrow uzavřený  
\end{align}
$$
*Složitost:* BFS doběhne v čase $O(m+n)$ a spotřebuje $\Theta(n+m)$ paměti.
# Prohledávání hloubky DFS
$$
\begin{align}
&\text{DFS} \\
&\text{Vstup: Graf } G=(V,E) \text{ a počáteční vrchol } v_{0} \\
&\text{1.  Pro všechny vrcholy } v \in V:\\
&\text{2.  }\quad stav(v) \leftarrow nenalezený \\
&\text{3.  }\quad D(v) = \emptyset, P(v) =\emptyset \\
&\text{4.  }stav(v_{0}) \leftarrow otevřený \\
&\text{5.  } \text{Založíme zásobník } S \text{ s vrcholem }v_{0} \\
&\text{6.  Dokud není fronta } Q \text{ prázdná}:\\
&\text{7.  }\quad \text{Odebereme vrchol z } S \text{ a označíme ho }v: \\
&\text{8.  }\quad \forall w, \text{ následníky v}: \\
&\text{9.  }\quad\quad \text{Je-li } stav(w) = nenalezený:  \\
&\text{10.  } \quad\quad\quad stav(w) \leftarrow oteveřený \\
&\text{11.  } \quad\quad\quad D(w) \leftarrow D(v)+1, P(w) \leftarrow v \\
&\text{12.  } \quad\quad\quad \text{Přidáme }w \text{ do zásobníku } S \text{.} \\
&\text{13.  } \quad\quad stav(v) \leftarrow uzavřený  
\end{align}
$$
*Složitost:* BFS doběhne v čase $O(m+n)$ a spotřebuje $\Theta(n+m)$ paměti.

---
# Topologické třídění orientovaných grafů

*Definice:* Mějme orientovaný graf $G = (V, E)$. Řekneme, že **topologické uspořádání** grafu je lineární uspořádání $\leq$ na množině $V$ takové, že:
$$
\forall (u,v) \in E: \quad u \leq v
$$
Tzn. každý vrchol musí být ve výstupním pořadí dříve než jeho následníci.

*Poznámky:* 
- Takové uspořádání existuje **právě tehdy**, když graf **neobsahuje orientovaný cyklus**, tj. je **acyklický (DAG)**. 
- Topologické uspořádání obecně **není jediné** a může jich být více.
## Konstrukce topologického uspořádání
### 1. Odtrhávání zdrojů
Zdrojem nazveme vrchol, jehož vstupní stupeň (počet hran do něj) je $0$.
$$
\begin{align}
&\text{TopSortRemoveSources} \\
&\text{Vstup: Orientovaný graf }G=(V,E) \\
&\text{Výstup: Topologické uspořádání vrcholů } \\
&\text{1. } \text{Inicializujeme frontu } Q \text{ zdrojovými vrcholy (stupeň 0)} \\
&\text{2. } T \leftarrow [\,] \text{ (výstupní seznam)} \\
&\text{3. } \text{Dokud } Q \text{ není prázdná:} \\
&\text{4. }\quad u \leftarrow Q.\text{pop()} \\
&\text{5. }\quad T.\text{append}(u) \\
&\text{6. }\quad \text{Pro každého souseda } v \text{ vrcholu } u: \\
&\text{7. }\quad\quad \text{Odebereme hranu } (u,v) \text{ z } G \\
&\text{8. }\quad\quad \text{Pokud stupeň } v \text{ klesne na 0: přidáme } v \text{ do } Q \\
&\text{9. } \text{Pokud } |T| < |V| \text{ ⇒ graf má cyklus ⇒ žádné topologické uspořádání} \\
&\text{10.} \text{Jinak vrátíme } T
\end{align}
$$
### 2. Pomocí hloubkového prohledávání (DFS)
Při zpětném návratu z DFS (post-order) přidáme vrcholy do zásobníku.
Výstupem je zásobník v **opačném pořadí**, tedy topologické uspořádání.
$$
\begin{align}
&\text{TopSortDFS} \\
&\text{Vstup: Orientovaný graf }G=(V,E) \\
&\text{Výstup: Topologické uspořádání vrcholů } \\
&\text{1. } \text{Navštíveno } \leftarrow \emptyset, \quad S \leftarrow [\,] \\
&\text{2. } \text{Pro každé } v \in V: \\
&\text{3. }\quad \text{Pokud } v \notin \text{Navštíveno: DFS(v)} \\
&\text{4. } \text{Funkce DFS(u):} \\
&\text{5. }\quad \text{Označíme } u \text{ jako navštívený} \\
&\text{6. }\quad \text{Pro každého souseda } v \text{ z } u: \\
&\text{7. }\quad\quad \text{Pokud } v \notin \text{Navštíveno: DFS(v)} \\
&\text{8. }\quad \text{Po dokončení rekurze přidáme } u \text{ do zásobníku } S \\
&\text{9. } \text{Výstup: Reverzní obsah zásobníku } S
\end{align}
$$
## Příklad
Mějme graf s vrcholy a hranami:
- Vrcholy: $V = \{A, B, C, D\}$
- Hrany: $E = \{(A, B), (A, C), (C, D), (B, D)\}$
Topologická uspořádání mohou být:
- $A, B, C, D$
- $A, C, B, D$
## Využití
- Plánování úloh (např. s předchůdci)
- Sestavování rozvrhů a kompilace programů (závislosti mezi jednotkami)
- Detekce cyklů v orientovaných grafech
*Poznámka:* Oba algoritmy mají časovou složitost $\mathcal{O}(|V| + |E|)$.

---
# Hledání cest v ohodnocených grafech
Definujeme funkcí $l: E \to \mathbb{R}$ pro každou hranu a tomu řekneme délka. 
## Dijkstrův algoritmus
$$
\begin{align}
&\text{Dijkstra} \\
&\text{Vstup: Orientovaný graf }G=(V,E) \\
&\text{Výstup: Pole vzdáleností vrcholů $h$,pole předchůdců }P \\
&\text{1.  Pro všechny vrcholy } v \in V:\\
&\text{2.  }\quad stav(v) \leftarrow nenalezený \\
&\text{3.  }\quad h(v) = + \infty \\
&\text{4.  }\quad P(v) = nedefinováno \\
&\text{5.  }stav(v_{0}) \leftarrow otevřený \\
&\text{6.  }h(v_{0}) \leftarrow 0 \\
&\text{7.  Dokud existují otevřené vrcholy}:\\
&\text{8.  }\quad \text{Vybereme otevřený vrchol }v: \\
&\text{9.  }\quad \forall w, \text{ následníky v}: \\
&\text{10.  }\quad\quad \text{Pokud } h(w) > h(v) + l(v,w):  \\
&\text{11.  } \quad\quad\quad stav(w) \leftarrow oteveřený \\
&\text{12.  } \quad\quad\quad h(w) \leftarrow h(v) + l(v,w) \\
&\text{13.  } \quad\quad\quad P(w) \leftarrow v \\
&\text{14.  } \quad\quad stav(v) \leftarrow uzavřený  
\end{align}
$$
Pro kladné délky hran dává algoritmus dobré výsledky a udělá to v čase $O(n^2)$, avšak na-implementujeme-li algoritmus s haldou, tak můžeme časovou složitost zlepšit na $O(n \cdot T_{Insert} + n \cdot T_{ExtractMin} + m \cdot T_{Decrease} )$ a s binární haldou to vychází $O((n+m)\log n)$.
## Bellman-Fordův algoritmus
 
Relaxační algoritmy jsou obecnou třídou algoritmů pro hledání nejkratších cest. Dijkstrův algoritmus je speciálním případem relaxačního algoritmu, který funguje pro nezáporné hrany. Chceme-li pracovat i se zápornými hranami (ale bez záporných cyklů), použijeme **Bellman-Fordův algoritmus**.

Přiřadíme každému vrcholu ohodnocení $h(v)$ – odhad vzdálenosti z počátečního vrcholu $v_0$. 
Na začátku:
- $h(v_0) = 0$
- $h(v) = +\infty$ pro všechna ostatní $v$
- $P(v) = \text{nedefinováno}$ (předchůdci)
Poté relaxujeme hrany – hledáme, zda by přes nějakou hranu nevedla kratší cesta do cílového vrcholu.
$$
\begin{align}
&\text{BellmanFord} \\
&\text{Vstup: Orientovaný graf } G = (V, E), \text{ ohodnocení hran } \ell(e), \text{ startovní vrchol } v_0 \\
&\text{Výstup: Nejkratší vzdálenosti } h(v) \text{ z } v_0 \text{ a pole předchůdců } P(v) \\

&1.\ \text{Pro každý } v \in V: \quad h(v) \leftarrow +\infty,\ P(v) \leftarrow \text{nedef} \\
&2.\ h(v_0) \leftarrow 0 \\

&3.\ \text{Opakuj } |V| - 1 \text{ krát:} \\
&4.\quad \text{Pro každou hranu } (u, v) \in E: \\
&5.\quad\quad \text{Pokud } h(v) > h(u) + \ell(u, v): \\
&6.\quad\quad\quad h(v) \leftarrow h(u) + \ell(u, v) \\
&7.\quad\quad\quad P(v) \leftarrow u \\

&8.\ \text{// Detekce záporného cyklu} \\
&9.\ \text{Pro každou hranu } (u, v) \in E: \\
&10.\quad \text{Pokud } h(v) > h(u) + \ell(u, v): \\
&11.\quad\quad \text{Graf obsahuje záporný cyklus – chyba} \\
\end{align}
$$
## *Správnost a analýza*
- **Fáze výpočtu:** Fáze $F_0$ otevře pouze $v_0$, každá další fáze $F_i$ relaxuje vrcholy otevřené během $F_{i-1}$.
- **Invariant F (fáze):** Po $i$-té fázi platí: $h(v) \leq$ délka nejkratší cesty z $v_0$ do $v$ s nejvýše $i$ hranami.
- **Zastavení:** Pokud graf neobsahuje záporné cykly, algoritmus se zastaví po $|V|$ fázích.
- **Složitost:** Každou hranu relaxujeme nejvýše $|V| - 1$ krát → časová složitost $O(nm)$, kde $n = |V|, m = |E|$.
### *Výhody a použití*
- Funguje i pro záporné hrany.
- Detekuje záporné cykly.
### *Porovnání s Dijkstrovým algoritmem*

| Vlastnost                 | Dijkstra                          | Bellman-Ford |
| ------------------------- | --------------------------------- | ------------ |
| Záporné hrany             | ❌                                 | ✅            |
| Detekce záp. cyklu        | ❌                                 | ✅            |
| Složitost                 | $O(n \log n + m)$ (s fib. haldou) | $O(nm)$      |
| Strategická volba vrcholu | min. $h(v)$ (pomocí haldy)        | FIFO fronta  |

---
# Minimální kostry grafu
Jako vážené grafu bereme takové, které mají nějakou funkci, která umí ohodnotit jejich hrany.
## Jarníkův algoritmus
$$
\begin{align}
&\text{Jarník} \\
&\text{Vstup: Souvislý graf } G = (V, E) \\
&\text{Výstup: Minimální kostra } T\\

&1.\ v_{0} \leftarrow \text{libovolný vrchol grafu}\\
&2.\ T \leftarrow \text{strom obsahující } v_{0} \text{ a žádné hrany} \\
&3.\ \text{Dokud existuje hrana } uv \text{ taková, že } u\in V(T), v \not\in V(T): \\
&4. \ \quad \text{Nejlehčí takovou hranu přidáme do } T \text{.}
\end{align}
$$
Takže vlastně je typický hladový algoritmus. Jarníkův algoritmus se po nejvýše $n$ iteracích zastaví a vydá nějakou kostru zadaného grafu a taková kostra je z výběru vrcholů minimální. Časová složitost je $O(nm)$ protože $n$-krát musíme překontrolovat $m$ hran.
## Borůvkův algoritmus
Jedná se o "paralelní verzi Jarníkova algoritmu", kdy pěstujeme minimální kostřičky a ty spojujeme dohromady.
$$
\begin{align}
&\text{Borůvka} \\
&\text{Vstup: Souvislý graf } G = (V, E)\text{ s unikátními váhami} \\
&\text{Výstup: Minimální kostra } T\\

&1.\ T \leftarrow (V,\emptyset)\\
&2.\ \text{Dokud $T$ není souvislý}: \\
&3.\ \quad \text{Rozložíme $T$ na komponenty souvislosti } T_{1},\dots,T_{k}\text{.} \\
&4. \ \quad \text{Pro každý strom } T \text{ najdeme nejlehčí z hran mezi } T_{i} \text{ a zbytkem grafu a označíme ji $e_{i}$.} \\
&5. \ \quad \text{Přidáme do } T \text{ hrany } \{ e_{1},\dots,e_{n} \} \text{.}

\end{align}
$$
*Tvrzení:* Borůvkův algoritmus skončí po nejvýše $\lfloor \log n \rfloor$ iteracích a najde minimální kostru.
Minimální kostra to jistě je, protože máme-li nějaký řez $R$ s nejlehčí hranou $e$, tak pak $e$ je součástí minimální kostry a taková $e$ my vlastně vždy vybíráme. 
Borůvka tedy běží v čase $O(n \cdot \log n)$

---
# Toky v sítích a Ford-Fulkerson algoritmus
[[Toky v sítích]]
Chceme najít **maximální tok** ze zdroje $z$ do stoku $s$ v orientované síti s kapacitami na hranách. Začneme nulovým tokem a **postupně ho zlepšujeme**, dokud už dál zlepšit nejde. Každý takový "zlepšovák" využívá tzv. **zlepšující (augmentační) cestu**, po které lze tok ještě zvětšit.

Klíčový nápad: **povolíme tok nejen po směru hrany, ale i proti jejímu směru** — v tom případě tok *odčítáme*.

Pro každou hranu $uv$ definujeme **rezervu** jako:
- $r(uv) := c(uv) - f(uv) + f(vu)$

To odpovídá:
- kolik můžeme přidat po směru $uv$: $c(uv) - f(uv)$
- kolik můžeme ubrat proti směru $vu$: $f(vu)$
Hrana s $r(uv) > 0$ je **nenasycená**, jinak **nasycená**.
$$
\begin{align}
&\text{FordFulkerson} \\
&\text{Vstup: Síť } (V, E), \text{ kapacitní funkce } c(e), \text{ zdroj } z, \text{ stok } s \\
&\text{Výstup: Maximální tok } f \\

&1.\ \text{Pro každou hranu } e \in E: \quad f(e) \leftarrow 0 \\

&2.\ \text{Dokud existuje nenasycená cesta } P \text{ z } z \text{ do } s: \\
&3.\quad \varepsilon \leftarrow \min\{ r(e) \mid e \in P \} \quad \text{// rezerva cesty} \\
&4.\quad \text{Pro každou hranu } uv \in P: \\
&5.\quad\quad \delta \leftarrow \min\{ f(vu),\ \varepsilon \} \quad \text{// kolik lze odečíst proti směru} \\
&6.\quad\quad f(vu) \leftarrow f(vu) - \delta \\
&7.\quad\quad f(uv) \leftarrow f(uv) + (\varepsilon - \delta) \\

&8.\ \text{Vrátíme tok } f
\end{align}
$$
Po každém kroku se velikost toku **zvětší o ε** – tedy o **kladnou hodnotu**. Pokud jsou kapacity celočíselné, tok poroste **alespoň o 1**, takže algoritmus **musí skončit** (nejvýše tolik kroků, kolik je součet kapacit všech hran do stoku).

Po zastavení víme:
- žádná nenasycená cesta neexistuje $\implies$ nelze dál zlepšovat
- definujeme množiny:
  - $A :=$ vrcholy dosažitelné ze zdroje přes nenasycené cesty
  - $B := V \setminus A$

Pak množina hran z $A$ do $B$ tvoří **řez**, který je:
- **minimální**, protože žádná hrana nemá rezervu (všechny nasycené)
- **odpovídá toku** – po řezu proudí tok rovný jeho kapacitě

Z toho plyne:
- žádný jiný tok nemůže být větší
- náš tok je **maximální**
## Správnost a zastavení
- Pro **celočíselné kapacity**: algoritmus se jistě zastaví a tok je celočíselný.
- Pro **racionální kapacity**: přeškálujeme kapacity na celá čísla a aplikujeme algoritmus stejně.
- Pro **iracionální kapacity**: algoritmus **nemusí skončit** ani konvergovat.
*Poznámka:*
- Pokud vybíráme vždy **nejkratší nenasycenou cestu**, získáme tzv. **Edmonds-Karpův algoritmus**, který je efektivnější: $O(nm²)$.
---

# Komponenty silné souvislosti v orientovaných grafech

*Definice:* Silně souvislá komponenta (SSC) je maximální množina vrcholů, ve které existuje cesta mezi každou dvojicí vrcholů v obou směrech.
$$
\begin{align}
&\text{KompSilnéSouvislosti} \\
&\text{Vstup: Orientovaný graf } G=(V,E) \\
&\text{Výstup: Seznam silně souvislých komponent} \\

&1.\ \text{Pro všechny } v\in V: \text{stav}(v)\leftarrow nenavštíven, S\leftarrow[\,] \\
&2.\ \text{Pro každé } v\in V: \text{Pokud }v\text{ nebyl navštíven: DFS1(v)} \\

&3.\ \text{Function DFS1}(u): \\
&4.\quad \text{stav}(u)\leftarrow navštíven \\
&5.\quad \forall w:(u\to w)\in E \text{ a } stav(w)=nenavštíven:DFS1(w) \\
&6.\quad S.\text{push}(u) \\

&7.\ \text{Otoříme všechny hrany }E \text{ na }E^T \\
&8.\ \text{Pro všechny } v\in V: \text{stav}(v)\leftarrow nenavštíven \\
&9.\ \text{KosarComponentes}\leftarrow[] \\
&10.\ \text{Dokud je }S\text{ neprázdné:}\\
&11.\quad u\leftarrow S.\text{pop}() \\
&12.\quad \text{Seznam }C\leftarrow[] \\
&13.\quad \text{Pro }w \text{ dosažitelné DFS2(u) ve }E^T:\ C.\text{append}(w)\\
&14.\quad \text{Přidej }C\text{ do KosarComponents}\\

&15.\ \text{Funkce DFS2}(u): \\
&16.\quad \text{stav}(u)\leftarrow navštíven, C.\text{append}(u) \\
&17.\quad \forall w:(u\to w)\in E^T \text{ a } stav(w)=nenavštíven: DFS2(w)
\end{align}
$$
*Složitost:* $O(n+m)$ – dvě DFS a přetočení hran.

---
# Dinicův algoritmus pro maximální tok

Síť je orientovaný graf s kapacitami a určeným zdrojem a stokem:
- $G = (V, E)$ je orientovaný graf.
- $z \in V$ je **zdroj**.
- $s \in V$ je **stok**.
- $c: E \to \mathbb{R}_{\ge 0}$ je funkce udávající **kapacitu** každé hrany.
- $f: E \to \mathbb{R}_{\ge 0}$ je **tok**, pokud:
  - $\forall e \in E: 0 \le f(e) \le c(e) \quad \text{(omezujeme tok kapacitami)}$
  - $\forall v \in V \setminus \{z, s\}: \sum_{u: (u,v) \in E} f(uv) = \sum_{w: (v,w) \in E} f(vw) \quad \text{(Kirchhoffův zákon)}$
Velikost toku je definována jako:
$$
|f| := \sum_{v: (z,v) \in E} f(zv) - \sum_{u: (u,z) \in E} f(uz)
$$
Rezerva udává, o kolik lze zvýšit tok přes hranu (nebo snížit v protisměru):
$$
r(uv) := c(uv) - f(uv) + f(vu)
$$
- Hrana je **nasycená**, pokud $r(uv) = 0$.
- Cesta je **nenasycená**, pokud má všechny rezervy kladné.
## Intuice Dinicova algoritmu
- Vylepšujeme tok, dokud existují nenasycené cesty.
- Místo náhodných cest používáme jen **nejkratší** cesty — to omezuje počet fází.
- V každé fázi hledáme **blokující tok**: tok, který „zasytí“ alespoň jednu hranu každé cesty.
- Postupně tak **zvyšujeme minimální délku zlepšujících cest** → algoritmus skončí.
$$
\begin{align}
&\text{Dinic} \\
&\text{Vstup: Síť } (V, E, z, s, c) \\
&\text{Výstup: Maximální tok } f \\

&1.\quad f \leftarrow 0 \\
&2.\quad \text{Opakujeme:} \\
&3.\quad\quad \text{Sestrojíme síť rezerv } R \text{ a odstraníme hrany s nulovou rezervou} \\
&4.\quad\quad \ell \leftarrow \text{délka nejkratší cesty ze } z \text{ do } s \text{ v } R \\
&5.\quad\quad \text{Pokud taková cesta neexistuje: } \text{vrátíme } f \\
&6.\quad\quad \text{Pročistíme síť (ponecháme jen nejkratší cesty)} \\
&7.\quad\quad g \leftarrow \text{Blokující tok v pročištěné síti } R \\
&8.\quad\quad f \leftarrow f + g \\
\end{align}
$$

---
$$
\begin{align}
&\text{ČištěníSítě} \\
&1.\quad \text{Rozdělíme vrcholy do vrstev podle vzdálenosti od } z \\
&2.\quad \text{Odstraníme vrcholy za vrstvou } \ell \text{ (tj. vzdálenost > } \ell) \\
&3.\quad \text{Odstraníme hrany vedoucí do stejné nebo předchozí vrstvy} \\
&4.\quad \text{Fronta } F \leftarrow \{v \ne z, s \mid \deg^{+}(v) = 0\} \\
&5.\quad \text{Dokud } F \ne \emptyset: \\
&6.\quad\quad v \leftarrow F.\text{pop()} \\
&7.\quad\quad \text{Odstraň } v \text{ a všechny hrany incidentní do } v \\
&8.\quad\quad \text{Pokud } \deg^{+}(u) = 0 \Rightarrow F.\text{push}(u)
\end{align}
$$
---
## Hledání blokujícího toku
$$
\begin{align}
&\text{BlokujícíTok} \\
&\text{Vstup: Pročištěná síť rezerv } R \\
&\text{Výstup: Blokující tok } g \\
&1.\quad g \leftarrow 0 \\
&2.\quad \text{Dokud existuje orientovaná cesta } P \text{ z } z \text{ do } s: \\
&3.\quad\quad \varepsilon \leftarrow \min\limits_{e \in P} (r(e) - g(e)) \\
&4.\quad\quad \forall e \in P: \quad g(e) \leftarrow g(e) + \varepsilon \\
&5.\quad\quad \text{Pokud } g(e) = r(e) \Rightarrow \text{odstraň hranu } e \\
&6.\quad\quad \text{Dočisti síť (jako výše)} \\
&7.\quad \text{return } g
\end{align}
$$
---
## Intuice a důkazy korektnosti
### Lemma K: Korektnost
Pokud algoritmus skončí, neexistuje cesta ze $z$ do $s$ v síti rezerv $\implies$ žádné další zlepšení toku není možné $\implies$ výstupní tok je maximální.
### Lemma C: Délka se prodlužuje
Po každé fázi se nejkratší cesta prodlouží alespoň o 1 (protože jsme nasytili všechny dosavadní nejkratší).
### Lemma S: Čas jedné fáze
Každá fáze trvá $O(nm)$, protože konstrukce vrstvené sítě a blokujícího toku lze provést v lineárním čase vzhledem k počtu hran a vrcholů.

---
## Věta: Složitost Dinicova algoritmu
- Nejvýše $n$ fází (protože délka nejkratší cesty se nejvýše $n$-krát prodlouží)
- Každá fáze trvá $O(mn)$
- $\Rightarrow O(n^2 m)$
---
# Goldbergův algoritmus pro hledání maximálního toku

## Definice

**Síť:** Orientovaný graf $G = (V, E)$ s kapacitní funkcí $c: E \to \mathbb{R}_0^+$, zdrojovým vrcholem $z \in V$ a stokem $s \in V$.

**Vlna:** Funkce $f: E \to \mathbb{R}_0^+$ je vlna, pokud platí:
- $\forall e \in E: f(e) \leq c(e)$ (nepřekračuje kapacitu hran),
- $\forall v \in V \setminus \{z, s\}: f^\Delta(v) \geq 0$, kde $f^\Delta(v)$ je přebytek toku ve vrcholu $v$.

> Každý tok je vlnou, ale ne každá vlna je tok – přebytky mohou být nenulové.

**Rezerva:** Pro hranu $e = uv$ je:
$$
r(uv) = c(uv) - f(uv)
$$
**Převedení přebytku:** Můžeme převést přebytek po hraně $uv$, pokud:
- $f^\Delta(u) > 0$
- $r(uv) > 0$
Pak pošleme tok ve výši:
$$
\delta = \min(f^\Delta(u), r(uv))
$$a aktualizujeme:
$$
\begin{align}
f^\Delta(u) &\leftarrow f^\Delta(u) - \delta \\
f^\Delta(v) &\leftarrow f^\Delta(v) + \delta \\
r(uv) &\leftarrow r(uv) - \delta \\
r(vu) &\leftarrow r(vu) + \delta
\end{align}
$$
## Intuice
Místo hledání cest postupně přesouváme přebytky ze zdroje k stoku nebo zpět. Abychom zabránili "cestování v kruhu", zavádíme **výšky** $h(v)$ a dovolujeme přesun pouze **dolů** (tj. $h(u) > h(v)$).

Když přebytek uvízne (není kam přelévat dolů), **zvedneme výšku** vrcholu.
$$
\begin{align}
&\text{Goldberg} \\
&\text{Vstup: Síť } (V, E, z, s, c) \\
&\text{Výstup: Maximální tok } f \\[6pt]

&1.\quad \text{Pro každý vrchol } v \in V: f^\Delta(v) \leftarrow 0,\ f \leftarrow 0 \\
&2.\quad \text{Inicializace výšek: } h(z) \leftarrow |V|,\ h(v) \leftarrow 0 \text{ pro } v \neq z \\
&3.\quad \text{Nastavíme } f(zv) \leftarrow c(zv),\ \forall zv \in E \\
&4.\quad \text{Pro každé takové } v: f^\Delta(v) \leftarrow c(zv) \\[6pt]

&5.\quad \text{Dokud existuje } u \in V \setminus \{z, s\} \text{ s } f^\Delta(u) > 0: \\
&6.\quad\quad \text{Pokud existuje } uv \in E \text{ s } r(uv) > 0 \text{ a } h(u) > h(v): \\
&7.\quad\quad\quad \delta \leftarrow \min(f^\Delta(u), r(uv)) \\
&8.\quad\quad\quad f(uv) \leftarrow f(uv) + \delta \\
&9.\quad\quad\quad f^\Delta(u) \leftarrow f^\Delta(u) - \delta \\
&10.\quad\quad\quad f^\Delta(v) \leftarrow f^\Delta(v) + \delta \\
&11.\quad\quad \text{Jinak: } h(u) \leftarrow h(u) + 1 \\
\end{align}
$$
---
### Invariant A (základní):
- $f$ je vždy vlna.
- Výšky $h(v)$ nikdy neklesají.
- $h(z) = n$, $h(s) = 0$.
- $f^\Delta(v) \geq 0$ pro $v \ne z$.

### Invariant S (spád):
Neexistuje hrana $uv$ s kladnou rezervou a spádem $h(u) - h(v) > 1$.

### Invariant C (cesta do zdroje):
Z každého vrcholu s $f^\Delta(v) > 0$ existuje nenasycená cesta do $z$.

### Invariant V (výšky):
$$
\forall v \in V: \quad h(v) \leq 2n
$$
---
## Důkaz korektnosti (Lemma K)
Když algoritmus skončí:
- Přebytek zůstává jen ve $z$ a $s$.
- Tedy Kirchhoffovy zákony platí → $f$ je tok.
- Pokud by nebyl maximální, existuje nenasycená cesta z $z$ do $s$.
  - Ta by překonávala výšku $n$, ale měla by nejvýš $n-1$ hran.
  - Musela by mít hranu se spádem alespoň $2$ → spor s invariantem S.
---
### **Lemma Z (počet zvednutí):**
$$
\text{Každý vrchol } v \text{ může být zvednut nejvýše } 2n \text{ krát}.
$$
**Idea důkazu:**
- Zvedáme výšku pouze tehdy, když je přebytek a nelze ho odvést žádnou hranou "dolů".
- Díky **invariantu C** víme, že když je přebytek, existuje cesta do zdroje.
- Tato cesta překonává výšku nejvýše $n$, takže pokud by výška překročila $2n$, musela by obsahovat hranu se spádem $\geq 2$ – to odporuje **invariantu S**.
### **Lemma S (nasycená převedení):**
$$
\text{Každou hranu lze nasyceně použít nejvýše } n \text{ krát } \Rightarrow \text{ celkem } nm \text{ nasycených převedení}.
$$
**Idea důkazu:**
- Mezi dvěma nasycenými převedeními po hraně $uv$ musí být vrchol $u$ zvednut o alespoň 2 (kvůli spádu).
- Výška $u$ je omezena lemmatem Z ($\leq 2n$), takže mezi každými dvěma nasycenými převedeními je minimálně 2 zvednutí.
- Tedy pro každou hranu $uv$ maximálně $n$ takových akcí.
### **Lemma N (nenasycená převedení):**
$$
\text{Počet všech nenasycených převedení je } \mathcal{O}(n^2 m).
$$
**Idea důkazu – potenciálová metoda:**
Zavádíme **potenciál**:
$$
\Phi := \sum_{v \neq z,s,\ f^\Delta(v) > 0} h(v)
$$
Pozorování:
- Potenciál se nikdy nezvýší příliš:
  - Zvednutí: $+1$ (max $2n^2$ ×)
  - Nasycené převedení: maximálně $+2n$ (celkem max $2n^2 m$)
- Ale **každé nenasycené převedení** ho sníží minimálně o 1 (odebereme $h(u)$ a přidáme max $h(v) = h(u)-1$).
Z toho plyne, že **nenasycených převedení nemůže být více než celkové zvýšení potenciálu**, tedy $\mathcal{O}(n^2 m)$.
### **Věta (složitost Goldbergova algoritmu):**
$$
\text{Goldbergův algoritmus běží v čase } \mathcal{O}(n^2 m)
$$
**Idea důkazu:**
- Sečteme počet jednotlivých operací a jejich čas:
  - Zvednutí: $\leq 2n^2$ × (každé v čase $O(n)$) → $O(n^3)$
  - Nasycené převedení: $\leq nm$ × (každé v čase $O(1)$) → $O(nm)$
  - Nenasycené převedení: $O(n^2 m)$ × (každé v čase $O(1)$) → $O(n^2 m)$
- Největší složitost dominuje, tedy výsledná složitost je:
$$
\boxed{\mathcal{O}(n^2 m)}
$$
---
# Změny v analýze algoritmů pro toky

### 1. Pokud jsou všechny kapacity hran celočíselné:
Pokud jsou všechny kapacity hran kladná celá čísla, pak **Ford-Fulkersonův algoritmus skončí po konečném počtu kroků**.
*Důkaz (intuice):*
Každá augmentační cesta zvýší tok o alespoň 1 jednotku (protože nejmenší nenulová rezerva je alespoň 1). Maximální možný tok je nejvýše součet kapacit hran ze zdroje — tj. nějaké konečné číslo $C$.
- Po každé augmentaci se hodnota toku zvětší alespoň o 1.
- Proto algoritmus skončí nejvýše po $C$ krocích.
- Pokud je maximální tok $F$, pak složitost je $O(m \cdot F)$, kde $m$ je počet hran a $F$ celkový maximální tok.
> Slabina: $F$ může být exponenciálně velké vzhledem k velikosti vstupu (např. pokud kapacity jsou velká čísla), proto algoritmus není polynomiální.

---
### 2. Pokud se Ford-Fulkerson používá s BFS (Edmonds-Karp algoritmus):
Ford-Fulkerson s výběrem augmentační cesty přes BFS (Edmonds-Karp) má časovou složitost:
$$
O(n \cdot m^2)
$$
Každá augmentační cesta je nejkratší (v počtu hran). Po každé augmentaci se délka nejkratší augmentační cesty **nikdy nezmenší**. Navíc:
- Délka augmentační cesty se může zvýšit nejvýše $n$-krát.
- Každá hrana může být "kritická" (tj. její kapacita se stane nulovou na augmentační cestě) nejvýše $O(n)$-krát.
- Jelikož je hran $m$, vznikne nejvýše $O(n \cdot m)$ augmentačních kroků.
A každý BFS běží v $O(m)$, takže složitost je $O(n \cdot m^2)$.
---

# Párování v bipartitních grafech jako problém maximálního toku

### Definice párování
- **Párování** je množina hran $F \subseteq E$, kde žádné dvě hrany nesdílejí vrchol.
- **Velikost párování** je $|F|$.

## Převod bipartitního grafu na síť
Z bipartitního grafu $G = (V, E)$ vytvoříme síť $(V', E', z, s, c)$:
- Najdeme **levou** partitu $X$ a **pravou** partitu $Y$.
- Hrany orientujeme z $X$ do $Y$.
- Přidáme:
  - **zdroj** $z$ a hrany $z \to x$ pro každé $x \in X$,
  - **stok** $s$ a hrany $y \to s$ pro každé $y \in Y$.
- Všechny hrany mají kapacitu 1: $c(e) = 1$ pro každé $e \in E'$.

---
### Korektnost: párování odpovídá toku
**Tvrdíme:** Po výpočtu maximálního toku odpovídá každá hrana s tokem 1 hraně v párování.
**Důkaz:**
- Každý vrchol $x \in X$ má z $z$ maximálně jeden tok → může být spojen s nejvýše jedním $y$.
- Každý vrchol $y \in Y$ má do $s$ maximálně jeden tok → může být spojen s nejvýše jedním $x$.
- Proto žádné dvě hrany netvoří konflikt na vrcholu: opravdu jde o párování.

---
### Úplnost: každé párování je tok
**Tvrdíme:** Každému párování $F$ odpovídá celočíselný tok.
**Důkaz:**
- Hranu $(x, y) \in F$ nahradíme třemi hranami: $z \to x$, $x \to y$, $y \to s$, každou s tokem 1.
- Celkový tok odpovídá velikosti párování.

Tím vzniká bijekce mezi množinou párování a množinou celočíselných toků velikosti $k$.

---
## Časová složitost
**Věta:** Ford-Fulkerson na síti s jednotkovými kapacitami najde maximální tok v čase $O(nm)$.
**Důkaz:**
- BFS najde augmentační cestu v $O(m)$.
- V každém kroku se tok zvětší o 1.
- Maximální tok je nejvýše $n$ (víc než $|X|$ hrany nemůžeme vybrat).
- Celkem tedy $O(n)$ kroků $\Rightarrow$ celkem $O(nm)$.

---

## Důsledek: Algoritmus pro párování
**Tvrzení:** Největší párování v bipartitním grafu lze najít v čase $O(nm)$.
**Důkaz:**
- Převod na síť: $O(n + m)$.
- Maximální tok: $O(nm)$.
- Převod zpět na párování: $O(m)$.
- Celkově tedy $O(nm)$.
