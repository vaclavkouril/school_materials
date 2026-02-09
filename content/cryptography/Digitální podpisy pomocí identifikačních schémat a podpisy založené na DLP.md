KL 13.5

---
# Definice podpisového schéma
Obsahuje 3 poly-time algoritmy $(Gen,Sign,Vrfy)$ takové, že
1. $Gen$ dostane jako vstup **securty parameter** $1^n$ a vrátí $(pk,sk)$ public a private klíče a každý má délku alespoň $n$ a $n$ může být z obou odvozeno.
2. $Sign$ vezme jako vstup private key a zprávu $m$ z nějakého prostoru zpráv $\mathcal{M}$. Vrátí podpis $\sigma$ a píšeme $\sigma \leftarrow Sign_{sk}(m)$.
3. $Vrfy$ je deterministický dostávající $pk$ a zprávu $m$ s podpisem $\sigma$. Vrací bit $b$, který je $1$, pokud je podpis validní a $b=0$ pokud není. Píšeme $b:= Vrfy_{pk}(m,\sigma)$.

Je potřeba, aby se s **nezanedbatelnou** pravděpodobností nad $(pk,sk)$ výstupy $Gen(1^n)$ platilo $Vrfy_{pk}(m,Sign_{sk}(m))=1$ pro každou (legální) zprávu $m$.

Pokud existuje funkce $\ell$ taková, že všechny výstupy $Gen(1^n)$ je prostor zpráv $\{ 0,1 \}^{\ell(n)}$ tak, řekneme o $(Gen,Sign,Vrfy)$, že je podpisové schéma pro zprávy délky $\ell(n)$.

Experiment $\text{Sig-forge}_{\mathcal{A},\Pi}(n)$ pro $\mathcal{A}$ útočníka a $\Pi=(Gen,Sign,Vrfy)$ a parametr $n$:
1. $Gen(1^n)$ vygeneruje $(pk,sk)$.
2. $\mathcal{A}$ dostane $pk$ a přístup k orákulu $Sign_{sk}(\cdot)$. $\mathcal{A}$ vydává výstupy $(m,\sigma)$. Nechť $\mathcal{Q}$ jsou množina zodpovězených dotazů na orákulum.
3. $\mathcal{A}$ uspěje $\iff$ $(1) Vrfy(m,\sigma)=1$ a $(2) m \not\in \mathcal{Q}$. V takovém případě je výstup experimentu $1$. 

*Definice:* Podpisové schéma $\Pi=(Gen,Sign,Vrfy)$ je **existentially unforgeable under an adaptive chosen-message attack**, nebo stačí jen **bezpečné**, když pro každého poly-time útočníka $\mathcal{A}$ existuje zanedbatelná funkce $negl$ taková, že
$$
\Pr[\text{Sig-forge}_{\mathcal{A},\Pi}(n)=1] \leq ne gl(n).
$$
---
# Podpisy z diskrétních logaritmů
## Identifikační schémata a podpisy
 Prover má dva algoritmy $\mathcal{P}_{1},\mathcal{P}_{2}$ a verifier má algoritmus $\mathcal{V}$. Ověření, že prover je tím kdo má přístup k $sk$ se dělá následovně
 1. $Gen(1^n)$ na straně provera a ten má $sk$ a $pk$ je pro verifiera.
 2. Prover: $(I,state) \leftarrow \mathcal{P}_{1}(sk)$ a pošle $I$ verifierovi.
 3. Verifier: vybere uniformě náhodně challenge $r\leftarrow \Omega_{pk}$ a pošle $r$.
 4. Prover: spočte odpověď $s:= \mathcal{P}_{2}(sk,state,r)$ a pošle $s$
 5. Verifier: $\mathcal{V}(pk,r,s)$ a překontroluje rovnost s $I$.

$I$ musí být nedegenerované, tedy pokud každý $sk$ a zafixovaná libovolná možná $I$ initial message je
$$
\Pr[\mathcal{P}_{1}(sk) = I] \leq ne gl(n).
$$
To můžeme i s každým degenerovaným schématem doplněním $I||rand$ pro uniformně náhodné $rand \in \{ 0,1 \}^n$.

$Trans_{sk}$ je orákulum bez vstupu takové, že provede pravou interakci mez Prover($sk$) a Verifier($pk$) vracející přepis komunikace $(I,r,s)$.

Pro $\Pi=(Gen,\mathcal{P}_{1},\mathcal{P}_{2},\mathcal{V})$ je identifikační schéma a uvažujme experiment pro útočníka $\mathcal{A}$ s parametrem $n$:

