 ## Motivace
Chceme parametry
- $d\approx \epsilon n$
- $k\approx (1-\epsilon) n$
# Definice
Mějme $g\ge n$ a $GF[g]$, $\alpha_{1},\dots,\alpha_{n}\in GF[g], \alpha_{i}\ne \alpha_{j}, k\leq n$. Pak zpráva $GF[g]\ni m=m_{0}m_{1}\dots m_{k-1}$, pro kterou definujeme polynom $p_{m}(x)=m_{0}+m_{1}x+\dots+ m_{k-1}x^{k-1}$ a pro zakódování mějme
$$
C(m) = \left\langle p_{m}(\alpha_{1}),p_{m}(\alpha_{2}),\dots,p_{m}(\alpha_{n}) \right\rangle.
$$
*Pozorování:* Je to lineární kód 

Zjevně $m\ne m': p_{m}(x)\pm p_{m'}(x)=p_{m+m'}(x)$ a také $\alpha p_{m}(x)=p_{\alpha m}(x)$