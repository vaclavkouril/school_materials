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
