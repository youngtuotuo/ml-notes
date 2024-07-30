#heading(level: 1, numbering: none)[Problem Setup]
<problem-setup>
We have an unknown target state $x_k in bb(R)^n$, we want to estimate it
during each timestamp $k in bb(N) union { 0 }$. We create some
measurement method to help us guess each $x_k$. The Kalman Filter’s
objective is to guess a theoretically perfect $x_k$ from each
measurement $z_k$.

TL;DR, the Kalman Filter is the process doing: get $z_1$, guess $x_1$;
get $z_2$, guess $x_2$; get $z_3$, guess $x_3$, and so on.

= Assumptions
<assumptions>
By means of #emph[theoretically];, we need some assumptions.

== Pre-Defined Transition
<pre-defined-transition>
Let $F_k in bb(R)^(n times n)$ be a matrix. We assume that the next
state $x_(k + 1)$ can be obtained from the current state $x_k$ by

$ x_(k + 1) = F_k x_k + u_k $

where $u_k tilde.op cal(N) (0 , Q_k)$ is a white noise,
$u_k in bb(R)^n$, and $Q_k in bb(R)^(n times n)$.

This is also called #emph[the linear model of Kalman Filter];.

== Measurement to Real State
<measurement-to-real-state>
Let $H_k in bb(R)^(m times n)$ be a matrix. We assume that the current
measurement $z_k in bb(R)^m$ is obtained from the current state $x_k$ by

$ z_k = H_k x_k + w_k $

where $w_k tilde.op cal(N) (0 , R_k)$ is a white noise,
$w_k in bb(R)^m$, and $R_k in bb(R)^(m times m)$.

= Initial Setup
<initial-setup>
We never know $x_k$, we can only guess it, so denote the guessed value
by $hat(x)_k$. Formally, we call $hat(x)_k$ the #emph[estimate];.

The zero-th step of the Kalman Filter is randomly guess $hat(x)_0$ since
there’s no $z_(- 1)$. We further concern the correctness of each
$hat(x)_k$, we use the error covariance matrix
$P_k = "E" [(x_k - hat(x)_k) (x_k - hat(x)_k)^T]$ to formally compute
it. So when we start with $x_0$, we’ll also have another randomly guess
matrix $P_0$.

TL;DR, the initial setup is one vector $hat(x)_0$ and one matrix $P_0$.

= Preliminary Theorems
<preliminary-theorems>
== Minimum Variance Unbiased Estimate
<minimum-variance-unbiased-estimate>
Consider the measurement equation
#link(<eq:measurement>)[\[eq:measurement\]];, we wanna seek a matrix
$K_k in bb(R)^(n times m)$ that can do the guessing
$hat(x)_k = K_k z_k$. Since $w_k$ is a random vector, $z_k$ is also a
random vector, then so does $hat(x)_k$. As a result, the error term
$hat(x)_k - x_k$ is a random vector as well. In this subsection’s
discussion, the timestamp subscript $k$ won’t effect any computation, so
I ignore it to avoid the confusion.

We can define an inner product of two random vectors be

$ (x \| y) = "E" (x^T y) = "E" (sum_(i = 1)^n x_i y_i) , $

and then induces a norm by

$ parallel x parallel = sqrt("E" (x^T x)) = sqrt("E" (x_1^2 + dots.h.c + x_n^2)) = {"Tr" ("E" (x x^T))}^(1 \/ 2) . $

Now, consider the l2-norm

$  & parallel hat(x) - x parallel^2 = "E" [(hat(x) - x)^T (hat(x) - x)]\
= & "E" [(K z - x)^T (K z - x)]\
= & "E" [(K (H x + w) - x)^T (K (H x + w) - x)]\
= & "E" [((K H x)^T + (K w)^T - x^T) (K (H x + w) - x)]\
= & "E" [(K H x - x)^T (K H x - x)] + "E" [(K w)^T (K w)]\
= & parallel K H x - x parallel^2 + "Tr" ("E" [K w (K w)^T])\
= & parallel K H x - x parallel^2 + "Tr" (K "E" [w w^T] K^T)\
= & parallel K H x - x parallel^2 + "Tr" (K R K^T) . $

The final term still depends on the actual state $x$, but we never know
its value. To solve this, we add one more assumption $K H = I$. Observe
that if $K H = 1$, we have

$ "E" [hat(x)] = "E" [K z] = "E" [K H x + K w] = "E" [K H x] + "E" [K w] = x , $

this implies that $hat(x)$ is an unbiased estimate of $x$.

Then the error term becomes quite simple when we assume $K H = 1$

$ parallel hat(x) - x parallel^2 = "E" [(hat(x) - x)^T (hat(x) - x)] = "Tr" (K R K^T) $

Our mission now becomes

$  & "arg min"_K "Tr" (K R K^T)\
 & "s.t." K H = I_n $

This is an optimization problem with $n times n$ constraints.

\# Proof Needed, ref: Ch4.4 in
Optimization-Vector-Space-Methods-Luenberger

= Main Theorem
<main-theorem>
#block[
#strong[Theorem 1];. #emph[The optimal estimate $hat(x)_(k + 1)$ and
$P_(k + 1)$ can be generated recursively as]

#emph[$ hat(x)_(k + 1) & = F_k hat(x)_k + F_k P_k H_k^T [H_k P_k H_k^T + R_k]^(- 1) (z_k - H_k hat(x)_k)\
P_(k + 1) & = F_k P_k {I - H_k^T [H_k P_k H_k^T + R_k]^(- 1) H_k P_k} F_k^T + Q_k $]

]
#block[
#emph[Proof.] Suppose we have $hat(x)_(k - 1)$ and $P_(k - 1)$. At $k$,
we obtain a new measurement

$ z_k = H_k x_k + w_k $

which gives us additional information about $x_k$.~◻

]
