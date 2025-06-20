# Obecná informatika ✓
1. Kombinatorika ✓
	- [[Vytvořující funkce]] ✓
		- použití vytvořujících funkcí k řešení lineárních rekurencí
		- [[Zobecněná binomická věta]] (formulace)
		- [[Catalanova čísla]] (příklad kombinatorické interpretace, odvození vzorce v uzavřeném tvaru) 
	- [[Odhady faktoriálu a kombinačních čísel]] ✓
		- formulace základních odhadů
			- $(𝑛/𝑒)^𝑛 \leq 𝑛! \leq 𝑒𝑛(𝑛/𝑒)^𝑛$
			- $(𝑛/𝑘)^𝑘 \leq \binom{n}{𝑘} \leq (𝑒𝑛/𝑘)^𝑘$
			- $2^{2𝑚}/(2\sqrt{m}) \leq \binom{2m}{m} \leq 2^{2m}/\sqrt{2m}$
	- [[Ramseyovy věty]] ✓
		- Ramseyova věta (formulace konečné a nekonečné verze pro p-tice, důkaz verze p=2 pro 2 barvy)
		- [[Ramseyova čísla]] (definice, pro 2 barvy horní odhad z důkazu Ramseyovy věty a dolní odhad pravděpodobnostní konstrukcí)
	- [[Extremální kombinatorika]] ✓
		- obecné povědomí co extremální kombinatorika studuje
		- Turánova věta (formulace, Turánovy grafy)
		- Erdös-Ko-Radoova věta (formulace)
	- [[Samoopravné kódy]] ✓
		- přehled o používané terminologii
		- vzdálenost kódu a její vztah k počtu opravitelných a detekovatelných chyb
		- [Hammingův odhad](mff_statnice/combinatorics/Samoopravné%20kódy#Hammingův%20odhad) (formulace a důkaz) ✓
		- perfektní kódy (definice a příklady, Hammingův kód bez přesné konstrukce)
- Předměty
	- NDMI011 Kombinatorika a grafy 1 (5 kr)
	- NDMI012 Kombinatorika a grafy 2 (5 kr)
	
2. Diferenciální a integrální počet ve více rozměrech ✓
	- [[Riemannův integrál jedno- i vícerozměrný]] ✓
	- [[Funkce více proměnných]] ✓
		- parciální derivace: definice a výpočet
		- výpočet extrémů pomocí parciálních derivací
		- existence extrémů pro funkce několika reálných proměnných
		- vázané extrémy: výpočet pomocí Lagrangeových multiplikátorů
	- [[Metrický prostor]] ✓
		- definice a základní příklady
		- otevřené a uzavřené množiny: definice, příklady
		- spojitost funkce na metrickém prostoru
		- kompaktnost: definice a důsledky pro extrémy funkcí více proměnných
		- stejnoměrná spojitost
- Předměty
	- NMAI055 Matematická analýza 2 (5 kr)

3. Pokročilé algoritmy a datové struktury ✓
	- [[Dynamické programování]] ✓
		- princip dynamického programování (řešení podproblémů od nejmenších k největším)
		- aplikace: nejdelší rostoucí podposloupnost, editační vzdálenost
	- [[Grafové algoritmy]] ✓
		- komponenty silné souvislosti orientovaných grafů
		- toky v sítích (Dinicův a Goldbergův algoritmus)
		- toky v celočíselně ohodnocených grafech, aplikace na párování v bipartitních grafech
	- [[Algoritmy vyhledávání v textu]] ✓
		- algoritmy Knuth-Morris-Pratt a Aho-Corasicková
	- [[Algebraické algoritmy]] ✓
		- diskrétní Fourierova transformace a její aplikace
		- výpočet Fourierovy transformace algoritmem FFT
	- [[RSA]] ✓
		- šifrování, dešifrování a generování klíčů
	- [[Aproximační algoritmy]] ✓
		- aproximační poměr a relativní chyba
		- aproximační schémata
		- příklady: obchodní cestující, batoh
	- [[Paralelní třidění]] pomocí komparátorových sítí ✓
- Předměty
	- NDMI010 Grafové algoritmy (3 kr)
	- NMAI062 Algebra 1 (5 kr)
	- NTIN060 Algoritmy a datové struktury 1 (5 kr)
	- NTIN061 Algoritmy a datové struktury 2 (5 kr)

4. Pokročilá diskrétní matematika ✓
	- [[Barevnost grafů]] ✓
		- definice a základní vlastnosti
		- hranová barevnost (definice, formulace Vizingovy věty, souvislost s párováními v grafech)
		- Brooksova věta (formulace)
		- základní metody z důkazů Vizingovy a Brooksovy věty (Kempeho řetězce, hladový algoritmus)
		- silná a slabá věta o perfektních grafech (formulace), chordální grafy a další příklady tříd perfektních grafů
	- [[Párování v grafech]] ✓
		- definice párování a perfektního párování
		- párování v obecných grafech (formulace Tutteovy věty včetně důkazu jednodušší implikace, Petersenova věta a její důkaz použitím Tutteovy věty)
		- Edmondsův algoritmus (pouze vědět o jeho existenci)
	- [[Kreslení grafů na plochách]] ✓
		- základní topologické pojmy (homeomorfismus, křivka, plocha)
		- konstrukce ploch pomocí přidávání uší a křížítek (formulace), orientovatelné a neorientovatelné plochy, Eulerova charakteristika
		- pojem buňkového (2-cell) nakreslení
		- zobecněná Eulerova formule, její použití pro horní odhad počtu hran a minimálního stupně v grafu nakresleném na dané ploše
	- [[Grafové minory]] ✓
		- definice a základní vlastnosti
		- zachovávání nakreslení při minorových operacích
	- [[Množiny a zobrazení]] ✓
		- přehled o používané terminologii (třídy a vlastní třídy, kartézský součin, relace, zobrazení, suma, potenční množina, …)
	- [[Subvalence a ekvivalence množin]] ✓
		- definice
		- Cantorova-Bernsteinova věta (bez důkazu)
		- spočetné množiny
			- definice
			- zachovávání spočetnosti při množinových operacích
		- mohutnost množin racionálních a reálných čísel, důkaz ne-ekvivalence diagonální metodou
	- [[Dobré uspořádání]] ✓
		- definice
		- ordinální a kardinální čísla (definice)
- Předměty
	- NAIL063 Teorie množin (3 kr)
	- NDMI012 Kombinatorika a grafy 2 (5 kr)