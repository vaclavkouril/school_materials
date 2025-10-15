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
&= \Pr[Enc_{K}(m) = c]
\end{align*}
$$
kde první rovnice je z definice náhodné veličiny $C$, druhá protože máme podmínku na to jak vlastně náhodná veličina $M$ vypadá a vzhledem k tomu, že z definice je klíč nezávislý na $M$. 