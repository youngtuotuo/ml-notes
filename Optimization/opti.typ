= Optimization
<optimization>
== Hessian Matrix
<hessian-matrix>
Let $f : bb(R)^n arrow.r bb(R)$ be a twice differentiable function, its
Hessian matrix at $x in bb(R)^n$ is defined as
$ nabla^2 f (x) = mat(delim: "(", frac(partial^2 f, partial x_1^2), frac(partial^2 f, partial x_1 x_2), frac(partial^2 f f, partial x_1 x_3), dots.h.c, frac(partial^2 f, partial x_1 x_n); frac(partial^2 f, partial x_2 x_1), frac(partial^2 f, partial x_2^2), frac(partial^2 f, partial x_2 x_3), dots.h.c, frac(partial^2 f, partial x_2 x_n); dots.v, dots.v, dots.v, dots.down, dots.v; frac(partial^2 f, partial x_n x_1), frac(partial^2 f, partial x_n x_2), frac(partial^2 f, partial x_n x_3), dots.h.c, frac(partial^2 f, partial x_n^2)) in bb(R)^(n times n) $

=== Quadratic Function
<quadratic-function>
Let $f : bb(R)^n arrow.r bb(R)$ and $f (x) = 1 / 2 x^T H x + p^T x$
where $H in bb(R)^(n times n)$ is a symmetric matrix and $p in bb(R)^n$.
Then $ nabla f (x) & = H x + p\
nabla^2 f (x) & = H $ If $H$ is positive definite, then
$x^(\*) = - H^(- 1) p$ is a unique solution.

=== Least-Square Problem
<least-square-problem>
$ min_(x in bb(R)^n) parallel A x - b parallel_2^2 , med A in bb(R)^(m times n) , med b in bb(R)^m $
$ f (x) & = (A x - b) (A x - b)^T\
 & = x^T A^T A x - 2 b^T A x + b^T b\
nabla f (x) & = 2 A^T A x - 2 A^T b\
nabla^2 f (x) & = 2 A^T A\
x^(\*) & = (A^T A)^(- 1) A^T b $

=== Newton’s Method
<newtons-method>
Compute $d^i$ satisfies $ nabla^2 f (x^i) d^i = - nabla f (x^i) $ Update
$ x^(i + 1) = x^i + d^i $ Until $nabla f (x^i) = 0$.

== Lagrangian Function
<lagrangian-function>
For the problem $  & min_(x in Omega) f (x)\
 & s . t . quad g_i (x) lt.eq 0 , med h_i (x) = 0 , med forall med i = 1 , dots.h , m $
Write $g (x) = (g_1 (x) , dots.h , g_m (x))^T$ and
$h (x) = (h_1 (x) , dots.h , h_m (x))^T$. Let
$ cal(L) (x , alpha , beta) = f (x) + alpha^T g (x) + beta^T h (x) upright(med a n d med) alpha in bb(R)^m gt.eq 0 $
For a fixed $alpha gt.eq 0$ and a fixed $beta$, if
\$\\Bar{x}\\in\\mathop{\\mathrm{arg\~min}}\\{\\mathcal{L}(x,\\alpha,\\beta)|x\\in\\mathbb{R}^n\\}\$
then
\$\$\\left.\\frac{\\partial\\mathcal{L}(x,\\alpha,\\beta)}{\\partial x}\\right|\_{x=\\Bar{x}}=\\nabla f(\\Bar{x}) + \\alpha^T\\nabla g(\\Bar{x})+\\beta^T\\nabla h(\\Bar{x})=0\$\$

=== Duality
<duality>
Consider
$ max_(alpha , beta) min_(x in Omega) cal(L) (x , alpha , beta) upright(med s . t . med) alpha gt.eq 0 $
Let $theta (alpha , beta) = inf_(x in Omega) cal(L) (x , alpha , beta)$.
Then
$ max_(alpha , beta) theta (alpha , beta) upright(med s . t . med) alpha gt.eq 0 $
For any \$\\Bar{x}\\in\\Omega\$ and
\$(\\Bar{\\alpha}\\geq0,\\Bar{\\beta})\$ be solutions of the above
problems, respectively, since \$\\Bar{\\alpha}^T g(\\Bar{x})\\leq 0\$
and \$h(\\Bar{x})=0\$, we have
\$f(\\Bar{x})\\geq \\theta(\\Bar{\\alpha},\\Bar{\\beta})\$.

