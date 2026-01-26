# Popis
V přihrádce máme jeden prvek. Fixujeme jednu hashovací funkci $h$. Každý prvek $x$ má vyhledávací posloupnost (permutaci přihrádek), tedy máme
$$
h(x,i) = i\text{=tý prvek posloupnosti }i=0,1,\dots,m-1
$$
### Insert(x)
Přidáme ho na první volnou $i$ pro $h(x,i)$
### Find(x)
Projdeme posloupnost, dokud nenarazíme na $x$ nebo prázdnou buňku.
### Delete(x)
Najdeme-li $x$ tak ho označíme za tombstone abychom nerozbili ostatní.
## Implementace
**Lineární přidávání** 
$$
h(x,i) = h(x) + i \mod m
$$

---
# Analýza hash lineárním přidáváním plně náhodnou hešovací funkcí a např. třetinovým zaplněním
### *Věta:* Nechť $m \geq 3n$ a $m = 2^k$ a mějme $h: \mathcal{U} \to[m]$ plně nezávislou. Pak $\forall y \in \mathcal{U}: \mathbb{E}[\#\text{kroků při } Find(y)] \in O(1)$.
*Důkaz:* Cílem je dokázat, že $R$ je souvislý blok paměti, tak 
$$
\mathbb{E}[|R|] \in O(1).
$$
Definujme bloky jako části paměti velikosti $2^t$ a řekneme o něm, že je kritický, když je do něj zahashováno alespoň $\frac{2}{3}\cdot 2^t$ prvků. 

### Černovova nerovnost: Nechť $X_{1},\dots,X_{n} \in \{ 0,1 \}$ jsou n.n.v. a $X = X_{1}+ \dots+X_{n}$ mějme $\mu = \mathbb{E}[X]$ pak $\forall c > 0: \Pr[X \geq c \cdot \mu] \leq \left( e^{c-1}/c^c \right)^\mu$.
### *Lemma 1:* $\Pr[B \text{ o délce } 2^t \text{ je kritický}] \leq \left( \frac{e}{4} \right)^{2^t/3}$. ($q = \left( \frac{e}{4} \right)^{1/3} \approx 0,877$)
*Důkaz:* Pro prvek $x_{i} \in T$ mějme indikátor $X_{i}$, zda je $h(x_{i})\in T$. Pro $m = 3n$.
$$
\mu = \mathbb{E}[X] = \mathbb{E} \left[ \sum X_{i} \right] = \sum \mathbb{E} [X_{i}] = n \cdot \frac{2^t}{m} \leq \frac{2^t}{3}
$$
Tedy to zda je prvek kritický máme
$$
\Pr[B \text{ o délce } 2^t \text{ je kritický}] = \Pr\left[ X > \frac{2}{3}2^t \right]  \leq \Pr[X > 2 \mu] \stackrel{\text{Chernoff}}{\leq} \left( \frac{e}{4} \right)^\mu 
$$
tedy přesně znění lemma.
### *Lemma 2:*  Mějme $R$ úsek obsazených buněk délky $\geq 2^{t+2}$ a mějme $B_{0}, B_{1} B_{2},B_{3}$ první čtyři bloky $R$ délky $2^t$, pak alespoň jeden musí být kritický.
*Důkaz:* Pro spor předpokládejme, že ani jeden není kritický, pak začátek $R$ má délku podmnožínu $L$ pronikající se se všemi bloky $|L| \geq 3 \cdot 2^t +1$. Všechny prvky z $L$ jsou i hashovány do $L$, protože před $L$ je prázdná buňka. Pokud jsou všechny nekritické, tak $4$ bloky mohou obsahovat maximálně 
$$
4 \cdot \frac{2}{3} 2^t = \frac{8}{3} 2^t < 3 \cdot 2^t
$$
prvků, tedy méně než jich je v $L$, tedy spor.

### *Lemma 3:* Nechť $R$ je obsazený úsek s $h(y)$ a $|R| \in [2^{j+2}, 2^{j+3})$. Pak je aspoň jeden z následující $12$ bloků velikosti $2^j$ kritický: blok obsahující $h(y)$ 8 před ním a 3 po něm.
*Důkaz:* $R$ proniká mezi $4$ až $9$ bloky dané velikosti $2^j$. Tedy začne nejdříve o 8 bloků dříve než $h(y)$ a dle předešlého lemma je jeden z nich kritický a stejně, když začne v $h(y)$.

Máme pro $R$ obsahující $h(x)$ pravděpodobnost pro $|R| \in [2^{j+2}, 2^{j+3})$ omezenou $12 \cdot (e / 3)^{2^j / 3} = 12 \cdot q^{2^j}$. 
$$
\mathbb{E}[|R|] \leq 3 \cdot \mathrm{Pr}[|R| \leq 3] + \sum_{\ell \geq 0} 2^{\ell+3} \cdot \mathrm{Pr}[|R| \in [2^{\ell+2}, 2^{\ell+3}]]
$$
a tedy
$$
\mathbb{E}[|R|] \leq 3 \cdot \Pr[|R| \leq 3] + \sum_{\ell \geq 0} 2^{\ell+3} \cdot 12 \cdot q^{2^\ell}
$$
pro $q\in (0,1)$ taková suma konverguje, tak očekávaná hodnota $|R|$ je nejvýše konstantní.
$$
3\cdot \Pr[|R| \leq 3] + \sum_{\ell \geq 0} 2^{\ell+3} \cdot 12 \cdot q^{2^\ell} \leq 3 + O(1) \cdot \sum_{i=1}^\infty i \cdot q^i.
$$

---
# Výhody
- Sekvenční přístup do pole
- Cache friendly
---
# Nevýhody
- Potřeba velmi nezávislých rodin hashovacích funkcí
- Mazání je neelegantní kvůli tombstones a rebuildy
