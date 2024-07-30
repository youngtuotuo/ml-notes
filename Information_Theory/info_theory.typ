= Information Theory
<information-theory>
== Information
<information>
#block[
#emph[Highly improbable events bring more information to us, while
certain events bring no information.]

]
The information of an event $x$ will therefore depends on the
probability distribution $p (x)$ of its random variable $X$.

== Construct Information Fomula
<construct-information-fomula>
Let $h (dot.op)$ be a monotonic function of any distribution $p (x)$
that returns the information of $p (x)$. If $x$ and $y$ are unrelated
events, we hope the information they take are also unrelated, so

$  & h (x , y) = h (x) + h (y)\
 & p (x , y) = p (x) p (y) $

Note that we can interpret $h (p (x))$ as $h (x)$ and interpret
$h (p (x , y))$ as $h (x , y)$.

$log_2 (x)$ is a monotonic function that satisfied both (@eq:1) and
(@eq:2), hence we can define

$ h (x) = - log_2 p (x) $

Then $h (x)$ satisfies $2^(h (x)) = frac(1, p (x))$. We can interpret
this as

#block[
$h (x)$ #emph[is the amount of bits that being enough for representing]
$frac(1, p (x))$ #emph[in binary];.

]
When $p (x)$ is low, the probability is low, we need more bits to
represent it.

== Entropy
<entropy>
Let $X$ be the random variable of the state that transmitted from a
sender to a receiver. Intuitively, #emph[the average amount of the
information] that $X$ carries is obtained by taking the expectation of
information $h (x)$ with respect to the p.d.f. $p (x)$

$ sum_(x in X) p (x) h (x) = - sum_(x in X) p (x) log_2 p (x) $

This is called the #emph[entropy] of the random variable $X$ and denote
it by $"H" (X)$ or $"H" (p)$ or $"H" (x)$, based on the context of the
paragraph.

Since $lim_(p arrow.r 0) p ln p = 0$, we just take $p (x) ln p (x) = 0$
when we encounter $p (x) = 0$ for some $x$.

=== Nats
<nats>
In practice, we use $ln p (x)$ instead of $log_2 p (x)$. That is,

$  & h (x) = - ln p (x)\
 & "H" (p) = - sum_(x in X) p (x) ln p (x) $

In this situation, we said the information is measured in the units of
’nats’.

=== Entropy as Lower Bound
<entropy-as-lower-bound>
#block[
#emph[Entropy is a lower bound of the amount of bits that a random
variable can transmits.]

]
by the #emph[Noiseless Coding Theorem];.

=== Noiseless Coding Theorem
<noiseless-coding-theorem>
#block[
$N$ i.i.d. random variables each with entropy $"H" (X)$ can be
compressed into more than $N "H" (X)$ bits with negligible risk of
information loss, as $N arrow.r oo$; but conversely, if they are
compressed into fewer than $N "H" (X)$ bits it is virtually certain that
information will be lost.

]
(ChatGPT) In essence, the theorem states that for any given data source
with a certain probability distribution of symbols, it is possible to
encode the source in such a way that the average length of the encoded
message per symbol is close to the entropy of the source.

== Maximize Entropy in Discrete Case
<maximize-entropy-in-discrete-case>
#heading(level: 3, numbering: none)[TL;DR]
<tldr>
#block[
#emph[The distribution that can carry the most average amount of
information is the uniform.]

]
#heading(level: 3, numbering: none)[Proof]
<proof>
Let $X = { x_i }_(i = 1)^M$ be a discrete random variable and let $p$ be
the distribution of $X$. For the optimization problem

$ max (- sum_(i = 1)^M p (x_i) ln p (x_i)) $

with the normalization constraint on the probabilities

$ sum_(i = 1)^M p (x_i) = 1 $

The Lagrangian is

$ cal(L) = - sum_(i = 1)^M p (x_i) ln p (x_i) + lambda (sum_(i = 1)^M p (x_i) - 1) $

From
$partial cal(L) \/ partial p (x_i) = - (ln p (x_i) + 1) + lambda = 0$,
we have $lambda = ln p (x_i) + 1$, $forall i = 1 , dots.h , M$. By
$sum_(i = 1)^M p (x_i) = 1$ and $lambda = ln p (x_i) + 1$, it’s easy to
get $lambda = ln (1 \/ M) + 1$, we then have

