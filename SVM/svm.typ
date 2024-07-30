= Support Vector Machine
<support-vector-machine>
Suppose there are $N$ data points
$upright(bold(x))_1 , dots.h , upright(bold(x))_N$ and let
$t_1 , dots.h , t_N$ be their labels where $t_k in { - 1 , 1 }$ for all
$k$. We want to find suitable $phi.alt (upright(bold(x))_k)$, weight
$upright(bold(w))$ and bias $b$ that satisfies
$ upright(bold(w))^T phi.alt (upright(bold(x))_k) + b = {> 0 & upright(i f med) t_k = 1\
< 0 & upright(i f med) t_k = - 1 quad upright(f o r med a l l med) k $
This is a linear classifier in feature space. The distance of each data
point to this hyper plane is
$ frac(lr(|upright(bold(w))^T phi.alt (upright(bold(x))_k) + b|), parallel upright(bold(w)) parallel) $
According to #emph[statistical learning theory];(not actually
understand), we want to maximize the minimal distance
$ "arg max"_(upright(bold(w)) , b) {frac(1, parallel upright(bold(w)) parallel) min_k lr(|upright(bold(w))^T phi.alt (upright(bold(x))_k) + b|)} $
Since $t_k (upright(bold(w))^T phi.alt (upright(bold(x))_k) + b) > 0$
and $t_k in { - 1 , 1 }$, the problem is equivalent to
$ "arg max"_(upright(bold(w)) , b) {frac(1, parallel upright(bold(w)) parallel) min_k t_k (upright(bold(w))^T phi.alt (upright(bold(x))_k) + b)} $
Observe that any rescaling of $upright(bold(w))$ and $b$ won’t change
the ultimate value, hence we can set
$ t_k (upright(bold(w))^T phi.alt (upright(bold(x))_k) + b) = 1 $ for
those $upright(bold(x))_k$ that are closest to the hyper plane. Then
other points yield
$ t_k (upright(bold(w))^T phi.alt (upright(bold(x))_k) + b) gt.eq 1 $
Now we simplify the problem into
$ "arg max"_(upright(bold(w)) , b) frac(1, parallel upright(bold(w)) parallel) upright(quad s . t . quad) t_k (upright(bold(w))^T phi.alt (upright(bold(x))_k) + b) gt.eq 1 upright(med f o r med a l l med) k $
It’s equivalent to
$ "arg min"_(upright(bold(w)) , b) 1 / 2 parallel upright(bold(w)) parallel^2 upright(quad s . t . quad) t_k (upright(bold(w))^T phi.alt (upright(bold(x))_k) + b) gt.eq 1 upright(med f o r med a l l med) k $
And gives the Lagrangian function
$ cal(L) (upright(bold(w)) , b , upright(bold(a))) = 1 / 2 parallel upright(bold(w)) parallel^2 + sum_(k = 1)^N a_k #scale(x: 120%, y: 120%)[\[] 1 - t_k (upright(bold(w))^T phi.alt (upright(bold(x))_k) + b) #scale(x: 120%, y: 120%)[\]] $
where
$upright(bold(a)) = (a_1 , dots.h , a_N)^T gt.eq upright(bold(0))$. For
$ max_(upright(bold(a))) min_(upright(bold(w)) , b) cal(L) (upright(bold(w)) , b , upright(bold(a))) upright(quad s . t . quad) upright(bold(a)) gt.eq 0 $
let gradient vanish with respect to $upright(bold(w))$ and $b$
$  & nabla_(upright(bold(w))) cal(L) (upright(bold(w)) , b , upright(bold(a))) = upright(bold(w)) - sum_(k = 1)^N a_k t_k phi.alt (upright(bold(x))_k) = 0\
 & nabla_b cal(L) (upright(bold(w)) , b , upright(bold(a))) = sum_(k = 1)^N a_k t_k = 0 $
