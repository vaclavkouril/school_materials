KL 2

---
# Šifrovací schéma
Šifrovací schéma je určeno trojicí $(Gen,Enc, Dec)$ algoritmů a určením množiny zpráv $\mathscr M$, kde $|\mathscr M| > 1$. 
- $Gen$ je pravděpodobnostní algoritmus vybírající klíč $k$ pomocí nějaké pravděpodobnostní distribuce, kde $\mathscr K$ je konečná množina klíčů. 
- $Enc$ je algoritmus sloužící k zašifrování zprávy $m \in \mathscr M$ pomocí klíče $k \in \mathscr K$, tedy $Enc_{k}(m) = c$, kde $c$ je ciphertext, dovolujeme aby takový algoritmus byl pravděpodobnostní a při použití stejných vstupů, tedy není nutné, aby vždy vydal stejné $c$. $Enc_{k}(m) := c$ značí deterministický algoritmus, $c \leftarrow Enc_{k}(m)$ značí vysloveně pravděpodobnostní algoritmus.
 - $Dec$ algoritmus dekóduje zprávu z $c$ pomocí klíče a tedy $Dec_{k}(c) =m$, předpokládáme _perfektní korektnost_ a tedy, že $\Pr[Dec_{k}(c) =m] = 1$. Takový předpoklad vede k tomu, že bez újmy na obecnosti je $Dec$ deterministický.

---
# Perfektně tajné šifrovací schéma
Schéma $(Gen, Enc, Dec)$ s množinou zpráv $\mathscr M$ **je perfektně tajné**, právě tehdy když pro každou pravděpodobnostní distribuci pro $M$, tak $\forall m \in \mathscr M$ a $\forall c \in \mathscr C$, kde $\Pr[C = c] > 0$:
$$
\Pr[M= m \mid C= c] = \Pr[M =m].
$$
### Alternativní definice perfektnosti schématu
_Lemma_: Šifrovací schéma $(Gen, Enc, Dec)$ je perfektně tajné schéma s množinou zpráv $m \in \mathscr M,$ právě tehdy když platí
$$
\forall m,m' \in \mathscr M, \forall c \in \mathscr C: \Pr[Enc_{k}(m) = c] = \Pr[Enc_{k}(m') = c].
$$
_Důkaz_: Pozorujme, že pro libovolné $\mathscr M, m \in \mathscr M$, pro které $\Pr[M =m]>0$ a libovolné $c \in \mathscr C$ platí
$$
\begin{align*}
\Pr[C = c \mid M = m] &= \Pr[Enc_{K}(M) = c \mid M = m] \\
&= \Pr[Enc_{K}(m) = c \mid M = m] \\
&= \Pr[Enc_{K}(m) = c],
\end{align*}
$$
kde první rovnice je z definice náhodné veličiny $C$, druhá protože máme podmínku na to jak vlastně náhodná veličina $M$ vypadá a vzhledem k tomu, že z definice je klíč nezávislý na $M$. Zároveň se nám hodí, pro $c\in \mathscr C: \Pr[C =c] > 0$ 
$$
\Pr[M=m \mid C =c] \cdot \Pr[C = c] = \Pr[C =c \mid M = m] \cdot \Pr[M = m]. 
$$
Vezměme rovnoměrnou distribuci na $\mathscr M$. Je-li schéma perfektní, tedy $\Pr[M =m \mid C =c] = \Pr[M =m]$, tak rovnice výše ukazuje $\Pr[C =c \mid M=m] = \Pr[C = c].$ Vzhledem k tomu, že to platí pro všechna $m,m'$ a $c$, tak máme
$$
\begin{align*}
\Pr[Enc_{K}(m) = c] &= \Pr[C = c \mid M =m] \\
&= \Pr[C=c] \\
&= \Pr[C =c \mid M =m'] = \Pr[Enc_{K}(m') = c].
\end{align*}
$$
Tím jsem dokázali, perfektní tajnost schématu $\implies$ podmínku nerozeznatelnosti ciphertextů.

