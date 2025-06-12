*Definice:* Pro parametr $\theta$ náhodného procesu a statistik $D\le H$ nazveme interval $[D,H]$ **konfidenčním intervalem** o spolehlivosti $1-\alpha$ (neboli $(1-\alpha)$-CI), jestliže  
$$
P\bigl(D \le \theta \le H\bigr) = 1 - \alpha.
$$
### Metoda založená na normálním přiblížení
1. **Bodový odhad** $\hat\theta$ je nestranný odhad parametru $\theta$.  
2. Pro velké $n$ (nebo když $\hat\theta$ je lineární kombinací i.i.d. veličin) platí podle [CLT](Limitní%20věty#Centrální%20limitní%20věta)  
$$
     \hat\theta \;\approx\; N\bigl(\theta,\;\sigma^2(\hat\theta)\bigr).
$$
3. **Standardní chyba** 
$$
     \mathrm{se}(\hat\theta) = \sqrt{\mathrm{Var}(\hat\theta)}.
$$
   Např. pro průměr $\overline X$ z i.i.d. vzorku s pop. rozptylem $\sigma^2$ je $\mathrm{se}(\overline X)=\sigma/\sqrt n$.  
4. **CI pro $\theta$**  
$$
   \hat\theta
   \pm
   z_{\alpha/2}\,\mathrm{se}(\hat\theta),
$$
   kde $z_{\alpha/2} = \Phi^{-1}(1-\alpha/2)$. 

*Příklad:* Pro průměr $\mu$ známého $\sigma$ z $n$ pozorování $X_i\sim N(\mu,\sigma^2)$:  
$$
\overline X \pm z_{\alpha/2}\,\frac{\sigma}{\sqrt n}.
$$
---
# Testování hypotéz

### Základní schéma
1. **Formulace hypotéz:**  
   - **Nulová hypotéza** $H_0$: „konzervativní“ model, který chceme otestovat.  
   - **Alternativní hypotéza** $H_1$: „zajímavější“ model.  
1. **Testová statistika** $T(X_1,\dots,X_n)$, jejíž rozdělení za $H_0$ známe (nebo aproximujeme).  
2. **Kritický obor** $W$: množina hodnot $T$, při jejichž dosažení se $H_0$ zamítá, určená tak, aby  
$$
   P\bigl(T\in W \mid H_0\bigr) = \alpha.
$$  
   Hodnota $\alpha$ je **hladina významnosti** – pravděpodobnost chyby I. druhu.  
3. **Rozhodnutí:**  
   - Pokud $T\notin W$, nezamítáme $H_0$.  
   - Pokud $T\in W$, zamítáme $H_0$.  
### Chyby testování
- **Chyba I. druhu ($\alpha$)**: Zamítnutí $H_0$, i když je pravdivá.  
- **Chyba II. druhu ($\beta$)**: Nezamítnutí $H_0$, i když platí $H_1$.  
- **Síla testu**: $1-\beta$ – pravděpodobnost správného zamítnutí $H_0$ pod $H_1$.  
### p-hodnota

*Definice:* p-hodnota je nejmenší $\alpha$, při kterém by náš pozorovaný výsledek vedl k zamítnutí $H_0$.  

---

*Poznámka:* Pro střední hodnotu normálního rozdělení existují konkrétní z-testy (známý $\sigma$, testová statistika $Z=(\overline X-\mu_0)/(\sigma/\sqrt n)$) a t-testy (neznámé $\sigma$, statistika Studentova $t$).

--- 
## Jednoduchý příklad: Odhady a testování pro podíl úspěchů

Máme 100 nezávislých pokusů (např. vhazování mincí) a zaznamenáme 60 úspěchů (head). Označme počet úspěchů $K\sim\mathrm{Bin}(100,p)$.
### 1. Bodový odhad
- Podílový odhad  
$$
  \hat p = \frac{K}{n} = \frac{60}{100} = 0{,}60.
$$
### 2. Konfidenční interval (95 %)
1. **Standardní chyba** odhadu $\hat p$:  
$$
   \mathrm{se}(\hat p)
   = \sqrt{\frac{\hat p(1-\hat p)}{n}}
   = \sqrt{\frac{0{,}6\cdot0{,}4}{100}}
   = 0{,}049.
$$
2. **Kritická hodnota** pro 95 % CI:  
$$
   z_{\alpha/2} = z_{0{,}025} \approx 1{,}96.
$$
3. **Interval** pro $\hat p \pm z_{\alpha/2}$
$$
   \mathrm{se}
   = 0{,}60 \pm 1{,}96\cdot0{,}049
   = [\,0{,}60 - 0{,}096,\;0{,}60 + 0{,}096\,]
   ≈ [\,0{,}504,\;0{,}696\,].

$$

> _Interpretace:_ S 95 % jistotou říkáme, že skutečný $p$ leží někde mezi 0,504 a 0,696.

---

### 3. Testování hypotézy
#### Hypotézy
- $H_0\!: p = 0{,}5$  
- $H_1\!: p > 0{,}5$  (jednostranný test)
#### Testová statistika
Za $H_0$ platí
$$
Z = \frac{\hat p - p_0}{\sqrt{p_0(1-p_0)/n}}
= \frac{0{,}60 - 0{,}50}{\sqrt{0{,}5\cdot0{,}5/100}}
= \frac{0{,}10}{0{,}05}
= 2.
$$
#### p-hodnota
$$
\text{p-hodnota} = P(Z > 2) = 1 - \Phi(2) \approx 1 - 0{,}9772 = 0{,}0228.
$$
#### Rozhodnutí
- Zvolíme $\alpha = 0{,}05$.  
- Protože p-hodnota $0{,}0228 < 0{,}05$, zamítáme $H_0$.  

> _Interpretace:_ Pozorování 60 úspěchů z 100 je při $p=0{,}5$ dost nepravděpodobné (jen asi 2,3 % šance), proto usuzujeme, že skutečný podíl úspěchů je vyšší než 0,5.

---
### 4. Chyby a síla testu

- **Chyba I. druhu ($\alpha$=5 %):** Zamítnout $H_0$, i když $p=0{,}5$ (falešné poplachy).  
- **Chyba II. druhu ($\beta$):** Nezamítnout $H_0$, i když ve skutečnosti $p>0{,}5$.  

  Například pokud je pravý $p=0{,}6$, kritický práh pro zamítnutí je $\hat p>0{,}582$ (protože $z_{0,05}=1,645$ dává $0{,}5+1,645\cdot0{,}05\approx0{,}582$).  
  Pak  
$$
  \beta = P\bigl(\hat p \le 0{,}582 \mid p=0{,}6\bigr)
  \approx P\!\Bigl(Z \le \frac{0{,}582-0{,}6}{\sqrt{0{,}6\cdot0{,}4/100}}\Bigr)
  = P\bigl(Z \le -0{,}357\bigr)
  \approx 0{,}36.
$$
  Síla testu $1-\beta\approx0{,}64$.

---

### Shrnutí

1. **Intervalový odhad:** Dává rozsah, kde s danou jistotou leží parametr.  
2. **Test hypotézy:** Porovnává data s předpokladem $H_0$, rozhoduje podle hladiny $\alpha$.  
3. **Chyba I. druhu:** Prorazíme $H_0$, i když je pravdivá (říkáme si „falešný poplach“).  
4. **Chyba II. druhu:** Nezamítneme $H_0$, i když je ve skutečnosti nepravdivá (promarněná příležitost).  
5. **p-hodnota:** Skutečná pravděpodobnost pozorovat tak extrémní či ještě extrémnější hodnotu testové statistiky za $H_0$.  
6. **Síla testu:** Pravděpodobnost správného zamítnutí $H_0$ pod alternativou.
