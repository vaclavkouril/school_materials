*Definice:* Jazyk je neprázdná množina _výrokových proměnných_ $\mathbb{P}$, prvkům říkáme _prvovýroky_ nebo _atomické výroky_. Kromě těchto proměnných máme také logické symboly $\neg, \land, \lor, \to, \leftrightarrow$ a závorky, pro jazyky predikátové logiky přidáváme ještě $\exists, \forall$.

*Definice:* **Výrok** v jazyce $\mathbb{P}$ je prvek množiny $\text{VF}_{\mathbb{P}}$ definované jako nejmenší množina splňující
1. $\forall p \in \mathbb{P}: p\in \text{VF}_{\mathbb{P}}$,
2. $\forall \varphi \in \text{VF}_\mathbb{P}: \neg \varphi \in \text{VF}_{\mathbb{P}}$,
3. $\forall \varphi, \psi \in \text{VF}_\mathbb{P}: \varphi \land \psi, \varphi \lor \psi, \varphi \to \psi, \varphi \leftrightarrow \psi \in \text{VF}_{\mathbb{P}}$.
Vzhledem k tomu, že ne každý prvovýrok musí být obsahem