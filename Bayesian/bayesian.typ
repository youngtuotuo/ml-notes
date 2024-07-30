= Probabilistic Generative Model
<probabilistic-generative-model>
$P (A \| B) = frac(P (A sect B), P (B)) = frac(P (A , B), P (B))$: the
probability of $A$ given $B$. By definition,
$ P (A \| B) frac(P (B), P (A)) = frac(P (A , B), P (A)) = P (B \| A) $
There are two classes $C_1$, $C_2$. The probability of $x$ is
$ P (x) = P (x \| C_1) P (C_1) + P (x \| C_2) P (C_2) $ The posterior
probability
$ P (C_1 \| x) = frac(P (x \| C_1) P (C_1), P (x)) = frac(P (x \| C_1) P (C_1), P (x \| C_1) P (C_1) + P (x \| C_2) P (C_2)) $