$ p (x_i) = 1 / M , forall i $

is the stationary point.

To verify the maximum, first compute the Hessian matrix

$ frac(partial cal(L), partial p (x_i) partial p (x_j)) = - I_(i j) frac(1, p (x_i)) $

It’s obvious that all the eigenvalues are negative (negative definite).
So $p (x_i) = 1 / M$ actually attains a maximum, and the maximum entropy
is $"H" (p) = ln M$.

== Differential Entropy
<differential-entropy>
Let $X subset.eq bb(R)$ be a continuous random variable and $p (x)$ be
the distribution of $X$. By M.V.T, we know there exists some $x_i$ such
that

$ integral_(i Delta)^((i + 1) Delta) p (x) d x = p (x_i) Delta $

where $Delta$ is the length of one partition of $X$. Now for any
$x in [i Delta , (i + 1) Delta]$, we can use $p (x_i) Delta$ to estimate
its probability as long as $Delta$ small enough. Here comes an entropy
estimation

$ "H"_Delta & = - sum_i p (x_i) Delta ln (p (x_i) Delta)\
 & = - sum_i p (x_i) Delta ln (p (x_i) Delta) + sum_i p (x_i) Delta ln Delta - sum_i p (x_i) Delta ln Delta\
 & = - sum_i p (x_i) Delta ln (frac(p (x_i) Delta, Delta)) - (sum_i p (x_i) Delta) ln Delta\
 & = - sum_i p (x_i) Delta ln p (x_i) - ln Delta $

Note that $sum_i p (x_i) Delta = integral_(x in X) p (x) d x = 1$.

The limit of the first term of right hand side is

$ lim_(Delta arrow.r 0) - sum_i p (x_i) Delta ln p (x_i) = - integral p (x) ln p (x) d x $

This integral is called the #emph[differential entropy];.

The difference term $ln Delta$ shows the fact that we need lots of bits
to describe a continuous variable.

The differential entropy can have negative values when
$sigma^2 < 1 \/ (2 pi e)$.

For multi dimension random variable, the differential entropy is similar

$ "H" (p) = - integral p (upright(bold(x))) ln p (upright(bold(x))) d upright(bold(x)) $

== Conditional Entropy
<conditional-entropy>
Given a joint probability $p (upright(bold(x)) , upright(bold(y)))$.
When $upright(bold(x))$ is known, the additional information needed to
specify the corresponding value of $upright(bold(y))$ is given by
$- ln p (upright(bold(y)) \| upright(bold(x)))$. We can compute the
#emph[conditional entropy]

$ "H" (upright(bold(y)) \| upright(bold(x))) = - integral.double p (upright(bold(x)) , upright(bold(y))) ln p (upright(bold(y)) \| upright(bold(x))) d upright(bold(y)) d upright(bold(x)) $

Note that

$ "H" (upright(bold(x)) , upright(bold(y))) & = - integral.double p (upright(bold(x)) , upright(bold(y))) ln p (upright(bold(x)) , upright(bold(y))) d upright(bold(x)) d upright(bold(y))\
 & = - integral.double p (upright(bold(x)) , upright(bold(y))) ln (p (upright(bold(y)) \| upright(bold(x))) p (upright(bold(x)))) d upright(bold(x)) d upright(bold(y))\
 & = - integral.double p (upright(bold(x)) , upright(bold(y))) ln p (upright(bold(y)) \| upright(bold(x))) d upright(bold(x)) d upright(bold(y)) - integral.double p (upright(bold(x)) , upright(bold(y))) ln p (upright(bold(x))) d upright(bold(x)) d upright(bold(y))\
 & = - integral.double p (upright(bold(x)) , upright(bold(y))) ln p (upright(bold(y)) \| upright(bold(x))) d upright(bold(x)) d upright(bold(y)) - integral (integral p (upright(bold(x)) , upright(bold(y))) d upright(bold(y))) ln p (upright(bold(x))) d upright(bold(x))\
 & = "H" (upright(bold(y)) \| upright(bold(x))) + "H" (upright(bold(x))) $

== Cross Entropy
<cross-entropy>
The cross entropy of the distribution $q (x)$ relative to a distribution
$p (x)$ is

