*Věta:* **Inkluze a exkluze** Nechť $A_{1}, A_{2}, \dots, A_{n}$ jsou konečné [množiny](mff_statnice/discrete_math/Množiny a zobrazení#Množiny). Potom
$$
\left| \bigcup^n_{i=1} A_{i} \right| = \sum^n_{k=1}(-1)^{k+1} \sum_{I \in \binom{\{ 1,2,\dots,n \}}{k}}\left|\bigcap_{{i\in I}} A_{i}\right|
$$
také lze zapsat jako 
$$
\left| \bigcup^n_{i=1} A_{i} \right| = \sum_{\emptyset \neq I \subseteq \{ 1,2,\dots,n \}} (-1)^{|I|+1} \left|\bigcap_{i \in I}A_{i}\right|
$$
*Důkaz:* Hlavní otázka je kolikrát započteme prvek $x \in \bigcup_{i=0}^n A_{i}$ na pravé straně rovnosti.
Nechť $k =$ počet $A_{i}$ ve kterých se vyskytuje $x$. Vezmeme-li postupně $j = |I|$ jedno po druhém, tak $j> k$ máme příspěvek $x$ nulový, ale pro $j \leq k$ máme $\binom k j$ $j$-tic obsahujících $x$ a celkem tedy přispějí $(-1)^{j+1} \binom{k}{j}$. 
*Pozorování:* Dle [binomické věty](mff_statnice/discrete_math/Kombinační čísla#Binomická věta) máme $$(1-1)^k = \sum_{i=0}^k \binom k i (-1)^{i} =1 + \sum_{i=1}^k \binom k i (-1)^{i} = 1 -1 = 0.$$
Sečtením přes všechna $j$ máme 
$$
\sum_{i=1}^k \binom k i (-1)^{i+1} = (-1) \sum_{i=0}^k \binom k i (-1)^{i}
$$
kde aplikujeme pozorování o $\sum_{i=0}^k \binom k i (-1)^{i} = -1$ a tedy
$$
-1 \cdot \sum_{i=0}^k \binom k i (-1)^{i} = (-1) \cdot (-1) = 1.
$$
# Problém šátnářky
Pravděpodobnostní prostor: $\Omega = S_{n} := \{ \pi : \{ 1,2,\dots,n \} \to \{ 1,2,\dots,n \} \}$. 
$i$ dostal svůj kolobouk $\leftrightarrow$  $\pi(i)=i$, neboli je to pevný bod
Úloha: Jaká je pravděpodobnost, že náhodná permutace nemá žádný pevný bod?
$$
P(\underbrace{\{ \pi \in S_{n} | \forall i: \pi(i) \neq i \}}_{= Š}) = \frac{|Š|}{n!}
$$
Pro spočtení pravděpodobnosti se můžeme zabývat doplňkem a sice, jaká je pravděpodobnost existence alespoň jednoho pevného bodu.
Zadefinujeme $A = \{ \pi \in S_{n} : (\exists i)(\pi (i) = i) \}$ a pomocné množiny $A_{i} = \{ \pi \in S_{n} : (\pi (i) = i) \}$ pro všechna $i$. Můžeme pozorovat, že $A = \bigcup_{i=0} A_{i}$. Zároveň je vidět $Š = S_{n} \setminus A$ a stačí dosadit do principu inkluze a exkluze:
$$
\left|\bigcup_{i=1}^n A_{i}\right| = \sum_{k=1}^n (-1)^{k+1} \sum_{I\subseteq \{ 1,2,\dots,n \}: I \neq \emptyset} \left|\bigcap_{i \in I} A_{i}\right|
$$
# Eulerova funkce
*Definice* **Eulerova funkce** $\varphi(n)$ značí pro přirozené $n$ počet $k \in \{ 1,2,\dots, n-1 \}$, nesoudělných s $n$, tedy $\text{NSD}(k,n)=1$.

# Počet surjekcí
Počet všech funkcí z $A$ do $B$ je $|B|^{|A|}$ ($|A| = n, |B| = k$) a mi chceme eliminovat ty, které nejsou **na**, tedy takové funkce, kde $\exists b \in B$, které není obrazem žádného $a \in A$. Pro každé $i \in B$ zavedeme
$$
X_{i} = \{ f: A\to B \ | \  i \not\in \text{Rng}(f)\}.
$$
Takže počet surjekcí je
$$
|B|^{|A|} - \left|\bigcup_{i=1}^{|B|} X_{i}\right|.
$$
Ve vzorci inkluze–exkluze pro sjednocení $X_1 \cup \dots \cup X_k$ platí:
$$
  \bigl|\,X_1 \cup \dots \cup X_k\bigr|
  \;=\;
  \sum_{m=1}^{k} (-1)^{\,m-1}
  \;\sum_{\substack{I \subseteq \{1,\dots,k\}\\|I| = m}}
  \Bigl|\;\bigcap_{i \in I} X_i\Bigr|.
$$
Potřebujeme tedy spočítat:
$$
  \bigl|\,X_{i_1} \cap \dots \cap X_{i_m}\bigr|
  \quad\text{pro libovolnou množinu }I = \{i_1,\dots,i_m\}\subseteq B.
$$

Podmínka $\bigl(f \in X_{i_1} \cap \dots \cap X_{i_m}\bigr)$ znamená, že funkce $f$ **nepoužije** žádné z prvků $i_1, i_2, \dots, i_m$. Tedy hodnotu $f(a)$ si ve skutečnosti vybírá jen z množiny
  $$
    B \;\setminus\; \{\,i_1,\dots,i_m\},
  $$
  která má $\,(k - m)$ prvků. Každý z $n$ prvků z $A$ může zvolit libovolný z těchto $(k-m)$ cílů, takže
  $$
    \bigl|\,X_{i_1} \cap \cdots \cap X_{i_m}\bigr|
    \;=\;
    (\,k - m\,)^{\,n}.
  $$
Z množiny $B$ o velikosti $k$ vybereme přesně $m$ prvků, které nebudou v obrazu. To lze udělat $\binom{k}{m}$ způsoby.

Vložením do vzorce inkluze-exkluze za $\lvert X_{i_1}\cap \dots\cap X_{i_m}\rvert = (k-m)^n$ a v úvahu, že existuje $\binom{k}{m}$ možností, jak vybrat $m$ unikátních prvků z $B$, dostaneme:

$$
  \bigl|\,X_1 \cup \cdots \cup X_k \bigr|
  \;=\;
  \sum_{m=1}^{k} (-1)^{\,m-1}\;\binom{k}{m}\;(k - m)^{\,n}.
$$
Proto je počet surjektivních funkcí
$$
  \boxed{%
    \bigl|\{\text{surjekce }f\colon A\to B\}\bigr|
    \;=\;
    k^n
    \;-\;
    \sum_{m=1}^{k}(-1)^{\,m-1}\,\binom{k}{m}\,(k - m)^{\,n}.
  }
$$
Kde posunem a zařazením $k^n$ přepíše jako
$$
  \sum_{m=0}^{k} (-1)^{\,m}\,\binom{k}{m}\,(k - m)^{\,n}.
$$
Tedy výsledná forma je:
$$
  \boxed{%
    |\{ f: A \to B \  |\  f \text{ je surjekce (na)} \}|
    \;=\;
    \sum_{m=0}^{k}(-1)^{\,m}\,\binom{k}{m}\,(k - m)^{\,n}.
  }
$$