#heading(level: 1, numbering: none)[Batch Normalization,
#link("https://arxiv.org/abs/1502.03167");]
<batch-normalization-httpsarxiv.orgabs1502.03167>
#heading(level: 2, numbering: none)[Target]
<target>
Reduce the #emph[internal covariate shift];.

#emph[Covariate shift];: The input distribution to a learning system
changes.

#emph[Internal covariate shift];: In the course of training, the change
in the distributions of internal nodes of a deep network.

#heading(level: 2, numbering: none)[Training Time]
<training-time>
Let ${ f_1 , f_2 , f_3 , dots.h , f_n }$ be the batched feature vector
of some layer (a.k.a. that layer’s output, either pre-activation or
post-activation). Let’s say each $f_i in bb(R)^d$. The Batch
Normalization first computes

$  & mu = 1 / n sum_(i = 1)^n f_i\
 & sigma = sqrt(frac(sum_(i = 1)^n (f_i - mu)^2, n))\
 & tilde(f)_i = frac(f_i - mu, sigma) , med mu , sigma in bb(R)^d $

second, computes the affine transform

$ hat(f)_i = gamma dot.op tilde(f)_i + beta $

where all arithmetic are element-wise, and $gamma , beta in bb(R)$ are
learnable.

We’ll use each $hat(f)_i$ as next layer’s input. Each new batch features
${ hat(f)_i }_(i = 1)^n$ has mean $upright(bold(0)) in bb(R)$ and
standard deviation $upright(bold(1)) in bb(R)$.

Note that the batch normalization is computed independently for each
channel in CNN.

#heading(level: 2, numbering: none)[Testing Time]
<testing-time>
During the testing time, mostly we don’t have a bachted data. Hence no
on-line $mu , sigma$ to compute. Instead, we use the training data to
help us get them.

For each $i$-th batch, we have $mu_i , sigma_i$. We can then use the
Exponential Moving Average to compute the $mu^(‾) , sigma^(‾)$ for
testing

$  & mu^(‾) = alpha mu^(‾) + (1 - alpha) mu_i\
 & sigma^(‾) = alpha sigma^(‾) + (1 - alpha) sigma_i $

where $alpha in [0 , 1]$ is a pre-defined hyper parameter and
$mu^(‾) , sigma^(‾)$ are both initialized to $upright(bold(0))$. In
pytorch, $alpha$ is called #emph[momentum] and the default value is
$0.1$.

We use

$ hat(f) = frac(f - mu^(‾), sigma^(‾)) dot.op gamma + beta $

as the testing time batch normalization.

#heading(level: 1, numbering: none)[Layer Normalization,
#link("https://arxiv.org/abs/1607.06450");]
<layer-normalization-httpsarxiv.orgabs1607.06450>
#heading(level: 1, numbering: none)[Instance Normalization,
#link("https://arxiv.org/abs/1607.08022");]
<instance-normalization-httpsarxiv.orgabs1607.08022>
#heading(level: 1, numbering: none)[Group Normalization,
#link("https://arxiv.org/abs/1803.08494");]
<group-normalization-httpsarxiv.orgabs1803.08494>
#heading(level: 1, numbering: none)[Weight Normalization,
#link("https://arxiv.org/abs/1602.07868");]
<weight-normalization-httpsarxiv.orgabs1602.07868>
#heading(level: 1, numbering: none)[Weight Normalization,
#link("https://arxiv.org/abs/1705.10941");]
<weight-normalization-httpsarxiv.orgabs1705.10941>
