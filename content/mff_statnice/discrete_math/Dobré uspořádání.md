*Definice:* Říkáme že [uspořádání](mff_statnice/discrete_math/Množiny a zobrazení#Částečná uspořádání) $R$ na [třídě](mff_statnice/discrete_math/Množiny a zobrazení#Třídy) $A$ je dobré, jestliže každá neprázdná podmnožina $u \subseteq A$ má nejmenší prvek vzhledem k $R$. $A$ je dobře uspořádaná existuje-li nějaká relace $R$ dobrého uspořádání na ní.

$\omega$ je dobře uspořádaná díky relaci $\in$.

Mějme dobře uspořádanou množinu $(D,U)$. Transfinitní rekurzí definujeme na $D$ zobrazení $f$ předpisem $f(x) = \{ f(d) : d <x \}$, speciálně pro nulový prvek $d_{0} \in D$ vyjde $f(d_{0}) = \emptyset$. Definujeme *typ* této dobře uspořádané množiny jako $\text{typ}(D,U) = \{ f(d): d \in D \}$. Množiny, které lze získat jako $\text{typ}(D,U)$ nějaké dobře uspořádané množiny $(D,U)$, nazveme **ordinálními čísly**.

*Příklad:* Pro $(D,U)$ na nosné množině $\{ d_{0},d_{1},d_{2} \}$, kde $d_{0}<d_{1}<d_{2}$, se chová definice takhle:
$$
f(d_{0}) = \emptyset, \quad f(d_{1}) = \{\emptyset\}, \quad f(d_{2}) = \{\emptyset, {\emptyset}\} , \quad \text{typ}(D,U) = \Big\{\emptyset, \{ \emptyset \}, \{ \emptyset, \{ \emptyset \} \}\Big\}.
$$

*Definice:* Kardinální číslo (stručně kardinál) je nejmenší ordinální číslo své mohutnosti. Jde tedy
o takové ordinální číslo $\alpha$, že pro žádné $\beta < \alpha$ neplatí $|\beta| = |\alpha|$.

*Věta:* Nechť $\alpha$ je kardinál a $\beta < \alpha$ je ordinál. Pak $|\beta| < |\alpha|$.

*Věta:* Pro každé nekonečné ordinální číslo $\alpha$ platí $|\alpha| = |\alpha\times \alpha|$.