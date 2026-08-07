#import "../theorems/thm1.typ": theorem
#import "../theorems/thm1.typ": callout

#let accent = rgb("#1f4e79")
#let warn = rgb("#8c2f0d")

= Gaussian Processes
Gaussian processes can be seen as an infinite-dimensional generalization of multivariate normal distributions. That is, a multivariate normal draws a vector ($f_1, dots.c, f_n$). It has $n$ coordinates because its index set is ${1,2,dots.c, n}$. A Gaussian process, on the other hand, draws a function $f$. Its "coordinates" are the values $f(x)$, one for each $x$ in the input space --- and if that space is $bb(R)$ or $[0,1]$, there are uncountably many of them. Then the function is the infinitely long vector. Formally,

#theorem(title: "Definition")[
    Let $Y_1, Y_2, dots.c, Y_T$ be a sequence of random variables such that $Y_t in bold(upright(Y))$ , then the sequence is a _Gaussian process_ (GP) if and only if $bold(upright(Y)) attach(tilde.op, t: "iid") cal(N)(bold(mu), bold(Sigma))$.
]

== Estimation
A Gaussian process is fully specified by a mean function $m(dot.c)$ and a covariance (kernel) function $k(dot.c, dot.c)$. The mean is usually taken to be zero, so the modeling burden falls on the kernel, which is chosen from a parametric family whose hyperparameters are estimated from data, typically by maximizing the marginal likelihood. The kernel encodes assumptions about the function --- smoothness, periodicity, scale --- and determines how strongly function values at two inputs covary. Common choices include the squared exponential (RBF), Matérn, periodic, and linear kernels, which can be combined by addition and multiplication.

== The condition

A function $k: cal(X) times cal(X) -> RR$ is a valid covariance function if and only if
it is *symmetric* and *positive semi-definite* (PSD): for every finite set of inputs
$x_1, dots, x_n$ and every vector $c in RR^n$,

$ sum_(i=1)^n sum_(j=1)^n c_i c_j thin k(x_i, x_j) >= 0, $

that is, every Gram matrix $K$ with $K_(i j) = k(x_i, x_j)$ is PSD.

The reason is immediate once one writes out what it means. For a GP $f$ with kernel $k$,
the scalar $sum_i c_i f(x_i)$ is a Gaussian random variable with

$ op("Var") (sum_i c_i f(x_i)) = c^top K c. $

If $k$ were not PSD, one would have a random variable with negative variance.


#callout[The condition is not a technicality][
  Positive semi-definiteness is not a constraint layered on top of the definition ---
  it #emph[is] the statement that $k$ describes a covariance. Together with symmetry it
  is also precisely what the Kolmogorov extension theorem requires in order to guarantee
  that a stochastic process with those finite-dimensional marginals actually exists.
]

A remark on semi- versus strictly definite: PSD suffices for the GP to exist, but with
only semi-definiteness the matrix $K$ may be singular, which breaks noise-free
inference. In practice the observation-noise term $sigma_n^2 I$, or a small jitter term,
resolves this.

=== Three ways to guarantee it

Checking the inequality directly for all $n$ and all $c$ is hopeless. Kernels are
therefore almost never designed by writing down a formula and then verifying it --- they
are designed #emph[by construction], via one of the following routes.

==== Feature maps

If $k$ can be written as

$ k(x, x') = lr(chevron.l phi(x), phi(x') chevron.r)_cal(H) $

for #emph[any] map $phi$ into #emph[any] inner product space, then $k$ is automatically
PSD, since

$ c^top K c = norm(sum_i c_i phi(x_i))^2 >= 0. $

The Moore--Aronszajn theorem gives the converse: every PSD kernel arises this way, with
a canonical reproducing kernel Hilbert space attached. So "valid kernel" and "inner
product of features" are the same thing, and inventing a feature map is a licence to
invent a kernel. The linear kernel is $phi(x) = x$; polynomial kernels use monomial
features; the RBF kernel corresponds to an infinite-dimensional $phi$.

==== Mercer's theorem

On a compact domain, $k(x, x') = sum_i lambda_i psi_i (x) psi_i (x')$ with all
$lambda_i >= 0$. The same idea in spectral clothing.

==== Bochner's theorem

This is the workhorse for stationary kernels. A continuous stationary kernel $k(tau)$,
with $tau = x - x'$, is PSD *if and only if* it is the Fourier transform of a finite
non-negative measure:

$ k(tau) = integral e^(2 pi i thin omega^top tau) thin upright(d) S(omega). $

This flips the design problem into something easy: pick #emph[any] non-negative,
integrable spectral density $S(omega)$, transform it, and a valid kernel comes out for
free. It also explains what the kernel #emph[means] --- $S$ is the power spectrum of the
sample paths, so the decay of its tails controls smoothness.

