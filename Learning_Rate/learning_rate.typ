= Tuning Learning Rate(Optimizer)
<tuning-learning-rateoptimizer>
== Momentum
<momentum>
Let $v_k$ be the variable that stores previous move, i.e. the momentum.
In the beginning, $v_0 = 0$.
$ upright(I n i t i a l i z e med) & theta_0 upright(med a n d med l e t med) v_0 = 0 .\
 & theta_1 = theta_0 + v_1 , quad v_1 = lambda v_0 - alpha nabla L (theta_0) = - alpha nabla L (theta_0) ,\
 & theta_2 = theta_1 + v_2 , quad v_2 = lambda v_1 - alpha nabla L (theta_1) = - lambda alpha nabla L (theta_0) - alpha nabla L (theta_1) ,\
 & quad dots.v\
 & theta_(t + 1) = theta_t + v_(t + 1) , quad v_(t + 1) = lambda v_t - alpha nabla L (theta_t) $
Briefly, momentum method perturb current gradient by previous
gradient(momentum).

== Nesterov Accelerated Gradient(NAG)
<nesterov-accelerated-gradientnag>
Similar to momentum
$ upright(I n i t i a l i z e med) & theta_0 upright(med a n d med l e t med) v_0 = 0 .\
 & theta_1 = theta_0 + v_1 , quad v_1 = lambda v_0 - alpha nabla L (theta_0 + lambda v_0) = - alpha nabla L (theta_0) ,\
 & theta_2 = theta_1 + v_2 , quad v_2 = lambda v_1 - alpha nabla L (theta_1 + lambda v_1) = - lambda alpha nabla L (theta_0) - alpha nabla L (theta_1 + lambda v_1) ,\
 & quad dots.v\
 & theta_(t + 1) = theta_t + v_(t + 1) , quad v_(t + 1) = lambda v_t - alpha nabla L (theta_t + lambda v_t) $
Here, instead of perturbing current gradient, we perturb current
parameter by previous gradient.

