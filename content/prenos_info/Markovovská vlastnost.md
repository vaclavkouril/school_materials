*Definice:* O diskrétních náhodných veličinách $X,Y,Z$ ($X\to Y\to Z$) řekneme, že splňují Markovovskou vlastnost ($Z=g(Y)$), když
$$
\forall x,y,z: \Pr[Z=z \mid Y=y] = \Pr[Z=z \mid Y=y \land X=x].
$$
$X\to Y \to Z$ nastává právě tehdy když $Z\to Y\to X$ a tedy je to ekvivalentní tomu, že zafixujeme-li $Y$, tak $X,Z$ jsou nezávislé.

Markovovská vlastnost je tedy
$$
p(z|y) = p(z|y,x),
$$
víme, že $p(x,z|y)=p(x|y)\cdot p(z|x,y) = p(x|y) \cdot p(z|y)$ a to je přesně definice pro $X,Z$ nezávislé za podmínky $Y$.

### *Věta(Data processing ineq.):* Mějme $X,Y,Z: X\to Y\to Z$ mají Markovovskou vlastnost pak $I(X:Y)\geq I(X:Z)$.
*Důkaz:* Dle Chain rule
$$
\begin{align}
I(X:Y,Z) &= I(X:Y) + I(X:Z \mid Y) \\
&= I(X:Z) + I(X:Y \mid Z)
\end{align}
$$
protože víme, že $X,Z$ jsou za podmínky $Y$ nezávislé tak máme
$$
I(X:Y) = I(X:Z) + I(X:Y \mid Z).
$$
Protože $I(X:Y \mid Z)$ je nezáporná, jako všechny [vzájemné informace](Vzájemná%20informace.md) a tedy
$$
I(X:Y) \geq I(X:Z).
$$

- Vzhledem k tomu, že $Z = g(Y)$ pro nějakou funkci $g$, tak vlastně zjišťujeme, že aplikací funkcí může informace jen klesnout.