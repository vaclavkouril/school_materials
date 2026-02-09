KL 14.4

*Definice:* Funkce $f: \{ 0,1 \}^* \to \{ 0,1 \}^*$ mějme pro ni experiment $\text{Invert}_{\mathcal{A},f}(n)$:
1. Vybereme uniformně náhodně $x\in \{ 0,1 \}^n$ a spočteme $y=f(x)$.
2. $\mathcal{A}$ dostane $1^n$ a $y$ a vydá $x'$.
3. Pokud $f(x')=y$ tak je výstup 1, jinak 0.

Funkce $f$ je one-way když jsou splněné následující podmínky:
1. Existuje poly-time algoritmus $M_{f}$ počítající $f$, $\forall x:M(x)=f(x)$.
2. Pro každého pravděpodobnostního poly-time algoritmus $\mathcal{A}$ existuje zanedbatelná funkce $negl$, že 
$$
\Pr[\text{Invert}_{\mathcal{A},f}(n) =1] \leq negl(n).
$$

---
# Lamportovo podpisové schéma
Mějme $\Pi=(Gen,Sign,Vrfy)$ podpisové schéma, pak definujme experiment pro útočníka $\mathcal{A}$ s parametrem $n$ jak $\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n)$ jako one-time signature experiment
1. $Gen(1^n)$ dostaneme $(sk,pk)$ klíče.
2. $\mathcal{A}$ dostane $pk$ a zeptá se jen na jeden podpis zprávy $m'$ na orákulum $Sign_{sk}(\cdot)$. $\mathcal{A}$ pak vrátí $(m,\sigma),m\ne m'$.
3. Výstup experimentu je $1\iff Vrfy_{pk}(m,\sigma)=1$.

*Definice:* Podpisové schéma $\Pi=(Gen,Sign,Vrfy)$ je **one-time signature scheme** když pro všechny PPT (pravděpodobnostní poly-time) útočníky $\mathcal{A}$ existuje zanedbatelná $negl$ funkce taková, že:
$$
\Pr[\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n) =1] \leq negl(n).
$$
Pro Lamportovo podpisové schéma mějme $H:\{ 0,1 \}^*\to \{ 0,1 \}^*$ funkci a $\ell=\ell(n)$ délku zpráv k podpisu, pak mějme
- $Gen$ na vstupu $1^n$ postupujme následovně pro $i \in \{ 1,\dots,\ell \}$
	1. Vyberme uniformně náhodně $x_{i,0},x_{i,1}\in \{ 0,1 \}^n$.
	2. Spočteme $y_{i,0}:= H(x_{i,0})$ a $y_{i,1}:=H(x_{i,1})$.
	a $pk = \begin{pmatrix} y_{1,0} & y_{2,0} & \dots & y_{\ell,0} \\ y_{1,1} & y_{2,1} & \dots & y_{\ell,1} \end{pmatrix}$ a $sk = \begin{pmatrix} x_{1,0} & x_{2,0} & \dots & x_{\ell,0} \\ x_{1,1} & x_{2,1} & \dots & x_{\ell,1} \end{pmatrix}$.
- $Sign$ na vstupu privátního klíče $sk$ a zprávy $m \in \{ 0,1 \}^\ell$ s $m=m_{1}m_{2}\dots m_{\ell}$ vrátíme výstup $(x_{1,m_{1}},x_{2,m_{2}},\dots,x_{\ell,m_{\ell}})$.
- $Vrfy$ na vstupu $pk$, zprávy $m \in \{ 0,1 \}^\ell$ s $m=m_{1},\dots m_{\ell}$ a podpisem $\sigma=(x_{1},\dots,x_{\ell})$ vydáme $1 \iff \forall 1 \leq i \leq \ell: H(x_{i})=y_{i,m_{i}}$.

