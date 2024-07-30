#heading(level: 1, numbering: none)[First and First]
<first-and-first>
#emph[Random] itself has the meaning of #emph[unknown];, and
#emph[unpredictable];. It’ll be a contradiction if we can define what is
random. Or, from a different aspect, we can only use #emph[unknown] to
define #emph[random];.

= Random Variable
<random-variable>
A #emph[random variable] is a function that maps the outcome of a random
experiment to a real number. We use $cal(C)$ to denote the set of all
outcomes; $c$ to denote a single outcome.

For example, let
$C = { upright("GPT") , upright("GAN") , upright("BERT") , upright("YOLO") }$,
then a random varialbe $X$ can be
$ X (upright("GPT")) = 0 , X (upright("GAN")) = 1 , X (upright("BERT")) = 2 , X (upright("YOLO")) = 3 . $

You can change to any number you want.

We cannot observe a random variable itself, i.e., the mapping $X$ is
unobservable. We can only define the mapping, and then observe the
result of applying this mapping to an experiment outcome.

== Realization
<realization>
The #emph[realization] of a random variable is the result of applying
the random variable (i.e., mapping) to an observed outcome of a random
experiment. This is what we actually observe.

Typically, we use lowercase to denote the realized number; uppercase to
denote the random variable. e.g., $x$ is a realization of $X$.

== Space
<space>
The #emph[space] or #emph[range] of $X$ is a set of real numbers
$cal(D) = { X (c) : c in C }$.

== Probability Mass Function
<probability-mass-function>
A random variable $X$ is said to be #emph[descrete] if its space
$cal(D)$ is either finite or countable.

Let $X$ be a discrete random variable with space $cal(D)$. The
#emph[probability mass function] of $X$, $p_X (d_i)$, is defined by

$ p_X (d_i) = P [{ c : X (c) = d_i }] = P [X = d_i] , $

for all $d_i in cal(D)$.

The induced probability distribution, $P_X (dot.op)$, of $X$ is

$ P_X (D) = sum_(d_i in D) p_X (d_i) = sum_(d_i in D) P [{ c : X (c) = d_i }] = sum_(d_i in D) P [X = d_i] , upright(" ") D subset cal(D) $

Note that the notation $P [X = d_i]$ is an abbreviation, since the
outcome $c$ is not actually important here.

== Cumulative Distribution Function
<cumulative-distribution-function>
The #emph[cumulative distribution function];, $F_X (x)$, of $X$ is
defined by

$ F_X (x) = P_X \( (- oo , x \]) = P [{ c : X (c) lt.eq x }] = P (X lt.eq x) . $

Cdf is also simply called the #emph[distribution function];.

== Probability Density Function
<probability-density-function>
A random variable $X$ is said to be #emph[continuous] if its cdf
$F_X (x)$ is continuous for all $x in bb(R)$.

Let $X$ be a continuous random variable with interval
$cal(D) subset bb(R)$ as space. The #emph[probability density function]
of $X$, $f_X (x)$, is a function that satisfies

$ F_X (x) = P (X lt.eq x) = integral_(- oo)^x f_X (t) d t . $

When there exits such a function $f_X (x)$, $X$ is also called an
#emph[absolutely continuous] random variable.

If $f_X (x)$ is also continuous, we have

$ frac(d, d x) F_X (x) = f_X (x) $

by the Fundamental Theorem of Calculus. Note that for any continuous
random variable $X$, there are no points of discrete mass, hence

$ P (X = x) = 0 , $

for all $x in bb(R)$.

From this, we can also infer that

$ P (a < X lt.eq b) = P (a lt.eq X lt.eq b) = P (a lt.eq X < b) = P (a < X < b) $

== Different random variable can have the same cdf
<different-random-variable-can-have-the-same-cdf>
Let $X$ has be a random variable that stands for a real random number
randomly choosed from the interval $(0 , 1)$, and we simply use the
sample as the assigned number. In this case, the domain is
$cal(D) = (0 , 1)$. Assign a probability on $X$,

$ P_X [(a , b)] = b - a , upright(" for ") 0 < a < b < 1 $

Then the pdf of $X$ is

$ f_X (x) = cases(delim: "{", 1 & 0 < x < 1, 0 & upright("elsewhere")) $

It’s easy to show that the cdf is

$ F_X (x) = P (X lt.eq x) = cases(delim: "{", 0 & upright("if ") x < 0, x & upright("if ") 0 lt.eq x < 1, 1 & upright("if ") x gt.eq 1) $

Now consider $Y = 1 - X$,

