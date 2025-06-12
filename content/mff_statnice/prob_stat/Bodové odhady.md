Bodový odhad $\hat\theta_n$ parametru $\theta$ je funkce výběru $X_1,\dots,X_n$ (náhodný vzorek) sloužící jako „odhad“ skutečné hodnoty $\theta$.  

### Vlastnosti odhadů
- **Nevychýlenost (nestrannost)**  
$$
    \hat\theta_n\text{ je nevychýlený, pokud }
    \mathbb E\bigl[\hat\theta_n\bigr] = \theta.
$$
- **Asymptotická nevychýlenost**  
$$
    \lim_{n\to\infty} \mathbb E\bigl[\hat\theta_n\bigr] = \theta.
$$
- **Konzistence**  
$$
    \hat\theta_n\xrightarrow{P}\theta
    \quad\text{(konverguje v pravděpodobnosti).}
$$
- **Bias (vychýlení)**  
$$
    \mathrm{bias}\bigl(\hat\theta_n\bigr)
    = \mathbb E\bigl[\hat\theta_n\bigr] - \theta.
$$
- **Střední kvadratická chyba (MSE)**  
$$
    \mathrm{MSE}\bigl(\hat\theta_n\bigr)
    = \mathbb E\bigl[(\hat\theta_n-\theta)^2\bigr]
    = \mathrm{bias}(\hat\theta_n)^2 + \mathrm{Var}(\hat\theta_n).
$$

---

## Metoda momentů
1. **Myšlenka:**  
   Pro parametrické rozdělení $F_\theta$ definujeme populární (teoretické) momenty  
$$
     m_r(\theta) = \mathbb E_\theta\bigl[X^r\bigr].
$$
   Spočítáme odpovídající výběrové momenty  
$$
     \widehat m_r = \frac1n\sum_{i=1}^n X_i^r.
$$
2. **Postup:**  
   Vybereme tolik rovnic $m_r(\theta)=\widehat m_r$, kolik máme neznámých parametrů, a vyřešíme je pro $\hat\theta_n$.  
3. **Vlastnosti:**  
   - Odhady jsou obvykle konzistentní a asymptoticky nevychýlené.  
   - Jednoduché na výpočet, ale nemusí být efektivní (větší rozptyl než MLE).  
1. **Příklad:** Pro $\mathrm{Norm}(\mu,\sigma^2)$ lze použít  
$$
     \widehat m_1=\overline X = \frac1n\sum X_i,\quad
     \widehat m_2=\frac1n\sum X_i^2.
$$
   Z rovnic  $\mu = \widehat m_1,\quad \sigma^2+\mu^2 = \widehat m_2$
   dostaneme odhady $\hat\mu=\overline X$, $\widehat\sigma^2 = \widehat m_2 - \overline X^2$.

---
## Metoda maximální věrohodnosti (MLE)
1. **Myšlenka:**  
   Pravděpodobnost (hustota) pozorování $X_1=x_1,\dots,X_n=x_n$ je  
$$
     L(\theta)
     = \begin{cases}
       \prod_{i=1}^n p(x_i;\theta),&\text{diskrétní},\\
       \prod_{i=1}^n f(x_i;\theta),&\text{spojité}.
     \end{cases}
$$
   Hledáme $\hat\theta_n = \arg\max_\theta L(\theta)$.  
2. **Log‐věrohodnost:**  
 $$
     \ell(\theta) = \log L(\theta)
     = \sum_{i=1}^n \log p(x_i;\theta)
     \quad\text{nebo}\quad
     \sum_{i=1}^n \log f(x_i;\theta).
$$
   Budeme řešit $\ell'(\theta)=0$.  
3. **Vlastnosti MLE:**  
   - **Konzistence** (za běžných podmínek).  
   - **Asymptotická normalita:**  
     $\sqrt n(\hat\theta_n-\theta)\xrightarrow{d}N(0,I(\theta)^{-1})$, kde $I(\theta)$ je Fisherova informace.  
   - **Asymptotická efektivita:** Dosahuje Cramér‐Rao dolní meze.  
4. **Příklad (Bernoulli):**  
   Data: $k$ úspěchů v $n$ pokusech.  
$$
     L(\theta)=\theta^k(1-\theta)^{n-k},\quad
     \ell(\theta)=k\ln\theta + (n-k)\ln(1-\theta).
$$
   Derivací:  
 $\ell'(\theta)=\frac{k}{\theta}-\frac{n-k}{1-\theta}=0 \to \hat\theta_n = \frac{k}{n}$.
