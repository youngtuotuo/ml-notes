= K-means clustering
<k-means-clustering>
Given $N$ data points ${ x_n }_(n = 1)^N subset bb(R)^D$. Initialize $K$
prototype vectors ${ mu_k }_(k = 1)^K$. Each $mu_k$ corresponds to the
mean of the $k^(upright(t h))$ cluster. Let $r_(n k)$ be indicator
variable with respect to $x_n$ and $mu_k$.
$ r_(n k) = cases(delim: "{", 1 & upright(i f med) k = "arg min" parallel x_n - mu_k parallel^2, 0 & upright(o t h e r w i s e)) $
Then update $mu_k$, $ mu_k = frac(sum_n r_(n k) x_n, sum_n r_(n k)) $
Keep this procedure until
$ J = sum_(n = 1)^N sum_(k = 1)^K r_(n k) parallel x_n - mu_k parallel^2 $
converge.