$ F_Y (y) & = P (Y lt.eq y) = P (1 - X lt.eq y) = P (X gt.eq 1 - y) = 1 - P (X < 1 - y)\
 & = cases(delim: "{", 0 & upright("if ") y < 0, y & upright("if ") 0 lt.eq y < 1, 1 & upright("if ") 1 lt.eq y) $

In this case, we said $X$ and $Y$ are equal in distribution and denote
by $X =^D Y$.

== Expectation
<expectation>
The #emph[expectation] of $X$ is defined by

$ E [X] = cases(delim: "{", sum x_i p (x_i) & upright("if ") X upright(" is discrete with pmf ") p (x) upright(", and ") sum lr(|x|) p (x) < oo, integral x f (x) d x & upright("if ") X upright(" is continuous with pdf ") f (x) upright(", and ") integral lr(|x|) f (x) d x < oo) $

Expectation is also called #emph[mean];, or #emph[expected value];, and
mostly denoted by $mu$.

The expection can reflect the transformation of random variable. Let
$Y = g (X)$, then

$ E (Y) = E (g (X)) & = sum g (x) p (x)\
E (Y) = E (g (X)) & = integral g (x) f (x) d x $

The expection is linear with respect to random variable,

$ E [k_1 g_1 (X) + k_2 g_2 (X)] = k_1 E [g_1 (X)] + k_2 E [g_2 (X)] $

== Variance and Standard Deviation
<variance-and-standard-deviation>
Let $X$ be a random variable with finite mean $mu$ and $E [(X - mu)^2]$
is also finite. The variance of $X$ is defined by

$ "Var" [X] = E [(X - mu)^2] $

Variance is mostly denoted by $sigma^2$. The single $sigma$ is called
the #emph[standard deviation];. The number $sigma$ is sometimes
interpreted as a measure of the dispersion of the points of the space
relative to the mean value $mu$.

Note that

$ sigma^2 & = E [(X - mu)^2] = E (X^2 - 2 X mu + mu^2)\
 & = E [X^2] - 2 mu^2 + mu^2\
 & = E [X^2] - mu^2 $

= Random Vector
<random-vector>
Consider two random variables $X_1$ and $X_2$ on the same sample space
$cal(C)$, that they assign each element $c$ of $cal(C)$ one and only one
ordered pair of numbers $X_1 (c) = x_1$ , $X_2 (c) = x_2$. Then we say
that $(X_1 , X_2)$ is a random vector. The #emph[space] of $(X_1 , X_2)$
is the set of ordered pairs
$cal(D) = { (x_1 , x_2) : x_1 = X_1 (c) , x_2 = X_2 (c) , c in cal(C) }$.

== Probability Mass Function
<probability-mass-function-1>
A discrete random vector $(X_1 , X_2)$ with finite or countable space
$cal(D)$. The #emph[joint probability mass function] of $(X_1 , X_2)$,
$p_(X_1 , X_2) (x_1 , x_2)$, is defined by

$ p_(X_1 , X_2) (x_1 , x_2) = P [X_1 = x_1 , X_2 = x_2] $

for all $(x_1 , x_2) in cal(D)$.

== Cumulative Distribution Function
<cumulative-distribution-function-1>
The cumulative distribution function of $(X_1 , X_2)$,
$F_(X_1 , X_2) (x_1 , x_2)$, is defined by

$ F_(X_1 , X_2) (x_1 , x_2) = P [{ X_1 lt.eq x_1 } sect { X_2 lt.eq x_2 }] , $

for all $(x_1 , x_2) in bb(R)$. This is also called #emph[joint
cumulative distribution function];.

We’ll also abbreviate $P [{ X_1 lt.eq x_1 } sect { X_2 lt.eq x_2 }]$ to
$P [X_1 lt.eq x_1 , X_2 lt.eq x_2]$.

== Probability Density Function
<probability-density-function-1>
A random vector $(X_1 , X_2)$ with space $cal(D)$ is said to be
continuous if

$ F_(X_1 , X_2) (x_1 , x_2) = P [{ X_1 lt.eq x_1 } sect { X_2 lt.eq x_2 }] $

is continuous.

The of $(X_1 , X_2)$, $f_(X_1 , X_2) (x_1 , x_2)$, is defined to satisfy

$ F_(X_1 , X_2) (x_1 , x_2) = integral_(- oo)^(x_1) integral_(- oo)^(x_2) f_(X_1 , X_2) (w_1 , w_2) d w_1 d w_2 $

for all $(x_1 , x_2) in bb(R)$. Then

$ frac(partial^2 F_(X_1 , X_2) (x_1 , x_2), partial x_1 partial x_2) = f_(X_1 , X_2) (x_1 , x_2) $

