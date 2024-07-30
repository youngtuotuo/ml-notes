= Loss Functions
<loss-functions>
== Hinge Loss
<hinge-loss>
Let $g (x)$ be a classifier that defined by a score function $f (x)$

$ g (x) = {1 & upright(i f med) f (x) > 0\
- 1 & upright(i f med) f (x) lt.eq 0 $

Suppose there are $N$ data points $x_1 , dots.h , x_N$ with labels
$hat(y)_1 , dots.h , hat(y)_N in { - 1 , 1 }$. The hinge loss of $g$ is
defined to be

$ l #scale(x: 120%, y: 120%)[\(] g (x_n) , hat(y)_n #scale(x: 120%, y: 120%)[\)] = max { 0 , 1 - hat(y)_n f (x_n) } $

When $f (x_n) gt.eq 1$ or $f (x_n) lt.eq - 1$, both implies
$hat(y)_n f (x_n) gt.eq 1$. This means
$l #scale(x: 120%, y: 120%)[\(] g (x_n) , hat(y)_n #scale(x: 120%, y: 120%)[\)] = 0$.

When $f (x_n) in (- 1 , 1)$, we have $hat(y)_n f (x_n) in \[ 0 , 1 \)$.
Hence
$l #scale(x: 120%, y: 120%)[\(] g (x_n) , hat(y)_n #scale(x: 120%, y: 120%)[\)] = 1 - hat(y)_n f (x_n)$.

== Cross Entropy
<cross-entropy>
The cross entropy of the distribution $q (x)$ relative to a distribution
$p (x)$ is

$ H (p , q) = - upright(E)_p [ln q] = - sum_x p (x) ln q (x) $

In deep learning, $p (x)$ refers to the ground truth label, $q (x)$
refers to the output from a deep neural network model. In information
theory, minimize cross entropy means

#emph[Let the amount of the information carried by] $q (x)$ #emph[refers
to] $p (x)$.

=== Binary Class
<binary-class>
$p (x) in { 0 , 1 }$, $q (x) in [0 , 1]$

$ H (p , q) = - sum_x p (x) ln q (x) + (1 - p (x)) ln (1 - q (x)) $

=== Multi Class
<multi-class>
There are several ways to formulate. They are all equivalent.

\- One-Hot Ground Truth:

$p (x) in bb(R)^C$, $p_i (x) in { 0 , 1 }$, $sum_(i = 1)^C p_i (x) = 1$,
$q (x) in bb(R)^C$, each $q_i in [0 , 1]$, $forall i = 1 , dots.h , C$

$ H (p , q) & = - sum_x sum_(i = 1)^C p_i (x) ln q_i (x) + (1 - p_i (x)) ln (1 - q_i (x)) $

\- Raw Class Number Ground Truth:

== $L^p$ Norm
<lp-norm>
Let $bold(y) (bold(w) , bold(b)) : bb(R)^n arrow.r bb(R)^m$ be a model
defined by $bold(w)$ and $bold(b)$ that map $bold(x) in bb(R)^n$ into
$bold(y) in bb(R)^m$. Mathematically the $L^1$ norm is

$ parallel bold(y) (bold(w) , bold(b)) - hat(bold(y)) parallel_1 = sum_(k = 1)^m #scale(x: 120%, y: 120%)[\|] y_k (bold(w) , bold(b)) - hat(y)_k #scale(x: 120%, y: 120%)[\|] $

The $L^p$ norm is

$ parallel bold(y) (bold(w) , bold(d)) - hat(bold(y)) parallel_p = (sum_(k = 1)^m #scale(x: 120%, y: 120%)[\(] y_k (bold(w) , bold(b)) - hat(y)_k #scale(x: 120%, y: 120%)[\)]^p)^(1 \/ p) $

The $L^oo$ norm is

$ parallel bold(y) (bold(w) , bold(b)) - hat(bold(y)) parallel_oo = max_k lr(|y_k (bold(w) , bold(b)) - hat(y)_k|) $

== Mean Absolute Error($L^1$ Loss)
<mean-absolute-errorl1-loss>
Suppose there are $N$ instances ${ bold(x)_i }_(i = 1)^N$. The MAE is
defined by

$ L (bold(w) , bold(b)) = frac(sum_(n = 1)^N parallel bold(y)^n (bold(w) , bold(b)) - hat(bold(y)^n) parallel_1, N) $

== Mean Square Error($L^2$ Loss)
<mean-square-errorl2-loss>
Suppose there are $N$ instances ${ bold(x)_i }_(i = 1)^N$. The MSE is
defined by

$ L (bold(w) , bold(b)) = frac(sum_(n = 1)^N parallel bold(y)^n (bold(w) , bold(b)) - hat(bold(y)^n) parallel_2^2, N) $
