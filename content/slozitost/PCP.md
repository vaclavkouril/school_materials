# PCP věta (Probabilistically Checkable Proofs)
- $\mathcal{NPÚ}$ problémy jsou vzájemně převoditelné v poly-čase $\iff$ "stejně těžké" z hlediska řešitelnosti v poly-čase.
- Na $\mathcal{NP}$-těžké optimalizační problémy: stejně těžké z hlediska získání optimálního řešení.
- BATOH $\to \exists$ ÚPAS (FPTAS) a tedy $\exists \varepsilon>0$ ÚPAS vydá pro instanci $x$ řešení s relativní chybou $\leq \varepsilon$ v čase $poly(|x|, 1/\varepsilon)$.
- TSP: na vstupu je $K_{n}, d: E\to \mathbb{R}^+$ a výstupem je 

Pro TSP platí: Pokud $\mathcal{P}\ne \mathcal{NP}$ tak neexistuje poly-time aproximační algoritmus na TSP s konstantní poměrovou chybou.
- relativní chyba $\frac{f(AP)-f(OPT)}{f(OPT)}$
- poměrová chyba: $\frac{f(AP)}{f(OPT)}$ (pro min. problémy)

*Důkaz:* Sporem předpokládejme, že $\exists$ poly-time aprox. algo. $A$ pro TSP s poměrovou chybou $c$.