### ★ *Věta:* Nechť $\ell$ je libovolný polynom. Když $H$ je one-way funkce, tak Lamportovo podpisové schéma je one-time signature scheme.
*Důkaz:* Nechť $\ell = \ell(n)$, základní pozorování je následující
- Řekněme, že $\mathcal{A}$ chce podpis $m'$.
- Vezměme libovolnou $m\ne m'$
- Musí být alespoň jedna pozice $i^* \in \{ 1,\dots \ell\}$, kde se $m,m'$ liší. Řekněme $m_{i^*}=b\ne m'_{i^*}$ 
- Pak falšování podpisu $m$ potřebuje nalézt předobraz $y_{i^*,b^*}$ při $H$ u public key.

Nechť $\Pi$ je Lamportovo schéma a $\mathcal{A}$ je PPT útočník. Mějme průběh $\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n)$, nechť $m'$ je zpráva, kterou si $\mathcal{A}$ poslal k podepsání (BÚNO jednu si vždy nechá podepsat). $(m,\sigma)$ je výstup z $\mathcal{A}$. 

O $\mathcal{A}$ řekneme, že vydává falšovaný podpis na $(i,b)$ když $Vrfy_{pk}(m,\sigma)=1$ a $m_{i} \ne m'_{i}$ a mějme $b = m_{i}$. Vždy když $\mathcal{A}$ vydá falešný podpis tak je to falšované na nějaké pozici $i$.

Mějme následující PPT algorimus $I$ inverutující $H$:
0. Dostaneme jako vstup $1^n$ a $y$ jako vstup.
1. Vybereme uniformně náhodně $i^* \in \{ 1,\dots,\ell \}$ a $b^*\in \{ 0,1 \}$, nastavme $y_{i^*,b^*}:= y$.
2. $\forall i\in \{ 1,\dots,\ell \}$ a $b\in \{ 0,1 \}$ s $(i,b)\ne (i^*,b^*)$ vybereme uniformně náhodně $x_{i,b} \in \{ 0,1 \}^{n}$ a nastavíme $y_{i,b}:= H(x_{i,b})$.
3. Spustíme $\mathcal{A}(pk)$, pro $pk = \begin{pmatrix} y_{1,0} & y_{2,0} & \dots & y_{\ell,0} \\ y_{1,1} & y_{2,1} & \dots & y_{\ell,1} \end{pmatrix}$.
4. Když si $\mathcal{A}$ vyžádá podpis $m'$:
	- Když $m'_{i^*}=b^*$, tak $I$ abortuje (skončí).
	- Jinak $I$ vrátí podpis $\sigma = (x_{1,m'_{1}}, \dots,x_{\ell,m_{\ell}'})$.
5. Když $\mathcal{A}$ vydá výstup $(m,\sigma)$ s $\sigma=(x_{1},\dots,x_{\ell})$, tak když $\mathcal{A}$ vydá falešný podpis na $(i^*,b^*)$ tak vydáme výstup $x_{i^*}$.

Pokud $\mathcal{A}$ vydá falešný podpis na $(i^*,b^*)$ tak $I$ uspěje při invertování $y$ vstupu. Zajímá nás pravděpodobnost výskytu takového invertování, když $x \in \{ 0,1 \}^n$ je uniformně vybráno a $y := H(x)$ je vstupem pro $I$.

Uvažujme experiment, kde $I$ má k dispozici $x$ a 1, nastaví $x_{i^*,b^*}:=x$ a ve 4. se nikdy neabortuje, tedy i kdyby $m'_{i^*} = b^*$. Pak $\mathcal{A}$ při běhu vidí úplně to samé jako při $\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n)$, protože to co vidí $\mathcal{A}$ je nezávislé na námi zvolené dvojici $(i^*,b^*)$, takže pravděpodobnost toho, že $\mathcal{A}$ vydá falešný podpis na konkrétní $(i^*,b^*)$ za podmínky, že umí falšovat je alespoň $1 / 2\ell$ (uniformně náhodně z $\{ 1,\dots,\ell \}\times \{ 0,1 \}$ slotů), tedy v takové úpravě je pravděpodobnost falešnosti na $(i^*,b^*)$ alespoň $\frac{1}{2\ell}\cdot \Pr[\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n) =1]$.