== Adagrad(Adaptive Gradient)
<adagradadaptive-gradient>
Use first derivative to estimate second derivative.
$  & alpha arrow.l alpha / sqrt(sum_(i = 0)^t #scale(x: 120%, y: 120%)[\(] nabla L (theta_i) #scale(x: 120%, y: 120%)[\)]^2) ,\
 & theta_t arrow.l theta_(t - 1) - alpha / sqrt(sum_(i = 0)^t #scale(x: 120%, y: 120%)[\(] nabla L (theta_i) #scale(x: 120%, y: 120%)[\)]^2) nabla L (theta^(t - 1)) $
In practice we will add $epsilon.alt$ in the denominator to avoid
dividing by zero
$ theta_t arrow.l theta_(t - 1) - alpha / sqrt(sum_(i = 0)^t #scale(x: 120%, y: 120%)[\(] nabla L (theta_i) #scale(x: 120%, y: 120%)[\)]^2 + epsilon.alt) nabla L (theta^(t - 1)) $

== Adadelta
<adadelta>
This method needs the average of gradients
$upright(E) [nabla L (theta)^2]_t$ at step $t$ and the average of
parameter update $upright(E) [Delta theta^2]_t$. Initialize
$upright(E) [nabla L (theta)^2]_0 = 0 , med upright(E) [Delta theta^2]_0 = 0$
and choose a decay rate $rho$, learning rate $alpha$ and small
$epsilon.alt$.
$ upright(I) . med & theta_1 = theta_0 + Delta theta_0 , med Delta theta_0 = - alpha / sqrt(upright(E) [nabla L (theta)^2]_0 + epsilon.alt) nabla L (theta_0)\
upright(I I) . med & upright(E) [Delta theta^2]_0 = 0\
upright(I I) . med & upright(E) [nabla L (theta)^2]_1 = rho upright(E) [nabla L (theta)^2]_0 + (1 - rho) nabla L (theta_1)^2\
upright(I I) . med & theta_2 = theta_1 + Delta theta_1 , med Delta theta_1 = - sqrt(upright(E) [Delta theta^2]_0 + epsilon.alt) / sqrt(upright(E) [nabla L (theta)^2]_1 + epsilon.alt) nabla L (theta_1) equiv - frac(R M S [Delta theta]_0, R M S [nabla L (theta)]_1) nabla L (theta_1)\
upright(I I I) . med & upright(E) [Delta theta^2]_1 = rho upright(E) [Delta theta^2]_0 + (1 - rho) Delta theta_1^2\
upright(I I I) . med & upright(E) [nabla L (theta)^2]_2 = rho upright(E) [nabla L (theta)^2]_1 + (1 - rho) nabla L (theta_2)^2\
upright(I I I) . med & theta_3 = theta_2 + Delta theta_2 , med Delta theta_2 = - frac(R M S [Delta theta]_1, R M S [nabla L (theta)]_2) nabla L (theta_2)\
upright(\#) . med & upright(E) [Delta theta^2]_(t - 2) = rho upright(E) [Delta theta^2]_(t - 3) + (1 - rho) Delta theta_(t - 2)^2\
upright(\#) . med & upright(E) [nabla L (theta)^2]_t = rho upright(E) [nabla L (theta)^2]_(t - 1) + (1 - rho) nabla L (theta_t)^2\
upright(\#) . med & theta_t = theta_(t - 1) + Delta theta_(t - 1) , med Delta theta_(t - 1) = - frac(R M S [Delta theta]_(t - 2), R M S [nabla L (theta)]_(t - 1)) nabla L (theta_(t - 1)) $

== RMSprop(Root Mean Square Propagation)
<rmsproproot-mean-square-propagation>
Manually determine a weight $beta$.
$ theta_1 & arrow.l theta_0 - alpha / sigma_0 nabla L (theta_0) , quad sigma_0 = nabla L (theta_0) ,\
theta_2 & arrow.l theta_1 - alpha / sigma_2 nabla L (theta_1) , quad sigma_1 = sqrt(beta (sigma_0)^2 + (1 - beta) #scale(x: 120%, y: 120%)[\(] nabla L (theta_1) #scale(x: 120%, y: 120%)[\)]^2 + epsilon.alt) ,\
 & quad dots.v\
theta_(t + 1) & arrow.l theta_t - alpha / sigma_t nabla L (theta_t) , quad sigma_t = sqrt(beta (sigma_(t - 1))^2 + (1 - beta) #scale(x: 120%, y: 120%)[\(] nabla L (theta_t) #scale(x: 120%, y: 120%)[\)]^2 + epsilon.alt) $

== Adam(RMSprop+Momentum)
<adamrmspropmomentum>
Two weight numbers $beta_1$ and $beta_2$. Two moment vectors $v_k$ and
$sigma_k$. In the beginning $v_0 = 0$ and $sigma_0 = 0$.
$  & theta_1 = theta_0 - alpha frac(sigma_1, sqrt(v_1) + epsilon.alt) , quad sigma_1 = frac(beta_1 sigma_0 + (1 - beta_1) nabla L (theta_0), 1 - beta_1) , quad v_1 = frac(beta_2 v_0 + (1 - beta_2) #scale(x: 120%, y: 120%)[\(] nabla L (theta_0) #scale(x: 120%, y: 120%)[\)]^2, 1 - beta_2) ,\
 & theta_2 = theta_1 - alpha frac(sigma_2, sqrt(v_2) + epsilon.alt) , quad sigma_2 = frac(beta_1 sigma_1 + (1 - beta_1) nabla L (theta_1), 1 - beta_1^2) , quad v_2 = frac(beta_2 v_1 + (1 - beta_2) #scale(x: 120%, y: 120%)[\(] nabla L (theta_1) #scale(x: 120%, y: 120%)[\)]^2, 1 - beta_2^2) ,\
 & #h(2em) dots.v\
 & theta_(t + 1) = theta_t - alpha frac(sigma_(t + 1), sqrt(v_(t + 1)) + epsilon.alt) , quad sigma_(t + 1) = frac(beta_1 sigma_t + (1 - beta_1) nabla L (theta_t), 1 - beta_1^t) , quad v_(t + 1) = frac(beta_2 v_t + (1 - beta_2) #scale(x: 120%, y: 120%)[\(] nabla L (theta_t) #scale(x: 120%, y: 120%)[\)]^2, 1 - beta_2^t) $
