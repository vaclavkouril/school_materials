*Definice:* Obarvení grafu $G$ pomocí $k$ barev je funkce $C: V(G) \to \{ 1,2,\dots,k \}$, že $\forall u,v \in V(G): \{ u,v \} \in E(G) \implies C(u) \neq C(V)$.
*Definice:* Barevnost grafu $\chi(G)$ je nejmenší $k$, že pro něj existuje obarvení grafu $G$.

*Pozorování:* $\chi(K_{k}) = k$, protože každý jeden vrchol má svou barvu a pak každému sousedovi musí přiřadit unikátní barvu tedy $1 + k-1$. 

*Definice:* Klikovost grafu $\omega(G)$ je maximální $k$ takové že $G$ obsahuje $K_{k}$ jako podgraf.

*Pozorování:* Pro každý graf platí $\chi(G) \geq \omega(G)$, protože minimálně na tu největší kliku musíme dát $\omega(G)$ barev.

---
# Hranová barevnost
*Definice:* Hranové obarvení grafu $G$ je $b: E(G) \to \{ 1,2,\dots,k \}$ pro $k \in \mathbb{N}$ taková, aby platilo 
$$
\forall e,f \in E(G), e \neq f: e \cap f \neq \emptyset \implies b(e) \neq b(f).
$$
*Definice:* **Hranová barevnost** grafu $G$ je $\chi'(G) =$ nejmenší takové $k$, aby pro něj existovalo barevné obarvení.

*Pozorováni:* Každá barva odpovídá nezávislému párování hran. Obarvit graf $\chi'(G)$ barvami znamená rozdělit hrany do $\chi'(G)$ párování.

Nechť $\Delta (G)$ je označení nejvyššího ze stupňů grafu $G$.

*Věta:* (Vizing) Pro každý graf $G$ platí, že $\Delta(G) \leq \chi'(G) \leq \Delta(G) +1$.
*Intuice za důkazem:* Dolní odhad je triviální. Zvolíme co největší podgraf $H$ na stejných vrcholech grafu $G$, jenž jde obarvit pomocí barev $B = \{ 1,2,\dots,\Delta(G)+1 \}$. Přidáme hranu do takového $H$ a můžeme konstruktivně pozorovat, že každá hrana má barvu a každý vrchol je v obležení maximálně $\Delta(G)$ barev a tedy mu alespoň jedna zůstává, tomuto vrcholu tuto _volnou_ přiřadíme, takovou barvu má tedy každý. 
Přidáme-li hranu do $H$, abychom se přiblížili konstruktivně $G$ tak máme dvě možnosti:
1. Dva nově propojené vrcholy mají nějakou volnou barvu shodnou a nové hraně ji přidáme a zase stačí $\Delta(G)+1$ barev.
2. Nemají shodu ve volných barvách. 
	Tedy máme $e_{0}$ jenž jsme přidali a jen bod má volnou barvu  a to $x$ a druhý $y_{1}$ má barvu $b_{1}$. Teď najdeme co nejdelší posloupnost různých hran z $x$, takovou že barva hrany $e_{j}$ je volná u $y_{j-1}$ vrcholu.
	Nechť $\alpha$ je volná u $y_{k}$, může se stát:
	1. $\alpha$ je volná u vrcholu $x$, pak hranu $e_{k}$ změníme za $\alpha$ a proházíme barvy u předešlých vrcholů a po-přeházíme se až k uvolnění barvy $b_{1}$ u $x$.
	2. $\alpha$ je použita na hraně $e$ incidentní s $x$, navíc $e \not\in \{ e_{1},e_{2},\dots,e_{k} \}$, to je spor s maximalitou posloupnosti.
	3. $\alpha$ použitá na hraně $e_j$, jež je někde v posloupnosti.  
		Pak označme $\beta$ volnou barvu u $x$ (existuje, protože stupeň $x$ je nejvýše $\Delta(G)$ a máme $\Delta(G)+1$ barev).
		Nyní vytvoříme **$\beta$-$\alpha$-řetězec** z vrcholu $x$ podle barev hran incidentních s $x$ a okolních vrcholů.  
		To je posloupnost střídajících se hran obarvených barvami $\beta$ a $\alpha$.
		
		Pokud tento řetězec **neobsahuje** žádný vrchol z již popsané posloupnosti ${ y_1, y_2, \dots, y_k }$, pak v něm můžeme **prohodit barvy $\beta \leftrightarrow \alpha$**.  
		Tím uvolníme barvu $\alpha$ u $x$ a jsme zpět v případě 1.
		Pokud tento řetězec **zasáhne** některý z $y_j$, zkrátíme původní posloupnost k tomuto místu a proces zopakujeme.
Celý postup má konečný počet možných barevných přiřazení, a proto proces je **vždy úspěšný**.  
Tedy každou nově přidanou hranu lze obarvit bez překročení $\Delta(G)+1$ barev.

**Souvislost s párováními:**  
  Každá barva tvoří párování hran.  
  Obarvení hran je tedy rozklad množiny hran na $\chi'(G)$ párování.

---

## Brooksova věta
*Věta:* Nechť $G$ je souvislý jednoduchý graf, který **není úplný graf** $K_n$ a **není lichý cyklus**. Pak platí:  
$$
  \chi(G) \leq \Delta(G)
  $$
  To znamená, že jen úplné grafy a liché cykly mohou vyžadovat $\Delta(G)+1$ barev.
  
# Základní metody z důkazů

### Kempeho řetězce

- Cesta nebo komponenta, kde se střídají dvě barvy (např. $a$, $b$).
- Využívá se k přepínání barev bez porušení platnosti obarvení.
- Umožňuje „uvolnit“ určitou barvu pro obarvení jiného prvku.

### Hladový algoritmus (greedy coloring)

- Procházíme vrcholy v daném pořadí a každému přiřadíme nejmenší možnou barvu.
- Zaručuje:  
  $$
  \chi(G) \leq \Delta(G) + 1
  $$
- Neposkytuje nutně optimální obarvení, ale často slouží jako výchozí metoda.

# Perfektní grafy
*Definice:* $\alpha(G)$ značí velikost největší nezávislé množiny z $G$ a $\omega(G)$ značí velikost největší kliky a $H \le G$ znamená indukovaný podgraf $H$ grafu $G$, pak **perfektní graf** je definován následovně:
### Silná věta o perfektních grafech
*Věta:* Graf $G$ je perfektní právě tehdy, když každý jeho indukovaný podgraf $H$ splňuje:  
$$
  \chi(H) = \omega(H)
  $$kde $\omega(H)$ je velikost největší kliky v $H$.

### Slabá věta o perfektních grafech
*Věta:* Pokud je $G$ perfektní, pak pro každý $H \subseteq G$ platí $\chi(H) = \omega(H)$.

## Příklady tříd perfektních grafů

- **Chordální grafy** — každý cyklus délky $\geq 4$ má **chordu** (hranu spojující dva nesousední vrcholy cyklu).  
  Všechny chordální grafy jsou perfektní.

- **Další perfektní grafy:**
- $K_{n}$
- Bipartitní grafy
- $P_{n}$
