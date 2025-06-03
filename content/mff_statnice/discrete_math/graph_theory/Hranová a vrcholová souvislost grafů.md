*Definice:*
- **hranový řez** v grafu $G$ je $F \subseteq E(G): G' =(V, E \setminus F)$ je nesouvislý.
- **vrcholový řez** v grafu $G$ je $A \subseteq V(G): G' =\left( V \setminus A, E \cap \binom{V \setminus A}{2}\right) = G [V \setminus A]$ je nesouvislý.
- **hranová souvislost** $k_{e}(G) = \min \{ F \subseteq E\ | \ F \text{ je hranovým řezem}\}$
- **vrcholová souvislost** $k_{v}(G) = \left\{ \begin{array}{lcl}  1 & \text{pro} & K_{1} \\ n-1 & \text{pro} & K_{n} \\ \min \{ A\subseteq V\ | \ A \text{ je vrcholovým řezem}\} 1 & \text{jindy} \\ \end{array} \right.$
- Graf $G$ je **hranově $k$-souvislý** platí-li $k_{e}(G) \ge k$.
- Graf $G$ je **vrcholově $k$-souvislý** platí-li $k_{v}(G) \ge k$.
	- Takovému maximálnímu $k$ říkáme pak **kriticky** souvislý.
# Mengerovy věty
*Věta:* (_hranová verze_, Ford-Fulkerson) Pro graf $G$, a $t \in \mathbb{N}$ platí $k_{e}(G) \ge t \iff \forall u,v \in V(G)$ existuje alespoň $t$ hranově disjunktních cest. 
*Důkaz:* ($\Leftarrow$)
Nechť existuje pro spor hranový řez $F: |F| < t$. Tedy $G \setminus F$ je rozdělení $G$ na více komponent. Vezmu-li teď $u$ z jedné komponenty a $v$ z druhé, tak mají z předpokladu alespoň $t$ hranově disjunktních cest a tedy řez $F$ nemohl přerušit všechny a tudíž to není řez a máme spor.

($\Rightarrow$)
Mějme $k_{e}​(G)\ge t$ a pro $u,v$ hledejme disjunktní cesty. Sestrojíme si pomocnou jednotkovou síť, kde beru $u$ jako zdroj a $v$ jako stok a nalezneme tok. Pak vidíme, že máme tok velikosti alespoň $t$ (maximální tok je minimální řez) a z toku naleznu cesty.

*Věta:* (_vrcholová verze_, Menger) Pro graf $G$, a $t \in \mathbb{N}$ platí $k_{v}(G) \ge t \iff \forall u,v \in V(G)$ existuje alespoň $t$ vrcholově disjunktních cest, až na vrcholy $u,v$.
*Důkaz:* ($\Leftarrow$)
Nechť existuje pro spor vrcholový řez $A: |A| < t$. Tedy $G \setminus A$ je rozdělení $G$ na více komponent. Vezmu-li teď $u$ z jedné komponenty a $v$ z druhé, tak mají z předpokladu alespoň $t$ vrcholově disjunktních cest a tedy řez $A$ nemohl přerušit všechny a tudíž to není řez a máme spor.

($\Rightarrow$)
Předpokládejme, že každá množina vrcholů, která *odřízne $u$ od $v$, má velikost alespoň $t$.
1. Každý vrchol $x \in V(G) \setminus {u,v}$ **rozdělíme na dva**: $x_{\text{in}}$ a $x_{\text{out}}$, a přidáme hranu $x_{\text{in}} \to x_{\text{out}}$.
2. Každou původní hranu $a \to b$ nahradíme hranou $a_{\text{out}} \to b_{\text{in}}$.
3. Vznikne orientovaná **síť** s jednotkovými kapacitami (každá hrana má kapacitu 1).
4. V této síti hledáme maximální tok z $u$ do $v$ (Ford–Fulkerson).
5. Z faktu, že každý vrcholový řez má kapacitu alespoň $t$, plyne, že maximální tok má hodnotu alespoň $t$.
6. Každá jednotková cesta v toku odpovídá jedné vrcholově disjunktní cestě v původním grafu.
$\Rightarrow$ Existuje alespoň $t$ vrcholově disjunktních $(u,v)$-cest.