For an event $A subset cal(D)$, we have

$ P [(X_1 , X_2) in A] = integral integral_A f_(X_1 , X_2) (x_1 , x_2) d x_1 d x_2 $

== Marginals
<marginals>
Let $(X_1 , X_2)$ be a random vector. Recall that

$ { X_1 lt.eq x_1 } & = { c : X_1 (c) lt.eq x_1 } = { c : X_1 (c) lt.eq x_1 } sect { c : - oo < X_2 < oo }\
 & = { X_1 lt.eq x_1 , - oo < X_2 < oo } , $

hence,

$ F_(X_1) (x_1) = P [X_1 lt.eq x_1 , - oo < X_2 < oo] , $

for all $x_1 in bb(R)$. By the property of cdf, we can get

$ F_(X_1) (x_1) = lim_(x_2 arrow.r oo) F_(X_1 , X_2) (x_1 , x_2) . $

This is exactly where we connect the cdf, pdf, pmf between random
variable and random vector.

=== Discrete
<discrete>
For discrete $(X_1 , X_2)$. Let $cal(D)_(X_1)$ be the support of $X_1$,
i.e., $cal(D)_(X_1) = { x in cal(D) : p_(X_1) (x) eq.not 0 }$ where
$cal(D)$ is the space of $X_1$. For $x_1 in cal(D)_(X_1)$

$ F_(X_1) (x_1) & = P [X_1 lt.eq x_1 , - oo < X_2 < oo]\
 & = "∑∑"_(w_1 lt.eq x_1 , - oo < x_2 < oo) p_(X_1 , X_2) (w_1 , x_2)\
 & = sum_(w_1 lt.eq x_1) {sum_(x_2 < oo) p_(X_1 , X_2) (w_1 , x_2)} $

By uniqueness of cdfs, we know the pmf of $X_1$ must be

$ p_(X_1) (x_1) = sum_(x_2 < oo) p_(X_1 , X_2) (x_1 , x_2) , $

for all $x_1 in cal(D)_(X_1)$. This is called the #emph[marginal pmf] of
$X_1$. We can get similar result for $X_2$.

=== Continuous
<continuous>
For continuous $(X_1 , X_2)$. We use the same notation as the discrete
one. Then

$ F_(X_1) (x_1) = integral_(- oo)^(x_1) integral_(- oo)^oo f_(X_1 , X_2) (w_1 , x_2) d x_2 d w_1 = integral_(- oo)^(x_1) {integral_(- oo)^oo f_(X_1 , X_2) (w_1 , x_2) d x_2} d w_1 , $

for all $x_1 in cal(D)_(X_1)$. The pdf of $X_1$ must be

$ f_(X_1) (x_1) = integral_(- oo)^oo f_(X_1 , X_2) (x_1 , x_2) d x_2 $

== Expectation
<expectation-1>
From above, we have

$ E (X_1) & = integral x_1 f_(X_1) (x_1) d x_1\
 & = integral x_1 {integral f_(X_1 , X_2) (x_1 , x_2) d x_2} d x_1\
 & = integral integral x_1 f_(X_1 , X_2) (x_1 , x_2) d x_2 d x_1 $

Let $upright(bold(X)) = (X_1 , X_2) prime$ be a random vector. The
expectation $E (upright(bold(X)))$ exists if the expectations $X_1$ and
$X_2$ exist, and, is computed by

$ E [upright(bold(X))] = mat(delim: "[", E (X_1); E (X_2)) $

It’s easy to verify that $E [upright(bold(X))]$ is linear.

== Conditional Distributions and Expectations
<conditional-distributions-and-expectations>
Let $f_(X_1 , X_2) (x_1 , x_2)$ be the joint pdf of two random variables
$X_1$ and $X_2$. Let $f_(X_1) (x_1)$ and $f_(X_2) (x_2)$ denote the
marginal pdf of $X 1$ and $X_2$, respectively. Observe that

$ integral_(- oo)^(- oo) frac(f_(X_1 , X_2) (x_1 , x_2), f_(X_1) (x_1)) d x_2 = frac(1, f_(X_1) (x_1)) integral_(- oo)^(- oo) f_(X_1 , X_2) (x_1 , x_2) d x_2 = frac(1, f_(X_1) (x_1)) f_(X_1) (x_1) = 1 $

That is, $frac(f_(X_1 , X_2) (x_1 , x_2), f_(X_1) (x_1))$ satisfies the
properties of a pdf of one continous random variable on the support of
$X 1$. We called this the #emph[conditional pdf] of $X_2$, given
$X_1 = x_1$.

The #emph[conditional probability] is then defined by