#block[
#strong[Theorem 1];. #emph[If the equality happens, the \$\\Bar{x}\$ and
\$(\\Bar{\\alpha}\\geq 0, \\Bar{\\beta})\$ solve the primal and dual
problem, respectively. In this case,
\$\$\\mathbf{0}\\leq \\Bar{\\alpha} \\perp g(x)\\leq\\mathbf{0}\$\$
Furthermore, for these \$\\Bar{x}\$ and
\$(\\Bar{\\alpha}, \\Bar{\\beta})\$, \$\$\\begin{aligned}
                        f(\\Bar{x}) &= \\theta(\\Bar{\\alpha},\\Bar{\\beta})\\\\
                                   &= \\inf\_{x \\in \\Omega}\\{f(x) + \\Bar{\\alpha}^T g(x) + \\Bar{\\beta}^T h(x)\\}\\\\
                                   &\\leq f(\\Bar{x}) + \\Bar{\\alpha}^T g(\\Bar{x}) + \\Bar{\\beta}^T h(\\Bar{x})\\\\
                                   &= f(\\Bar{x}) + \\Bar{\\alpha}^T g(\\Bar{x})\\\\
                                   &\\leq f(\\Bar{x})
                    
\\end{aligned}\$\$ This implies that
\$\$\\Bar{\\alpha}^T g(\\Bar{x}) = 0\$\$]

]
=== Karush-Kuhn-Tucker Condition(KKT Condition)
<karush-kuhn-tucker-conditionkkt-condition>
This is a summary of solve both primal form and dual form. Find
\$\\Bar{x}\\in\\Omega\$,
\$\\Bar{\\alpha},\\Bar{\\beta}\\in\\mathbb{R}^m\$ such that
\$\$\\begin{aligned}
                    \\mathbf{Stationarity \\quad} & \\nabla f(\\Bar{x}) + \\Bar{\\alpha}^T\\nabla g(\\Bar{x}) + \\Bar{\\beta}^T\\nabla h(\\Bar{x})=0\\\\
                    \\mathbf{Complmentary\~Slackness \\quad} & \\Bar{\\alpha}^T g(\\Bar{x})=0\\\\
                    \\mathbf{Primal\~Feasibility \\quad} & h(\\Bar{x})=0,\~g(\\Bar{x})\\leq 0\\\\
                    \\mathbf{Dual\~Feasibility \\quad} & \\Bar{\\alpha}\\geq 0
                
\\end{aligned}\$\$

=== Dual Linear Problem
<dual-linear-problem>
For the primal linear problem
$ min_(x in bb(R)^n) p^T x upright(quad s . t . quad) A x gt.eq b , med x gt.eq 0 $
Consider
$ max_(alpha_1 , alpha_2 gt.eq upright(bold(0))) min_(x in bb(R)^n) cal(L) (x , alpha , beta) = p^T x + alpha_1^T (b - A x) + alpha_2^T (- x) $
When
\$\\Bar{x}\\in\\mathrm{arg\~min}\\{\\mathcal{L}(x,\\alpha,\\beta)|x\\in\\Omega\\}\$,
the gradient \$\\nabla\\mathcal{L}(\\Bar{x},\\alpha,\\beta)\$ vanish
$ p - A^T alpha_1 - alpha_2 = 0 $ Then we have the dual problem
$ max_(alpha_1 , alpha_2 gt.eq upright(bold(0))) b^T alpha_1 upright(quad s . t . quad) p - A^T alpha_1 - alpha_2 = 0 $
Since $alpha_2$ is a slack variable, it’s equivalent to
$ max b^T alpha upright(quad s . t . quad) A^T alpha lt.eq p , med alpha gt.eq 0 $

=== Least Square Problem
<least-square-problem-1>
For $min_(x in bb(R)^n) parallel A x - b parallel_2^2$ where
$A in bb(R)^(m times n)$ and $b in bb(R)^m$. It’s obvious that
$ x^(\*) in #scale(x: 120%, y: 120%)[{] "arg min" { parallel A x - b parallel_2^2 #scale(x: 120%, y: 120%)[}] arrow.r.double A^T A x = A^T b $
Consider the problem
$ min upright(bold(0))^T x upright(quad s . t . quad) A^T A x = A^T b $
Then for
$ max_alpha min upright(bold(0))^T x + alpha^T (A^T b - A^T A x) upright(quad s . t . quad) alpha in bb(R)^m $
and the dual problem
$ max_alpha b^T A alpha upright(quad s . t . quad) (A^T A)^T alpha = upright(bold(0)) $
The constraint has a trivial solution $alpha = upright(bold(0))$ and the
objective function has value $0$. The objective function of the primal
problem and the dual problem have the same value. This implies that
$A^T A x = A^T b$ must have a solution. Otherwise the dual problem won’t
have optimal solution.

=== Quadratic Problem
<quadratic-problem>
The primal problem
$ min_(x in bb(R)^n) 1 / 2 x^T Q x + p^T x upright(quad s . t . quad) A x lt.eq b $
For
$ max_(alpha gt.eq 0) min_(x in bb(R)^n) 1 / 2 x^T Q x + p^T x + alpha^T (A x - b) upright(quad s . t . quad) alpha gt.eq 0 $
the gradient needs vanishing
$ Q x + p + A^T alpha = 0 arrow.r.double x = - Q^(- 1) (A^T alpha + p) $
Substitute back and we have the dual form
$ max - 1 / 2 (p^T + alpha^T A) Q^(- 1) (A^T alpha + p) - alpha^T b upright(quad s . t . quad) alpha gt.eq upright(bold(0)) $
