*Definice:* Model jazyka $\mathbb{P}$ je ohodnocení $v\in\{0,1\}^{|\mathbb{P}|}$ pravdivostních hodnot prvovýroků; říkáme, že $v$ je modelem formule $\varphi$, zapisujeme $v\models\varphi$, právě když pravdivostní funkce $f_{\varphi,\mathbb{P}}(v)=1$. Množinu všech modelů $\varphi$ označíme $M(\varphi)$.

*Definice:* Výrok $\varphi$ je
1. pravdivý (tautologie), pokud $M(\varphi)=M_{\mathbb{P}}$, tedy platí v každém modelu jazyka, 
2. lživý (sporný), pokud $M(\varphi)=\emptyset$, tedy nemá žádný model,
3. nezávislý, pokud $\emptyset\subsetneq M(\varphi)\subsetneq M$,
4. splnitelný, pokud $M(\varphi)\neq\emptyset$.

*Definice:* Pro teorii $T\subseteq\mathrm{VF}_{\mathbb{P}}$ definujeme množinu jejích modelů $M(T)=\bigcap_{\psi\in T}M(\psi)$. 
Říkáme, že $\varphi$ je **důsledek** $T$ (zapisujeme $T\models\varphi$), právě když každý model $T$ je modelem $\varphi$, tj. $M(T)\subseteq M(\varphi)$. 
$\varphi$ je pravdivý v $T$, pokud pro všechna $v\in M(T)$ platí $v\models\varphi$.

Teorie v konečném jazyce $P=\{p_1,\dots,p_n\}$ má nejvýše $2^n$ modelů.  

Modely $T$ získáme průnikem modelů jeho axiomatických formulí: $M(T)=\bigcap_{\psi\in T}M(\psi)$.  

Příklad: Nechť $T=\{\,p\lor q\lor r,\;q\to r,\;\neg r\}$.  
   1. $M(r)=\{(x,y,0)\mid x,y\in\{0,1\}\}$,  
   2. $M(r,q\to r)=\{(0,0,0),(1,0,0)\}$,  
   3. $M(T)=\{(1,0,0)\}$.
