= Principal Component Analysis(PCA)
<principal-component-analysispca>
== Settings
<settings>
Let $upright(bold(X)) = { upright(bold(x))_i }_(i = 1)^n in bb(R)^p$ be
a sample of $n$ observations of $p$ dimensional vectors. The first
principal component of this sample is a real variable transformed from
$X$ $ upright(bold(z))_1 = upright(bold(X)) upright(bold(a))_1^T $ where
the vector
$upright(bold(a))_1 = (a_11 , a_21 , dots.h , a_(p 1)) in bb(R)^p$ is
chosen so that $parallel upright(bold(a))_1 parallel_2 = 1$ and
$v a r [upright(bold(z))_1]$ is maximized. \
The $k^(upright(t h))$ principal component of the sample is
$ upright(bold(z))_k = upright(bold(X)) upright(bold(a))_k^T , quad k = 2 , dots.h , p $
where the vector
$upright(bold(a))_k = (a_(1 k) , a_(2 k) , dots.h , a_(p k)) in bb(R)^p$
is chosen so that $parallel upright(bold(a))_k parallel_2 = 1$,
$v a r [upright(bold(z))_k]$ is maximized and
$c o v [upright(bold(z))_k , upright(bold(z))_l] = 0$ for
$k > l gt.eq 1$.

Geometrically, at first step, PCA finds a unit vector
$upright(bold(a))_1 in bb(R)^p$ that the projections of sample points on
it has maximum variance. $upright(bold(z))_1$ is actually a variable of
projection length of sample points on $upright(bold(a))_1$. Secondly,
PCA finds the second component $bold("z")_2$ in the same logic but with
further restriction that $upright(bold(z))_2$ has no relation with
$upright(bold(z))_1$, i.e.
$c o v [upright(bold(z))_2 , upright(bold(z))_1] = 0$.

== Computations
<computations>
To find $upright(bold(a))_1$, first note that
$ v a r [bold("z")_1] = & upright(E) [upright(bold(z))_1^2] - upright(E) [upright(bold(z))_1]^2\
= & sum_(i , j = 1)^p a_(i 1) a_(j_1) upright(E) [X_i X_j] - sum_(i , j = 1)^p a_(i 1) a_(j 1) upright(E) [X_i] upright(E) [X_j]\
= & sum_(i , j = 1)^p a_(i 1) a_(j 1) c o v [X_i , X_j]\
= & (a_11 , a_21 , dots.h , a_(p 1)) mat(delim: "(", c o v [X_1 , X_1], c o v [X_1 , X_2], dots.h, c o v [X_1 , X_p]; c o v [X_2 , X_1], c o v [X_2 , X_2], dots.h, c o v [X_2 , X_p]; dots.v, dots.v, dots.down, dots.v; c o v [X_p , X_1], c o v [X_p , X_2], dots.h, c o v [X_p , X_p]) vec(a_11, a_21, dots.v, a_(p 1))\
= & upright(bold(a))_1 Sigma upright(bold(a))_1^T $ where $Sigma$ is the
covariance matrix of $X$. The problem becomes
$ max (upright(bold(a))_1 Sigma upright(bold(a))_1^T) quad s . t . quad parallel upright(bold(a))_1 parallel_2 = 1 $
Let $lambda$ be Lagrange multiplier and let
$g (upright(bold(a))_1) = upright(bold(a))_1 Sigma upright(bold(a))_1^T - lambda (upright(bold(a))_1 upright(bold(a))_1^T - 1)$.
Then we need
$ nabla g (upright(bold(a))_1) = upright(bold(a))_1 Sigma^T - lambda upright(bold(a))_1 = (Sigma upright(bold(a))_1^T - lambda upright(bold(a))_1^T)^T = 0 $
Therefore, $upright(bold(a))_1^T$ is the eigenvector of $Sigma$
corresponding to eigenvalue $lambda equiv lambda_1$. Furthermore, we
have maximized
$v a r [upright(bold(z))_1] = upright(bold(a))_1 Sigma upright(bold(a))_1^T = lambda_1$,
this means $lambda_1$ is the largest eigenvalue of $Sigma$.

For the second component, note that
$c o v [upright(bold(z))_2 , upright(bold(z))_1] = upright(bold(a))_2 Sigma upright(bold(a))_1^T = upright(bold(a))_2 lambda_1 upright(bold(a))_1^T = 0$.
For another multipliers $phi.alt$ and $lambda$ and another
$g (upright(bold(a))_2) = upright(bold(a))_2 Sigma upright(bold(a))_2^T - lambda (upright(bold(a))_2 upright(bold(a))_2^T - 1) - phi.alt lambda_1 upright(bold(a))_2 upright(bold(a))_1^T$,
we need
$ nabla g (upright(bold(a))_2) = (Sigma upright(bold(a))_2^T - lambda upright(bold(a))_2^T - phi.alt lambda_1 upright(bold(a))_1^T)^T = 0 $
Multiply $upright(bold(a))_1$ both side, we get
$  & upright(bold(a))_1 Sigma upright(bold(a))_2^T - upright(bold(a))_1 lambda upright(bold(a))_2^T - phi.alt lambda_1 upright(bold(a))_1 upright(bold(a))_1^T\
= & (upright(bold(a))_2 Sigma upright(bold(a))_1)^T - lambda (upright(bold(a_2)) upright(bold(a))_1)^T - phi.alt lambda_1 = 0 $
So $phi.alt$ must be zero. Hence
$ Sigma upright(bold(a))_2^T = lambda upright(bold(a))_2^T $
$upright(bold(a))_2^T$ is also an eigenvector and has
$lambda equiv lambda_2$ as its eigenvalue. And, again,
$v a r [upright(bold(z))_2] = upright(bold(a))_2 Sigma upright(bold(a))_2^T = lambda_2$
is the second largest eigenvalue. \
In general,
$ v a r [upright(bold(z))_k] = upright(bold(a))_k Sigma upright(bold(a))_k^T = lambda_k $
The $k^(upright(t h))$ largest eigenvalue of $Sigma$ is the variance of
the $k^(upright(t h))$ PC.