$Ident_{\mathcal{A},\Pi}(n):$
1. $Gen(1^n)$ pro získání klíčů $(sk,pk)$.
2. $\mathcal{A}$ dostane $pk$ a orákulum $Trans_{sk}$ tak, že může udělat volání kolik chce.
3. V určitý moment $\mathcal{A}$ pošle $I$. Náhodná challenge $r \in \Omega_{pk}$ je vybrána a dána $\mathcal{A}$, který odpoví s $s$ (během toho se může ptát na $Trans_{sk}$)
4. Experiment vydá $1 \iff$ $\mathcal{V}(pk,r,s) = 1$. 

*Definice:* Idetifikační schéma $\Pi=(Gen,\mathcal{P}_{1},\mathcal{P}_{2},\mathcal{V})$ je **bezpečné** pro každého pravděpodobnostního poly-čas útočníka $\mathcal{A}$ pokud existuje zanedbatelná $ne gl$ funkce pro kterou platí
$$
\Pr[Ident_{\mathcal{A},\Pi}(n)=1] \leq ne gl (n).
$$
### Konstrukce podpisů z identifikací (Fiat-Shamirova transformace)
Nechť $(Gen_{id},\mathcal{P}_{1},\mathcal{P}_{2},\mathcal{V})$ je identifikační schéma a konstruujeme podpisové schéma následovně
- $Gen$ na vstupu $1^n$ spustí $Gen_{id}(1^n)$ k zisku $(pk,sk)$, kde $\Omega_{pk}$ je parametrizováno $pk$. Součástí generování se zvolí $H: \{ 0,1 \}^* \to \Omega_{pk}$.
- $Sign$ na vstupu $sk$ a $m \in \{ 0,1 \}^*$ uděláme
	1. Spočteme $(I,state)\leftarrow \mathcal{P}_{1}(sk)$.
	2. Spočteme $r := H(I,m)$.
	3. Spočteme $s:= \mathcal{P}_{2}(sk,state,r)$.
	
	Vydáme jako výstup podpis $(r,s)$.
- $Vrfy$ na vstupu $pk$, $m$, $\sigma=(r,s)$ spočteme $I:= \mathcal{V}(pk,r,s)$ a vydáme $1 \iff H(I,m)=r$. 

Pokud je $H$ modelováno jako náhodné orákulum uniformě zobrazující vstupy na $\Omega_{pk}$ tak i $r$ je uniformně náhodné.

#### *Věta:* Nechť $\Pi=(Gen,\mathcal{P}_{1},\mathcal{P}_{2},\mathcal{V})$ je identifikační schéma a nechť $\Pi'$ je podpisové schéma, které vyjde aplikací Fiat-Shamirovi transformace. Když $\Pi$ je bezpečné a $H$ je modelované jako náhodné orákulum, pak $\Pi'$ je bezpečné.
*Důkaz:* Nechť $\mathcal{A}'$ je pravděpodobnostní poly-time útočník na $\Pi'$ s $q=q(n)$ je horní hranice na počet dotazů $\mathcal{A}'$ udělá na $H$. Předpokládejme, že
- $\mathcal{A}'$ udělá unikátní dotaz na $H$ jen jednou,
- po dostání podpisu $(r,s)$ na zprávu $m$ s $\mathcal{V}(pk,r,s)=I$, tak útočník $\mathcal{A}'$ se nikdy nezeptá na $H(I,m)$ (zná výsledek $r$),
- když $\mathcal{A}'$ vrátí falšovaný podpis $(r,s)$ na zprávu $m$ s $\mathcal{V}(pk,r,s)=I$, tak $\mathcal{A}'$ se dříve zeptal na $H(I,m)$.