$ H (p , q) = - upright(E)_p [ln q] = - sum_x p (x) ln q (x) $

In deep learning, $p (x)$ often refers to the ground truth label, and
$q (x)$ refers to the output from a deep neural network model.

In information theory, minimize cross entropy means

#block[
#emph[Minimizes the amount of information required to specify the value
of] $x$ #emph[as a result of using] $q (x)$.

]
== Kullback-Leibler Divergence
<kullback-leibler-divergence>
Let $p (x)$ be an unknown distribution and we use $q (x)$ to approximate
it. This will cause additional amount of information

$ "KL" (p parallel q) & = (- integral p (upright(bold(x))) ln q (upright(bold(x))) d upright(bold(x))) - (- integral p (upright(bold(x))) ln p (upright(bold(x))) d upright(bold(x)))\
 & = - integral p (upright(bold(x))) ln {frac(q (upright(bold(x))), p (upright(bold(x))))} d upright(bold(x)) $

This is known as the #emph[KL divergence] from $q$ to $p$. #emph[KL
divergence] is also called the #emph[relative entropy];.

Note that $"KL" (p parallel q) eq.not "KL" (q parallel p)$.

#heading(level: 3, numbering: none)[TL;DR]
<tldr-1>
$"KL" (p parallel q) gt.eq 0$,
$"KL" (p parallel q) = 0 arrow.l.r.double p = q$.

#heading(level: 3, numbering: none)[Convex function]
<convex-function>
For $0 lt.eq lambda lt.eq 1$, a convex function satisfies

$ f (lambda a + (1 - lambda) b) lt.eq lambda f (a) + (1 - lambda) f (b) $

A convex function is called strictly convex if the equality holds only
when $lambda = 0$ or $lambda = 1$.

#heading(level: 3, numbering: none)[Jensen’s Inequality]
<jensens-inequality>
Recall the #emph[Jensen’s inequality];, for a convex function $f$,

$ f (sum_i lambda_i x_i) lt.eq sum_i lambda_i f (x_i) $

where $lambda_i gt.eq 0$ and $sum_i lambda_i = 1$.

When each $lambda_i$ becomes the probability $p (x_i)$, we have

$ f ("E" [x]) lt.eq "E" [f (x)] . $

For continuous random variable, we have

$ f (integral upright(bold(x)) p (upright(bold(x))) d upright(bold(x))) lt.eq integral f (upright(bold(x))) p (upright(bold(x))) d upright(bold(x)) $

#heading(level: 3, numbering: none)[Proof]
<proof-1>
Observe that $- ln x$ is a strictly convex function, so by Jensen’s
inequality

$ "KL" (p parallel q) & = - integral p (upright(bold(x))) ln frac(q (upright(bold(x))), p (upright(bold(x)))) d upright(bold(x))\
 & gt.eq - ln (integral p (upright(bold(x))) frac(q (upright(bold(x))), p (upright(bold(x)))) d upright(bold(x)))\
 & = - ln (integral q (upright(bold(x))) d upright(bold(x))) = 0 $

When the equality holds,

$  & p (upright(bold(x))) ln frac(q (upright(bold(x))), p (upright(bold(x)))) = 0\
arrow.r.double & ln frac(q (upright(bold(x))), p (upright(bold(x)))) = 0\
arrow.r.double & frac(q (upright(bold(x))), p (upright(bold(x)))) = 1\
arrow.r.double & q (upright(bold(x))) = p (upright(bold(x))) $

== Gaussian Maximizes Differential Entropy
<gaussian-maximizes-differential-entropy>
We want to maximize

$ "H" (p) = - integral p (x) ln p (x) d x $

with three natural constraints

$  & integral_(- oo)^oo p (x) d x = 1\
 & integral_(- oo)^oo x p (x) d x = mu\
 & integral_(- oo)^oo (x - mu)^2 p (x) d x = sigma^2 $

The Lagrangian is

$ cal(L) [p] = - integral_(bb(R)) p (x) ln p (x) d x + lambda_1 (integral_(bb(R)) p (x) d x - 1) +\
lambda_2 (integral_(bb(R)) x p (x) d x - mu) + lambda_3 (integral_(bb(R)) (x - mu)^2 p (x) d x - sigma^2) $

