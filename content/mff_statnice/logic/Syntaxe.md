*Definice:* Jazyk je neprázdná množina _výrokových proměnných_ $\mathbb{P}$, prvkům říkáme _prvovýroky_ nebo _atomické výroky_. Kromě těchto proměnných máme také logické symboly $\neg, \land, \lor, \to, \leftrightarrow$ a závorky, pro jazyky predikátové logiky přidáváme ještě $\exists, \forall.$

*Definice:* **Výrok** v jazyce $\mathbb{P}$ je prvek množiny $\text{VF}_{\mathbb{P}}$ definované jako nejmenší množina splňující
1. $\forall p \in \mathbb{P}: p\in \text{VF}_{\mathbb{P}}$,
2. $\forall \varphi \in \text{VF}_\mathbb{P}: \neg \varphi \in \text{VF}_{\mathbb{P}}$,
3. $\forall \varphi, \psi \in \text{VF}_\mathbb{P}: \varphi \land \psi, \varphi \lor \psi, \varphi \to \psi, \varphi \leftrightarrow \psi \in \text{VF}_{\mathbb{P}}$.

Vzhledem k tomu, že ne každý prvovýrok musí být obsáhnut v každém výroku tak definujeme $\text{Var}: \text{VF}_{\mathbb{P}} \to \mathscr{P}(\mathbb{P})$, která zobrazí $\psi \in \text{VF}_{\mathbb{P}}$ na množinu obsahující prvovýroky ve $\psi$. 

*Definice:* Podvýrok (podformule) je podřetězec, který je sám o sobě výrok. Množinu prvovýroků obsažených ve formuli $\varphi$ označíme $\mathrm{Var}(\varphi)$. Např. pro  
$$
\varphi=((p\lor\neg q)\leftrightarrow(r\to(p\land q)))
$$  
platí $\mathrm{Var}(\varphi)=\{p,q,r\}$. 

*Definice:* Každá formule $\varphi\in\mathrm{VF}_{\mathbb{P}}$ má jedinečný syntaktický strom $\text{Tree}(\varphi)$, kde listy jsou atomické výroky $p\in\mathbb{P}$ a vnitřní uzly jsou unární symbol $\neg$ nebo binární symboly $\land,\lor,\to,\leftrightarrow$.

*Definice:* Výskytem proměnné $x$ ve formuli $\psi$, je rozuměno, že existuje list $\text{Tree}(\psi)$ s označením $x$, výskyt je 
1. **vázaný** je-li takové $x$ i součástí nějakého podstromu začínajícího $(Qx)$, kde $Q \in \{ \forall, \exists \}$,
2. **volný** kdykoliv není vázaný.

*Definice:* Teorie $T$ v jazyce $\mathbb{P}$ je libovolná množina výrokových formulí $T\subseteq\mathrm{VF}_{\mathbb{P}}$. Axiomy teorie jsou prvky $T$.

*Definice:* Formule je **otevřená**, pokud neobsahuje žádný kvantifikátor; je to uzavřená (sentence), pokud nemá žádnou volnou proměnnou.

*Příklad:* $x+y\le0$ je otevřená; $(\forall x)(\forall y)(x+y\le0)$ je uzavřená; $(\forall x)(x+y\le0)$ není ani otevřená, ani uzavřená. 

---
# Tvary výrokových formulí
*Definice:* Instance formule $\varphi(x_1,\dots,x_n)$ na termy $t_1,\dots,t_n$ je formule  
$$
\varphi[x_1:=t_1,\dots,x_n:=t_n]
$$
kde každá volná proměnná $x_i$ je nahrazena termem $t_i$, přičemž se přejmenují vázané proměnné, aby nedošlo ke kolizi. 

*Definice:* Varianta formule je ekvivalentní formule získaná přejmenováním všech vázaných proměnných (α-konverze). 