Dokážeme zkonstruovat útočníka $\mathcal{A}$ používající $\mathcal{A}'$ útočícího na $\Pi$. $\mathcal{A}$ vypadá následovně, dostane $pk$ a orákulum $Trans_{sk}$
1. Vybereme uniformně náhodně $j \in \{ 1,\dots,q \}$
2. Rozběhneme $\mathcal{A}'(pk)$. Odpovíme na jeho dotazy následovně:
	1. Když $\mathcal{A}'$ chce $i$-tý dotaz na $H(I_{i},m_{i})$ tak odpovíme následovně
		- Když $i=j$, pošle se $I_{j}$ verifikátoru a dostaneme challenge $r$. Vrátíme $r$ pro $\mathcal{A}'$ jako odpověď.
		- Když $i \neq j$, vybereme náhodné $r \in \Omega_{pk}$ a vrátíme $r$ jako odpověď na dotaz pro $\mathcal{A}'$.
	2. Když $\mathcal{A}'$ chce podpis zprávy $m$, tak odpovíme dle $Trans_{sk}$, ze kterého dostaneme $(I,r,s)$ a předáme $\mathcal{A}'$ přesně $(r,s)$.
	3. Když $\mathcal{A}'$ vrátí falšovaný podpis $(r,s)$ na zprávu $m$, spočteme $I:= \mathcal{V}(pk,r,s)$ a překontrolujeme zda $(I,m)=(I_{j},m_{j})$. Když ano tak vrátíme $s$, jinak skončíme neúspěchem.

Může se stát, že $\mathcal{A}$ odpoví na podpisový dotaz na zprávu $m$ používaje přepis $(I,r,s)$, pro které je $H(I,m)$ již definováno ($\mathcal{A}'$ se na něj již zeptal) a $H(I,m) \ne r$. To se ale pro nedegenerované $\Pi$ stane jen se zanedbatelnou pravděpodobností a tedy pravděpodobnost $\mathcal{A}'$ odpovídající falšovanou indentifikací při použití v $\mathcal{A}$ je $\Pr[\text{Sig-forge}_{\mathcal{A}',\Pi'}(n)=1]-ne gl(n)$ pro zanedbatelnou funkci $ne gl(n)$.

Vezměme případ, kde experiment $Ident_{\mathcal{A},\Pi}(n)$ ve kterém $\mathcal{A}'$ vrátí falšovaný podpis $(r,s)$ na zprávu $m$ a nechť $I:= \mathcal{V}(pk,r,s)$. Kvůli uniformitě $j$ tak máme $\Pr[(I,m)=(I_{j},m_{j})] = 1 / q$. (Předpokládali jsme $\mathcal{A}'$ vydá falešný podpis, pak se zeptalo na $H(I,m)$) Když se stane jak shoda $I,m$ a $I_{j},m_{j}$ i experiment vrátí falšovaný podpis, tak $\mathcal{A}$ je přesvědčivě za provera. $\mathcal{A}$ pošle $I_{j}$ jako initial zprávu dostane $r$ jako challenge a pošle $s$, ale $H(I_{j},m_{j})=r$ a (z validity falešného podpisu) máme $\mathcal{V}(pk,r,s)=I$, dohromady:
$$
\begin{align}
\Pr[Ident_{\mathcal{A},\Pi}(n)=1] &\geq \frac{1}{q(n)} \cdot (\Pr[\text{Sig-forge}_{\mathcal{A}',\Pi'}(n)=1]) -ne gl (n)  \\
\Pr[\text{Sig-forge}_{\mathcal{A}',\Pi'}(n)=1] &\leq {q(n)} \cdot \Pr[Ident_{\mathcal{A},\Pi}(n)=1]  -ne gl (n)
\end{align}
$$
Když $\Pi$ je bezpečné, tak $\Pr[Ident_{\mathcal{A},\Pi}(n)=1]$ je zanedbatelné a protože $q(n)$ je polynomiální, tak máme $\Pr[\text{Sig-forge}_{\mathcal{A}',\Pi'}(n)=1]$ taky zanedbatelné. Protože $\mathcal{A}'$ byl libovolný tak $\Pi'$ je také bezpečné.

---
## Schnorrovo podpisové schéma
- $\mathcal{G}$ je poly-time algoritmus, který na vstupu $1^n$ vrátí popis cyklické grupy $\mathbb{G}$, její řád $q, ||q|| =n$ a generátor $g$. 
- Pro klíče prover spustí $\mathcal{G}(1^n)$ a dostane $(\mathbb{G},q,g)$ a vybere uniformě náhodně $x\in \mathbb{Z}_{q}$ a nastaví $y:= g^x$ a public key je $\left\langle \mathbb{G},q,g,y \right\rangle$ a private key je $x$.
- Prover uniformně náhodně zvolí $k\in \mathbb{Z}_{q}$ a nastaví $I:= g^k$, které pošle verifierovi, ten vrátí náhodnou challenge $r \in \mathbb{Z}_{q}$, prover pošle $s:= [rx +k \mod q]$ a verifier přijme pokud $g^{s} \cdot y^{-r}=I$.

