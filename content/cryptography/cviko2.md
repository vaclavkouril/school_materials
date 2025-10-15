# 2.11
Vybíráme jen z $2^{\ell}-1$ klíčů, tedy
$$
\Pr[C=c\mid M=m] =
\begin{cases}
0, & \text{pokud } c\oplus m = 0^{\ell},\\
1/(2^{\ell}-1), & \text{jinak.}
\end{cases}
$$
Pak pro $c=m$ je tato pravděpodobnost $0$, ale pro jiné dvojice $(m',c)$ kladná.  
Alternativní definice na základě lemmatu 2.5:

>Šifrovací schéma $(Gen, Enc, Dec)$ je perfektně tajné schéma s množinou zpráv $m \in \mathscr M,$ právě tehdy když platí $\forall m,m' \in \mathscr M, \forall c \in \mathscr C: \Pr[Enc_{k}(m) = c] = \Pr[Enc_{k}(m') = c].$

Tak vidíme, že pro $m=c$ je $\Pr[Enc_{k}(m)=c]=0$, zatímco pro jiné $m'\neq c$ je $\Pr[Enc_{k}(m')=c]=1/(2^{\ell}-1)$, tedy podmínka z lemmatu 2.5 není splněna.

---
# 2.17
Mějme $|K| = |M| / 2^t$, tedy klíče jsou o $t$ kratší než zprávy a na zbytek si pořídíme množinu $\mathscr H$, která obsahuje binární řetězce délky $t$, tedy má $2^t$ prvků a $\forall h \in \mathscr H:\Pr[H =h] = 2^{-t}$. Když šifrujeme tak vybereme uniformě náhodně z $h \in \mathscr H$ a použijeme ho jako zbytek klíče, tedy $k.h$ a tím zašifrujeme pomocí dokonale tajného šifrování. 
Když dešifrujeme tak vždy dešifrujeme pomocí klíče $k$ a jednoho zafixovaného $h_{0}$. Vychází tedy $\Pr[Dec_{k}(Enc_{k}(m)) = m] = 2^{-t}$, protože $\Pr[h=h_{0}] = 2^{-t}$. 

$(K,H)$ je rovnoměrný na množině velikosti $|K|\cdot 2^t=|M|$ a šifra pro složený klíč $(k,h)$ je perfektní (pro každé $m,c$ existuje právě jeden $(k,h)$ s $\mathrm{Enc}_{k.h}(m)=c$),
$$
\Pr[C=c\mid M=m]
=\frac{1}{|K|\,2^t}
=\frac{1}{|M|}.
$$
Tedy $\Pr[C=c\mid M=m]=1/|M|$ nezávisle na $m$. Pak
$$
\Pr[M=m\mid C=c]
=\frac{\Pr[C=c\mid M=m]\Pr[M=m]}{\Pr[C=c]}
=\frac{\tfrac{1}{|M|}\Pr[M=m]}{\sum_{m'}\tfrac{1}{|M|}\Pr[M=m']}
=\Pr[M=m].
$$

Nechť schéma je perfektně tajné, zafixujme libovolné $m$. Korektnost znamená, že pravděpodobnost, že se po zašifrování a dešifrování získá zpět $m$, je alespoň $2^{-t}$:
$$
\Pr[\mathrm{Dec}_K(\mathrm{Enc}_K(m))=m]
=\sum_{c}\Pr[\mathrm{Dec}_K(c)=m \wedge C=c \mid M=m]
\ge 2^{-t}.
$$
Pro každý ciphertext $c$ je tato událost nenulová jen tehdy, pokud existuje klíč $k$ s $\mathrm{Dec}_k(c)=m$.  
Těchto klíčů je nejvýše $|K|$, zatímco celkový počet možných $(m,c)$ párů je $|M||C|$.  
Aby měla každá zpráva alespoň pravděpodobnost $2^{-t}$ vrátit se správně, musí být
$$
|K||C| \ge |M||C| \cdot 2^{-t} \quad\Rightarrow\quad |K| \ge |M|\cdot 2^{-t}.
$$
Proto každé perfektně tajné schéma s korektností $\ge 2^{-t}$ musí mít
$$
|K| \ge |M|/2^{t},
$$
a konstrukce dosahuje rovnosti.