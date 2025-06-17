= Practice
$
  "Solve" y' + p(x)y = q(x)
$

= Sol

Consider
$ H(x) = integral p(x) d x $

Multiply $e^(H(x))$ to both sides

$
  e^(H(x))y' + e^(H(x))p(x)y = e^(H(x))q(x)
$

This gives
$
  d / (d x) lr([e^(H(x))y]) = e^(H(x))q(x)
$

Integration gives

$
  e^(H(x))y = integral e^(H(x))q(x) d x + C
$
and yields
$
  y(x) = e^(-H(x))lr([integral e^(H(x))q(x) d x + C]).
$

Note that $e^(H(x))$ is called the _integrating factor_.

#align(right)[$qed$]

