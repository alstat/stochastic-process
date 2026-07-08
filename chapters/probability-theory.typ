#import "../theorems/thm1.typ": theorem
= Probability Theory
== Axioms of Probability
A **probability space** is then nothing more than a measure space with *one extra normalization axiom bolted on* $mu(X)=1$, written below $P(Omega)=1$. 

#theorem(title: "Definition")[
    A *probability space* is a measure space with triple $(Omega, cal(F), P)$, where $Omega$ is the set of outcomes, $cal(F)$ is a $sigma$-algebra of subsets of $Omega$ (the _events_ --- closed under complement and countable union, containing $Omega$), and $P : cal(F) -> [0, 1]$ is a countably additive measure with $P(Omega) = 1$. 
]

Therefore, the probability space differs from measure space by using a probability measure $P(dot.c)$ instead, which normalizes $mu$, $0 <= P(dot.c) <= 1$. The measure $P$ is countably additive because it makes the limits, and hence the convergence theorem, work. 

== Random Variable

Once $(Omega, cal(F), P)$ is in place, probabilities already attach to _events_ (the measurable subsets of $Omega$), the probabilities of how likely it to happen, so the output is a _likelihood_. But we are rarely interested in a raw
outcome $omega$ itself; we care about some _numerical quantity_ read off from
it (a count, a sum, a waiting time). Such a quantity is captured by a function
of the outcome, and because its input $omega$ is governed by chance the value
varies randomly --- hence _random variable_. Requiring this function to be
_measurable_ is what lets the probabilities on events transfer to its values,
as formalized below.

#theorem(title: "Definition")[
  A #strong[random variable] is a measurable map
  $
    X : (Omega, cal(F)) -> (E, cal(E)),
  $
  where $(E, cal(E))$ is a measurable space (the _state space_, often
  $(bb(R), cal(B)(bb(R)))$). Measurable means $X^(-1)(B) in cal(F)$ for every
  $B in cal(E)$, which is exactly what is needed for $P(X in B)$ to be defined,
  via the pushforward law $mu_X (B) = P(X^(-1)(B))$. A random vector
  $(X_1, dots, X_n)$ is just a measurable map into
  $(E^n, cal(E)^(times.o n))$ --- finitely many random variables bundled
  together.
]

#theorem(title: "Definition")[
  A #strong[Borel space] is a measurable map
  $
    X : (Omega, cal(F)) -> (E, cal(E)),
  $
  where $(E, cal(E))$ is a measurable space (the _state space_, often
  $(bb(R), cal(B)(bb(R)))$). Measurable means $X^(-1)(B) in cal(F)$ for every
  $B in cal(E)$, which is exactly what is needed for $P(X in B)$ to be defined,
  via the pushforward law $mu_X (B) = P(X^(-1)(B))$. A random vector
  $(X_1, dots, X_n)$ is just a measurable map into
  $(E^n, cal(E)^(times.o n))$ --- finitely many random variables bundled
  together.
]