Substitute back then yield the dual form
$ max_(upright(bold(a))) sum_(k = 1)^N a_k - 1 / 2 sum_(k = 1)^N sum_(m = 1)^N a_k a_m t_k t_m phi.alt (upright(bold(x))_k)^T phi.alt (upright(bold(x))_m) $
subject to $ a_k gt.eq 0 , & quad k = 1 , dots.h , N\
sum_(k = 1)^N a_k t_k = 0 . &  $

Let
$k (upright(bold(x)) , upright(bold(x)) prime) = phi.alt (upright(bold(x)))^T phi.alt (upright(bold(x)) prime)$
stands for the kernel function and let
$y (upright(bold(x))) = upright(bold(w))^T phi.alt (upright(bold(x))) + b$.
When $upright(bold(w))$ is the solution,
$upright(bold(w)) = sum_k a_k t_k phi.alt (upright(bold(x))_k)$. Put
this into $y (upright(bold(x)))$ and have
$ y (upright(bold(x))) = sum_(k = 1)^N a_k t_k k (upright(bold(x))_k , upright(bold(x))) + b $
here we express the classifier in terms of ${ a_k }$ and the kernel
function $k (upright(bold(x)) , upright(bold(x)) prime)$.

== Apply KKT Condition
<apply-kkt-condition>
We have a primal problem
$ "arg min"_(upright(bold(w)) , b) 1 / 2 parallel upright(bold(w)) parallel^2 upright(quad s . t . quad) t_k y (upright(bold(x))_k) - 1 gt.eq 0 upright(med f o r med a l l med) k $
and a dual problem
$ max_(upright(bold(a))) sum_(k = 1)^N a_k - 1 / 2 sum_(k = 1)^N sum_(m = 1)^N a_k a_m t_k t_m k (upright(bold(x))_k , upright(bold(x))_m) upright(quad s . t . quad) a_k gt.eq 0 , med forall med k upright(med a n d med) sum_(k = 1)^N a_k t_k = 0 $
The KKT condition needs further constraint that
$ a_k { t_k y (upright(bold(x))_k) - 1 } = 0 $ This implies $a_k = 0$ or
$t_k y (upright(bold(x))_k) = 1$. Any data point has $a_k = 0$ will not
contribute to the classifier. The rest data points have
$t_k y (upright(bold(x))_k) = 1$ are called #emph[support vector];.This
tells us that we only need support vectors to predict new point though
we need whole data to train. Mathematically, choose one support vector
$upright(bold(x)) prime$, we can get $b$ by
$ t prime y (upright(bold(x)) prime) = t prime {sum_m a_m t_m k (upright(bold(x))_m , upright(bold(x)) prime) + b} = 1 $
where $m$ stands for the index of support vector. In practical, multiply
each side by one label $t_k$ of one support vector and have
$ b = t_k - {sum_m a_m t_m k (upright(bold(x))_m , upright(bold(x))_k)} upright(med f o r med a l l med) k $
Take the average of all possible $b$ as the final one
$ b = 1 / M sum_k (t_k - {sum_m a_m t_m k (upright(bold(x))_m , upright(bold(x))_k)}) $
where $M$ is the number of support vectors and $k$ and $m$ are both the
index of support vector.

