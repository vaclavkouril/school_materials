# CREW
Používáme model Concurrent Read/ Exclusive write.

# Zámky (locks)
## Definice
Zámek (mutex) je synchronizační primitivum, které zajišťuje **vzájemné vyloučení** při přístupu ke sdíleným datům. V každém okamžiku může kritickou sekci vykonávat nejvýše jeden proces.

Operace: 
- lock(L) - dokud je zamčen čeká a pak zamkne
- unlock(L)
---
## Problémy zámků
### Blokování-DEADLOCK
Proces může čekat neomezeně dlouho, pokud jiný proces drží zámek.
### Inverze priorit
Nízkoprioritní proces drží zámek, na který čeká proces s vyšší prioritou.  
Řešení: *dědičnost priorit*.
### Výkon
- režie zamykání a odemykání,
- paměťová režie,
- špatná škálovatelnost při jemnozrnném zamykání.
### Odolnost proti chybám
Pád procesu může zanechat zámky trvale zamčené.

---
# Atomické operace

## Compare-And-Swap (CAS)
### Definice
Atomická operace
$$
\mathrm{CAS}(R, \text{old}, \text{new})
$$
funguje takto:
- pokud $R = \text{old}$, pak $R \leftarrow \text{new}$,
- jinak se $R$ nemění,
- vždy vrací původní hodnotu $R$.

---
## Load-Linked / Store-Conditional (LL/SC)

### Definice
- **LL$(x)$** atomicky načte hodnotu a začne ji monitorovat, (načte ze sdílené buňky $P$ do lokální proměnné $L$)
- **SC$(x,v)$** zapíše hodnotu $v$ pouze tehdy, pokud se adresa $x$ od posledního LL nezměnila(zapíše $L$ do $P$ pokud k $P$ nebylo přistoupeno).

### Vztah ke CAS
- CAS lze simulovat pomocí LL/SC,
- opačně to obecně nejde.

---
# Bezzámkový zásobník (lock-free stack)

## Datová struktura
- jednosměrně vázaný seznam,
- atomický ukazatel $\text{head}$,
- každý uzel obsahuje ukazatel $\text{next}$.

---
## Operace Push

### Algoritmus
Opakujeme:
1. $h \leftarrow \text{head}$
2. $n.\text{next} \leftarrow h$
3. pokud
$$
\mathrm{CAS}(\text{head}, h, n) = h
$$
pak skončíme. (V původní $h$ se nic nezměnilo, tak ji přehodíme, ostatní vlákna musí znovu pokud mezitím načetli hlavu)
---
## Operace Pop

### Algoritmus
Opakujeme:
1. $h \leftarrow \text{head}$
2. $s \leftarrow h.\text{next}$
3. pokud
$$
\mathrm{CAS}(\text{head}, h, s) = h
$$
pak vrátíme $h$.

---
## Vlastnosti
- **lock-free**: alespoň jeden proces uspěje v konečném čase,
- možný **livelock**, ale žádný deadlock, (cyklus do nekonečna)
- linearizační bod je úspěšný CAS.

---
# Problém ABA

## Popis
CAS kontroluje pouze rovnost hodnot, nikoli jejich historii.
### Scénář
1. proces $P_1$ čte $\text{head} = A$
2. proces $P_2$ provede:
   - Pop$(A)$
   - Pop$(B)$
   - Push$(A)$
3. $\text{head} = A$ znovu
4. $P_1$ provede CAS a chybně uspěje

Formálně:
$$
A \rightarrow B \rightarrow A
$$
je pro CAS nerozlišitelné od
$$
A \rightarrow A
$$

---
# Řešení ABA

## LL/SC
Store-conditional selže, pokud se mezitím hodnota změnila.

---
## Verzované ukazatele (Wide CAS dvě buňky)
Každý ukazatel má tvar
$$
(\text{ptr}, \text{verze})
$$
a při každé změně platí
$$
\text{verze} \leftarrow \text{verze} + 1.
$$

---
## Zákaz recyklace uzlů
Každý Push alokuje nový uzel.

---
# Správa paměti (Dealokace)
## Problém
Uzel může být stále referencován jiným procesem, i když byl odebrán.

---
## Reference counting

Každý uzel zásobníku má čítač $\text{ref\_cnt}$.

Uzel lze uvolnit, pouze pokud
$$
\text{ref\_cnt} = 0.
$$

Nevýhoda: složitá implementace, závody při inkrementaci.

$PopRefCount$
Opakujeme:
1. $h \leftarrow \text{head}$
2. $h.ref\_cnt++$
3. Když $h \ne S.head$ tak: $h.ref\_cnt--;continue;$
4. $s \leftarrow h.\text{next}$
5. pokud $\mathrm{CAS}(S.\text{head}, h, s) = h$: tak $h.ref\_cnt--;$vrátíme $h$.
6. Jinak $h.ref\_cnt--$

---
## Hazard pointers
Procesy si registrují ukazatele, které právě používají.

Uzel lze uvolnit, pouze pokud není obsažen v žádném hazard pointeru.

---
# Hierarchie souběžných struktur
1. blocking - klidně s deadlocky
2. obstruction-free  - se zámky, ale pokud se ostatní vlákna zastaví tak i vlákno skončí
3. lock-free - bez zámkové a aspoň jedno vlákno doběhne, pro některé ale může být livelock
4. wait-free každá operace doběhne v konečném čase  
5. bounded wait-free - každá operace doběhne v čase omezeném, třeba počtem vláken

Náš zásobník je **lock-free**, nikoli **wait-free**.

---
# Porovnání přístupů
## Zámky
**Výhody**
- jednoduchost,
- snadné důkazy korektnosti.

**Nevýhody**
- deadlocky,
- inverze priorit,
- špatná škálovatelnost,
- citlivost na pády procesů.

---
## Atomické operace (bezzámkové struktury)
**Výhody**
- žádné deadlocky,
- lepší škálování,
- vyšší odolnost vůči selhání procesů.

**Nevýhody**
- složitý návrh,
- ABA problém,
- komplikovaná správa paměti,
- závislost na paměťovém modelu hardware.