Máme-li platnou podmínku na pravděpodobnost rozeznatelnosti ciphertextů ke zprávám, tak zafixujeme-li si pravděpodobnostní distribuci na $\mathscr M$, tak můžeme očekávat $\forall c \in \mathscr C, \forall m \in \mathscr M: \Pr[C =c] >0$, tak i $\Pr[M=m] > 0$, protože byla by pravděpodobnost zprávy $0$, tak i víme $\Pr[M=m \mid C =c]$. $\forall c \in \mathscr C$ definujeme $p_{c} := \Pr[Enc_{K}(m) = c]$, z předpokladu a pozorování na začátku důkazu máme $\Pr[C=c \mid M =m'] = p_{c}$ pro všechna $m' \in \mathscr M$. Tedy dostáváme
$$
\begin{align*}
\Pr[C=c] &= \sum_{m'\in \mathscr M} \Pr[C=c \mid M=m'] \cdot \Pr[M=m'] \\
&= \sum_{m' \in \mathscr M} p_{c} \cdot \Pr[M=m'] = p_{c} = \Pr[C =c \mid M=m],
\end{align*}
$$
kde podle $\Pr[M=m \mid C =c] \cdot \Pr[C = c] = \Pr[C =c \mid M = m] \cdot \Pr[M = m]$ máme $\Pr[M= m \mid C =c] = \Pr[M=m],$ tedy máme perfektně tajné schéma.

---
### Perfektní (adversarial) nerozpoznatelnost
Definujme experiment $\text{PrivK}^{eav}_{\mathcal{A},\Pi}$, kde $\Pi = (Gen,Enc,Dec)$ je šifrovací schéma s prostorem zpráv $\mathcal{M}$. Nechť $\mathcal{A}$ je nepřítel (adversary), tedy nějaký algoritmus BÚNO deterministický, následovně:
1. Nepřítel $\mathcal{A}$ vydá jako výstup zprávy $m_{0},m_{1} \in \mathcal{M}$.
2. Klíčem $k$ vygenerovaným pomocí $Gen$ a zvolí se uniformně náhodný bit $b \in \{ 0,1 \}$. Ciphertext $c \leftarrow Enc_{k}(m_{b})$ je spočten a dán $\mathcal{A}$ ($c$ je zván challenge ciphertext)
3. $\mathcal{A}$ vydá bit $b'$
4. Výstup experimentu je definován jako $1$, když $b'=b$ a $0$ jinak.

U experimentu píšeme $\text{PrivK}^{eav}_{\mathcal{A}, \Pi}=1$ pokud výstup experimentu je jedna a v tom případě útočník $\mathcal{A}$ uspěje.

Triviálně uspěje s $1 / 2$ pravděpodobností tím, že bude vydávat náhodný bit $b'$.

*Definice:* Šifrovací schéma $\Pi = (Gen,Enc,Dec)$ s prostorem zpráv $\mathcal{M}$ je **perfektně nerozpoznatelné**, pokud platí
$$
\Pr[\text{PrivK}^{eav}_{\mathcal{A},\Pi} = 1] = \frac{1}{2}. 
$$

*Lemma:* Šifrovací schéma je **perfektně tajné** $\iff$ je **perfektně nerozpoznatelné**.

---
# One-time Pad
Pro konstrukci si zafixujme $\ell >0$, prostor zpráv $\mathcal{M}$ a klíčů $\mathcal{K}$ a ciphertextů $\mathcal{C}$, všechny rovné $\{ 0,1 \}^\ell$.
- $Gen$ vybere uniformně náhodně klíč z $\mathcal{K} = \{ 0,1 \}^\ell$ a pravděpodobnost na každá jeden klíč je přesně $2^{-\ell}$.
- $Enc$ s daným $k$ klíčem a zprávou $m \in \mathcal{M}$ vrátí výstup z $c:= k \oplus m$.
- $Dec$ s daným klíčem a $c \in \mathcal{C}$ ciphertextem vrátí zprávu $m := k \oplus c$.
## *Věta:* One-time pad schéma je perfektně tajné
*Důkaz:* Pro libovolné $c \in \mathcal{C}$ a $m \in \mathcal{M}$ s $\Pr[M=m]>0$. Pro one-time pad máme
$$
\begin{align}
\Pr[C=c \mid M=m] &= \Pr[K \oplus m = c \mid M= m] \\
&= \Pr[K = m \oplus c \mid M=m] \\
&= 2^{-\ell}
\end{align}
$$
první rovnost je z definice schéma a poslední rovnost protože $K$ je uniformě náhodně a nezávisle na $M$ zvolený řetězec.

Zafixujeme-li si libovolnou distribuci zpráv z $\mathcal{M}$, tak pro libovolné $c \in \mathcal{C}$ máme
$$
\begin{align}
\Pr[C=c] &= \sum_{m\in \mathcal{M}} \Pr[C=c \mid M=m] \cdot \Pr[M=m] \\
&= 2^{-\ell} \sum_{m\in \mathcal{M}} \Pr[M=m] \\
&= 2^{-\ell},
\end{align}
$$
Nyní stačí aplikovat Bayesovu větu
$$
\begin{align}
\Pr[M=m \mid C=c] &= \frac{1}{\Pr[C=c]} \cdot \Pr[C=c \mid M=m] \cdot \Pr[M=m] \\
&= \frac{1}{2^-\ell} \cdot 2^{-\ell} \cdot \Pr[M=m] \\
&= \Pr[M=m],
\end{align}
$$
odpovídající přímo definici [Perfektně tajné šifrovací schéma](#Perfektně%20tajné%20šifrovací%20schéma).

---
# Limity perfektní tajnosti
## *Věta:* Když $(Gen,Enc,Dec)$ je perfektně tajné šifrovací schéma s prostorem zpráv $\mathcal{M}$ a klíčů $\mathcal{K}$, tak $|\mathcal{K}|\geq |\mathcal{M}|$.
*Důkaz:* Předpokládejme pro spor $|\mathcal{K}|< |\mathcal{M}|$. Mějme uniformní distribuci nad $\mathcal{M}$ a nechť $c \in \mathcal{C}$ je ciphertext, který se objevuje s nenulovou pravděpodobností. Definujme
$$
M(c) := \{ m \in \mathcal{M} \mid m = Dec_{k}(c) \text{ pro nějaké } k\in \mathcal{K} \}.
$$
Zjevně $|M(c)|\leq |\mathcal{K}|$ ($Dec$ je detereministické). Když $|\mathcal{K}| < |\mathcal{M}|$, tak existuje $m' \in \mathcal{M}$ takové, že $m' \not\in M(c)$. Pak ale
$$
\Pr[M=m' \mid C=c] = 0 \neq \Pr[M=m']
$$
a tedy spor.

---
# Shannonova věta
## *Věta:* Nechť $(Gen,Enc,Dec)$ šifrovací schéma s prostorem zpráv $\mathcal{M}$, klíčů $\mathcal{K}$ a ciphertextů $\mathcal{C}$, kde $|\mathcal{M}| = |\mathcal{C}| = |\mathcal{K}|$. Schéma je perfektně tajné právě tehdy když 
1. Každý klíč $k \in \mathcal{K}$ je vybrán se stejnou pravděpodobností $1 / |\mathcal{K}|$ pomocí $Gen$.
2. $\forall m \in \mathcal{M}, \forall c \in \mathcal{C}$ existuje unikátní klíč $k \in \mathcal{K}$ takový, že $Enc_{k}(m)$ vydá $c$.

*Důkaz:* ($\impliedby$) Pro jednoduchost BÚNO $Enc$ je deterministické. Zafixujeme libovolné $c \in \mathcal{C}, m\in \mathcal{M}$, nechť $k$ je unikátním klíčem, že $Enc_{k}(m)=c$, pak
$$
\Pr[Enc_{k}(m)=c] = \Pr[K=k] = 1 / |\mathcal{K}|
$$
kde rovnost plyne z podmínky 1. Taková rovnost platí pro každé $m,c$, takže dle [Alternativní definice perfektnosti schématu](#Alternativní%20definice%20perfektnosti%20schématu) máme perfektní tajnost.

($\implies$) Předpokládejme perfektní tajnost, zafixujme si libovolné $c \in \mathcal{C}$, musí pak existovat $m^*$ pro kterou $\Pr[Enc_{K}(m^*)=c]\ne 0$. Dle [Alternativní definice perfektnosti schématu](#Alternativní%20definice%20perfektnosti%20schématu) dostáváme, že $\Pr[Enc_{K}(m)=c]\ne 0$ pro každé $m \in \mathcal{M}$. Pak z $\mathcal{M} = \{ m_{1},m_{2},\dots \}$ pro každou $m_{i}$ máme neprázdnou $\mathcal{K}_{i} \subset \mathcal{K}$ takové, že $Enc_{k}(m_{i})=c \iff k \in \mathcal{K}_{i}$. Navíc pro $\mathcal{K}_{i},\mathcal{K}_{j},i \ne j$ musí být $\mathcal{K}_{i} \cap \mathcal{K}_{j} = \emptyset$, jinak by neplatila korektnost. Protože $|\mathcal{K}|= |\mathcal{M}|$, tak $\mathcal{K}_{i}$ může mít jen jeden klíč a tedy je splněna podmínka 2. Dle alternativní definice pro perfektní tajnost dostáváme pro libovolné dvě $m_{i},m_{j}\in \mathcal{M}$ dostáváme
$$
\Pr[K=k_{i}] = \Pr[Enc_{K}(m_{i})=c] = \Pr[Enc_{K}(m_{j})=c] = \Pr[K=k_{j}]
$$
platné pro všechna $1\leq i,j \leq |\mathcal{M}|=|\mathcal{K}|$ a $k_{i}\ne k_{j}$ pro $i \ne j$, tedy i klíče mají stejnou pravděpodobnost výběru stejně jako v podmínce 1.