= Soft Margin Support Vector Machine
<soft-margin-support-vector-machine>
The original SVM is
$ min_(upright(bold(w)) , b) 1 / 2 parallel upright(bold(w)) parallel^2 upright(quad s . t . quad) t_k y (upright(bold(x))_k) gt.eq 1 upright(med f o r med a l l med) k $
To allow some points can be misclassified, we introduce each point a
#emph[slack variable] $xi_k$ that is defined by
$ xi_k = {0 & upright(i f med) t_k y (upright(bold(x))_k) gt.eq 1\
lr(|t_k - y (upright(bold(x))_k)|) & upright(o t h e r w i s e) $ Look
deeper into this definition. If $0 < t_k y (upright(bold(x))_k) < 1$, we
have $0 < y (upright(bold(x))_k) < 1$ or
$- 1 < y (upright(bold(x))_k) < 0$. Hence
$0 < xi_k = 1 - t_k y (upright(bold(x))_k) < 1$. If
$t_k y (upright(bold(x))_k) = 0$,
$xi_k = 1 - t_k y (upright(bold(x))_k) = 1$. If
$t_k y (upright(bold(x))_k) < 0$,
$xi_k = 1 - t_k y (upright(bold(x))_k) > 1$. In summary
$ xi_k cases(delim: "{", = 0 & upright(i f med) t_k y (upright(bold(x))_k) in \[ 1 , oo \), = 1 - t_k y (upright(bold(x))_k) & cases(delim: "{", in (0 , 1) & upright(i f med) t_k y (upright(bold(x))_k) in (0 , 1), = 1 & upright(i f med) t_k y (upright(bold(x))_k) = 0, > 1 & upright(i f med) t_k y (upright(bold(x))_k) in (- oo , 0))) $

Replace the constrain with
$ t_k y (upright(bold(x))_k) gt.eq 1 - xi_k upright(med f o r med a l l med) k $
This is so called #emph[soft margin];.

When there exist outliers, they’ll have extremely large $xi_k$. To avoid
this, here comes the soft SVM that also minimize slack vairable
$ min_(upright(bold(w)) , b , upright(bold(xi))) C sum_(k = 1)^N xi_k + 1 / 2 parallel upright(bold(w)) parallel^2 upright(quad s . t . quad) t_k y (upright(bold(x))_k) gt.eq 1 - xi_k upright(med f o r med a l l med) k $
where $C$ is some constant. Briefly speaking, slack vairables relax some
points’ constarint, their $t_k y (upright(bold(x))_k)$ only needs to
larger than some value smaller than $1$. That’s why we call this
#emph[soft margin];.

== Apply KKT Condition
<apply-kkt-condition-1>
The Lagrangian of soft SVM is
$ cal(L) (upright(bold(w)) , b , xi , upright(bold(a)) , upright(bold(mu))) = 1 / 2 parallel upright(bold(w)) parallel^2 + C sum_(k = 1)^N xi_k - sum_(k = 1)^N a_k { t_k y (upright(bold(x))_k) - 1 + xi_k } - sum_(k = 1)^N mu_k xi_k $
where $a_k , mu_k gt.eq 0$ ,
$t_k y (upright(bold(x))_k) - 1 + xi_k gt.eq 0$ and note that slack
variables are non negative $xi_k gt.eq 0$. The KKT conditions are
$ upright(bold(D u a l med F e a s i b i l i t y med)) & a_k gt.eq 0 , & mu_k gt.eq 0\
upright(bold(P r i m a l med F e a s i b i l i t y med)) & t_k y (upright(bold(x))_k) - 1 + xi_k gt.eq 0 , & xi_k gt.eq 0\
upright(bold(C o m p l m e n t a r y med S l a c k n e s s med)) & a_k (t_k y (upright(bold(x))_k) - 1 + xi_k) = 0 , & mu_k xi_k = 0 $
Use
$y (upright(bold(x))) = upright(bold(w))^T phi.alt (upright(bold(x))) + b$
and compute gradients of $cal(L)$ with respect to $upright(bold(w))$,
$b$ and $xi$
$  & nabla_(upright(bold(w))) cal(L) = upright(bold(w)) - sum_(k = 1)^N a_k t_k phi.alt (upright(bold(x))_n) = 0\
 & nabla_b cal(L) = sum_(k = 1)^N a_k t_k = 0\
 & nabla_(xi_k) cal(L) = a_k - C - mu_k = 0 $ Substitute back and get
the dual form
$ max_(upright(bold(a))) sum_(k = 1)^N a_k - 1 / 2 sum_(k = 1)^N sum_(m = 1)^N a_k a_m t_k t_m k (x_k , x_m) upright(quad s . t . quad) 0 lt.eq a_k lt.eq C , med forall med k upright(med a n d med) sum_(k = 1)^N a_k t_k = 0 $
It’s the same as normal SVM, the only difference is the constraint of
$a_k$, which is known as the #emph[box constraint];.
