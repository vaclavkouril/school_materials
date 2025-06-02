*Definice:*
- **Strom** je souvislý acyklický [graf](mff_statnice/discrete_math/graph_theory/Základní typy grafů)
- **Les** je acyklický graf, tedy soubor stromů
- **List** je vrcholem stromu s $\deg(v) = 1$ 

*Věta:* Strom s alespoň 2 vrcholy má alespoň 2 listy
*Důkaz: uvažme nejdelší cestu. Její krajní vrcholy jsou listy, jelikož:
- pokud z nich vede cesta někam zpět do sebe, tak graf není strom
- pokud z nich vede cesta někam, kde jsme ještě nebyli, tak není nejdelší

*Věta*: (charakteristika stromu) následující tvrzení o stromu $G$ jsou ekvivalentní:
1. **standardní:** $G$ je souvislý a acyklický
2. **jednoznačná souvislost:** mezi každými vrcholem $x,y$ vede právě 1 cesta
3. **minimální souvislost:** $G$ je souvislý a $\forall e \in E(G): G-e$ souvislý není
4. **maximální acykličnost:** $G$ je acyklický a $\forall e \in \binom{V(G)}{2} \setminus E(G): G + e$ obsahuje cyklus
5. **Eulerova formule:** $G$ je souvislý a $∣E(G)∣=∣V(G)∣−1$
*Důkaz:*
- $1 \to 5$ indukcí
	- $n=1$ jasně platí
	- $n+1 \to n$ mějme $G$ s $n+1$ vrcholy, každý strom má dva listy a odebráním jednoho odebereme 1 z obou stran rovnice
- $1\to 2$ indukcí
	- $n=1$ platí
	- po přilepení vrcholu, tak abychom měli stále acyklický souvislý graf, tak zachováme všechny staré cesty a do vrcholu ke kterému jsem přilepili náš nový $x$ existovala dle indukčního předpokladu právě jedna jedna cesta a tedy přes jednu hranu co jsme přidali nemůže vzniknou více cest do $x$.
- $5\to 3$ indukcí
	- $n=2$ platí
	- $n \to n+1$ rozpadne-li se na $n$ vrcholech, tak přidáním jedné hrany a jednoho vrcholu jako to vyžaduje $5.$ tak se na $n+1$ vrcholech graf $G$ zase rozpadne.
 - $2 \to 4$
	 - acykličnost platí 
	 - přidáním hrany vytvoříme cyklus a přidáme více cest než jednu
- $2\to 1$ 
	- je souvislý z existence cesty
	- kdyby existovala kružnice, pak existují 2 různé cesty
- $3\to 1$
	- souvislost sedí
	- kdyby existoval cyklus, tak se odstraněním nestane nesouvislý
- $4 \to 1$ kdyby nebyl souvislý, tak přidání nevytvoří cyklus
- $5\to 1$ indukcí
	- existuje vrchol jenž je listem
	- koukneme na $\sum^n_{i=1} d_{i} = 2 \cdot |E(G)=2n-2$
	-  $d_{i}\geq 1$ (souvislost) a alespoň 1 je 1 (kdyby ne, tak $d_{i}>1$, což je v součtu alespoň $2n$) a máme tedy list; jeho odtržením máme podle IP (graf má po odtržení stupeň $2(n−1)−2$) strom, a po přilepení je to opět strom