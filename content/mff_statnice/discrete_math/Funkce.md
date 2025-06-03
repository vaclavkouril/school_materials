*Definice:* [Relace](Množiny a zobrazení#Relace) $F$ je zobrazení (funkce), jestliže pro libovolná $u,v,w$ platí
$$
(\langle u,v \rangle \in F \land \langle u,w\rangle \in F) \to v = w.
$$
O $F$ řekneme, že je zobrazením třídy $X$ do třídy $Y$, a píšeme $F: X \to Y$, jestliže $\text{Dom}(F) = X$ a $\text{Rng}(F) \subseteq Y$.

# Typy funkcí
*Definice:* Funkce $F: A \to B$ je 
- **na**, je-li $\text{Dom}(F) = X$ a $\text{Rng}(F) = Y$.
- **prostá**, je-li i inverzní relace $F^{-1}$ zobrazením.
- **bijekce**, je-li zároveň **na** i **prostá**.
# Počítání funkcí

*Věta:* Mějme funkci $f: A \to B$ a $|A| = a$, $|B| = b$, pak počet funkcí $f$ je $b^a$.
*Důkaz:* Pro každý z prvků $A$ máme $b$ možností kam ho zobrazit.

*Věta:* Mějme množinu $x$, pro ní platí $|2^x| = 2^{|x|}$.
*Důkaz:* Pro $y \subseteq x$ zavedeme charakteristickou funkci $C_{y}: x \to \{ 0,1 \}$, která pro $\forall a \in y: C_{y}(a) = 1$, jinak je $0$. 
Každá taková funkce určuje unikátní podmnožinu, tedy se vlastně ptáme kolik existuje funkcí mezi $n$-prvkovou množinou $x$ a $\{ 0,1 \}$ a sice $2^n$.

*Věta:* Mějme funkci $f: A \to B$ a $|A| = a$, $|B| = b$, pak počet prostých funkcí $f$ je
$$
\frac{b!}{(b-a)!} = \prod^{a-1}_{i=0} (b-i) = b^{\underline{a}}
$$
*Důkaz:* Pro první prvek $A$ máme $b$ možností kam ho zobrazit, ale pro další už jen $b-1$ atd. než nám dojdou prvky z $b$. $b\ge a$ platí kvůli prostosti.

Počet $k$-tic prvků z $X$ je $F: \{ 1,2,\dots,k \}\to X$ je pro $|X| =n$
$$
n\cdot(n-1)\cdot \ldots \cdot(n-k + 1).
$$
# Permutace
*Definice:* **Permutace** je bijekce na stejné množině, tedy bijektivní $F: X \to X$.

*Definice:* **Pevný bod** permutace $p: X \to X$ je $x \in X$ takové, že $p(x) = x$. 

*Věta:* Počet bijekcí mezi $X$ a $X$, tedy **permutací** je $n!$ pro $|X|=n$.
*Důkaz:* Jedná se o speciální případ věty o počtu prostých funkcí.