= Simple Regression Model
<simple-regression-model>
== Linear
<linear>
=== One Dimension
<one-dimension>
Each instance has one attribute $x$ corresponds to one label $y$.
$ y = w x + b , quad y , med x , med w , med b in bb(R) $

=== Multiple Dimensions
<multiple-dimensions>
Each instance has multiple attributes $x_1 , dots.h , x_n$ and multiple
labels $y_1 , dots.h , y_m$.
$  & #h(2em) bold(y) = bold(w x) + bold(b) ,\
 & #h(2em) bold(x) in bb(R)^n ,\
 & #h(2em) bold(w) in bb(R)^(m times n) ,\
 & #h(2em) bold(y) , med bold(b) in bb(R)^m ,\
vec(y_1, dots.v, y_m) = & mat(delim: "(", w_11, dots.h, w_(1_n); dots.v, dots.down, dots.v; w_(m 1), dots.h, w_(m n)) vec(x_1, dots.v, x_n) + vec(b_1, dots.v, b_m) $

== Nonlinear(Polynomial Model)
<nonlinearpolynomial-model>
=== One Dimension
<one-dimension-1>
Each instance has one attribute $x$ correponds to one label $y$.
$ y & = w_2 x^2 + w_1 x + b ,\
 & quad dots.v\
y & = w_k x^k + w_(k - 1) x^(k - 1) + dots.h.c + w_1 x + b $

=== Multiple Dimensions
<multiple-dimensions-1>
Each instance has multiple attributes $x_1 , dots.h , x_n$ and multiple
labels $y_1 , dots.h , y_m$.
$ bold(y) & = bold(w)_2 bold(x)^2 + bold(w)_1 bold(x) + bold(b) ,\
 & quad dots.v\
bold(y) & = bold(w)_k bold(x)^k + bold(w)_(k - 1) bold(x)^(k - 1) + dots.h + bold(w)_1 bold(x) + bold(b) $
where
$ bold(x)^p = vec(x_1^p, dots.v, x_n^p) , med bold(w)_p in bb(R)^(m times n) , med bold(y) , bold(b) in bb(R)^m $

= Logistic Regression
<logistic-regression>
Put the function of linear regression into sigmoid function, the output
value will lie in $(0 , 1)$.
$ f_(w , b) (x) = sigma (w dot.op x + b) = sigma (sum_i w_i x_i + b) $
In the training set ${ (x_k , hat(y)_k) }_k$, $hat(y)_k in { 0 , 1 }$.
$1$ for class $C_1$, $0$ for class $C_2$. If
$(x_1 , x_2 , x_3 , dots.h)$ corresponds to $(1 , 1 , 0 , dots.h)$. The
loss function
$ L (w , b) = f_(w , b) (x_1) f_(w , b) (x_2) #scale(x: 120%, y: 120%)[\(] 1 - f_(w , b) (x_3) #scale(x: 120%, y: 120%)[\)] dots.h , quad w^(\*) , b^(\*) = "arg max"_(w , b) L (w , b) $
Note that $ w^(\*) , b^(\*) = "arg min" - ln L (w , b) $ And
$ - ln L (w , b) & = - ln f_(w , b) (x_1) - ln f_(w , b) (x_2) - ln (1 - f_(w , b) (x_3)) dots.h\
 & = sum_k - [hat(y)_k ln f_(w , b) (x_k) + (1 - hat(y)_k) ln #scale(x: 120%, y: 120%)[\(] 1 - f_(w , b) (x_k) #scale(x: 120%, y: 120%)[\)]] $
The relation in the brackets $[med]$ is called the cross entropy between
two Bernoulli distribution.

== Comparison with Linear Regression
<comparison-with-linear-regression>
Simple computation shows that
$ frac(partial - ln L (w , b), partial w_i) = sum_k - #scale(x: 120%, y: 120%)[\(] hat(y)_k - f_(w , b) (x_k) #scale(x: 120%, y: 120%)[\)] x_(k , i) $
So $w_i$ will update in the same way with linear regression. The only
difference between them is the range of output. Logistic regression lies
in $(0 , 1)$ while linear regression can be any real number.
