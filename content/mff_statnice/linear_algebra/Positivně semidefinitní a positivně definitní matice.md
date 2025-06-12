# Hermitovská matice
*Definice:* Matice $A\in\mathbb{C}^{n\times n}$ je **hermitovská** (self-adjoint), pokud  
$$
A = A^H,
\quad\text{tj.}\quad
a_{ij} = \overline{a_{ji}}
\quad\forall i,j.
$$
# Vlastnosti a vztah ke skalárnímu součinu
- Všechny diagonální prvky jsou reálné: $a_{ii}\in\mathbb{R}$.  
- Pro vektory $u,v\in\mathbb{C}^n$ definuje  
$$
  \langle u,v\rangle_A := u^H\,A\,v
$$
  bilineární (sesquilineární) tvar, který při $A=A^H$ splňuje  
$$
  \langle v,u\rangle_A = \overline{\langle u,v\rangle_A}.
$$
# Charakterizace pozitivní definitnosti
*Věta:* Pro hermitovskou matici $A$ jsou ekvivalentní:  
1. $A$ je pozitivně definitní, tj. $\forall v\neq0:\;v^HAv>0$.  
2. Všechna vlastní čísla $\lambda_i$ jsou kladná.  
3. Existuje regulární matice $U$ tak, že  
 $$
   A = U^H\,U.
$$
---
# Choleského rozklad
*Věta:* Každá pozitivně definitní hermitovská matice $A$ má **jedinečný** rozklad  
$$
A = U^H\,U,
$$
kde $U$ je horní trojúhelníková matice s kladnými prvky na diagonále. Tohoto rozkladu se využívá k **efektivnímu řešení** soustav $Ax=b$, výpočtu determinantu $\det(A)=(\prod_i u_{ii})^2$ a stabilní numerické lineární algebře. 
