= EM Algorithm
<em-algorithm>
The goal of the EM algorithm is to find maximum likelihood solutions for
models having latent variables. Consider a probabilistic model in which
we collectively denote all of the observed variabels by #strong[X] and
all of the hidden variables by #strong[Z];. The joint distribution
$p (upright(bold(X)) , upright(bold(Z)) \| bold(theta))$ is governed by
a set of parameters denoted $bold(theta)$. Our goal is to maximize the
likelihood function that is given by
$ p (upright(bold(X)) \| bold(theta)) = sum_(upright(bold(Z))) p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)) $
This method based on the assumption that the computation of
$p (upright(bold(X)) , upright(bold(Z)) \| bold(theta))$ is easier than
$p (upright(bold(X)) \| bold(theta))$. Let $q (upright(bold(Z)))$ be the
distribution of $upright(bold(Z))$. Then is obvious that
$ ln p (upright(bold(X)) \| bold(theta)) = sum_(upright(bold(Z))) q (upright(bold(Z))) ln p (upright(bold(X)) \| bold(theta)) $
We’ve known that
$ ln p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)) = ln p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)) + ln p (upright(bold(X)) \| bold(theta)) $
Then
$ ln p (upright(bold(X)) \| bold(theta)) & = sum_(upright(bold(Z))) ln q (upright(bold(Z))) p (upright(bold(X)) \| bold(theta))\
 & = sum_(upright(bold(Z))) q (upright(bold(Z))) ln {frac(p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)), q (upright(bold(Z))))} - sum_(upright(bold(Z))) q (upright(bold(Z))) ln {frac(p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)), q (upright(bold(Z))))}\
 & equiv cal(L) (q , bold(theta)) + upright(K L) (q parallel p) $ Since
$upright(K L) (q parallel p) gt.eq 0$, $cal(L) (q , bold(theta))$ is the
lower bound of $ln p (upright(bold(X)) \| bold(theta))$, i.e.
$ cal(L) (q , bold(theta)) lt.eq ln p (upright(bold(X)) \| bold(theta)) $
Note that $upright(K L) (q parallel p) = 0$ if and only if
$q (upright(bold(Z))) = p (upright(bold(Z)) \| upright(bold(X)) , bold(theta))$.

The EM algorithm is a two-stage iterative optimization technique for
finding maximum likelihood solutions.

== E Step
<e-step>
Let $bold(theta)^(upright(o l d))$ be the current parameter vector.
Maximize $cal(L) (q , bold(theta))$ with respect to
$q (upright(bold(Z)))$ with holding $bold(theta)^(upright(o l d))$
fixed. $cal(L) (q , bold(theta))$ will reach its maximum
$ln p (upright(bold(X)) \| bold(theta))$ when
$q (upright(bold(Z))) = p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d)))$.
That is,
$ max cal(L) (q , bold(theta)) & = sum_(upright(bold(Z))) p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) ln p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)^(upright(o l d))) - sum_(upright(bold(Z))) p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) ln p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) $

== M Step
<m-step>
Maximize $cal(L) (q , bold(theta))$ with respect to $bold(theta)$ with
holding $q (upright(bold(Z)))$ fixed. Here we get new parameter
$bold(theta)^(upright(n e w))$. This will cause
$cal(L) (q , bold(theta))$ increase and then cause
$ln p (upright(bold(X)) \| bold(theta))$ increase subsequently.
Furthermore, the $q (upright(bold(Z)))$ in this step is determined in
the previous step, $upright(K L) (q , bold(theta)^(upright(n e w)))$
will be nonzero. Hence $ln p (upright(bold(X)) \| bold(theta))$
increases more than its lowe bound $cal(L) (q , bold(theta))$. From
above we have,
$ cal(L) (q , bold(theta)) & = sum_(upright(bold(Z))) p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) ln p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)) - sum_(upright(bold(Z))) p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) ln p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d)))\
 & = cal(Q) (bold(theta) , bold(theta)^(upright(o l d))) + upright(c o n s t a n t) $
