Problém je, že $B$ chce přijímat zprávy, tak aby jen on je mohl dešifrovat, publikuje **veřejný klíč**, pomocí něhož každý může poslat zprávu, ale jen jeho **soukromý klíč** je umí dešifrovat. 

# Protokol
$B$ spočte $N = pq$, kde $p,q$ jsou prvočísla. Zvolíme náhodně číslo $e$ nesoudělné s $\varphi(N) = (p-1)(g-1)$ a pomocí Eukleidova algoritmu spočteme $d$ 
$$
de \equiv 1 \mod \varphi(N).
$$
Čísla $N,e$ budou veřejným klíčem a $d,p,q$ jsou soukromým klíčem. 
$A$ posílá zprávu $0<x< N$ nesoudělnou s $N$, $A$ vypočítá 
$$
y = x^e \mod N
$$
a $y$ pošle $B$, ten zná $d$ tak spočte
$$
x = y^d \mod N
$$
a má zprávu.

---
# Důkaz správnosti
Dle Eulerovy věty která říká
$$
x^{\varphi(N)} \equiv x \mod N
$$
máme 
$$
y^d \equiv (x^e)^d = x^{ed} \equiv x^1 = x \mod N.
$$
A dokud nemáme rozumný algoritmus na výpočet prvočíselného rozkladu $N$, tak máme vystaráno.