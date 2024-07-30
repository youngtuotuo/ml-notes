= Backpropagation
<backpropagation>
== Notations
<notations>
Assume there are $M$ layers. The $k^(upright(t h))$ layer is denoted by
a vector $v^([k]) in bb(R)^(n_k)$. The weight matrix is denoted by
$W^([k]) in bb(R)^(n_k times n_(k - 1))$. The bias vector is denoted by
$b^([k]) in bb(R)^(n_k)$. The activation function between the
$k - 1^(upright(t h))$ layer and the $k^(upright(t h))$ layer is denoted
by $sigma_k : bb(R)^(n_k) arrow.r bb(R)^(n_k)$. To simplify the
computation, we let the activation function be sigmoid
$sigma (x) = frac(1, 1 + e^(- x))$, and note that

$ sigma (x) = vec(frac(1, 1 + e^(- x_1)), frac(1, 1 + e^(- x_2)), dots.v, frac(1, 1 + e^(- x_n))) , forall x = vec(x_1, x_2, dots.v, x_n) in bb(R)^n $

Let ${ (x_i , y_i) }_1^n$ be our training data, then the feed forward
process can be formalized as

$ v_i^([1]) & = x_i ,\
v_i^([2]) & = sigma (W^([1]) v_i^([1]) + b^([1])) ,\
v_i^([3]) & = sigma (W^([2]) v_i^([2]) + b^([2])) ,\
 & dots.v\
v_i^([k]) & = sigma (W^([k - 1]) v_i^([k - 1]) + b^([k - 1])) ,\
 & dots.v\
v_i^([M]) & = sigma (W^([M - 1]) v_i^([M - 1]) + b^([M - 1])) $

== Training
<training>
Let the last layer’s output $v_i^([M])$ be $hat(y)_i$. Let’s use L2-norm
as our loss function, for single data, we have

$ L (hat(y)_i , y_i) = 1 / 2 parallel hat(y)_i - y_i parallel_2^2 $

To train a network, we need to first sum the loss of all data,

$ cal(L) = sum_(i = 1)^n L (hat(y)_i , y_i) = sum_(i = 1)^n 1 / 2 parallel hat(y)_i - y_i parallel_2^2 $

The equation @forward_nn shows that the loss function @loss actually
depends on each weight matrix $W^([i])$, each bias vector $b^([i])$, and
each ground truth $y_i$, that is,

$ cal(L) (W^([1]) , W^([2]) , dots.h , W^([M - 1]) , b^([1]) , b^([2]) , dots.h , b^([M - 1]) , y_1 , y_2 , dots.h , y_n) = sum_(i = 1)^n 1 / 2 parallel hat(y)_i - y_i parallel_2^2 $

We can ignore each $y_i$ here since it’s a constant during the
computation, so

$ cal(L) (W^([1]) , W^([2]) , dots.h , W^([M - 1]) , b^([1]) , b^([2]) , dots.h , b^([M - 1])) = sum_(i = 1)^n 1 / 2 parallel hat(y)_i - y_i parallel_2^2 $

Now our goal is finding each $W^([k])$ and $b^([k])$ to let each
$hat(y)_i$ be closer to $y_i$ by minimizing $cal(L)$. The process of
minimizing the loss function is called #emph[training];, not being
specific to back propagation.

Let’s simplify our notation. Let
$theta = (W^([1]) , dots.h.c , W^([M - 1]) , b^([1]) , dots.h.c , b^([M - 1]))$,
then $theta in bb(R)^D$, where
$ D = sum_(k = 1)^(M - 1) n_k times n_(k + 1) + sum_(k = 1)^(M - 1) n_k $
Then the training problem becomes like this
$ "arg min"_theta sum_(i = 1)^n 1 / 2 parallel hat(y)_i - y_i parallel_2^2 = "arg min"_theta cal(L) (theta) , upright(w h e r e med) cal(L) : bb(R)^D arrow.r bb(R) $

== Main Computations
<main-computations>
To compute $nabla L (theta)$. Let
$z^([k]) = W^([k]) a^([k - 1]) + b^([k])$ then
$a^([k]) = sigma (z^([k]))$. Let $j$ be the index represents neurons of
each layer. The notation becomes
$  & z_j^([k]) = (W^([k]) a^([k - 1]) + b^([k]))_j = (W^([k]) a^([k - 1]))_j + b_j^([k]) ,\
 & a_j^([k]) = sigma (z^([k]))_j ,\
 & k = 2 , dots.h , M , quad j = 1 , dots.h , n_k $ The core concept of
