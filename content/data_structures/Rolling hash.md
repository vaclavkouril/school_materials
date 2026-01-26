*Definice:* Mějme rodinu funkcí $\mathbb{Z}_{p}^d \to \mathbb{Z}_{p}$, které řekneme rolling hash $\mathcal{R}=\{ r_{a} \mid a \in \mathbb{Z}_{p} \}$, kde $a$ je náhodné a $r_{a} (x)= \sum_{i=1}^d x_{i} a^{i-1} \mod p$.

---
# $\mathcal{R}$ je $d$-univerzální.
Mějme dva různé prvky $x,y$, tak
$$
\Pr_{a \in \mathbb{Z}_{p}} [r_{a}(x) \equiv r_{a}(y) \mod p]
$$
jak často se stane
$$
\begin{align*}
r_{a}(x) &\equiv r_{a}(y) \mod p \\
\sum_{i=1}^d x_{i} a^{i-1} &\equiv \sum_{i=1}^d y_{i} a^{i-1} \mod p \\
\sum_{i=1}^d (x_{i} - y_{i}) a^{i-1} &\equiv 0 \mod p

\end{align*}
$$
za různosti $x,y$ je $\sum_{i=1}^d (x_{i} - y_{i}) a^{i-1}$ nenulový polynom a polynom omezeného stupně (maximálně $d$) má omezený počet kořenů (a sice maximálně $d$), tak máme pravděpodobnost toho, že $a$ je kořen je $d/p$, tedy je $\mathcal{R}$ je $d$-univerzální.

---
# Výhoda oproti jiným hash funkcím
Rolling hash umožňuje udržovat hash posuvného okna v konstantním čase, přičemž poskytuje silnou univerzalitu a je ideální pro algoritmy nad řetězci a podřetězci.