= Mixture of Gaussian(Soft Clustering)
<mixture-of-gaussiansoft-clustering>
Give probabilities that an instance belongs to each cluster instead of
assigning only one. Let $g (x ; m , sigma)$ be the probability of a
point $x$ based on a Gaussian Distribution with mean $m$ and variance
$sigma$. Suppose there is a distribution generated by randomly selecting
one of $K$ Gaussians. We randomly draw a point from this distribution.
Let $p_k$ be the probability of choosing the $k^(upright(t h))$
Gaussian. Then $ p (x) = sum_(k = 1)^K p_k g (x ; m_k , sigma_k) $ Now
we want to find $p_k$, $sigma_k$ and $m_k$ that maximize $p (x)$. \
E step: compute the probability that point $x_n$ is generated by
distribution $k$, $i$ stands for steps
$ p^((i)) (k \| x_n) = frac(p_k^((i)) g (x_n ; m_k^((i)) , sigma_k^((i))), sum_(j = 1)^K p_j^((i)) g (x_n ; m_j^((i)) , sigma_j^((i)))) $
M step: update $p_k$, $sigma_k$ and $m_k$.
$  & m_k^((i + 1)) = frac(sum_(n = 1)^N p^((i)) (k \| x_n) x_n, sum_(n = 1)^N p^((i)) (k \| x_n))\
 & sigma_k^((i + 1)) = sqrt(frac(sum_(n = 1)^N p^((i)) (k \| x_n) parallel x_n - n_k^((i + 1)) parallel^2, sum_(n = 1)^N p^((i)) (k \| x_n)))\
 & p_k^((i + 1)) = 1 / N sum_(n = 1)^N p^((i)) (k \| x_n) $