Pokud ale vezmeme náš experiment s $I$ tak pravděpodobnost, že $\mathcal{A}$ vydá falešný podpis na $(i^*,b^*)$ je stejná. Protože experimenty se liší jen, když $m'_{i^*}=b^*$, ale když se to stane tak je z definice nemožné, aby byl vydán falešný podpis na námi zvolené dvojici. Tedy dohromady
$$
\Pr[\text{Invert}_{I,H} (n)=1 ] \geq  \frac{1}{2\ell} \cdot\Pr[\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n) =1]
$$
a protože $H$ je OWF, tak platí
$$
negl(n) \geq \Pr[\text{Invert}_{I,H} (n)=1 ].
$$
Navíc $\ell$ je polynomiální, takže i $\Pr[\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n) =1]$ je zanedbatelná.

*Důsledek:* Pokud existují OWF, tak pro libovolný polynom $\ell$ existuje one-time signature scheme pro zprávy délky $\ell$.

---
# Řetězové podpisy
*Definice:* Stateful signature scheme (stavové podpisové schéma) jsou pravděpodobnostní poly-time algoritmy $(Gen,Sign,Vrfy)$ splňující následující:
1. $Gen$ vezme security parameter vstup $1^n$ a vydá $(sk,pk,s_{0})$, kde $s_{0}$ je initial state. $pk$ je odvoditelný z $sk$ a oba jsou délky $n$.
2. $Sign$ vezme vstup $sk$, stav $s_{i-1}$ a zprávu $m\in \{ 0,1 \}^*$, vraceje $\sigma$ podpis a hodnotu $s_{i}$.
3. $Vrfy$ má vstup $pk$, zprávu $m$ a podpis $\sigma$ vraceje bit $b$.

Potřebujeme, aby $\forall n$ tak každý výstup $Gen(1^n)$ a libovolné zprávy $m_{1},\dots,m_{t} \in \{ 0,1 \}^*$, když iterativně spočteme $(\sigma,s_{i})\leftarrow Sign_{sk,s_{i-1}}(m_{i})$ pro $1\leq i\leq t$, tak $\forall i\in \{ 1,\dots,t \}$ platí $Vrfy_{pk}(m_{i},\sigma_{i})=1$.

Pro polynom $t$ umíme udělat $t$-time secure systém, kde každou zprávu podepíšeme jiným z $t$ klíčů a musíme distribuovat $t$ private-keys, jednotlivé podpisy tedy budou nějaké konstanty, ale public key velikost roste s $t$, protože máme $pk:= \left\langle pk_{1},\dots,pk_{t} \right\rangle$ a $sk:= \left\langle sk_{1},\dots,sk_{t} \right\rangle$. Ještě můžeme pomocí Merkle-tree udělat $h:= MT_{t}(pk_{1},\dots,pk_{t})$ a mít $\left\langle t,h \right\rangle$ jako public key a podpis $i$-té zprávy jako $(\sigma,i)$ spolu s hodnotou $pk_{i}$ a $\pi_{i}$ důkaz, že je to korektní klíč vzhledem k $h$. Pak by $pk$ byl konstantní, ale podpisy v logaritmické délce vůči $t$.

Chceme-li obejít omezení na $t$, tak mějme $\Pi=(Gen,Sign,Vrfy)$ one-time signature schéma. 
- $pk$ je jen nějaké $pk_{1}$ generované pomocí $Gen$ a private key je jen $sk_{1}$ pro $pk_{1}$.
- Podpis 1. zprávy $m_{1}$ si podepisující vygeneruje $(pk_{2},sk_{2})$ pomocí $Gen$ a podepíše $\sigma_{1} \leftarrow Sign_{sk_{1}}(m_{1}||pk_{2})$. Podpis který vrátíme je ale $\sigma_{1}$ a $pk_{2}$ a přidá si do stavu $\{ m_{1},pk_{2},sk_{2},\sigma_{1} \}$.
- Když chceme podepsat $i$-tou zprávu, tak se vygeneruje $(pk_{i+1},sk_{i+1})$ ze stavu má $\{ (m_{j},pk_{j+1},sk_{j+1},\sigma_{j}) \}_{j=1}^{i-1}$ spočte se $\sigma_{i} \leftarrow Sign_{sk_{i}}(m_{i}||pk_{{i+1}})$ a pošle se podpis s $\sigma_{i},pk_{i+1}$ a hodnoty $\{ m_{j},pk_{j+1},\sigma_{j} \}^{i-1}_{j=1}$ a do stavu si přidá $\{ pk_{i+1},sk_{i+1},\sigma_{i}, m_{i} \}$.
- Pro verifikaci podpisu $(pk_{i+1},\sigma_{i}, \{m_{j},\sigma_{j},pk_{j+1}  \}_{j=0}^{i-1})$ u $m_{i}$ s $pk_{1}$, tak verifikujeme celý řetězec a tedy výstupem je $1\iff \forall j \in \{ 1,\dots,i \}: Vrfy_{pk_{j}}(m_{j}||pk_{j+1},\sigma_{i}) =1$.