#block(inset: (left: 0.6em))[
  - *RBF* #sym.arrow.l Gaussian spectral density. Rapid tail decay, hence infinitely
    differentiable sample paths --- often unrealistically smooth.
  - *Matérn-$nu$* #sym.arrow.l Student-$t$-shaped density, tails
    $prop (c + omega^2)^(-(nu + d slash 2))$. Heavier tails, hence only
    $ceil(nu) - 1$ derivatives.
  - *Spectral mixture* #sym.arrow.l a Gaussian mixture in $omega$ (Wilson & Adams,
    2013), which is dense in the space of spectral densities and can therefore
    approximate any stationary kernel.
]

=== The kernel algebra

Given valid kernels $k_1$ and $k_2$, the following are valid:

#block(inset: (left: 0.6em))[
  - $k_1 + k_2$, and $alpha k_1$ for $alpha > 0$
  - $k_1 dot k_2$ (Schur product theorem)
  - $f(x) thin k_1 (x, x') thin f(x')$ for any function $f$
  - $k_1 (g(x), g(x'))$ for any mapping $g$
  - $exp(k_1)$, and $p(k_1)$ for any polynomial $p$ with non-negative coefficients
  - pointwise limits and integrals of families of kernels
  - sums and products across input dimensions --- this is what ARD and additive GPs
    exploit
]

#callout(tone: warn)[Not valid in general][
  $k_1 - k_2$, $quad k_1 slash k_2$, $quad$ and $h(k_1)$ for arbitrary $h$.
]

These rules are how modelling assumptions get encoded compositionally. The periodic
kernel is the clean example: map the input onto a circle,
$u(x) = (cos x, sin x)$, then apply the RBF kernel to $u$. Expanding
$norm(u(x) - u(x'))^2$ gives

$ k(x, x') = exp(- (2 sin^2 (pi (x - x') slash p)) / ell^2), $

which is valid by the composition rule, with no separate proof required. Likewise,
"smooth long-term trend plus periodic seasonality plus short-scale noise" becomes a sum,
and deep kernel learning is simply the case where $g$ is a neural network. Duvenaud's
automatic statistician work builds an entire grammar of models out of these operations.

=== When it fails

Plausible-looking formulas do break:

#block(inset: (left: 0.6em))[
  - $tanh(a thin x^top x' + b)$, the "sigmoid kernel", is not PSD for most $(a, b)$ ---
    it was used with SVMs anyway, which is partly why SVM folklore carries more caveats
    than GP folklore.
  - $exp(-norm(x - x')^p)$ is valid only for $0 < p <= 2$. At $p = 3$ it fails.
  - $-norm(x - x')$ is only #emph[conditionally] PSD: acceptable for variogram-based
    kriging under a mean constraint, but not a covariance function.
  - $min(x, x')$ #emph[is] valid on $RR_+$ --- it is Brownian motion.
]

The last two together show that the failures are not predictable from how the formula
looks. Empirically eigendecomposing a few Gram matrices and observing non-negative
eigenvalues proves nothing; the condition must hold for #emph[every] finite subset.

=== So how does one actually design a kernel?

Start from the structural assumption, not from the formula. Ask what invariance or
regularity the function should possess --- smoothness of a given order, periodicity,
stationarity, invariance to rotations or permutations, additivity across variable
groups, a monotone trend. Then realise that assumption as a feature map, a spectral
density, or a composition of existing kernels, which makes validity automatic. Only then
look at what hyperparameters fall out, and fit them by maximising the log marginal
likelihood.

= References

#block(inset: (left: 0.6em))[
  - Rasmussen, C. E. and Williams, C. K. I. (2006). #emph[Gaussian Processes for Machine
    Learning], Chapter 4. The standard treatment.
  - Genton, M. G. (2001). "Classes of Kernels for Machine Learning: A Statistics
    Perspective". Good on construction.
  - Wendland, H. (2004). #emph[Scattered Data Approximation]. The rigorous source on
    positive definite radial functions.
  - Wilson, A. G. and Adams, R. P. (2013). "Gaussian Process Kernels for Pattern
    Discovery and Extrapolation".
]


= Gaussian Fields

In this chapter, we introduce the concept of Gaussian fields. Gaussian fields is an extension of Gaussian processes, by generalizing it into a family of jointly Gaussian random variables indexed by a space.

Let $bold(upright(s))$ be any location in a study area $bold(upright(D))$ and let $U(bold(upright(s)))$ be the random (spatial) effect at that location.  $U(bold(upright(s)))$ is a stochastic process, with $bold(upright(s)) in bold(upright(D))$, where $bold(upright(D)) subset bb(R)^d$. Suppose, for example, that $bold(upright(D))$ is a country and data have been measured at geographical locations, over $d=2$ dimensions within this country.

We denote by $u(bold(upright(s))_i), i=1,2,dots,n$ a realization of $U(bold(upright(s)))$ at $n$ locations. It is commonly assumed that $u(bold(upright(s)))$ has a multivariate Gaussian distribution. If $U(bold(upright(s)))$ is assumed to be continuous over space, then it is continuously-indexed Gaussian field (GF). This implies that it is possible to collect these data at any finite set of locations within the study region. To complete the specification of the distribution of $u(bold(upright(s)))$, it is necessary to define its mean and covariance.

= Gaussian Markov Random Fields

= Stochastic Partial Differential Equations