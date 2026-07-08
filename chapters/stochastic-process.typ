#import "../theorems/thm1.typ": theorem

= Stochastic Process

Now index a whole family of random variables by a parameter set $T$ (think of
$T$ as time: $bb(N)$, $bb(Z)_(>= 0)$, or $[0, infinity)$). A *stochastic
process* is a collection
$
  {X_t}_(t in T)
$
of random variables, _all on the same space_ $(Omega, cal(F), P)$ and _all
valued in the same_ $(E, cal(E))$. Equivalently --- and this is the more
revealing formulation --- it is a single map
$
  X : T times Omega -> E, quad (t, omega) |-> X_t (omega),
$
required to be measurable in $omega$ for each fixed $t$.

The whole conceptual jump lives in how you slice this map:

- *Fix $t$, vary $omega$:* you recover $X_t$, a random variable --- a
  _snapshot_ of the system at one instant.
- *Fix $omega$, vary $t$:* you get a function $t |-> X_t (omega)$, a single
  deterministic curve called a _sample path_ (or trajectory, or realization).

So a process assigns to each outcome $omega$ an entire path. Packaged that way,
a stochastic process is literally one random variable taking values in the
function space $E^T$, equipped with the product $sigma$-algebra
$cal(E)^(times.o T)$ (the smallest $sigma$-algebra making all coordinate
projections $pi_t : E^T -> E$ measurable). Its *law* is the pushforward
$P compose X^(-1)$, a probability measure on that path space. This is the
precise sense of "random function."

== The bridge back to probability: finite-dimensional distributions

The law lives on an unwieldy infinite-dimensional space, so how do we ever
_specify_ or _construct_ a process? Through its finite slices. For any finite
set of indices $t_1, dots, t_n in T$, the random vector
$(X_(t_1), dots, X_(t_n))$ has an ordinary joint distribution
$
  mu_(t_1, dots, t_n) quad "on" quad (E^n, cal(E)^(times.o n)).
$
The whole collection of these, over all finite index sets, is the family of
*finite-dimensional distributions* (fidis). Because the cylinder sets they
describe generate the product $sigma$-algebra and form a $pi$-system, the fidis
_determine the law of the process completely_.

The fidis cannot be arbitrary --- they must fit together consistently:

+ _Permutation:_ reordering the indices reorders the distribution the same way.
+ _Marginalization:_ integrating out the last coordinate recovers the smaller
  family, i.e.
  $
    mu_(t_1, dots, t_n, t_(n+1)) (A_1 times dots.c times A_n times E)
    = mu_(t_1, dots, t_n) (A_1 times dots.c times A_n).
  $

*Kolmogorov's extension theorem* closes the loop: for a nice state space (e.g.
$E$ Polish with its Borel $sigma$-algebra), _any_ consistent family of
finite-dimensional distributions arises from an actual stochastic process on
some $(Omega, cal(F), P)$. This is what licenses us to define a process by
writing down its finite-dimensional laws and trust that the infinite object
exists.

== What usually gets added on top

In practice one often enriches the space with a *filtration*
${cal(F)_t}_(t in T)$, an increasing family of sub-$sigma$-algebras
($cal(F)_s subset.eq cal(F)_t$ for $s <= t$) modeling the information available
by time $t$. The process is *adapted* if each $X_t$ is $cal(F)_t$-measurable
--- you cannot see the future. This extra layer is what turns "a random
function" into a setting where you can talk about martingales, stopping times,
and stochastic integration.

#line(length: 100%, stroke: 0.5pt + gray)

As a concrete instance: a simple random walk is $X_n = sum_(k=1)^n xi_k$ with
$T = bb(N)$, $E = bb(Z)$, and i.i.d. $plus.minus 1$ steps $xi_k$; its fidis are
fixed by the increment distribution. Brownian motion is the continuous-time
analogue with $T = [0, infinity)$, $E = bb(R)$, Gaussian independent increments
$X_t - X_s tilde.op cal(N)(0, t - s)$, and (almost surely) continuous sample
paths --- a genuine random curve, built by exactly the machinery above.


#theorem(title: "Axiom")[
    _Well Ordering Principle_

    Every nonempty set of positive integers contains a smallest member.
]

== First Results
This section will build some of the results using the first axiom, the first one is the Divisor algorithm as given below:

#theorem[
    *Division Algorithm*

    Let $a$ and $b$ be integers with $b > 0$. Then there exist unique integers $q$ and $r$ with the property that $a = b q + r$, $0 <= r < b$.
]
*Proof.* We want to prove first that $r$ exist by showing $a - b k = r$. After showing the existence, next is to show that $r$ is unique, and by proving it's uniqueness, the corresponding $k$ for that unique $r$ will be the value of $q$, meaning $q$ will be a consequence of proving the uniqueness of $r$.

Now, to prove the existence, consider the set $S = {v: v = a - b k}$