Správnost z
$$
g^s \cdot y^{-r}= g^{rx +k} \cdot (g^x)^{-r} = g^k =I.
$$
$I=g^k$ u $k \leftarrow \mathbb{Z}_{q}$, takže je $I$ uniformní v $\left\langle g \right\rangle$, tak je nedegenerovaná.

### ★ *Věta:* Když je výpočet diskrétního logaritmu těžký vůči $\mathcal{G}$, pak Schnorrovo identifikační schéma je bezpečné.
*Důkaz:* Nechť $\Pi$ je Schnorrovo identifikační schéma. Nechť $\mathcal{A}$ je PPT (pravděpodobnostní poly-time) útočník na toto schéma. Vyrobíme algorimus $\mathcal{A}'$ řešící problém diskrétního logaritmu vůči $\mathcal{G}$: algoritmus $\mathcal{A}'$ dostane $(\mathbb{G},q,g,y)$ na vstupu.
1. Běží $\mathcal{A}(pk)$, odpovídající na jeho dotazy na $Trans_{sk}$, které se mohou simulovat i bez znalosti $sk$, protože poctivé $(I,r,s)$ mají stejnou distribuci jako: vybereme uniformně náhodně $r,s\in \mathbb{Z}_{q}$ a nastavíme $I:= g^s \cdot y^{-r}$.
2. Když $\mathcal{A}$ vrátí $I$, vybereme uniformně náhodně $r_{1}\in \mathbb{Z}_{q}$ jako challenge. Dáme $r_{1}$ jako odpověď $\mathcal{A}$, který vydá $s_{1}$.
3. Spustíme $\mathcal{A}(pk)$ podruhé se stejnou náhodností $\omega$ a místo $r_{1}$ mu dáme jako odpověď na $I$ $r_{2}$ útočník vraceje $s_{2}$.
4. Když $g^{s_{1}}\cdot y^{-r_{1}} = I$ a $g^{s_{2}}\cdot y^{-r_{2}} =I$ a $r_{1} \ne r_{2}$ tak výstupem bude $[(s_{1}-s_{2})\cdot (r_{1}-r_{2})^{-1} \mod q]$, jinak nebude výstupem nic.

Pokud vezmeme jeden běh $\mathcal{A}$ v $\mathcal{A}'$ a $\omega$ bude značit náhodnost použité při běhu, kromě náhodnosti pro challenge $r$. Tedy z $\omega$ můžeme odvodit náhodnost pro $\mathcal{G}$, volbu $sk =x$, náhodnost v $\mathcal{A}$ a náhodnost při odpovídání na $Trans_{sk}$. Definujme $V(\omega,r)=1 \iff \mathcal{A}$ správně odpoví na challenge $r$ při náhodnosti $\omega$. Pro nějaké zafixované $\omega$ definujme $\delta_{\omega} = \Pr_{r}[V(\omega,r)=1]$, pro fixované $\omega$ je to pravděpodobnost přes výběr challenge, které $\mathcal{A}$ umí odpovědět.

Definujme $\delta( n)=\Pr[\text{Ident}_{\mathcal{A},\Pi}(n)=1]$. Protože simulace $Trans_{sk}$ je perfektní, tak máme 
$$
\delta(n) = \Pr_{\omega,r}[V(\omega,r)=1]=\sum_{\omega}\Pr[\omega] \cdot \delta_{\omega}.
$$
Navíc z rovnosti $g^{s_{1}}\cdot y^{-r_{1}} = I =g^{s_{2}}\cdot y^{-r_{2}} \implies g^{s_{1}-s_{2}} = y^{r_{1}-r_{2}}$, tak pokud umí útočník odpovědět správně tak vlastně umí spočíst
$$
\log_{g} y = [(s_{1}-s_{2})\cdot (r_{1}-r_{2})^{-1} \mod q].
$$
Tedy
$$
\begin{align}
\Pr[\text{Dlog}_{\mathcal{A},\mathcal{G}}(n)=1] &= \Pr_{\omega,r_{1},r_{2}}[V(\omega,r_{1}) \land V(\omega,r_{2}) \land r_{1} \ne r_{2}] \\
&\geq \Pr_{\omega,r_{1},r_{2}}[V(\omega,r_{1}) \land V(\omega,r_{2})] - \Pr_{\omega,r_{1},r_{2}}[r_{1}=r_{2}] \\
&= \sum_{\omega}\Pr[\omega] \cdot \delta_{\omega}^2 - \frac{1}{q} \\
&\geq \left( \sum_{\omega}\Pr[\omega] \cdot \delta_{\omega} \right)^2 - \frac{1}{q} \\
&= \delta(n)^2 -\frac{1}{q}
\end{align}
$$
kde předposlední nerovnost je dle Jensenovi nerovnosti $\sum a_{i} \cdot b_{i}^2\geq \left( \sum a_{i} \right)^{-1} \cdot \sum (a_{i}b_{i})^2$ pro pozitivní $a_{i}$. Pokud je problém diskrétního logaritmu těžký vzhledem k $\mathcal{G}$, tak je $\Pr[\text{Dlog}_{\mathcal{A},\mathcal{G}}(n)=1]$ zanedbatelné. Protože i $1/q$ je zanedbatelné (inverzní polynom) tak dostáváme i $\delta(n)$ jako zanedbatelné, tedy že $\Pi$ je bezpečné identifikační schéma.

