# Primitivní funkce
*Definice:* Funkce $F$ je primitivní k $f$ na intervalu $I$, pokud $F'(x)=f(x)$ pro všechna $x\in I$. Zapisujeme  
$$
\int f(x)\,dx = F(x) + c.
$$*Metody výpočtu:*  
  1. **Substituce**: Pokud $\varphi\colon(\alpha,\beta)\to(a,b)$ má vlastní derivaci a $F$ je primitivní k $f$, pak  
$$
\int f(\varphi(t))\,\varphi'(t)\,dt = F(\varphi(t)) + c.
$$
    Inverzní substituce (Věta 10.9): 
$$
\int f(x)\,dx = G\bigl(\varphi^{-1}(x)\bigr) + c,
$$
	kde $G$ je primitivní k $f\circ\varphi$. 
  2. **Per partes**: Pro spojité $f,g$ s primitivními $F,G$ platí  
$$
\int f(x)\,G(x)\,dx + \int F(x)\,g(x)\,dx = F(x)G(x) + c.
$$
---
# Riemannův integrál
*Definice:* Pro dělení $D=(a_0,\dots,a_k)$ intervalu $[a,b]$ a funkci $f\colon[a,b]\to\mathbb R$ definujeme dolní Riemannovu sumu  
$$
s(f,D)=\sum_{i=0}^{k-1}(a_{i+1}-a_i)\,\inf_{x\in[a_i,a_{i+1}]}f(x),
$$
  a horní sumu  
$$
  S(f,D)=\sum_{i=0}^{k-1}(a_{i+1}-a_i)\,\sup_{x\in[a_i,a_{i+1}]}f(x).
$$
  Pokud  
$$
\sup_D s(f,D) = \inf_D S(f,D) \in \mathbb R,
$$
  říkáme, že $f$ je Riemannovsky integrovatelná a tuto hodnotu nazýváme
$$
  \int_a^b f(x)\,dx.
$$
## Newtonův integrál vs. Riemannův
Pokud $F$ je primitivní k $f$ spojitá na $[a,b]$, pak  
$$
  \int_a^b f(x)\,dx = F(b)-F(a).
$$
---
# Aplikace integrálu  
  1. **Odhady součtu řad**  
- Pro neklesající $f$ na $[1,n]$ platí
$$
\sum_{k=1}^{n-1}f(k)\;\le\;\int_1^n f(x)\,dx\;\le\;\sum_{k=2}^{n}f(k).
$$
 - Integrální kritérium: Pro nerostoucí $f\ge0$ na $[1,\infty)$ konverguje $\sum f(k)$ právě když $\int_1^\infty f(x)\,dx<\infty$. 

  2. **Obsahy rovinných útvarů**  
Pod grafem $U(a,b,f)=\{(x,y):a\le x\le b,\;0\le y\le f(x)\}$ je plocha
$$
\mathrm{area}(U)=\int_a^b f(x)\,dx.
$$

  3. **Objemy a povrchy rotačních útvarů**  
Pro rotační těleso kolem osy $x$ pod grafem $y=f(x)\ge0$ na $[a,b]$ platí  
$$
     \mathrm{Vol}(V)=\pi\int_a^b \bigl(f(t)\bigr)^2\,dt,\quad
     \mathrm{Area}(\partial V)
     =2\pi\int_a^b f(t)\sqrt{1+(f'(t))^2}\,dt.
$$
  4. **Délka křivky**  
Graf $G=\{(x,f(x)):a\le x\le b\}$ má délku  
$$
     L = \int_a^b \sqrt{1 + (f'(t))^2}\,dt.
$$
