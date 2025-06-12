*Definice:* Náhodná veličina je funkce, která přiřazuje každému elementárnímu náhodnému jevu hodnotu. 
Pro diskrétní náhodnou veličinu $X$ definujeme pravděpodobnostní funkci 
$$
p_{X}(x) = P(\{ X = x \}).
$$
Spojité náhodné veličiny zapisujeme distribuční funkcí a hustotou. 

Distribuční funkce náhodné veličiny $X$ je funkce $F_X : \mathbb{R} \to [0,1]$ definovaná $F_{X}(x) = P(X \leq x)$. Tedy zjevně platí $P(a < X \leq b) = F_{X}(b) - F_X(a).$
Vlastnosti:
1. $F_{X}$ je neklesající
2. $\lim_{ x \to +\infty } F_X(x) = 1$
3. $\lim_{ x \to -\infty } F_X(x) = 0$
4. $F_{X}$ je zprava spojitá
Náhodná veličina $X$ se nazývá spojitou pokud existuje nezáporná reálná funkce $f_{X}$ taková, že $F(x)= P(X \leq x) = \int_{-\infty}^x f_{X} \text{ d}t$. Taková $f_{X}$ se nazývá **hustota**.
---
# Střední hodnota
*Definice*: Pro náhodnou veličinu $X$ definujeme střední hodnotu
1. diskrétní $\mathbb{E}(X) = \sum_{x \in \mathrm{Im}(X)} x \cdot P(X =x)$,
2. spojitou $\mathbb{E}(X) = \int_{-\infty}^{+\infty} x f_{X}(x) \text{ d}x$.

### Pravidlo naivního statistika 
1. diskrétní $\mathbb{E}(g(X)) = \sum_{x \in \mathrm{Im}(X)} g(x) \cdot P(X =x)$,
2. spojitou $\mathbb{E}(g(X)) = \int_{-\infty}^{+\infty} g(x) f_{X}(x) \text{ d}x$.

*Věta:* (Linearita střední hodnoty) $\mathbb{E}(aX +b) = a \mathbb{E}(X) + b$.
Vychází z PNS pro funkci $g(x) = ax +b$.

### Střední hodnota součinu nezávislých veličin
*Věta:* Pro nezávislé veličiny $X,Y$ platí $\mathbb{E}(XY) = \mathbb{E}(X) \mathbb{E}(Y)$.

### Markovova nerovnost
Pro $X \geq 0, a > 0$ platí $P(X \geq a) \leq \frac{\mathbb{E}(X)}{a}$.

---
# Rozptyl
*Definice:* Rozptyl náhodné veličiny $X$ je definován $var(X)= \mathbb{E}((X-\mathbb{E}(X))^2)$. Definujeme také **směrodatnou odchylku** $\sigma_{X}=\sqrt{ var(X) }$.
*Věta*: $var(X) =\mathbb{E}(X^2) - \mathbb{E}(X)^2$

Rozptyl součtu nezávislých veličin je
$$
var(X +Y) = var(X) + var(Y).
$$
*Definice:* Kovariance $cov(X,Y) = \mathbb{E}((X-\mathbb{E}(X))(Y - \mathbb{E}(Y)))$
1. $cov(X,X)= var(X)$
2. $cov(X,Y) = \mathbb{E}(XY) - \mathbb{E}(X)\mathbb{E}(Y)$
3. pro nezávislé je rovna kovariance nule
4. korelace: $\rho(X,Y) = \frac{cov(X,Y)}{\sigma_{X} \cdot \sigma_{Y}}$

Rozptyl součtu libovolných náhodných veličin je $X = \sum_{i=1}^n X_{i}$ pak 
$$
var(X) = \sum^n_{i=1} \sum^n_{j=1} cov(X_{i}, X_{j}).
$$
---
# Konkrétní rozdělení 
### Bernoulliho rozdělení $\mathrm{Ber}(p)$
- **Popis:** Jeden pokus s pravděpodobností úspěchu $p$.  
- **PMF:**  
$$
P(X=1)=p,\quad P(X=0)=1-p,\quad P(X=x)=0\text{ jinde.}
$$
- **Střední hodnota:** $\mathbb E(X)=p$  
- **Rozptyl:** $\mathrm{Var}(X)=p(1-p)$  
- **Užití:** Modeluje indikátorovou proměnnou (zda nastal jev).  
---
### Geometrické rozdělení $\mathrm{Geom}(p)$
- **Popis:** Počet pokusů do prvního úspěchu (vč. úspěchu).  
- **PMF:**  
$$
  P(X=k)=(1-p)^{\,k-1}\,p,\quad k=1,2,\dots
