#import "../theorems/thm1.typ": theorem


= Introduction

A *stochastic process* is, in one sentence, a _random function_: where an ordinary random variable produces a random _point_, a stochastic process produces a random _path_. To make that precise, it is cleanest to build it up in layers, each one sitting on top of the previous. The  foundation is a *measure space*: a set equipped with a $sigma$-algebra and a measure. 

== Measure Theory
Probability is a special case of measure space. 
#theorem(title: "Definition")[
  *$sigma$-algebra*  // kept sigma in math mode for correct Typst rendering 

  A *$sigma$-algebra* on a set $X$ is a collection $cal(A) subset.eq cal(P)(X)$ such that // kept Typst math notation for calligraphic letters and subset relation
  - $emptyset in cal(A)$ and $X in cal(A)$,
  - if $A in cal(A)$, then $A^c in cal(A)$,
  - if $A_1, A_2, dots in cal(A)$, then $union.big_(i) A_i in cal(A)$. // replaced unknown `cup` with `big(cup)` for union operator

  Also, $cal(P)(X)$ denotes the power set of $X$. // added definition for cal(P) as requested
]

The study of measure theory generalizes the core idea of measuring, and at the very basic of measuring, there should be a thing or object that needs to be measured in the first place, and that thing is the $X$ above. Further, there are many ways to slice this thing, either you take the first half and then the second half to cover the full region of $X$, or you approach it with different slices either in uniform sizes or random sizes, what is important is that it should be _closed under complement_ and _countable union_, so that combining these pieces keeps you within the collection of _measurable_ sets. The union must be _countable_ (not merely finite) because probability theory rests on _countable additivity_ --- the probability of a countable union of disjoint events equals the sum of their probabilities --- and because central notions like _convergence in probability_ and _convergence in distribution_ are limits of sequences (countably many terms) of random variables.  

The fact that there are many ways for us to slice this thing into measurable pieces, it is therefore better to represent this mathematically, and $sigma$-algebra formalizes this. The prefix $sigma$ distinguishes a $sigma$-algebra from a plain _algebra (field) of sets_: both are closed under complement and finite union, but $sigma$ signals closure under countable unions.

The power set $cal(P)(X)$ is simply a collection of all subsets of $X$ and is the biggest $sigma$-algebra. Indeed, other $sigma$-algebras sit between the two extremes below.
$
    \{emptyset, X\} subset.eq cal(A) subset.eq cal(P)(X).
$
Note that not every sub-collection of $cal(P)$ are $sigma$-algebra, most fail to be _closed under complement_ or _countabel union_.

#theorem(title: "Definition")[
    _Measure Space_
    
    A *measure space* is a triple $(X, cal(A), mu)$ where $cal(A)$ is a $sigma$-algebra on $X$ and $mu: cal(A) -> [0, infinity]$ is a measure --- meaning it satisfies just two axioms: 
    - *null empty set*: $mu (emptyset) = 0 $
    - *countable additivity*: $mu (union.big_i A_i) = sum_i mu(A)$ for pairwise disjoint $A_i$.
]

A measure space is therefore a space where measurement can be done, and this space should contain the object or thing to be measured, $X$; its possible measurable slices, $cal(A)$; and the tool for measuring these slices, $mu$.
== Axioms of Probability
A **probability space** is then nothing more than a measure space with *one extra normalization axiom bolted on* $mu(X)=1$, written below $P(Omega)=1$. 

#theorem(title: "Definition")[
    _Probability Space_
    
    A *probability space* is a measure space with triple $(Omega, cal(F), P)$, where $Omega$ is the set of outcomes, $cal(F)$ is a $sigma$-algebra of subsets of $Omega$ (the _events_ --- closed under complement and countable union, containing $Omega$), and $P : cal(F) -> [0, 1]$ is a countably additive measure with $P(Omega) = 1$. 
]

Therefore, the probability space differs from measure space by using a probability measure $P(dot.c)$ instead which normalizes $mu$, $0 <= P(dot.c) <= 1$.

#theorem(title: "Proposition")[
    _Countably Additive_
    
    A measure $mu$ is countably additive (equivalently $sigma$-additive) if, whenever you have a _countable_ collection of pairwise  disjoint sets $A_1,A_2,A_3, dots.c in cal(F)$,
    $
        mu ( union.big_(i=1)^infinity A_i ) = 
        sum_(i=1)^infinity mu(A_i)    
    $
]




The measure $P$ is countably additive because it makes the limits, and hence the convergence theorem, work.

== The atom: a random variable

A random variable is a measurable map
$
  X : (Omega, cal(F)) -> (E, cal(E)),
$
where $(E, cal(E))$ is a measurable space (the _state space_, often
$(bb(R), cal(B)(bb(R)))$). Measurable means $X^(-1)(B) in cal(F)$ for every
$B in cal(E)$, which is exactly what is needed for "$P(X in B)$" to be defined,
via the pushforward law $mu(B) = P(X^(-1)(B))$. A random vector
$(X_1, dots, X_n)$ is just a measurable map into $(E^n, cal(E)^(times.o n))$
--- finitely many random variables bundled together.

== The object: a stochastic process

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

According to @bolin2020, also according to there is no answer to this. So according to @bolin2026