Protože je na jednu zprávu použit jen jeden pár $(pk,sk)$, tak plyne security z volby $\Pi$, je ale potřeba, aby signature scheme umělo podepisovat zprávy delší než je $pk$, což to Lambertovo není. Pokud ale aplikujeme hash-and-sign paradigma, tak dostaneme z Lamportova schéma přímo takové, aby mohlo podepsat libovolné délky. 

*Věta:* Pokud existují collision resistant funkce, tak existuje one-time signature scheme pro zprávy libovolné délky.

*Definice:* Hash funkce s výstupem délky $\ell(n)$ je dvojic pravděpodobnostních poly-time algoritmů $Gen,H$ s
- $Gen: 1^n \to s$ pro klíč $s$,
- $H$ vezme jako vstup $s$ a $x\in \{ 0,1 \}^*$ a vydá string $H^s(x)\in \{ 0,1 \}^{\ell(n)}$.

Hash funkce $\mathcal{H}=(Gen,H)$ a $\mathcal{A}$ je útočník, pak $\text{Hash-col}_{\mathcal{A},\mathcal{H}}(n)$
1. $s$ klíč je vygenerovaný pomocí $Gen(1^n)$
2. $\mathcal{A}$ dostane $s$ a vydá $x,x'$ 
3. Výsledek experimentu je $1\iff x\ne x', H^s(x)=H^s(x')$. 

Pokud platí 
$$
\Pr[\text{Hash-col}_{\mathcal{A},\mathcal{H}}(n) =1] \leq negl(n)
$$
pak je funkce collision resistant.

---
# Podpisy postavené na stromech
Nechť $\Pi = (Gen, Sign,Vrfy)$ je podpisové schéma. Pro binární string $m$, nechť $m\mid_{i} = m_{1},\dots,m_{i}$, tedy jeho $i$-bitový prefix. Konstruujme podpisové schéma následovně $\Pi^*=(Gen^*,Sign^*,Vrfy^*)$
- $Gen^*$ na vstupu $1^n$ spočte $(pk_{\epsilon},sk_{\epsilon})\leftarrow Gen(1^n)$ a výstupem je $pk_{\epsilon}$ jako public key a stav i private key je $sk_{\epsilon}$.
- $Sign^*$ na vstupu zprávy $m \in \{ 0,1 \}^n$ udělá následující operace:
	1. Pro od $i=0$ do $n-1$, když $pk_{m\mid_{i}0},pk_{m\mid_{i}1}$ a $\sigma_{m\mid_{i}}$ nejsou ve stavu, tak spočteme $(pk_{m\mid_{i}0},sk_{m\mid_{i}0})\leftarrow Gen(1^n),(pk_{m\mid_{i}1},sk_{m\mid_{i}1})\leftarrow Gen(1^n)$ a ještě $\sigma_{m\mid_{i}}\leftarrow Sign_{sk_{m\mid_{i}}} (pk_{m\mid_{i}0}\,||\,pk_{m\mid_{i}1})$ navíc s všechny hodnoty přidají do stavu.
	2. Když $\sigma_{m}$ není ve stavu, tak spočteme $\sigma_{m}\leftarrow Sign_{sk_{m}}(m)$ a přidáme ho do stavu.
	3. Vydáme podpis $(\{\sigma_{m\mid_{i}}, pk_{m\mid_{i}0},pk_{m\mid_{i}1} \}_{{i=0}}^{n-1}, \sigma_{m})$.
