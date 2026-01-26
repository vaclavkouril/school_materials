# Sufixové pole
*Definice:* Pro string $\alpha, |\alpha| =n$ máme suffixové pole, které je permutací $S$ množiny $\{ 0,\dots,n \}$ taková, že $\alpha[S[i]:] <_{LEX} \alpha[S[i+1]:]$ pro všechna $0\leq i < n$

Tedy pole $X$ určuje $X[i]$ pozice začátku $i$-tého suffixu v lexikografickém pořadí

Hledáme-li $\beta$, tak každý takový výskyt odpovídá $\alpha[i:]$ pro nějaké $i$, který má $\beta$ jako prefix.

Když tedy hledáme $\beta$, tak shodný prefix v lexikografickém seřazení je na souvislém intervalu. Tedy hledat $\beta$ umíme díky seřazení v $O(\beta \log n)$ čase.
### Konstrukce Sufixového pole
*Definice:* Mějme pro $\gamma,\delta$ stringy porovnání prefixů délky $k$:
$$
\gamma =_{k} \delta \text{, když } \gamma[:k] = \delta[:k], \qquad 
\gamma \leq_{k} \delta \text{, když } \gamma[:k] \leq \delta[:k]
$$
Algoritmus konstrukce v $o(\log n)$ průchodech, vždy seřadí prvních $k$ znaků, kde $k = 2^0,2^1,2^2,\dots,2^{\log n}$.

V $k$-tém průchodu vyrobíme $S_{k}$ permutaci pozic seřazující $\leq_{k}$ a dopočteme $R_{k}$, kde $R_{k}[i]$ je počet sufixů $\alpha_{j}$, že $\alpha_{j} <_{k} \alpha_{i}$.

V $2k$-tém průchodu máme už seřazeno dle $k$ a zbývá nám díky definice $\leq_{LEX}$:
$$
\alpha_{i} \leq_{2k} \alpha_{j} \iff (\alpha_{i} <_{k} \alpha_{j}) \lor ((\alpha_{i} =_{k} \alpha_{j}) \land (\alpha_{i+k} \leq_{k} \alpha_{j+k})).
$$
Dle $R_{k}$ můžeme vlastně přepsat porovnání na porovnání párů $(R_{k}[i],R_{k}[i+k])$ a $((R_{k}[j],R_{k}[j+k]))$. Takové páry můžeme dodat pro každé porovnání a máme konstantní porovnání i pro delší $k$.

Pokud je něco krátké tak si doplníme znaky váhou 0.

Na seřazení párů použijeme bucketsort, vzhledem k tomu, že páry mají hodnoty je $0$ až $n$, tak do $n$ přihrádek umíme setřídit ve dvou průchodech $O(n)$ čase.

Dohromady je čas $O(n \cdot \log n)$.
## Rank pole
*Definice:* Mějme $R[0\dots n]$ jako inverzní permutaci $S$. Tedy $R[i]$ nám řekne kolik suffixů $\alpha$ je lexikograficky menších než $\alpha[i:]$

Výpočet je vlastně:
$$
R[i] = j \iff S[j] = i 
$$
## LCP pole (Longest Common Prefix)
*Definice:* LCP pole $L[0\dots n-1]$ ukládá délku nejdelšího společného prefixu každého suffixu a jeho lexikografického následníka. Tedy $L[i] =LCP(\alpha[S[i]:],\alpha[S[i+1]:])$, kde $LCP(\gamma,\delta) = \max_{k} \gamma[:k] = \delta[:k]$.


Mějme $\alpha_{i},\alpha_{i+1}$ ve lexikografickém pořadí vedle sebe a $L[i] = k>0$, pak $\alpha_{i}[1:],\alpha_{i+1}[1:]$ jsou také sufixy $\alpha$ rovné $i'<j': \alpha_{i}[1:] = \alpha_{i'}, \alpha_{i+1}[1:] = \alpha_{j'}$, zjevně $LCP(\alpha_{i'},\alpha_{j'}) = LCP(\alpha_{i},\alpha_{i+1}) -1 = k-1$ ale LCP je ne $[i',j']$ nejmenší, tedy $L[i']\geq k-1$.
### Konstrukce LCP z Sufix
BuildLCP($\alpha$, S, R):
1. $k\leftarrow 0$
2. for $p = 0,\dots,n-1$ (začátky suffixů v $\alpha$)
	1. $k \leftarrow \max(k-1,0)$ další LCP je minimálně to poslední $-1$
	2. $i\leftarrow R[p]$ tedy index nynějšího suffixu v seřazeném pořadí
	3. $q \leftarrow S[i+1]$ začátek lexikograficky dalšího sufixu
	4. while $(p+k <n) \land (q+k < n) \land (\alpha[p+k] = \alpha[q+k])$: $k \leftarrow k+1$
	5. $L[i]\leftarrow k$

Algoritmus pracuje v $O(n)$ čase.

Jediný problém může být while loop, mějme $\phi = k$, hodnota je $k \in[0,n]$ a začne $0$ vždy se posune jen o $1$ zmenší se jen na začátku for loop a zvyšuje ve while loop. Protože je maximálně $n$ zmenšení, tak může být maximálně $2n$ zvětšení $k$. Tedy celkový čas ve while loop je $O(n)$.

---
# Aplikace
- Máme seno a hledáme jehly
- Počet $k$-gramů-různých podslov délky $k$
- Nejdelší opakující se podslovo
## Nejdelší podřetězec dvou řetězců
Mějme $\alpha,\beta$ a postavíme suffixové pole a LCP pole stringu $\alpha\#\beta$, kde $\# \not\in \alpha,\beta$. Každý suffix $\alpha\#\beta$ odpovídá suffixu buď v $\alpha$, nebo v $\beta$. Chceme najít pár pozic $i,j$, že $LCP$ je maximalizováno a jsou to sousedé, kde ale chceme aby $\alpha$ šlo z $S[k]$ a $\beta$ z $S[k+1]$ nebo obráceně.