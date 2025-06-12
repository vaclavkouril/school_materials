# Zákon velkých čísel
*Věta:* Mějme $X_{1},X_{2},\dots$ nezávislé náhodné veličiny stejného rozdělení, se střední hodnotou $\mu$ a rozptylem $\sigma^2$. Označme $\overline X_{n} = \frac{X_{1} + X_{2} + \dots,X_{n}}{n}$ jako výběrový průměr. Pak 
1. **Silný zákon velkých čísel** říká, že platí 
$$
\lim_{ n \to \infty } \overline{X_{n}} = \mu \quad \text{skoro jistě, tedy s pravděpodobností } 1
$$
2. **Slabý zákon velkých čísel** říká, že $\forall \epsilon >0$ platí 
$$
\lim_{ n \to \infty } P(|\overline{X_{n}} -\mu| > \epsilon) = 0 
$$
Říkáme, že pak posloupnost $\overline{X_{n}}$ konverguje v pravděpodobnosti.

---
# Centrální limitní věta
*Věta:* Mějme $X_{1},X_{2},\dots$ nezávislé náhodné veličiny stejného rozdělení, se střední hodnotou $\mu$ a rozptylem $\sigma^2$. Označme $Y_{n} = \frac{(X_{1} + X_{2} + \dots,X_{n}) - n\mu}{\sigma \sqrt{ n }}$ pak 
$$
Y_{n} \stackrel{d}{\to} N(0,1).
$$
Neboli pokud $F_{n}$ je distribuční funkce $Y_{n}$ tak 
$$
\lim_{ n \to \infty } F_{n}(x)= \phi(x) \quad \text{pro každé } x\in \mathbb{R}
$$
Říkáme, že posloupnost $Y_{n}$ konverguje k $N(0,1)$ v distribuci.

*Intuice:* Vlastně to říká, že pro libovolné náhodné veličiny, když jich máme hodně tak se více a více přibližujeme k průměrnému hodu býti jako střední hodnota jedné této veličiny.