Since
$p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) = q (upright(bold(Z)))$,
the last term is a constant. This tells us that we actually maximize the
expectation of the complete-data log likelihood.
= EM Algorithm
<em-algorithm>
The goal of the EM algorithm is to find maximum likelihood solutions for
models having latent variables. Consider a probabilistic model in which
we collectively denote all of the observed variabels by #strong[X] and
all of the hidden variables by #strong[Z];. The joint distribution
$p (upright(bold(X)) , upright(bold(Z)) \| bold(theta))$ is governed by
a set of parameters denoted $bold(theta)$. Our goal is to maximize the
likelihood function that is given by
$ p (upright(bold(X)) \| bold(theta)) = sum_(upright(bold(Z))) p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)) $
This method based on the assumption that the computation of
$p (upright(bold(X)) , upright(bold(Z)) \| bold(theta))$ is easier than
$p (upright(bold(X)) \| bold(theta))$. Let $q (upright(bold(Z)))$ be the
distribution of $upright(bold(Z))$. Then is obvious that
$ ln p (upright(bold(X)) \| bold(theta)) = sum_(upright(bold(Z))) q (upright(bold(Z))) ln p (upright(bold(X)) \| bold(theta)) $
We’ve known that
$ ln p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)) = ln p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)) + ln p (upright(bold(X)) \| bold(theta)) $
Then
$ ln p (upright(bold(X)) \| bold(theta)) & = sum_(upright(bold(Z))) ln q (upright(bold(Z))) p (upright(bold(X)) \| bold(theta))\
 & = sum_(upright(bold(Z))) q (upright(bold(Z))) ln {frac(p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)), q (upright(bold(Z))))} - sum_(upright(bold(Z))) q (upright(bold(Z))) ln {frac(p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)), q (upright(bold(Z))))}\
 & equiv cal(L) (q , bold(theta)) + upright(K L) (q parallel p) $ Since
$upright(K L) (q parallel p) gt.eq 0$, $cal(L) (q , bold(theta))$ is the
lower bound of $ln p (upright(bold(X)) \| bold(theta))$, i.e.
$ cal(L) (q , bold(theta)) lt.eq ln p (upright(bold(X)) \| bold(theta)) $
Note that $upright(K L) (q parallel p) = 0$ if and only if
$q (upright(bold(Z))) = p (upright(bold(Z)) \| upright(bold(X)) , bold(theta))$.

The EM algorithm is a two-stage iterative optimization technique for
finding maximum likelihood solutions.

== E Step
<e-step>
Let $bold(theta)^(upright(o l d))$ be the current parameter vector.
Maximize $cal(L) (q , bold(theta))$ with respect to
$q (upright(bold(Z)))$ with holding $bold(theta)^(upright(o l d))$
fixed. $cal(L) (q , bold(theta))$ will reach its maximum
$ln p (upright(bold(X)) \| bold(theta))$ when
$q (upright(bold(Z))) = p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d)))$.
That is,
$ max cal(L) (q , bold(theta)) & = sum_(upright(bold(Z))) p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) ln p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)^(upright(o l d))) - sum_(upright(bold(Z))) p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) ln p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) $

== M Step
<m-step>
Maximize $cal(L) (q , bold(theta))$ with respect to $bold(theta)$ with
holding $q (upright(bold(Z)))$ fixed. Here we get new parameter
$bold(theta)^(upright(n e w))$. This will cause
$cal(L) (q , bold(theta))$ increase and then cause
$ln p (upright(bold(X)) \| bold(theta))$ increase subsequently.
Furthermore, the $q (upright(bold(Z)))$ in this step is determined in
the previous step, $upright(K L) (q , bold(theta)^(upright(n e w)))$
will be nonzero. Hence $ln p (upright(bold(X)) \| bold(theta))$
increases more than its lowe bound $cal(L) (q , bold(theta))$. From
above we have,
$ cal(L) (q , bold(theta)) & = sum_(upright(bold(Z))) p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) ln p (upright(bold(X)) , upright(bold(Z)) \| bold(theta)) - sum_(upright(bold(Z))) p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) ln p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d)))\
 & = cal(Q) (bold(theta) , bold(theta)^(upright(o l d))) + upright(c o n s t a n t) $
Since
$p (upright(bold(Z)) \| upright(bold(X)) , bold(theta)^(upright(o l d))) = q (upright(bold(Z)))$,
the last term is a constant. This tells us that we actually maximize the
expectation of the complete-data log likelihood.