$$
- **Střední hodnota:** $\mathbb E(X)=1/p$  
- **Rozptyl:** $\mathrm{Var}(X)=\tfrac{1-p}{p^2}$  
- **Užití:** Model čekací doby (počet pokusů, volání atd.)  
---

### Binomické rozdělení $\mathrm{Bin}(n,p)$
- **Popis:** Počet úspěchů v $n$ nezávislých pokusech s pravd. $p$.  
- **PMF:**  
$$
  P(X=k)=\binom{n}{k}\,p^k(1-p)^{\,n-k},\quad k=0,1,\dots,n.
$$
- **Střední hodnota:** $\mathbb E(X)=np$  
- **Rozptyl:** $\mathrm{Var}(X)=np(1-p)$  
- **Užití:** Výsledek opakovaných Bernoulliho pokusů (např. počet úspěchů).  
---

### Poissonovo rozdělení $\mathrm{Pois}(\lambda)$
- **Popis:** Počet událostí v jednotkovém čase s intenzitou $\lambda$.  
- **PMF:**  
$$
  P(X=k)=\frac{\lambda^k\,e^{-\lambda}}{k!},\quad k=0,1,2,\dots
$$
- **Limita:** $\mathrm{Pois}(\lambda)=\lim_{n\to\infty}\mathrm{Bin}(n,\lambda/n)$.  
- **Střední hodnota:** $\mathbb E(X)=\lambda$  
- **Rozptyl:** $\mathrm{Var}(X)=\lambda$  
- **Užití:** Náhodné příchozí události (zprávy, nehody, selhání).  
---
### Uniformní rozdělení $\mathrm{U}(a,b)$
- **Popis:** Rovnoměrné rozdělení na intervalu $[a,b]$.  
- **Hustota pravděpodobnosti:**  
$$
  f(x)=\frac{1}{b-a},\quad x\in[a,b].
$$
- **Distribuční funkce:**  
$$
  F(x)=\frac{x-a}{b-a},\quad x\in[a,b].
$$
- **Střední hodnota:** $\mathbb E(X)=\tfrac{a+b}{2}$  
- **Rozptyl:** $\mathrm{Var}(X)=\tfrac{(b-a)^2}{12}$  
- **Užití:** Model náhodného výběru z intervalu, Monte Carlo simulace.  
---
### Exponenciální rozdělení $\mathrm{Exp}(\lambda)$
- **Popis:** Čekací doba mezi Poissonovými událostmi s intenzitou $\lambda$.  
- **Hustota pravděpodobnosti:**  
$$
  f(x)=\lambda e^{-\lambda x},\quad x\ge0.
$$
- **Distribuční funkce:**  
$$
  F(x)=1-e^{-\lambda x},\quad x\ge0.
$$
- **Střední hodnota:** $\mathbb E(X)=1/\lambda$  
- **Rozptyl:** $\mathrm{Var}(X)=1/\lambda^2$  
- **Užití:** Model trvání do události (čekání, životnost).  
---
### Normální rozdělení $\mathrm{N}(\mu,\sigma^2)$
- **Popis:** Gaussovo rozdělení – základní spojité rozdělení.  
- **Hustota pravděpodobnosti:**  
$$
  f(x)=\frac{1}{\sigma\sqrt{2\pi}}\,
    \exp\!\Bigl(-\tfrac{(x-\mu)^2}{2\sigma^2}\Bigr).
$$
- **Standardní:** $\mathrm{N}(0,1)$:  
$$
  \phi(x)=\tfrac1{\sqrt{2\pi}}e^{-x^2/2},\quad
  \Phi(x)=\int_{-\infty}^x\phi(t)\,dt.
$$
- **Transformace:** Pokud $X\sim N(\mu,\sigma^2)$, pak
$$
  Z=\frac{X-\mu}{\sigma}\sim N(0,1).
$$
- **Suma nezávislých:**  
$$
  X_i\sim N(\mu_i,\sigma_i^2)
  \implies
  \sum X_i\sim N\Bigl(\sum\mu_i,\sum\sigma_i^2\Bigr).
$$
- **Pravidlo 3σ:**  
  $\;P(\mu\pm\sigma)\approx0.68,\;P(\mu\pm2\sigma)\approx0.95,\;P(\mu\pm3\sigma)\approx0.997.$  
- **Užití:** Model šumu, chyby měření, centrální mezní věta.  
