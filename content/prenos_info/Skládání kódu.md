Motivace: Chyby v kódech nejsou nezávislé.

Vlastně chceme symboly kódovat jedním kódem, nějakým vnitřním $C'=[L, \ell, D]_{2}$ a vnější posloupnosti těchto symbolů kódovat pomocí [Reed-Solomonova kódu](Reed-Solomonovy%20kódy.md), tedy $C=[n,k,n-k+1]_{q}$, kde
- $L=O(\ell)$
- $D=\Omega(\ell)$
$$
C \circ C' =[n \cdot L, k \cdot \ell, d \cdot D]
$$
Dekódování
- Každý vnitřní symbol
- Dekódování vnějšího kódu

Aby dekódování selhalo, tak musíme mít více chyb než $\frac{D-1}{2} \cdot \frac{d-1}{2}$, první člen za vnější dekódování a druhý za vnitřní znaky, tedy $\approx \frac{dD}{4}$. Dokonce můžeme opravit i $\frac{dD-1}{2}$ chyb.


Dekódování $C'$ uděláme hrubou silou, protože prvků je málo a můžeme si předpočítat tabulku.


---
$[n,k,d]_{q}$ pro binární kódy
- $d=n:C_{1}=\{ 0^n,1^n \}$
- $d=\frac{2n}{3}: C_{2}=\{0^n,0^{n/3}1^{2n/3}, 1^{2n/3}0^{n/3}\}$.

U binárního kódu máme $d< (\frac{1}{2}-\varepsilon)n$