- $Vrfy^*$ Na vstupu $pk_{\epsilon}$, zprávy $m$ a podpisu $(\{\sigma_{m\mid_{i}}, pk_{m\mid_{i}0},pk_{m\mid_{i}1} \}_{{i=0}}^{n-1}, \sigma_{m})$ vrátí $1$ právě tehdy, když 
	1. $Vrfy_{pk_{m\mid_{i}}}(pk_{m\mid_{i}0} \, ||\, pk_{m\mid_{i}1}, \sigma_{m\mid_{i}})= 1$ pro všechna $i \in \{ 0,\dots,n-1 \}$.
	2. $Vrfy_{pk_{m}}(m,\sigma_{m}) =1$.

### *Věta:* Nechť $\Pi$ je one-time signature schema, pak je stromová konstrukce bezpečné podpisové schéma.
*Důkaz:* Mějme $\Pi^*$ jako výstup konstrukce a PPT útočníka $\mathcal{A}^*$ a $\ell^*=\ell^*(n)$ horní hranice na počet signing dotazů od $\mathcal{A}^*$ a nastavme $\ell=\ell(n)=2n \ell^* (n) + 1$, tedy je to upper bound na počet podpisů vygenerovaných  pro $\Pi^*$.

Mějme útočníka $\mathcal{A}$, který dostane vstup $pk$ útočící na $\Pi$.
- Vybere uniformně náhodně index $i^* \in \{ 1,\dots,\ell \}$ zkonstruuje $pk^{1},\dots,pk^\ell$ následovně
	- nastaví $pk^{i^*}:=pk$,
	- pro $i\ne i^*$ spočteme $(pk^i,sk^i)\leftarrow Gen(1^n)$.
- Spustíme $\mathcal{A}^*$ na vstupu $pk_{\epsilon} = pk^1$, když $\mathcal{A}^*$ chce podpis na zprávu $m$ tak
	1. Pro $i=0$ do $n-1$ tak pokud nebyli hodnoty $pk_{m\mid_{i}0},pk_{m\mid_{i}1},\sigma_{m\mid_{i}}$ spočteny tak nastavíme $pk_{m\mid_{i}0},pk_{m\mid_{i}1}$ na další dva nevyužité klíče $pk^j,pk^{j+1}$ a spočteme $\sigma_{m\mid_{i}} \leftarrow Sign_{pk_{m\mid_{i}}} (pk_{m\mid_{i}0}\,||\,pk_{m\mid_{i}1})$.
	2. Když $\sigma_{m}$ není definováno tak spočteme podpis $m$ vzhledem k $pk_{m}$.
	3. Vrátíme $(\{\sigma_{m\mid_{i}}, pk_{m\mid_{i}0},pk_{m\mid_{i}1} \}_{{i=0}}^{n-1}, \sigma_{m})$ pro $\mathcal{A}^*$.
- Řekněme, že $\mathcal{A}^*$ vydá jako výstup zprávu $m$ (pro kterou si dříve neřekl o podpis) a podpis $(\{\sigma'_{m\mid_{i}}, pk'_{m\mid_{i}0},pk'_{m\mid_{i}1} \}_{{i=0}}^{n-1}, \sigma'_{m})$, pokud je to správný podpis tak:
	1. Možnost: Existuje $j\in \{ 0,\dots,n-1 \}$ pro které $pk'_{m\mid_{j}0} \ne pk_{m\mid_{j}0}$, nebo $pk'_{m\mid_{j}1}\ne pk_{m\mid_{j}1}$; to je platné i kdyby ani jeden nebyl definován v $\mathcal{A}$. Vezmeme nejmenší takové $j$ a řekněme, že mu odpovídá $i$ pro $pk^i = pk_{m\mid_{j}} = pk'_{m\mid_{j}}$ (existuje z minimality $j$). Když $i=i^*$ tak vrátíme jako výstup $(pk'_{m\mid_{j}0}\,||\,pk'_{m\mid_{j}1}, \sigma'_{m\mid_{i}})$.
	2. Možnost: Neexistuje-li takové $j$, tak $pk'_{m}=pk_{m}$ a nechť $i$ je takové, že $pk^i=pk_{m}$. Když $i=i^*$ vrátíme $(m,\sigma_{m})$.

