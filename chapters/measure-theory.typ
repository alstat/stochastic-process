#import "../theorems/thm1.typ": theorem


= Measure Theory 
In this chapter, the goal is to build on the concept of measure where probability is built on. This chapter is heavily based from the content of #cite(<axler2019>, form: "prose"). The chapter starts with a motivation for a _well-behaved_ measure, and then builds the properties of the said function.

== Motivation: Riemann Integration
Reimann integration uses rectangles to approximate areas under graphs, which can be done by creating partitions for the width of the triangle and then the height can be computed from the function of the graph. As such, _partition_ is formally defined below:

#theorem(title: "Definition")[
    Suppose $a,b in bb(R)$ with $a < b$. A *partition* of $[a, b]$ is a finite list of the form $x_0, x_1, dots, x_n$, where 
    $
        a = x_0 < x_1 < dots < x_n = b.
    $
]

So to say partition the interval $[a,b]$, is to think of $[a,b]$ as unions of closed subintervals,

$
    [a,b]=[x_0,x_1] union [x_1, x_2] union dots.c union [x_(n-1), x_n].
$

The next task is to measure the height of a rectangle under the graph. In the Riemann setting, the height comes from evaluating the function at a chosen point of each subinterval, which can be defined below:

#theorem(title: "Definition")[
    If $f$ is a real-valued function and $A$ is a subset of the domain of $f$, then 
    $
        inf_(A) f = inf\{f(x): x in A\} "and" sup_(A) f = sup\{f(x): x in A\}.
    $
]
Once we have the height of the rectangle, next is to sum of all these rectangles in both either _upper_ or _lower_ Riemann sums.

#theorem(title: "Definition")[
    Suppose $f:[a,b] -> bb(R)$ is a bounded function and $P$ is a partition $x_0, dots, x_n$. The _lower Riemann sum_ $L(f, P, [a,b])$ and _upper Riemann sum_ $U(f, P, [a,b])$ are defined by
    $
        L(f, P, [a,b]) = sum_(j=1)^n (x_j - x_(j-1)) inf_(x_(j-1), x_j) f
    $
    and 
    $
        U(f, P, [a,b]) = sum_(j=1)^n (x_j - x_(j-1)) sup_(x_(j-1), x_j) f.
    $
]

As the width of the partitions reduces, it is therefore expected that the lower Riemann sum increases and the upper Riemann sum decreases.

#theorem(title: "Proposition")[
    Let $f:[a,b] -> bb(R)$ be a bounded function and let $P,P'$ be partitions of $[a,b]$ such that the list defining $P$ is a sublist of the list defining $P'$, then
    $
        L(f, P', [a,b]) <= L(f, P, [a,b]) <= U(f, P', [a,b]) <= U(f, P, [a,b]).
    $
]
_Proof_. Let 

== Sigma Algebra
A *stochastic process* is, in one sentence, a _random function_: where an ordinary random variable produces a random _point_, a stochastic process produces a random _path_. To make that precise, it is cleanest to build it up in layers, each one sitting on top of the previous. The  foundation is a *measure space*: a set equipped with a $sigma$-algebra and a measure. Further

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

_Proof_. Define an equivalence class $x ~ y$ with $x - y in bb(Q)$ on $[0, 1]$, meaning
$
    [v] = \{x in [0,1]: x - v in bb(Q)\},
$
read as 
From each of these equivalence classes and using the Axiom of Choice (_see_ Axiom ), pick one representative and let $V$ be the resulting set. Consider the translate $V+q, q in bb(Q) inter [0,1]$, so that

$
    V+q = \{v+q: v in V\}.
$
Then, 
$
    lambda(V+q) = lambda(V)
$
Further, since $x in [0,1]$ then some $x = v + q$ for $q in bb(Q) inter [-1,1]$, so that 
$
    [0,1] subset.eq union.big_(q in bb(Q) inter [-1,1]) V+q.
$
Also, 
$
    [0,1] subset.eq union.big_(q in bb(Q) inter [-1,1]) V+q subset.eq [-1,2].
$
By countable additive 
#theorem(title: "Proposition")[
    There is no _countably additive, translation-invariant measure_
    $mu: cal(P)(bb(R)) -> [0, infinity]$ that assigns to intervals their length,
    say $mu([0, 1]) = 1$.
]