### Schnorr identifikace a Fiat-Shamirova konstrukce
Mějme $\mathcal{G}$ jako výše:
- $Gen$ Rozběhneme $\mathcal{G}(1^n)$ na zisk $(\mathbb{G},q,g)$. Vybereme uniformně náhodně $x\in \mathbb{Z}_{q}$ a nastavme $y:=g^x$. $sk$ je $x$ a $pk$ je $(\mathbb{G},q,g,y)$ a specifikujeme $H: \{ 0,1 \}^* \to \mathbb{Z}_{q}$.
- $Sign$ na vstup private key $x$ a zprávy $m \in \{ 0,1 \}^*$ vybereme uniformně náhodně $k \in \mathbb{Z}_{q}$ a nastavíme $I:= g^{k}$. Spočteme $r:= H(I,m)$ následně spočteme $s:= [rx + k \mod q]$. Výstupem je podpis $(r,s)$.
- $Vrfy$ na vstupu public key $(\mathbb{G},q,g,y)$ a zprávy $m$ s podpisem $(r,s)$ spočteme $I:= g^{s} \cdot y^{-r}$ a vrátíme $1$ pokud $H(I,m) = r$.

---
## DSA a ECDSA
Digital signature algorithm i elliptic curve digital signature algorithm jsou stejné konstrukce, jen je rozdíl výběru grup, kdy
- DSA- $\mathbb{G}\subseteq \mathbb{Z}_{p}^*$ pro nějaké velké prvočíslo s $q \mid (p-1)$ a generátor $g = h^{(p-1) / q} \mod p$
- ECDSA - $\mathbb{G} \subseteq E(\mathbb{F}_{p})$, tedy eliptická křivka nad konečným tělesem

Obě schémata mají nějaké identifikační schéma v pozadí. Nechť $\mathbb{G}$ je cyklická grupa řádu $q$ s generátorem $g$. Mějme identifikační schéma s private klíčem $x$ a public key $(\mathbb{G},q,g,y), y=g^x$:
1. Prover vybere uniformně $k \in \mathbb{Z}_{q}^*$ a pošle $I:= g^k$.
2. Verifier vybere uniformně a pošle $\alpha,r\in \mathbb{Z}_{q}$ jako challenge.
3. Prover pošle $s:= [k^{-1}\cdot(\alpha + xr) \mod q]$ jako odpověď.
4. Verifier přijme pokud $s \ne 0$ a $g^{\alpha s ^{-1}} \cdot y^{r s^{-1}}=I$.

$s\ne 0$ pokud neplatí $\alpha = -xr \mod q$, což se stane jen se zanedbatelnou pravděpodobností. Předpokládaje $s\ne 0$ a $s^{-1} \mod q$ existuje a
$$
g^{\alpha s^{-1}} y^{r s^{-1}} = g^{\alpha s^{-1}} \cdot g^{x r s^{-1}} = g^{(\alpha + xr)\cdot s^{-1}} = g^{(\alpha + xr)\cdot k \cdot (\alpha+xr)^{-1}} = g^k=I.
$$
Tedy korektnost platí až na zanedbatelný případ kdy ne.