Při 1. 2. odpovídání na $\mathcal{A}^*$ když $i^*\ne i$ tak so může $\mathcal{A}$ spočíst podpis vzhledem k $pk^i$. $\mathcal{A}$ může navíc dostat (jeden) podpis vzhledem k $pk^{i^*}$ dle odpovídajícího dotazu na svoje signing oracle. 

V experimentu $\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n)$ je z pohledu $\mathcal{A}^*$ spuštěného jako funkce v $\mathcal{A}$ stejné, jako, když $\mathcal{A}^*$ běží v experimentu $\text{Sig-forge}_{\mathcal{A}^*,\Pi^*}(n)$. Když $\mathcal{A}^*$ vydá falešný podpis tak uvažujeme dvě možnosti:
1. Protože $\Pr_{i}[i = i^*] = \frac{1}{\ell}$ dle uniformity výběru, tak když $i=i^*$ pak $\mathcal{A}$ chtěl podpis na zprávu $pk_{m\mid_{j}0}\,||\,pk_{m\mid_{j}1}$ s korespondujícím public key $pk=pk^{i^*}=pk_{m\mid_{j}}$ který dostal a navíc
$$
pk_{m\mid_{j}0}\,||\,pk_{m\mid_{j}1} \ne pk'_{m\mid_{j}0}\,||\,pk'_{m\mid_{j}1}
$$
	ale $\sigma'_{m\mid_{j}}$ je správný podpis pro $pk'_{m\mid_{j}0}\,||\,pk'_{m\mid_{j}1}$ vůči klíči $pk$. Tedy $\mathcal{A}$ vrátí falšovaný podpis.
2. Z uniformity výběru $i^*$ máme pravděpodobnost jeho výběru $1 / \ell$ a když $i=i^*$ a $\mathcal{A}$ nechtěl podpisy vzhledem k $pk = pk^{i^*}=pk_{m}$, ale vydal platný podpis $\sigma'_{m}$ zprávy $m$ vzhledem k $pk$.

Tedy za podmínky, že $\mathcal{A}^*$ vydá falešný podpis, tak $\mathcal{A}$ tak udělá také s pravděpodobností alespoň $1/\ell$, tedy
$$
\Pr[\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n) =1] = \frac{1}{\ell} \cdot \Pr[\text{Sig-forge}_{\mathcal{A}^*,\Pi^*}(n) = 1],
$$
protože je $\Pi$ one-time signature scheme, tak existuje zanedbatelná funkce $negl(n)$, že
$$
\Pr[\text{Sig-forge}_{\mathcal{A},\Pi}^{1-\text{time}}(n) =1] \leq negl(n)
$$
tak máme, díky tomu že $\ell$ je polynom i $\Pr[\text{Sig-forge}_{\mathcal{A}^*,\Pi^*}(n) = 1]$ jako zanedbatelnou.


## Bezstavové řešení
Ukládejme si $k,k'$ pro pseudonáhodnou funkci $F$. Když je potřeba tak se hodnoty $pk_{w},sk_{w}$ mohou být vygenerovány pomocí 
1. Spočteme $r_{w} = F_{k}(w)$.
2. Spočteme $(pk_{w},sk_{w}) := Gen(1^n;r_{w})$

Pokud potřebujeme náhodnost při podpisování $\sigma_{w} := Sign_{sk_{w}}(pk_{w{0}} \, || \, pk_{w {1}};r'_{w})$, tak si mějme $r'_{w} = F_{k'}(w)$.

Existence collision-resistant hash funkcí implikuje OWF a implikuje existenci pseudonáhodných generátorů, tak máme:

*Věta:* Když existují collision resistant hash funkce tak existju stateless bezpečné podpisové schéma.