This is a functional. The derivative of a functional is denoted by
$frac(delta cal(L), delta p)$ and is defined to satisfy

$ integral frac(delta cal(L) [p], delta p) phi.alt (x) d x = lim_(epsilon.alt arrow.r 0) frac(cal(L) [p + epsilon.alt phi.alt] - cal(L) [p], epsilon.alt) = [frac(d, d epsilon.alt) cal(L) [p + epsilon.alt phi.alt]]_(epsilon.alt = 0) $

where $phi.alt (x)$ is a variation term.

Deriving from the definition

$ integral frac(delta cal(L) [p], delta p) phi.alt (x) d x = integral (- (ln p (x) + 1) + lambda_1 + lambda_2 x + lambda_3 (x - mu)^2) phi.alt (x) d x $

We have the actual form of $frac(delta cal(L) [p], delta p)$ and can let
it be zero then get

$ p (x) = e^(- 1 + lambda_1 + lambda_2 x + lambda (x - mu)^2) $

Substitute this result back to three constraints leading to

$ p (x) = 1 / (2 pi sigma^2)^(1 / 2) e^(- frac((x - mu)^2, 2 sigma^2)) $

which is the Gaussian.

To verify the maximum, let $f (x)$ be any distribution has the variance
$sigma^2$. Since differential entropy is translation invariant, we can
also assume $f (x)$ has the same mean $mu$. Now consider the KL
divergence

$  & "KL" (f parallel p) = - integral f (x) ln (frac(p (x), f (x))) d x\
= & - "H" (f) - integral f (x) ln (1 / (2 pi sigma^2)^(1 / 2) e^(- frac((x - mu)^2, 2 sigma^2))) d x\
= & - "H" (f) + 1 / 2 ln (2 pi sigma^2) + frac(1, 2 sigma^2) integral f (x) (x - mu)^2 d x\
= & - "H" (f) + 1 / 2 ln (2 pi sigma^2) + frac(sigma^2, 2 sigma^2)\
= & - "H" (f) + 1 / 2 ln (2 pi sigma^2) + 1 / 2\
= & - "H" (f) + "H" (p) gt.eq 0 $

Hence

$ H (p) gt.eq H (f) , forall f $

The corresponding maximum entropy is,

$ "H" (p) = 1 / 2 (1 + ln (2 pi sigma^2)) $

== KL Divergence in Deep Learning
<kl-divergence-in-deep-learning>
Let $p (upright(bold(x)))$ be an unknown target distribution. We have
$N$ training data ${ x_i }_(i = 1)^N$ drawn from it. Let
$q (upright(bold(x)) \| theta)$ be a neural network tries to approximate
$p (upright(bold(x)))$ with the model weight $theta$. In theory, the
training process should minimize the KL divergence

$ "KL" (p parallel q) = - "E"_p [ln q / p] = - integral p (upright(bold(x))) ln frac(q (upright(bold(x)) \| theta), p (upright(bold(x)))) d upright(bold(x)) . $

Because $p (upright(bold(x)))$ is unknown, we can’t directly compute the
KL divergence. However, we can use sample mean to estimate it

$ "KL" (p parallel q) = - "E"_p [ln q / p] approx - 1 / N sum_(i = 1)^N ln (frac(q (upright(bold(x))_i \| theta), p (upright(bold(x))))) $

During training, $N$ is fixed, so

$ "KL" (p parallel q) approx sum_(i = 1)^N - ln q (upright(bold(x))_i \| theta) + ln p (upright(bold(x))_i) . $

$ln p (upright(bold(x)))$ is not related to the training, so minimizing
$sum_i - ln q (upright(bold(x))_i \| theta)$ is equivalent to minimizing
the KL divergence.

== Mutual Information
<mutual-information>
The following KL divergence is called the #emph[Mutual Information]
$"I" [upright(bold(x)) , upright(bold(y))]$,

$ "I" [upright(bold(x)) , upright(bold(y))] = "KL" (p (upright(bold(x)) , upright(bold(y))) parallel p (upright(bold(x))) p (upright(bold(y)))) = - integral.double p (upright(bold(x)) upright(bold(y))) ln (frac(p (upright(bold(x))) p (upright(bold(y))), p (upright(bold(x)) , upright(bold(y))))) d upright(bold(x)) $