back propagation is using deep level derivatives to compute shallow
level derivative. This can be achieved with the help of chain rule.
First we derive the derivative of $z_j^([k])$(the $j^(upright(t h))$
neuron of the $k^(upright(t h))$ layer).
$  & frac(partial L (theta), partial z_j^([M])) = frac(partial L (theta), partial a_j^([M])) frac(partial a_j^([M]), partial z_j^([M])) = frac(partial L (theta), partial a_j^([M])) sigma prime (z_j^([M])) = (a_j^([M]) - y_j) sigma prime (z_j^([M])) = (a_j^([M]) - y_j) a_j^([M]) (1 - a_j^([M])) ,\
 & frac(partial L (theta), partial z_j^([M - 1])) = frac(partial, partial z_j^([M - 1])) 1 / 2 sum_(k = 1)^(n_M) #scale(x: 180%, y: 180%)[\(] y_k - sigma #scale(x: 120%, y: 120%)[\(] W^([M]) sigma (z^([M - 1])) + b^([M]) #scale(x: 120%, y: 120%)[\)]_k #scale(x: 180%, y: 180%)[\)]^2\
 & #hide[frac(partial L (theta), partial z_j^([M - 1]))] = nabla_(z^([M])) L (theta) dot.op frac(partial z^([M]), partial z_j^([M - 1]))\
 & #hide[frac(partial L (theta), partial z_j^([M - 1]))] = sum_(m = 1)^(n_M) frac(partial L (theta), partial z_m^([M])) frac(partial z_m^([M]), partial z_j^([M - 1]))\
 & #hide[frac(partial L (theta), partial z_j^([M - 1]))] = sum_(m = 1)^(n_M) frac(partial L (theta), partial z_m^([M])) (frac(partial, partial z_j^([M - 1])) sum_(s = 1)^(n_(M - 1)) w_(m s)^([M]) sigma (z_s^([M - 1])) + b_m^([M]))\
 & #hide[frac(partial L (theta), partial z_j^([M - 1]))] = sum_(m = 1)^(n_M) frac(partial L (theta), partial z_m^([M])) w_(m j)^([M]) sigma prime (z_j^([M - 1]))\
 & #hide[frac(partial L (theta), partial z_j^([M - 1]))] = sigma prime (z_j^([M - 1])) ((W^([M]))^T frac(partial L (theta), partial z^([M])))_j\
 & #hide[frac(partial L (theta), partial z_j^([M - 1]))] = ((W^([M]))^T frac(partial L (theta), partial z^([M])))_j a_j^([M - 1]) (1 - a_j^([M - 1])) ,\
 & #h(2em) #h(2em) #h(2em) dots.v\
 & frac(partial L (theta), partial z_j^([1])) = ((W^([2]))^T frac(partial L (theta), partial z^([2])))_j a_j^([1]) (1 - a_j^([1])) $
From above we can see that we #emph[back propagate] the derivative since
we need $partial z^([M])$ to yield $partial z_j^([M - 1])$. The partial
derivative of $z_j^([k])$ can help us get the gradient w.r.t weight and
bias.
$  & frac(partial L (theta), partial b_j^([k])) = frac(partial L (theta), partial z_j^([k])) frac(partial z_j^([k]), partial b_j^([k])) = frac(partial L (theta), partial z_j^([k])) ,\
 & frac(partial L (theta), partial w_(j s)^([k])) = frac(partial L (theta), partial z_j^([k])) frac(partial z_j^([k]), partial w_(j s)^([k])) = frac(partial L (theta), partial z_j^([k])) a_s^([k]) $
And hence we can back propagate each $partial b_j^([k])$ and
$partial w_(j s)^([k])$.

For the case with multiple training instances $(x_i , y_i)$,
$i = 1 , dots.h , N$. The loss function becomes
$ L (theta) = 1 / N sum_(i = 1)^N 1 / 2 parallel y_i - a_i^(\[ [M]) parallel_2^2 $
The computation are all the same but the notation will become a little
bit complicated.
