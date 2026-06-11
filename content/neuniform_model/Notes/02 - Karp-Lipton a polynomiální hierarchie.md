# Karp-Lipton a polynomiální hierarchie

## Karp-Liptonova věta
Věta (Karp-Lipton):

$$
\forall k \; \exists L \in NP^{NP} \quad \text{t. ž. } L \notin SIZE(n^k,k).
$$
Jiný zápis v poznámkách: je-li $NP \subseteq P/poly$, pak kolabuje polynomiální hierarchie.

---
## Alternující Turingovy stroje

Alternující Turingovy stroje zobecňují nedeterminismus.

Strom možností výpočtu na daném vstupu $x$:
- konfigurační vrchol typu $\exists$ je přijímající, pokud alespoň jeden následník přijímá,
- konfigurační vrchol typu $\forall$ je přijímající, pokud všichni následníci přijímají.

Tento popis dává přirozené vrstvení tříd:
- $NP$ - na začátku existenciální větev,
- $coNP$ - univerzální větev,
- $NP^{NP}$ - střídání kvantifikátorů s polynomiální hloubkou.

## Oracle
Oracle pro jazyk $A \subseteq \{0,1\}^{*}$:
- zvláštní páska pro $A$,
- dotazy $u \in A$ se vyřizují v jednom kroku.

Třídy: 
- $NP^A$ je nedeterministický výpočet v poly-čase s orákulem $A$.
- $P^A$ je deterministický výpočet v poly-čase s orákulem $A$.
## Úplné problémy pro úrovně hierarchie
Definice:
$$
\Sigma_k^p\text{-SAT}=\{\varphi; \varphi \text{ je pravdivá } \Sigma_k\text{-SAT formule}\}.
$$
Příklad:
$$
\Sigma_3^p\text{-SAT}:
\exists x_1,\dots,x_n\; \forall y_1,\dots,y_n\; \exists z_1,\dots,z_n\; \varphi(x,y,z).
$$
$\Sigma_k^p$-SAT je jazyk s alternujícími kvantifikátorovými bloky.

Poznámky:
- $\Sigma_3^p$-SAT je úplný pro $NP^{NP^{NP}}$.
- $\Sigma_1^p = NP$.
- $\Pi_1^p = coNP$.
- $PH = \bigcup_k \Sigma_k^p$ je polynomiální hierarchie.
- $PH \subseteq PSPACE$.
---
## Důkaz pro $\exists L\in NP^{NP^{NP}}: L \not\in SIZE(n^k+k)$
Uvažujme jazyk
$$
\begin{split}
S = \{ a01^n01^m ; a \text{ je počáteční úsek pravdivostní tabulky funkce }\\
f : \{0,1\}^n \to \{0,1\}, \text{která je počitatelná obvody velikosti } m\}.
\end{split}
$$
Tento jazyk je v $NP$:
- pro vstup $x = a01^n01^m$ uhádneme obvod velikosti $\leq m$,
- ověříme, že $a$ odpovídá první části tabulky (prvních pár hodnot).

Idea pro jazyk $L$:

Na vstupu $x$, $|x|=n$, uhádneme prefix $a \in \{0,1\}^{n^{2k}+k}$ takový, že:
- $a$ není počitatelný obvodem velikosti $n^k+k$,
- tedy $a01^n01^{n^k +k} \notin S$,
- pokud $x$ je $j$-tý řetězec, $j<|a|$, přijmi pokud $a_j=1$,
- jinak odmítni.

$S\in NP$ protože pro vstup $y=a01^n{0}1^m$ uhodneme obvod velikosti $\leq m$ a ověříme, že $a$ je částí pravdivostní tabulky.

Problém: $a$ není jednoznačně, algoritmus může přijímat všechno, pro daný vstup zvolí $a$, které se přijme.

