#let innerproduct(x,y) = $lr(angle.l #x, #y angle.r)$
Let $CC$ denote the set of complex numbers and let $cal(H) = CC^n$ be the set
of all $n$-tuples $(xi_1, ..., xi_n)$ of complex numbers with addition and
scalar multiplication defined as follows.

For $x=(xi_1,...,xi_n)$ and $y=(eta_1,...,eta_n)$,
$
  x + y = (xi_1 + eta_1,...,xi_n + eta_n) "and"
  alpha x = (alpha xi_1,...,alpha xi_n), alpha in CC^n.
$
The complex valued function $angle.l,angle.r$, defined on the Cartesian product
$cal(H) times cal(H)$ by

$
  innerproduct(x,y) = sum_(i=1)^n xi_i overline(eta)_i
$

is called an #emph[inner product] on $cal(H)$.

= Practice

Show
+ $innerproduct(x,x) = 0$ if and only if $x eq.not 0$,
+ $overline(innerproduct(x,y)) = innerproduct(y,x)$,
+ $innerproduct(alpha x,y) = alpha innerproduct(x,y)$,
+ $innerproduct(x+y,z) = innerproduct(x, z) + innerproduct(y, z)$.

= Sol
+ #block[
  Let $xi_i = a_i + b_i i$. Then $innerproduct(x,x) = sum_(i=1)^n xi_i
  overline(xi)_i = sum_(i=1)^n a_i^2 + b_i^2 = 0$ implies that $a_i^2 + b_i^2
  = 0, forall i$, hence $a_i = b_i = 0, forall i$. Conclude that if
  $innerproduct(x,x) = 0$, $x = 0$. The other direction is easy to show.
]
+ #block[
  $overline(innerproduct(x,y)) = overline(sum_(i=1)^n xi_i overline(eta)_i)
  = sum_(i=1)^n overline(xi_i overline(eta)_i)
  = sum_(i=1)^n overline(xi)_i eta_i = sum_(i=1)^n eta_i overline(xi_i) = innerproduct(y, x)$.
]

+ #block[$innerproduct(alpha x, y) = sum_(i=1)^n alpha xi_i eta_i = alpha sum_(i=1)^n
  xi_i eta_i = alpha innerproduct(x, y)$.]
+ #block[Let $z = (gamma_1,...,gamma_n)$.
$
  innerproduct(x + y, z)
  &= sum_(i=1)^n (xi_i + eta_i) overline(gamma)_i
  = sum_(i=1)^n lr((xi_i overline(gamma)_i + eta_i overline(gamma)_i)) \
  &= sum_(i=1)^n xi_i overline(gamma)_i + sum_(i=1)^n eta_i overline(gamma)_i
  = innerproduct(x,y) + innerproduct(x,z)
$
]

#align(right)[$qed$]

= Practice
Show
+ #block[$innerproduct(x, alpha y + beta z) = overline(alpha) innerproduct(x,y)
  + overline(beta) innerproduct(x,z)$]
+ $innerproduct(x,0) = innerproduct(0,x) = 0$

= Sol
+ #block[
  $innerproduct(x, alpha y + beta z) &= overline(innerproduct(alpha y + beta z, x))
    = overline(alpha innerproduct(y,x) + beta innerproduct(z, x))
    = overline(alpha innerproduct(y,x)) + overline(beta innerproduct(z,x)) \
    &= overline(alpha) overline(innerproduct(y,x)) + overline(beta) overline(innerproduct(z,x))
    = overline(alpha) innerproduct(x,y) + overline(beta) innerproduct(x,z)$
]
+ It's simply a direct computation result.
#align(right)[$qed$]