Schémata jsou také tak bezpečná jak diskrétní logaritmus, protože pokud budeme $Trans_{sk}$ simulovat skoro perfektně tak, že vybereme uniformně náhodně $\alpha,r \in \mathbb{Z}_{q}$ a $s \in \mathbb{Z}_{q}^{*}$ a nastavíme $I:= g^{\alpha s^{-1}} \cdot y^{rs^{-1}}$ tak pokud útoční vydá $I$ pro kterou odpoví $s_{1},s_{2}\in \mathbb{Z}_{q}^*$ pro dvě různé challenge $(\alpha,r_{1}),(\alpha,r_{2})$, tak 
$$
g^{\alpha s_{1}^{-1}} \cdot y^{r_{1}s_{1}^{-1}} = I = g^{\alpha s_{2}^{-1} }\cdot y^{r_{2}s_{2}^{-1}}
$$
a tedy $g^{\alpha (s_{1}^{-1}-s_{2}^{-1})} = g^{r_{1}s_{1}^{-1} - r_{2}s_{2}^{-1}}$ a $\log_{g}y$ může být dopočítán úplně stejně. To samé platí když útočník vydá správné odpovědi na dvě různé challenge $(\alpha_{1},r),(\alpha_{2},r)$.

Po podpisová schémata ale konstrukce vypadá jinak než Fiat-Shamir, nejdříve mějme
- $\alpha:= H(m)$, kde $m$ je zpráva podepsaná a $H$ je kryptografická hash funkce.
- $r:= F(I)$ pro specifikovanou funkci $F: \mathbb{G}\to \mathbb{Z}_{q}$, kde $F$ je jednoduchá funkce a ne nějaké orákulum.

Funkce $F$ závisí na $\mathbb{G}$ v DSA je $\mathbb{G} \subseteq \mathbb{Z}_{p}^*$ pro prvočíslo $p$ s $\mathbb{G}$ řádu $q$ a $F(I)=[I \mod q]$. V ECDSA máme $\mathbb{G}$ jako podgrupu řádu $q$ nějaké grupy eliptických křivek nad $\mathbb{Z}_{p}$, tedy $E(\mathbb{Z}_{p})$ pro $p$ prvočíslo. (Jsou to prvky $\mathbb{Z}_{p} \times \mathbb{Z}_{p}$) $F((x,y)) = [x \mod q]$.

Pak podpisová schémata vypadají takto: Mějme $\mathcal{G}$ jako výše, pak
- $Gen$ na vstupu $1^n$ rozběhneme $\mathcal{G}(1^n)$ dostaneme $(\mathbb{G},q,g)$. Vybereme uniformně náhodně private key $x\in \mathbb{Z}_{q}$ a nastavme public key $(\mathbb{G},q,g,y)$, pro $y:= g^x$. Vybereme také $H:\{ 0,1 \}^*\to \mathbb{Z}_{q}$ a $F:\mathbb{G}\to \mathbb{Z}_{q}$.
- $Sign$ vstup private key $x$ a zpráva $m\in \{ 0,1 \}^*$ vybereme uniformně $k\in \mathbb{Z}_{q}^*$ a nastavíme $r:= F(g^k)$. Poté spočteme $s:= [k^{-1}\cdot (H(m)+xr)\mod q]$ (pokud $s=0$, nebo $r=0$, tak jen znovu vybereme $k$) a vydáme výstup $(r,s)$ jako podpis.
- $Vrfy$ na vstupu public key $(\mathbb{G},q,g,y)$, zprávy $m\in \{ 0,1 \}^*$ a podpisu $(r,s)$ s $r,s\ne {0}$ vrátíme $1\iff$ $r=F(g^{H(m) \cdot s^{-1}} \cdot y^{r \cdot s^{-1}})$. 

Pokud je $\text{Dlog}$ těžký, tak pokud jsou $H,F$ náhodná orákula, tak můžeme dokázat bezpečnost DSA/ECDSA. $F$, ale nelze prakticky modelovat jako náhodné orákulum, tedy u v praxi používaných $F$ nemáme důkaz o bezpečnosti.

Výběr $k$ musí být nepředvídatelný, protože pokud leakne $k$, nebo se předpoví, tak u veřejného $s=k^{-1}(H(m)x +r) \mod q$ je jediná neznámá $x$. Navíc pokud se použije dvakrát stejné $k$, tak máme stejný problém, protože $r$ se zopakuje a tedy
$$
\begin{align}
s_{1} &= k^{-1} \cdot (H(m_{1}) + xr) \mod q \\
s_{2} &= k^{-1} \cdot (H(m_{2}) + xr) \mod q
\end{align}
$$
dostame $s_{1}-s_{2} = k^{-1}(H(m_{1}) - H(m_{2})) \mod q\implies k=(H(m_{1}) - H(m_{2})) \cdot (s_{1}-s_{2})^{-1} \mod q$.