# $NL=co-NL$
$$
PATH=\{ (G,s,t) \mid \text{v } G \,\exists \text{orientovaná cesta z } s \text{ do }t \}
$$
$\log n$ dlouhá jména vrcholů. Kódujeme graf pomocí seznamu sousedů a chceme.
1. $PATH \in NL$
2. $PATH$ je $NL$-těžký
3. $co-PATH \in NL$

#### 1. $PATH \in NL$
Chceme logspace akceptor pro $PATH$.
- 3 $\log n$ velké buffery
	1. kód aktuálního vrcholu
	2. kód souseda, vybraného nedeterministicky
	3. počet kroků
- pokud počet kroků $n$ tak reject
- pokud je soused $t$, tak accept
#### 2. $PATH$ je $NL$-těžký
Mějme $X\in NL$, pak mám NTS log-space akceptora $M$. Ten si můžeme klidně předpokládat zadrátovaného do výpočtu transduceru $M'$, protože je to pro fixní jazyk konstanta (Godelovo číslo).
$$
w \in X \iff M(w) =1 \iff \exists s,t \text{ cesta v grafu konfig. }M 
$$
stačí, aby $M'$ vygeneroval popis $G_{M}$ graf konfigurací spolu s init a accept (BÚNO je jen jedna accept).

Každou konfiguraci $M$ zapíšeme do $O(\log n)$ prostoru a tedy $M'$ vygeneruje systematicky řetězce délky $O(\log n)$ a pro každý kontroluje, zda je to kód konfigurace stroje a pro něj vypíše do výstupní tabulky do jakých jiných konfigurací se dá dle $M$ v jednom kroku přejít.

$\implies M'$ pracuje v $O(\log n)$ prostoru.
#### 3. $co-PATH \in NL$
1. spočteme počet vrcholů dosažitelných z $s$ v $G$
2. spočteme je znovu když odstraníme $t$
3. přijmeme pokud 1. a 2. dají stejný výsledek

Takže stačí ukázat, že $\exists$ NTS v log-prostoru, který pro $G,s$ vydá počet vrcholů dosažených z $s$, protože pro kontrolu $2$ stačí spustit to samé, jen se přidá při výběru vrcholů kontrola, že to není $t$.

Definujme
$$
R_{i} = \{ u \mid u \text{ je dosažitelné z } s \text{ cestou délky} \leq i   \}
$$
zjevně $R_{0}=\{ s \}$ a $|R_{n}|$ je to co nás zajímá. Pro výpočet nás zajímá vždy jen $|R_{i}|$ spočtené potenciálně z $|R_{i-1}|$, které ale po využití zapomene.

Nedeterministicky hádáme $|R_{i}|$, když máme $|R_{i-1}|$ následovně:

Zkoušíme různá $0 \le g \le n$ a pro každé takové $g$ ověříme nedeterministicky
1. $|R_{i}|\geq g$
2. $|R_{i}|\leq g$

Pro 1. si nedeterministicky vybereme $g$ z $n$ vrcholů a pro každý vybraný $u$ nedeterministicky ověříme, že $\exists s,u$ cesta délky nejvýše $i$ (jako u 1. $PATH \in NL$)

U 2. nedeterministicky vybereme $n-g$ vrcholů a v lexikografickém pořadí pro vybraný $u$ ověříme, že $\forall w \in R_{i-1}: (u \ne w)$ a $(w,u)\not\in E(G)$

Paměti je potřeba
- $\log n$ na počítadlo ověřených $u \not\in R_{i}$
- $\log n$ aktuální $u$
- $\log n$ na counter ověřených $w$ pro aktuální $u$
- $\log n$ na kód aktuálního $w$
- $O(\log n)$ na verifikaci $w\in R_{i-1}$ (principiálně stejně jako $PATH \in NL$)