Řešení: definujeme jazyk $S'$ tak, že $a01^n 01^m \in S'$
- buď platí $a01^n01^m \in S$,
- nebo existuje lexikograficky menší $a'<a$ takové, že $a'01^n01^m \not \in S$.

Děláme to aby když se volí $a$ v ALG, tak se zvolí jednoznačně.

Tím získáme $S' \in NP^{NP}$ a použitím předchozího algoritmu dostaneme jazyk $L\in NP^{S'}$, který je ale charakterizovaný $x\in L$ je přijat na základě vyhodnocení funkce nespočitatelné obvodem $n^k +k$. 

Kdyby $L\in SIZE(n^k +k)$ tak vezměme $n^{2k}+k$ prvních slov délky $n$: $w_{1},\dots,w_{n^{2k}+k}$, mějme tedy malý obvod $C_{L}$ počítající $L$, pak $L(w_{i})= C_{L}(w_{i})$, ale dle definice máme $L(w_{j})=(a_{n})_{j}$, kde $a_{n}$ je mimo $S'$, pak ale dostáváme $a_{n}01^n 01^{n^k+k} \in S$ a to je spor, protože $S\subseteq S'$.
## Důkaz větou a kolaps hierarchie
Věta:
$$
\forall k\geq 0 \; \exists L \in NP^{NP} \quad \text{t. ž. } L \notin SIZE(n^k+k).
$$

Důkaz má dvě možnosti:
1. $NP \nsubseteq PSIZE = \bigcup_{k>0} SIZE(n^k+k)$; pak závěr plyne automaticky.
2. $NP \subseteq PSIZE$; pak $NP^{NP} \subseteq NP^{NP^{NP}} \subseteq NP^{NP}$ a dojde ke kolapsu úrovní hierarchie.

Pokud booleovská formule $\varphi(x_1,\dots,x_n)$ je splnitelná, pak
$$
\varphi(x_1,\dots,x_{n-1},0) \quad \text{nebo} \quad \varphi(x_1,\dots,x_{n-1},1)
$$
je splnitelná.

Tedy existují obvody $C_1,C_2,\dots,C_n$, které pomáhají řešit SAT (pro zafixovaná $x,y$), používáme předpoklad $NP \subseteq PSIZE$. Kde pro všechny body formulí $\varphi$ s velikostí $n$ ověříme
$$
C_{|\varphi|}(\varphi)=1 \iff C_{|\varphi(x,\dots,0)|}(\varphi(x_{1},\dots,x_{i-1},0)) = 1 \lor C_{|\varphi(x,\dots,1)|}(\varphi(x_{1},\dots,x_{i-1},1)) = 1
$$
kde se plně dosazené obvody vyhodnotí a tedy dostáváme rekurentní definice obvodu pro $SAT$ dle předpokladu.

Pro $C_{n}$ dostáváme vstupy typu $\varphi_{x,y}$, je to jeden obecný SAT obvod pro formule dané velikosti (a tedy ho nemusíme volit pro všechna $y$).

Pro $\Sigma_{3}$-SAT máme vlastně přepis formule $\exists x \forall y C_{n}(\varphi(x,y,z))=1$. Stroj v $NP^{NP}$ nezná $C_{n}$, ale on ho nemusí hádat pro $y$, takže vlastně můžeme udělat 
$$
\exists x \exists C_{0}, C_{1},\dots,C_{n} \forall y[\text{CorrectSAT}(C_{0},\dots,C_{n},\varphi) \land C_{n}(\varphi(x,y,z))=1].
$$
Takže vlastně nemáme $3$ alternace ale jen $2$, takový jazyk je tedy z předpokladů vyjde $\Sigma_{2}=\Sigma_{3}$.

Pokud kolabuje hierarchie, tak platí i dle předešlé věty $\forall k,\exists L\in NP^{NP^{NP}}:L \not\in SIZE(n^k+k)$, že
$$
\forall k, \exists L\in NP^{NP}: L\not\in SIZE(n^k +k).
$$