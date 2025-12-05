# Šifrovací schéma
Šifrovací schéma je určeno trojicí $(Gen,Enc, Dec)$ algoritmů a určením množiny zpráv $\mathscr M$, kde $|\mathscr M| > 1$. 
- $Gen$ je pravděpodobnostní algoritmus vybírající klíč $k$ pomocí nějaké pravděpodobnostní distribuce, kde $\mathscr K$ je konečná množina klíčů. 
- $Enc$ je algoritmus sloužící k zašifrování zprávy $m \in \mathscr M$ pomocí klíče $k \in \mathscr K$, tedy $Enc_{k}(m) = c$, kde $c$ je ciphertext, dovolujeme aby takový algoritmus byl pravděpodobnostní a při použití stejných vstupů, tedy není nutné, aby vždy vydal stejné $c$. $Enc_{k}(m) := c$ značí deterministický algoritmus, $c \leftarrow Enc_{k}(m)$ značí vysloveně pravděpodobnostní algoritmus.
 - $Dec$ algoritmus dekóduje zprávu z $c$ pomocí klíče a tedy $Dec_{k}(c) =m$, předpokládáme _perfektní korektnost_ a tedy, že $\Pr[Dec_{k}(c) =m] = 1$. Takový předpoklad vede k tomu, že bez újmy na obecnosti je $Dec$ deterministický.

---
# Perfektní šifrovací schéma
Schéma $(Gen, Enc, Dec)$ s množinou zpráv $\mathscr M$ je perfektně tajné, právě tehdy když pro každou pravděpodobnostní distribuci $M$, tak $\forall m \in \mathscr M$ a $\forall c \in \mathscr C$, kde $\Pr[C = c] > 0$:
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
# Perfektní nerozpoznatelnost
Nechť $\Pi = (Gen, Enc, Dec)$ je šifrovací schéma s množinou zpráv $\mathscr M$. Nechť $A$ je nepřítel, který se BÚNO chová jako deterministický algoritmus. Definujeme experiment $\text{PrivK}_{A, \Pi}^{eav}$ následovně