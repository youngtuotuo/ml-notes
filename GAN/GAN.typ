#heading(level: 1, numbering: none)[Goal]
<goal>
Say $X tilde.op P_(t r u e)$ but $P_(t r u e)$ unknown. Our goal is to
leverage $X$ to generate more samples like they are also generated from
$P_(t r u e)$.

In reality, $X$ can be tons of images, tons of text, tons of paragraph,
or tons of videos, etc.

#heading(level: 1, numbering: none)[Maximum Log Likelihood Approach]
<maximum-log-likelihood-approach>
If $P_(t r u e)$ can be paremetrized by a parameter set $theta$. We can
leverage the maximum likelihood to estimate the $theta$ that yields the
\"best fit\" probability to the given samples.

Suppose we have $N$ real samples
${ x_1 , dots.h , x_N } tilde.op P_(t r u e)$. Suppose they are i.i.d
from different Gaussians

$ f (x_i ; mu , sigma) = 1 / sqrt(2 pi sigma^2) e^(- frac((x_i - mu)^2, 2 sigma^2)) $

The log likelihood function is

$ L ({ x_i } ; mu , sigma) & = ln product_(i = 1)^N f (x_i ; mu , sigma)\
 & = sum_(i = 1)^N ln f (x_i ; mu , sigma) $

Solve

$  & max_(mu , sigma) sum_(i = 1)^N ln f (x_i ; mu , sigma)\
= & max_(mu , sigma) sum_(i = 1)^N - frac((x_i - mu)^2, 2 sigma^2) - ln sqrt(2 pi sigma^2) $

is the classical approach. However, there’s no efficient and simple
probability model for larger dimensions.

#heading(level: 1, numbering: none)[GAN]
<gan>
Min-Max Problem

$ min_G max_D E_(x tilde.op P_(t r u e)) [ln D (x)] + E_(z tilde.op P (z)) [1 - ln D (G (z))] $

$x tilde.op P_(t r u e)$ and $z tilde.op P (z)$ implies Monte-Carlo

$  & E [ln D (X)] = 1 / N sum_(i = 1)^N ln D (x_i)\
 & E [1 - ln D (G (Z))] = 1 / N sum_(i = 1)^M ln D (G (z_i)) $

#heading(level: 1, numbering: none)[WGAN]
<wgan>
For $G$ fixed, the optimal $D$ is

$ D_G (x) = frac(P_(t r u e) (x), P_(t r u e) (x) + P_G (x)) $

KL divergence

$ K L (p parallel q) = sum_i p_i frac(ln p_i, q_i) = E_p [ln p / q] $

Jensen–Shannon divergence

$  & J S D (p , q) = 1 / 2 K L (p parallel m) + 1 / 2 K L (q parallel m) ,\
 & m = 1 / 2 (p + q) $

Let $p , q$ be $P_(t r u e) , P_G$,

$ min_G J S D (P_(t r u e) , P_G) $

Earth-Mover distance / Wasserstein-1 distance

$  & W S (P_(t r u e) , P_G) = sup_(parallel D parallel_L lt.eq 1) { E_(x tilde.op P_(t r u e)) [D (x)] - E_(y tilde.op P_G) [D (y)] } $

where $D$ is 1-Lipschitz continuous, i.e.

$ parallel D (x) - D (y) parallel lt.eq parallel x - y parallel $