*Konjunktivní normální forma (CNF):* literál je $p$ nebo $\neg p$, pro $p \in \mathbb{P}$, klauzule je disjunkce ($\lor$) literálů, formule je konjunkcí ($\land$) klauzulí (prázdná formule je $\top$). 

*Disjunktivní normální forma (DNF):* elementární konjunkce je konjunkce literálů, formule je disjunkcí elementárních konjunkcí (prázdná formule je $\bot$).  

*Převod do CNF/DNF:*  
1. Odstranění ekvivalencí a implikací:  
$$
\varphi\leftrightarrow\psi\sim(\neg\varphi\lor\psi)\land(\neg\psi\lor\varphi),\quad \varphi\to\psi\sim\neg\varphi\lor\psi.
$$ 
2. Posunutí negací na literály (De Morgan), odstranění dvojitých negací.  
3. Distributivita: 
$$
\phi\land(\psi\lor\chi)\sim(\phi\land\psi)\lor(\phi\land\chi)\quad\text{(pro DNF)},
$$ $$
\phi\lor(\psi\land\chi)\sim(\phi\lor\psi)\land(\phi\lor\chi)\quad\text{(pro CNF)}.
$$
*Použití:* SAT solvery běžně vyžadují CNF; rezoluční metoda pracuje na množinové reprezentaci klauzulí v CNF.

*Definice:* Formule je v **prenexní normální formě (PNF)**  , je-li ve tvaru  
$$
(Q_1x_1)\dots(Q_nx_n)\,\varphi'
$$
kde každý $Q_i\in\{\forall,\exists\}$ a $\varphi'$ je otevřená (otevřené jádro formule). 

*Lemma:* (Bublání kvatifikátorů) Označme $\overline Q$ jako doplňkový kvantifikátor ke $Q$. Nechť $\varphi, \psi$ jsou formule a proměnná není volná ve $\psi$ (kdyby byla tak ji v $\psi$ b.ú.n.o. přejmenujeme). Potom platí
$$
\begin{align}
\neg (Qx)\varphi &\sim (\overline Q x) \neg\varphi \\
(Qx)\varphi \land \psi &\sim (Q x) (\varphi \land \psi) \\
(Qx)\varphi \lor \psi &\sim (Q x) (\varphi \lor \psi) \\
(Qx)\varphi \to \psi &\sim (\overline Q x) (\varphi \to \psi)  \\
\psi \to (Qx)\varphi &\sim (Q x) (\psi \to \varphi)
\end{align}
$$
kde všechny jsou sémanticky jasné až na implikaci, kde kvatifikátor je v _antecendentu_, kdy je nutnost změny kvatifikátoru vzniká jasně z přepisu implikace na disjunkci a sice
$$
(Qx) \varphi \to \psi \sim \neg (Qx) \varphi \lor \psi \sim (\overline Qx) \neg  \varphi \lor \psi \sim (\overline Qx) \varphi \to \psi.
$$
*Převod do PNF:*  
1. Nahrazení podformulí ekvivalentními dle *Lemma* o bublání kvatifikátorů
2. Přejmenování vázaných proměnných (α-konverze)  
3. Opakování dokud všechny kvantifikátory neprojdou na začátek
4. 
Výsledkem je ekvivalentní formule v PNF.

Navíc z *PNF* můžeme udělat skolemizací *Skolemovu variantu*, kde máme jen všeobecné kvatifikátory. Process skolemizace je vlastně postaven na myšlence, že existence proměnné, aby něco splnila je podmíněna všeobecnými proměnnými před ní a tedy nahrazujeme proměnné s existenčními kvantifikátory iterativně zprava doleva za funkce které mají jako vstup proměnné nalevo od nich.
Tedy začíná-li formule $(\exists x) (\forall y)(\exists z) \psi$, tak všechny výskyty $z$ se nahradí za $f(x,y)$ a poté se všechny výskyty $x$ nahradí $g$, tedy konstantou.