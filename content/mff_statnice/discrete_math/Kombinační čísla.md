*Definice:* Mějme množinu $X$ a $k \in \mathbb{N}$, pak definujeme množinu všech podmnožin velikosti $k$ jako
$$
\binom{X}{k} = \{ A \subseteq X : |A| = k \}.
$$
*Definice:* Kombinační číslo ([zobecněné](mff_statnice/combinatorics/Zobecněná binomická věta)) pro $n,k \in \mathbb{N}$, kde $n \ge k$ je 
$$
\binom{n}{k} = \frac{n!}{k! \cdot(n-k)!}.
$$
*Věta:* Pro množinu $X$ a číslo $k \in \mathbb{N}, k \le |X|$ platí $|\binom{X}{k}| = \binom{|X|}{k}$.
*Důkaz:* Počet uspořádaných $k$-tic prvků z $X$ je stejný jako počet prostých funkcí $\{ 1,2,3,\dots,k \} \to X$ (tedy $k$-prvkových množin), kterých je $n \cdot (n-1) \cdot \ldots \cdot (n-k+1)$ krát $k!$ jako počet permutací těch $k$ prvků.

*Vlastnosti:*
1. Počet prázdných podmnožin $= 1 =$ počet podmnožin se stejným počtem prvků jako původní množina.
2. Počet jednoprvkových podmnožin $\binom n 1 = n = \binom{n}{n-1}$ tedy stejně jako těch kde jeden prvek chybí.
3. Počet všech podmnožin je $\sum^n_{k=0} \binom n k = 2^n$, protože je to jako $n$-bitové číslo pro jednu podmnožinu rozhodujíc, zda prvek patří či ne do podmnožiny.
4. $k$-prvková podmnožina buď obsahuje nebo neobsahuje daný prvek, tedy máme zbytek míst a buď jedno místo zabrané či ne, jinak zapsáno
$$
\binom n k = \binom{n-1}{k} + \binom{n-1}{k-1}.
$$
# Binomická věta
*Věta:* 
$$
\forall n \in N, \forall a,b \in R: (a+b)^r = \sum^n_{k=0} \binom{n}{k} a^{n-k}b^k
$$
*Důkaz:* Jedná se jen o součty součinů, kde se ze závorek vybírá $a$ nebo $b$. $a^{n-k}b^k$ nám určuje to že máme $n$ závorek a musíme vybrat z každé jedno či druhé a binomický člen nám udává kolika způsoby to tak jde.