# $coNEXP\subseteq NEXP/poly$

Zdrojové stránky: ![[page-21.png]], ![[page-22.png]], ![[page-23.png]]

## Exponenciální verze $NP$ versus $coNP$

Poznámky uvádějí analogie tříd s radou:

- $NP/poly$,
- $NEXP/poly$,
- $coNEXP/poly$.

Nedeterministická verze $P/poly$ má kromě rady ještě existenční svědek.

Jazyk $L$ je v $NP/poly$, pokud existuje polynomiální rada $g(n)$ a nedeterministický polynomiální algoritmus $A$ takový, že

$$
x\in L \iff \exists y:\ A(x,y,g(|x|))=1.
$$

Ekvivalentně: $L$ má polynomiálně velké nedeterministické obvody.

## Exponenciální rady a obvody

Analogicky pro $NEXP/poly$ dovolíme algoritmus běžící v exponenciálním čase, ale rada má stále pouze polynomiální délku vzhledem k $n$.

Poznámky uvádějí tvrzení:

$$
coNEXP/poly\subseteq NEXP/poly.
$$

Z toho zejména plyne:

$$
coNEXP\subseteq NEXP/poly.
$$

## Intuice důkazu

Pro $L\in coNEXP$ existuje nedeterministický exponenciální algoritmus $B$ pro doplněk $L$:

$$
x\notin L \iff \exists w:\ B(x,w)=1.
$$

Chceme rozhodovat $L$ nedeterministicky s radou. Přímá potíž je, že $L$ je komplement nedeterministického jazyka, tedy ověření členství v $L$ má univerzální charakter:

$$
x\in L \iff \forall w:\ B(x,w)=0.
$$

Trik je použít neuniformní informaci jako radu. Rada má zakódovat dostatečně mnoho informací o správných odpovědích pro délku $n$, aby nedeterministický algoritmus mohl ověřovat konzistenci.

## Schéma z poznámek

Pro pevnou délku $n$ si představíme tabulku všech odpovědí na slovech délky $n$:

$$
L\cap\\{0,1\\}^n.
$$

Algoritmus dostane jako radu kandidátskou tabulku. Pak nedeterministicky hledá porušení její správnosti vůči stroji pro doplněk.

- Pokud tabulka tvrdí, že $x\in L$, nesmí existovat přijímající výpočet stroje pro doplněk.
- Pokud tabulka tvrdí, že $x\notin L$, měl by existovat svědek pro doplněk.

V exponenciálním čase lze procházet objekty velikosti $2^{n^{O(1)}}$ a nedeterministicky hledat lokální porušení.

Poznámky tento krok formulují jako exponenciální analogii výsledku $NP/poly$ versus $coNP/poly$.

## Padding argument: $NP=coNP\Rightarrow NEXP=coNEXP$

Poznámky také uvádějí klasický padding argument.

Mějme $L\in NEXP$. Existuje nedeterministický stroj $A$ běžící v čase

$$
2^{n^k}.
$$

Definujeme vycpaný jazyk

$$
L'=\\{x\#0^{2^{|x|^k}};\\ x\in L\\}.
$$

Jazyk $L'$ je v $NP$, protože vycpání zvětší délku vstupu tak, že exponenciální výpočet původního stroje je polynomiální v délce nového vstupu.

Pokud $NP=coNP$, pak

$$
\overline{L'}\in NP.
$$

Pro vstup $x$ do $\overline L$ vytvoříme vycpaný vstup $x\#0^{2^{|x|^k}}$ a spustíme $NP$ algoritmus pro $\overline{L'}$. To běží v exponenciálním čase vzhledem k $|x|$.

Tedy

$$
\overline L\in NEXP.
$$

Dostáváme

$$
NP=coNP \implies NEXP=coNEXP.
$$

Obrácená implikace není známa.
