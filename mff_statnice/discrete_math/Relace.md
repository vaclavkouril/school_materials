*Definice:* binární relace mezi množinami $X,Y$ je  množina $R \subseteq X\times Y$.
*Příklady relací:* 
-  $\emptyset\dots$ prázdná
- $X \times Y\dots$ univerzální
- $\Delta_{X} = \{ (x,x) \ | \ x\in X \}\dots$ diagonální
- $R^{-1}: \{ (y,x)\ | \  (x,y)\in R \}\dots$ inverzní
- $x(R  \circ S)z \equiv \exists y\in Y: xRy \land ySz$

### Elementární vlastnosti relací:
Říkáme, že relace $R$ je na třídě $A$
1. *reflexivní*, jestliže pro libovolný prvek $x\in A$ platí $\langle x,x \rangle \in R$
2. *anti-reflexivní*, jestliže pro žádný prvek $x\in A$ neplatí $\langle x,x \rangle \in R$
3. *symetrická*, jestliže pro libovolné $x,y\in A$ platí $\langle x,y \rangle \in R \to \langle y,x\rangle \in R$
4. *slabě antisymetrická*, jestliže pro libovolné $x,y\in A$ platí $\left(\langle x,y \rangle \in R \land \langle y,x\rangle \in R\right) \to x=y$
5. *slabě antisymetrická*, jestliže pro libovolné $x,y\in A$ platí $\langle x,y \rangle \in R \to \langle y,x\rangle \notin R$
6. *trichotomická*, jestliže pro libovolné $x,y\in A$ platí $\langle x,y \rangle \in R \lor \langle y,x \rangle \in R \lor x=y$
7. *tranzitivní*, jestliže pro libovolné $x,y,z\in A$ platí $\left(\langle x,y \rangle \in R \land \langle y,z \rangle \in R \right) \to \langle x,z \rangle \in R$

# Ekvivalence
*Definice:* Relace $R$ na $X$ je ekvivalence $\equiv R$ je tranzitivní, symetrická a reflexivní.
*Definice:* Třída ekvivalence $R$ prvku $x$ je $\{ y\in X  \ | \ \langle x,y \rangle \in R \}$, třídu značíme $R[x]$.

Rozkladové třídy jsou právě třídy ekvivalence na ekvivalenci $R$.
![[Excalidraw/ekvival_tridy|right|200]]
# Částečná uspořádání
*Definice:* Uspořádání je relací $R$ na třídě $A$, je-li $R$ reflexivní, antisymetrické a tranzitivní.
Máme několik poddruhů:
1. lineární $\leq$: $\forall x,y\in A: x\leq y \lor y \leq x$ 
2. částečné uspořádání je uspořádání nelineární![[Excalidraw/hasseuv_diagram.excalidraw|250|right]]
3. ostré: mějme $\le$ uspořádání, platí-li $\forall x,y \in A: x < y \equiv x \le y \land x \neq y$
*Definice:* 