$ P (a < X_2 < b \| X_1 = x_1) = integral_a^b frac(f_(X_1 , X_2) (x_1 , x_2), f_(X_1) (x_1)) d x_2 , $

furthermore, the #emph[conditional expectation] is,

$ E [X_2 \| x_1] = integral_(- oo)^(- oo) x_2 frac(f_(X_1 , X_2) (x_1 , x_2), f_(X_1) (x_1)) d x_2 , $

the #emph[conditional variance] is,

$ "Var" [X_2 \| x_1] & = E \[ \( X_2 - E [X_2 lr(|x_1 \] \)^2|) x_1]\
 & = integral_(- oo)^(- oo) (x_2 - E [X_2 \| x_1])^2 frac(f_(X_1 , X_2) (x_1 , x_2), f_(X_1) (x_1)) d x_2\
 & = E (X_2^2 \| x_1) - [E (X_2 \| x_1)]^2 $

and, for $u (X_2)$ be a function of $X_2$,

$ E [u (X_2) \| x_1] = integral_(- oo)^(- oo) u (x_2) frac(f_(X_1 , X_2) (x_1 , x_2), f_(X_1) (x_1)) d x_2 , $

Note that both $E [X_2 \| x_1]$ and $"Var" [X_2 \| x_1]$ are a function
of $x_1$.

When the realization $x_1$ is not that important, we’ll denote the above
concepts by $E [X_2 \| X_1]$, $"Var" [X_2 \| X_1]$, and
$E [u (X_2) \| X_1]$.

=== Important Theorem
<important-theorem>
Let $(X_1 , X_2)$ be a random vector such that the variance of $X_2$ is
finite. Then

$  & E [E (X_2 \| X_1)] = E (X_2) ,\
 & "Var" [E (X_2 \| X_1)] lt.eq "Var" (X_2) $

#block[
#emph[Proof.] Consider

$ E (X_2) & = integral_(- oo)^oo integral_(- oo)^oo x_2 f (x_1 , x_2) d x_2 d x_1\
 & = integral_(- oo)^oo [integral_(- oo)^oo x_2 frac(f (x_1 , x_2), f_1 (x_1)) d x_2] f_1 (x_1) d x_1\
 & = integral_(- oo)^oo E (X_2 \| x_1) f_1 (x_1) d x_1\
 & = E [E (X_2 \| X_1)] , $

where $f (x_1 , x_2) = f_(X_1 , X_2) (x_1 , x_2)$ and
$f_1 (x_1) = f_(X_1) (x_1) = integral f (x_1 , x_2) d x_2$.

For the second result, let $mu_2 = E (X_2)$, consider

$ "Var" (X_2) & = E [(X_2 - mu_2)^2]\
 & = E [(X_2 - E (X_2 \| X_1) + E (X_2 \| X_1) - mu_2)^2]\
 & = E [\( X_2 - E (X_2 \| X_1)^2] + E [(E (X_2 \| X_1) - mu_2)^2]\
 & #h(2em) + 2 E [(X_2 - E (X_2 \| X_1)) (E (X_2 \| X_1) - mu_2)] , $

the last term is equal to

$  & 2 integral_(- oo)^oo integral_(- oo)^oo (x_2 - E (X_2 \| X_1)) (E (X_2 \| X_1) - mu_2) f (x_1 , x_2) d x_2 d x_1\
= & 2 integral_(- oo)^oo (E (X_2 \| X_1) - mu_2) {integral_(- oo)^oo (x_2 - E (X_2 \| X_1)) frac(f (x_1 , x_2), f_1 (x_1)) d x_2} f_1 (x_1) d x_1 , $

where the integral inside the curly braces is zero. Hence the variance
of $X_2$ is

$ "Var" (X_2) = E [\( X_2 - E (X_2 \| X_1)^2] + E [(E (X_2 \| X_1) - mu_2)^2] $

The first term is non negative, the second term is

$ E [(E (X_2 \| X_1) - E (X_2))^2] = E [(E (X_2 \| X_1) - E [E (X_2 \| X_1)])^2] = "Var" [E (X_2 \| X_1)] , $

we get the result $"Var" [E (X_2 \| X_1)] lt.eq "Var" (X_2)$.~◻

]
This theorem tells us that, when $mu_2$ is unkown, we would put more
reliance in $E (X_2 \| X_1)$ as a guess. That is, if we observe the pair
$(X_1 , X_2)$ to be $(x_1 , x_2)$, we could perfer to use
$E (X_2 \| x_1)$ to $x_2$ as a guess at the unknown $mu_2$.

= Random Sample
<random-sample>