Nechnť $G=(V,E)$ je instance HC (Hammilton cycle). Zkonstruujeme instanci TSP:
$$
G'=(V,E'=V\times V), |V|=n, \quad d(e) = \begin{cases}
1 &e\in E  \\
c\cdot n +1 &e\not\in E
\end{cases}
$$
a stačí spustit $A(G')$, který rozhodne zda máme HC.

---
## MAX-3-SAT
- Vstup: $3-CNF$
- Výstup: ohodnocení, které maximalizuje počet splněných klauzulí ve $\varphi$.

*Značení:* 
- $val(\varphi)=\max_{\text{ohod. } \varphi} \left\{ \frac{\#\text{ splnitelných klauzulí}}{m} \right\}$ 
- $\varphi$ splnitelná $\implies val(\varphi)=1$

$\varrho$-aproximační algoritmus pro MAX-3-SAT vždy vydá ohodnocení, pro které je splněno $\geq \varrho \cdot val(\varphi) \cdot m$ klauzulí
1. $\varrho=\frac{1}{2}$ funguje GREEDY
2. $\varrho=\frac{7}{8}$ funguje pravděp. algo.

---
## Vertex-cover
- GREEDY má poměrnou chybu 2.

---
# PCP definice
*Definice (PCP verifier):* Nechť $L \subseteq \{ 0,1 \}^*$ je jazyk a $q,r:\mathbb{N}-\mathbb{N}$. Řekneme, že $L$ má $(r(n),q(n))$-PCP-verifier pokud $\exists$ poly-time pravděpod. algo. $V$ splňující:
- **Efficiency**: Pro vstup $x\in \{ 0,1 \}^*$ a RAND přístup k řetězci $\Pi\in \{ 0,1 \}^*$ (důkaz), $V$ použije $\leq r(n)$ náhodných bitů a provede $\leq q(n)$ dotazů na bity v $\Pi$. Pak vydá $V^\Pi(x)=1$ (accept $x$) nebo $V^\Pi(x)=0$ (reject $x$)
- Neadaptivní (request nejsou podmíněné na sobě navzájem)
- **Completeness** $x\in \mathcal{L}\implies \exists\Pi: \Pr[V^\Pi(x)=1] = 1$ a takové $\Pi$ se nazývá "správný důkaz".
- **Soundness** $x\not\in L \implies \forall\Pi: \Pr[V^\Pi(x)=1]\leq \frac{1}{2}$. Řekneme, že $L\in PCP(r(n),q(n))$ pokud existují konstanty $c,d>0$ takové, že $L$ má $(c \cdot r(n),d \cdot q(n))$-PCP-verifier

### Věta A: $\mathcal{NP}=PCP(\log n, 1)$.
*Poznámky:* 
1. BÚNO lze předpokládat, že důkaz $\Pi$ pro $(r,q)$-verifier má délku $\leq q \cdot 2^r$, protože na více míst v $\Pi$ se nelze podívat s nenulovou pravděpodobností.
2. $PCP(r(n),q(n)) \subseteq NTIME(2^{O(r(n))} \cdot q(n))$. Speciálně
$$
PCP(\log n, 1) \subseteq NTIME(2^{O(\log n)}) = \bigcup_{c>0} NTIME (2^{c \log n}) NTIME(2^{c \log n}) = \bigcup_{c>0} NTIME(n^c) = \mathcal{NP}
$$
3. konstanta $\frac{1}{2}$ v soundness není podstatná a lze ji nahradit jakýmkoliv $\varepsilon>0$. 

---
# Grafový neizomorfismus
Vstupem je $GNI= \{ (G_{0},G_{1}) \mid G_{0} \not\equiv G_{1} \} \in PCP(poly(n),1)$, je reprezentován $0,1$ řetězcem kódujícím jeho incidenční matici.

$x= (G_{0},G_{1})$, kde $G_{0},G_{1}$ mají $n$ vrcholů $\Pi\in \{ 0,1 \}^*$ je indukovaný kódy incidenčních matic všech grafů na $n$ vrcholech.

U "správného důkazu" $\Pi$ budeme vyžadovat alg. $\Pi(i)=b$ pro grafy s kódem $i$, které jsou izomorf. $G_{b}$ a pokud je graf s $i$ kódem izomorfní k oběma $G_{0},G_{1}$, tak je $\Pi(i)$ náhodný bit

Verifikátor $V$ vygeneruje náhodný bit $b$ a náhodou permutaci $\{ 1,\dots,n \}$ a kód $i$ příslušného grafu izomorfního s $G_{b}$. Pak otestuje $\Pi(i)$ a přijme pokud $\Pi(i)=b$.

---
### Věta B: $\exists \varrho < 1\forall L \in \mathcal{NP}$ existuje poly-time funkce $f$ mapující instance $L$ na instance 3-CNF taková, že
1. $x\in L \implies val(f(x)) =1$
2. $x\not \in L \implies val(f(x))<\varrho$

*Důsledek:* $\exists\varrho<1$ taková, že pokud existuje poly-time $\varrho$-aproximační algoritmus pro MAX-3-SAT tak $\mathcal{P}=\mathcal{NP}$. 

*Definice:* Pro $q\in \mathbb{N}$ je $q$-CSP $\varphi$ množina funkcí (constraints) $\varphi_{1},\dots,\varphi_{m}$. $\forall i: \varphi_{i}: \{ 0,1 \}^n\to \{ 0,1 \}$  a závisí na  $\leq q$ proměnných. Řekneme, že $u\in \{ 0,1 \}^n$ splňuje constraint $\varphi_{i}$, pokud $\varphi_{i}(n)=1$. Definujme $p(n)=\frac{\sum_{i=1}^m \varphi_{i}(n)}{m}$ a $val(\varphi)= \max_{u \in \{ 0,1 \}^n} \{ p(n) \}$
- MAX-3-SAT je specifický případ $q$-CSP pro $q=3$, kde každé $\varphi_{i}$ je klauzule.

*Definice:* (gap-CSP) Pro $q\in \mathbb{N}$ a $\varrho<1$ definujeme $\varrho$-GAP-$q$-CSP jako problém rozhodnout pro danou $q$-CSP instanci $\varphi$ zda (1) $val(\varphi)=1$ (ANO instance) nebo (2) $val(\varphi)<\varrho$ (NE instance). Řekneme, že $\varrho$-GAP-$q$-CSP je NPT ($\mathcal{NP}$-těžký), pokud $\forall L\in \mathcal{NP}$ existuje poly-tim funkce $f$ mapující instance $L$ na instance $q$-CSP splnující
- **Completness** $x\in L \implies val(f(x))=1$,
- **Soundness** $x\in L \implies val(f(x))<\varrho$.
  
### Věta C: $\exists q\in \mathbb{N}, 0< \varrho<1:$ $\varrho$-GAP-$q$-CSP je NPT.
triv: Věta B $\implies$ Věta C

*Důkaz:* ($\impliedby$) *technické* s trikem: libovolné $\varphi_{i}$ lze ekvivalentně reprezentovat pomocí konjunkce $2^q$ klauzulí délky maximálně $q$

A $\implies$ C

Předpokládejme $\mathcal{NP} \subseteq PCP(\log n, 1)\implies \frac{1}{2}$-GAP-$q$-CSP je NPT pro nějaké $q$

ukážme, že $3$-SAT lze redukovat na $\frac{1}{2}$-GAP-$q$-CSP.

3-SAT má PCP verifier používající $c\log n$ náhodných biťů, který položí $q$ dotazů. Pro vstup $x$ (kód 3-CNF) a $r\in \{ 0,1 \}^{c \log n}$ definujme funkci $V_{x,r}$, která dá $1$ pokud verifier akceptuje $x$ s volbami $r$. 

Tím pádem pro pevné $x$, množina $V_{x,r}$ po $r\in \{ 0,1 \}^{c\log n}$ tvoří $q$-CSP systém (každé $V_{x,r}$ závisí jenom na $q$ adresách v $\Pi$)

Nyní completness (soundness) PCP verifier $\implies$ completeness (soundness) $\frac{1}{2}$-GAP-$q$-CSP

C$\implies$ A
Předpoklad: $\varrho$-GAP-$q$-CSP je NPT pro nějaké $q\in \mathbb{N}$ a $0< \varrho<1$.

Zkonstruujeme PCP verifyer, který pokládá $q$ dotazů má $\varrho$-soundness a $c \log n$ náhodnost pro libovolný $L\in \mathcal{NP}$. Verifier funguje takto:
- udělá redukci $f(x)$ a dostane instanci $q$-CSP $\varphi$ kde $\varphi=\{ \varphi_{i}\mid 1 \leq i \leq m \}$.
- "správný důkaz" $\Pi$ je ohodnocení proměnných $\varphi$, kde verifier vybere náhodně index $i$ a pomocí $q$ dotazů zjistí zda je $\varphi_{i}$ splněno.

Nyní opět completeness i soundness verifieru vyplývá ze stejných vlastností uvažovaného $\varrho$-GAP-$q$-CSP.