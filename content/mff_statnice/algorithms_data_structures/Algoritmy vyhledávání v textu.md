# Knuth-Morris-Pratt
$$
\begin{align}
&\text{KMP – vyhledávání jedné jehly} \\
&\text{Vstup: Jehla } \iota[1..J],\, \text{seno } \sigma[1..S] \\
&\text{Výstup: Všechny pozice } k \text{ tak, že } \sigma[k..k+J-1] = \iota \\

&\text{Pomocná konstrukce automatu – prefixové funkce} \\
&Z[0] \leftarrow \text{nedef},\quad Z[1] \leftarrow 0\\
&\text{for } i = 2..J:\\
&\quad s \leftarrow Z[i-1] \\
&\quad \text{while } s \ne 0 \land \iota[s+1] \ne \iota[i]:\quad s \leftarrow Z[s] \\
&\quad \text{if } \iota[s+1] = \iota[i]:\quad s \leftarrow s+1 \\
&\quad Z[i] \leftarrow s \\

&\text{Hledání znaků v seně} \\
&s \leftarrow 0 \\
&\text{for } i = 1..S:\\
&\quad \text{while } s \ne 0 \land \iota[s+1] \ne \sigma[i]:\quad s \leftarrow Z[s] \\
&\quad \text{if } \iota[s+1] = \sigma[i]:\quad s \leftarrow s+1 \\
&\quad \text{if } s = J:\ \text{ohlásíme } i-J+1,\, s \leftarrow Z[s] \\

&\text{Komplexnost: }\Theta(J + S)
\end{align}
$$

**Analýza a důkaz správnosti:**
- **Konstrukce prefix‑funkce** $Z[i]$ říká, jaký je nejdelší vlastní prefix jehly, který je zároveň suffixem $\iota[1..i]$. Tvoříme to spojenými kroky posunů přes $Z$ dopředu a zpět – každým znakem buď $s$ přibude, nebo „skočíme zpátky“ po $Z[s]$. Celkem tedy každé $i$ provede amortizovaně konstantu operací, dohromady $Θ(J)$.
- Během hledání v seně platí invariant: $s$ označuje délku nejdelšího prefixu jehly, který je_suffixem_ právě čtené části sena. Analogicky k výstavě automatu. Pohybem $while$ se „vracíme“ pomocí $Z$, pokud nedojde ke shodě, a při shodě zvyšujeme $s$. Celkem v každé pozici se provede maximálně 1 dopředný či zpětný krok, tedy $Θ(S)$.
- **Správnost**: Jakmile $s$ dosáhne $J$, máme úplné shodné $\sigma[i−J+1..i]=\iota$. Poté $s$ nastavíme na $Z[s]$, abychom mohli pokrýt i překrývající se výskyty.

---
# Aho-Corasicková

### Popis problému
Chceme nalézt všechny dvojice $(k, i)$ takové, že $\sigma[k : k + J_i] = \iota_i$, tj. jehla $\iota_i$ se vyskytuje v seně $\sigma$ na pozici $k$.

Výstup může být superlineární – například pokud jsou jehly vzájemnými sufixy.

Cílem je nalezení **všech výskytů** v čase
$$
\Theta\left( \sum_i J_i + S + V \right),
$$
kde $J_i$ jsou délky jehel, $S$ délka sena a $V$ počet výskytů.

---
### Struktura automatu
Automat se skládá z:
- **Dopředných hran**: písmenkový strom prefixů jehel.
- **Zpětných hran**: vedou do nejdelšího vlastního sufixu stavu, který je zároveň jiným stavem.
- **Zkratek**: vedou do nejbližšího koncového stavu po zpětných hranách.

U každého stavu si pamatujeme:
- $Zpět(s)$ – kam vede zpětná hrana,
- $Zkratka(s)$ – zkrácená hrana do koncového stavu,
- $Slovo(s)$ – je-li ve stavu koncové slovo,
- $Dopředu(s, x)$ – kam vede dopředná hrana po znaku $x$.

---
$$
\begin{align}
&\textbf{Procedura AcKrok (jeden krok automatu)} \\
&\text{Vstup: Jsme ve stavu } s, \text{ přečetli jsme znak } x \\
&1.\quad \text{Dokud } \text{Dopředu}(s, x) = \emptyset \land s \ne \text{kořen}: \quad s \gets \text{Zpět}(s) \\
&2.\quad \text{Pokud } \text{Dopředu}(s, x) \ne \emptyset: \quad s \gets \text{Dopředu}(s, x) \\
&\text{Výstup: Nový stav } s
\end{align}
$$
$$
\begin{align}
&\textbf{Algoritmus AcHledej (spuštění automatu na daný řetězec)} \\
&\text{Vstup: Seno } \sigma, \text{ zkonstruovaný automat} \\
&1.\quad s \gets \text{kořen} \\
&2.\quad \text{Pro znaky } x \in \sigma \text{ postupně provádíme:} \\
&3.\qquad s \gets \text{AcKrok}(s, x) \\
&4.\qquad j \gets s \\
&5.\qquad \text{Dokud } j \ne \emptyset: \\
&6.\qquad\quad \text{Je-li } \text{Slovo}(j) \ne \emptyset: \\
&7.\qquad\quad\quad \text{Ohlásíme } \text{Slovo}(j) \\
&8.\qquad\quad j \gets \text{Zkratka}(j)
\end{align}
$$
$$
\begin{align}
&\textbf{Algoritmus AcKonstrukce} \\
&\text{Vstup: Slova } \iota_1, \dots, \iota_n \\
&1.\quad \text{Založíme strom, který obsahuje pouze kořen } r \\
&2.\quad \text{Vložíme do stromu slova } \iota_1, \dots, \iota_n, \text{ nastavíme } \text{Slovo} \text{ ve všech stavech} \\
&3.\quad \text{Zpět}(r) \gets \emptyset,\quad \text{Zkratka}(r) \gets \emptyset \\
&4.\quad \text{Založíme frontu } F \text{ a vložíme do ní syny kořene} \\
&5.\quad \text{Pro všechny syny } s \text{ kořene: } \text{Zpět}(s) \gets r,\quad \text{Zkratka}(s) \gets \emptyset \\
&6.\quad \text{Dokud } F \ne \emptyset: \\
&7.\qquad \text{Vybereme } i \text{ z fronty } F \\
&8.\qquad \text{Pro všechny syny } s \text{ vrcholu } i: \\
&9.\qquad\quad z \gets \text{AcKrok}(\text{Zpět}(i), \text{písmeno na hraně } is) \\
&10.\qquad\quad \text{Zpět}(s) \gets z \\
&11.\qquad\quad \text{Pokud } \text{Slovo}(z) \ne \emptyset: \text{Zkratka}(s) \gets z \\
&12.\qquad\quad \text{Jinak } \text{Zkratka}(s) \gets \text{Zkratka}(z) \\
&13.\qquad\quad \text{Vložíme } s \text{ do fronty } F \\
&\text{Výstup: Strom, pole } \text{Slovo}, \text{Zpět}, \text{Zkratka}
\end{align}
$$
---
## Důkaz složitosti
- Každý krok v $AcHledej$ běží v čase $O(1)$ (díky zpětným a zkratkovým hranám).
- Hlásíme výskyty v čase $O(V)$.
- Konstrukce automatu běží v čase $\Theta\left(\sum J_i\right)$, protože každé hledání jedné jehly simuluje algoritmus KMP.
**Celková složitost:**  
$$
\Theta\left( \sum_i J_i + S + V \right)
$$