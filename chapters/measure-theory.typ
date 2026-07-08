#import "../theorems/thm1.typ": theorem


= Measure Theory 

A *stochastic process* is, in one sentence, a _random function_: where an ordinary random variable produces a random _point_, a stochastic process produces a random _path_. To make that precise, it is cleanest to build it up in layers, each one sitting on top of the previous. The  foundation is a *measure space*: a set equipped with a $sigma$-algebra and a measure. Further

== Sigma Algebra
#theorem(title: "Definition")[
  A *$sigma$-algebra* on a set $X$ is a collection $cal(A) subset.eq cal(P)(X)$ such that // kept Typst math notation for calligraphic letters and subset relation
  - $emptyset in cal(A)$ and $X in cal(A)$,
  - if $E in cal(A)$, then $X \\ E^c in cal(A)$,
  - if $E_1, E_2, dots in cal(A)$, then $union.big_(i=1)^infinity E_i in cal(A)$. // replaced unknown `cup` with `big(cup)` for union operator

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
    A *measure space* is a triple $(X, cal(A), mu)$ where $cal(A)$ is a $sigma$-algebra on $X$ and $mu: cal(A) -> [0, infinity]$ is a measure
]

#theorem(title: "Definition")[
    A *measurable space* is an ordered pair ($X, cal(A)$), where $X$ is a set and $cal(A)$ is a $sigma$-algebra on $X$.
]
    
A measure space is therefore a space where measurement can be done, and this space should contain the object or thing to be measured, $X$; its possible measurable slices, $cal(A)$; and the tool for measuring these slices, $mu$.

#theorem(title: "Definition")[
    A *measure* $mu: cal(A) -> [0, infinity]$, where $cal(A)$ is a $sigma$-algebra, is a function that 
    satisfies just two axioms: 
    - *null empty set*: $mu (emptyset) = 0 $
    - *countable additivity*: $mu (union.big_i A_i) = sum_i mu(A)$ for pairwise disjoint $A_i$.
]

#theorem(title: "Definition")[
The *Lebesgue measure* $lambda$ is the measure that generalizes length: beyond
the two axioms above, it is *translation-invariant*, $lambda(E + x) = lambda(E)$,
and assigns each interval its length, $lambda([a,b]) = b - a$. Translation
invariance is what makes it a notion of "length" — sliding a set does not change
its size. 
]

These extra properties (translation-invariant) of $lambda$ measure are exactly what cannot be extended to all of $cal(P)(bb(R))$ as will be shown below.


=== Borel $sigma$-algebra
Probability theory on real- or vector-valued outcomes requires a well-behaved
measure on $bb(R)^n$ — namely the _Lebesgue measure_, which generalizes length,
area, and volume. Whether such a measure exists depends on the choice of
$sigma$-algebra. Taking the power set $cal(P)(bb(R))$ as the $sigma$-algebra makes
it *impossible*: no measure on $cal(P)(bb(R))$ can simultaneously be countably
additive, translation-invariant, and assign intervals their length. Precisely:

#theorem(title: "Proposition")[
    There is no _countably additive, translation-invariant measure_
    $lambda: cal(P)(bb(R)) -> [0, infinity]$ that assigns to intervals their length,
    say $lambda([0, 1]) = 1$.
]

_Proof_. Define an equivalence class $x ~ y$ with $x - y in bb(Q)$ on $[0, 1]$. From each of these equivalence classes and using the Axiom of Choice (_see_ Axiom ), pick one representative and let $V$ be the resulting set. Consider the translate $V+q, q in bb(Q) inter [0,1]$, so that

$
    V+q = \{v+q: v in V\}.
$
Then, 
$
    lambda(V+q) = lambda(V)
$
Further, by countable additivity, we see that
$
    [0,1] subset.eq union.big_(q in bb(Q) inter [-1,1]) V+q subset.eq [-1,2].
$
#theorem(title: "Proposition")[
    There is no _countably additive, translation-invariant measure_
    $mu: cal(P)(bb(R)) -> [0, infinity]$ that assigns to intervals their length,
    say $mu([0, 1]) = 1$.
]
