# MAXCUT
- proměnné $y_{i}\in \{ -1,1 \}$
-  obj je $\sum \frac{1}{2}(1- y_{i} \cdot y_{j})$

relaxace jsou vektory $\bar{v_{i}}, \bar{v_{j}} \in \mathbb{R}^n$ vektorového programu
- Objective: $\frac{1}{2}(1-\bar{v_{i}}^T\bar{v_{j}})$
- $\bar{v_{i}}^T\bar{v_{i}}=1$

Pro max cut máme 
$$
\frac{1}{2}\sum_{(i,j)\in E} w_{ij}(1-y_{i}y_{j})
$$
a relaxaci
$$
\max \frac{1}{2}\sum_{(i,j)\in E} w_{ij}(1-v_{i}v_{j})
$$
$$
v_{i}v_{i}=1, i=1,\dots,n, v_{i}\in \mathbb{R}^n
$$
Vybereme náhodný vektor $r=(r_{1},\dots,r_{n})$, kde $r_{i} - N(0,1)$ aby půlení podle nadroviny s s tímto normálním vektorem bylo rozpůlení a rozptyl je $e^{-r_{1}^2/2} \cdot\dots \cdot e^{-r_{n}^2/2}$.

- $r^T\cdot v_{i}>0$ pak  je $v_{i}$ v $U$
- jinak je $v_{i}$ ve $V$

Pravděpodobnost toho, že úhel $\varphi$ mezi $i,j$ (které jsou součástí optimálního řešení SDP) bude rozdělen je $\frac{\varphi}{\pi}$, když $r$ rozdělí tak jejich přínos do sumy je $1$, jinak $0$. Tedy expected contribution do sumy u SDP je $\frac{\varphi}{\pi}$.

Dot product unit vektoru je jejich $\cos (\varphi)$ (jejich úhlu) a tedy prvek sumy u vektorového programu je
$$
\frac{1}{2}(1-\cos \varphi)
$$
Porovnáme-li je
$$
\frac{\varphi}{\pi} \geq 0.878 \cdot \frac{1}{2}(1-\cos \varphi)
$$
a tedy je to $0.878$ aproximační.