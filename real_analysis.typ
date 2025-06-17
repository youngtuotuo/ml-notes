For $E_k in RR^n$ and $cal(F) = {E_k: k=1,2,...}$, we define

$
  union.big_(E in cal(F)) E
  = lr({x: x in E "for some" E in cal(F)}), inter.big_(E in cal(F)) E
  = lr({ x: x in E "for all" E in cal(F)}) \
  op("lim sup") E_k = inter.big_(j=1)^infinity lr((union.big_(k=j)^infinity E_k)),
  op("lim inf") E_k = union.big_(j=1)^infinity lr((inter.big_(k=j)^infinity E_k)).
$

= Practice

#align(center)[For $cal(U)_j = union_(k=j)^infinity E_k$, $cal(U)_j arrow.br op("lim sup") E_k$.]

= Sol
$cal(U)_j = union.big_(k=j)^infinity E_k = E_j union.big lr((union_(k=j+1)^infinity E_k))
= E_j union.big cal(U)_(j+1)$, so $cal(U)_(j+1) subset cal(U)_j$.
Hence, $cal(U)_j arrow.br inter.big_j cal(U)_j = op("lim sup") E_k.$
#align(right)[$qed$]

= Practice

#align(center)[For $cal(V)_j = inter.big_(k=j)^infinity E_k$, $cal(V)_j arrow.tr op("lim inf")E_k$.]

= Sol
$cal(V)_j = inter.big_(k=j)^infinity E_k = E_j inter.big lr((inter_(k=j+1)^infinity E_k))
= E_j inter.big cal(V)_(j+1)$, so $cal(V)_j subset cal(V)_(j+1).$
Hence $cal(V)_j arrow.tr union.big_j cal(V)_j = op("lim inf") E_k.$
#align(right)[$qed$]

= Practice

$
  op("lim sup") E_k &= lr({ x in RR^n : x "belongs to infinitely many" E_k}), \
  op("lim inf") E_k &=    { x in RR^n : x in E_k, forall k >= k_0(x), k_0(x) in NN}.
$

= Sol
$
  op("lim sup") E_k
    &= inter.big_(j=1)^infinity lr((union_(k=j)^infinity E_k))
     = {x: x in union_(k=j)^infinity E_k "for all" j in {1, 2, ...} } \
    &= lr({x: x in {x: x in E_k "for some" k in {j, j+1, ...}} "for all" j in {1, 2, ...} }) \
    &= {x in RR^n: x "belongs to infinitely many" E_k} \
  op("lim inf") E_k
    &= union.big_(j=1)^infinity lr((inter_(k=j)^infinity E_k))
     = {x: x in inter_(k=j)^infinity E_k "for some" j in {1, 2, ...}} \
    &= {x: x in {x: x in E_k "for all" k in {j,j+1,...}} "for some" j in {1,2,...}} \
    &= {x in RR^n: x in E_k, forall k >= k_0(x), k_(x) in NN}
$

#align(right)[$qed$]

