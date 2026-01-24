# Velké otázky
- Definujte [Splay strom](Splay%20stromy.md). Popište, jak na něm probíhají operace Splay, Find, Insert a Delete. Popište výhody a nevýhody oproti jiným datovým strukturám, zejména vyváženým vyhledávacím stromům. Vyslovte a dokažte větu o amortizované složitosti operace Splay. ️✅
- Definujte [a,b strom](a,b%20stromy.md). Popište, jak na něm probíhají operace Find, Insert a Delete. Vyslovte a dokažte větu o amortizovaném počtu změn uzlů pro operace Insert a Delete v (a,2a)-stromech. Jak se to liší pro (a,2a−1)-stromy? Popište výhody a nevýhody oproti jiným datovým strukturám, zejména vyváženým binárním vyhledávacím stromům.
- Definujte I/O model pro správu [cache](Cache.md) a srovnejte cache-aware a cache-oblivious algoritmy. Vyslovte a dokažte Sleatorovu–Tarjanovu větu o kompetitivnosti LRU. Popište přínos této věty pro analýzu cache-oblivious algoritmů.
- Definujte c-univerzální a k-nezávislé rodiny hešovacích funkcí. Uveďte příklady, kde nestačí c-univerzální rodina hešovacích funkcí, ale musíme použít k-nezávislou rodinu. Formulujte a dokažte větu o střední hodnotě počtu kolizí nového prvku $y$ s reprezentovanou množinou v hešování s řetězci, tj. o střední délce řetězce, do kterého bychom přidali $y$ (jde o větu na str. 1 v \[L kap. 6\]). Ukažte příklady c-univerzálních a k-nezávislých rodin pro hešování přirozených čísel. Pro jeden příklad dokažte c-universalitu nebo k-nezávislost, pro $k \ge 2$. [[Hash otázka]] ✅
- Popište a analyzujte hešování s [lineárním přidáváním](Lineární%20přidávání.md) s plně náhodnou hešovací funkcí a např. třetinovým zaplněním. Popište výhody a nevýhody oproti jiným datovým strukturám, zejména založeným na hešování. 
- Definujte vícerozměrné intervalové stromy ([Range trees](Range%20trees.md)) a popište, jaké dotazy umí zpracovat. Rozeberte prostorovou složitost datové struktury a časovou složitost konstrukce a obdélníkových dotazů (bonus: včetně zrychlení zlomkovým kaskádováním).
- Definujte [sufixové pole a LCP pole](Sufixové%20a%20LCP%20pole.md). Popište a analyzujte algoritmy na jejich konstrukci (pro sufixové pole stačí ve skoro lineárním čase). Popište příklad úlohy, kterou umí tato pole efektivně řešit.
- Popište zámky a atomické operace CAS a LL/SC. Navrhněte a analyzujte bezzámkovou implementaci zásobníku. Vysvětlete problém ABA a navrhněte jeho řešení. Porovnejte paralelizaci datových struktur za použití zámků a za použití atomických operací (tzv. bezzámkové datové struktury), přičemž v obou případech vysvětlete, jaké mohou nastat problémy. [Paralelizace datových struktur](Paralelizace%20datových%20struktur.md)

# Malé otázky
- Popište [dynamické pole](Dynamické%20pole.md), tedy „nafukovací pole“ se zvětšováním a zmenšováním. Analyzujte jeho amortizovanou složitost.
- Popište [vyhledávací stromy s líným vyvažováním](Vyhledávací%20stromy%20s%20líným%20vyvažováním.md) (BB\[α\]-stromy). Analyzujte jejich amortizovanou složitost. Uveďte příklad jejich použití. ️✅
- Navrhněte operace Find, Insert a Delete na [Splay stromu](Splay%20stromy.md). Analyzujte jejich amortizovanou složitost. Větu o složitosti operace Splay stačí vyslovit, nemusíte ji dokazovat. ️✅
- Analyzujte hloubku [a,b stromy](a,b%20stromy.md). ✅
- Analyzujte k-cestný Mergesort v cache-aware modelu. Jaká je optimální volba $k$?
- Formulujte cache-oblivious algoritmus pro transpozici čtvercové matice. Rozeberte časovou složitost a I/O složitost.
- Popište systém hešovacích funkcí odvozený ze skalárního součinu. Dokažte, že je to 1-univerzální systém ze $\mathbb{Z}_p^k$ do $\mathbb{Z}_p$. [Hashování](Hashování.md##Hashování%20vektorů%20použitím%20skalárního%20násobení) ✅
- Popište systém hešovacích funkcí založených na lineární kongruenci. Dokažte, že je to 2-nezávislý systém ze $\mathbb{Z}_p$ do $[m]$ (můžete využít lemma o modulení, které zformulujte, ale nemusíte dokazovat). [Hashování](Hashování.md##Konstrukce%20$\mathcal{L}$%20a%20$\mathcal{L}'$) ✅
- Sestrojte k-nezávislý systém hešovacích funkcí ze $\mathbb{Z}_p$ do $[m]$. Zdůvodněte k-nezávislost (můžete využít lemma o modulení, které zformulujte, ale nemusíte dokazovat).  [Hashování](Hashování##Polynomiální%20hashování) ✅
- Sestrojte 2-nezávislý systém hešující řetězce délky nejvýše $L$ nad abecedou $[a]$ do $[m]$ založený na polynomech, tedy „[[rolling hash]]“. Popište výhodu použití tohoto systému oproti jiným hešovacím funkcím.
- Popište a analyzujte [Bloomův filtr](Bloomův%20filtr.md). Uveďte příklad jeho praktického použití.
- Definujte [k-d stromy](k-d%20stromy.md) a ukažte, že 2D intervalové dotazy trvají $\Omega(\sqrt{n})$.
- Ukažte, jak dynamizovat dvourozměrné intervalové stromy ([Range trees](Range%20trees.md)), stačí Insert.
- Ukažte, jak použít [sufixové pole a LCP pole](Sufixové%20a%20LCP%20pole.md) na nalezení nejdelšího společného podřetězce dvou řetězců.
- Ukažte, jak paralelizovat (a,b)-strom pomocí zámků. [a,b strom](a,b%20stromy.md) ✅

# Extra
- konstrukce [sufixového pole](Sufixové%20a%20LCP%20pole.md) v lineárním čase (Skew)
- [FM-index](FM-index.md)