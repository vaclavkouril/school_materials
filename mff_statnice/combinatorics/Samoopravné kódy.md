*Definice:*
- $\Sigma = \{0,1,\dots,q\}$ - abeceda 
	- $s \in \Sigma^n\dots$ slovo
- $C \subseteq \Sigma^n$ - kód
	- $c \in C\dots$ kódové slovo
	- $|C| \dots$ velikost kódu (počet kódových slov)
	- $n\dots$ délka kódu (kolik znaků mají kódová slova)
	- $k = \log_{q} |C|\dots$ dimenze kódu
- pro $x,y \in C: d(x,y) =$ # počet souřadnic ve kterých se liší
	- $d = \Delta(C) = \min_{x\neq y\in C} d(x,y)$
		- $d=1\dots$ kód se nemá jak samoopravit, žádná část informace negarantuje další část
		- $d=2\dots$ je rozpoznatelné že došlo k chybě
		- $d=3\dots$ 1 chyba je opravitelná
	- $\Delta|C| \ge 2t+1\dots$ pak opravíme $t$ chyb
- Znační kódů je $(n,k,d)-$kód dle vlastností
*Příklady:*
1. totální kód $C\subseteq \Sigma^n$
	- nemá jak napravit chyby, nic nekóduje
	- délka $=n$
	- $k = \log |C| = \log 2^n = n$
	- $d=1$
	- $(n,n,1)-$kód
2. opakovací kód délky $n$
	- délka $=n$
	- $C$ má dva prvky, 0 a 1 opakované
	- $k = \log |C| = \log 2 = 1$
	- $d=n$
	- $(n,1,n)-$kód
3. paritní kód $C\subseteq \Sigma^n, x \in C: \sum x_{i} = 0$
	- délka $=n$
	- prvky $C$ mají sudý počet jedniček
	- $k = \log |C| = \log 2^{n-1} = n-1\dots$ představme si $C$ jako libovolná slova na $\Sigma^{n-1}$, kde vždy spočteme paritu a doplníme poslední paritní bit, aby vyšel součet na $0$
	- $d=2\dots$ změna jednoho bitu změní paritu
	- $(n,n-1,2)-$kód

# Hammingův odhad
Mějme $C \subseteq \{ 0,1 \}^n$ binární kód s minimální vzdáleností $\Delta|C| \ge 2t+1$, pak platí
$$
|C| \cdot \sum_{i=0}^t\binom{n}{i} \leq 2^n
$$
*Důkaz:*
Mějme $c\in C:B(c,t)=\{ x \in \{ 0,1 \}^n  | \ d(x,t) \leq t\}$, máme soustředně všechny takové diskrétní koule pro všechny možné chyby. Tedy objem takové koule je $\sum^t_{i=0} \binom{n}{i}$.
Mezi vrcholy jsou navíc disjunktní díky tomu, že každé kódové slovo je $2t+1$ vzájemně daleko. 
A tedy máme  $|C| \cdot \text{objem koule} = |C| \cdot \sum^t_{i=0} \binom{n}{i} \le \text{počet všech slov} =2^n$.

# Perfektní kód
kód $C$ je perfektní, pokud pro něj platí Hammingův odhad s rovností.
## Hammingův kód
$\forall r\ge 2$ existuje Hammingův kód délky $n = 2^r -1$, dimenze $k = 2^r - r-1$, minimální vzdálenost $3$. $(n,k,3)-$kód.

Mějme paritní matici $P \in \Sigma^n \times\Sigma^n$ kódu $C = \{ x\ |\ Px=0  \}$.
**Definice (syndrom):** slova $z$ je $Pz$, kde $P$ je paritní matice kódu $C$.

- Perfektní: každé slovo má nejvýše jedno kódové slovo ve vzdálenosti $\leq 1$
- Efektivní dekódování pomocí _syndromu_    
- Rozšířený Hammingův kód (přidáním paritního bitu) má vzdálenost $d=4$