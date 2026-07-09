#import "../theorems/thm1.typ": theorem


= Set Theory 


#theorem(title: "Axiom")[
    Given any collection of nonempty sets $\{A_i\}_(i in I)$​, there exists a *choice function* $f$ that selects one element from each: $f(i) in A$ for every $i$. 
]


#theorem(title: "Axiom")[
    Let $A$ be a set and let $~$ be a binary relation on $A$ (i.e. $~ subset.eq A times A)$. The relation $~$ is an *equivalence relation* if it satisfies three properties for all $a,b,c in A$:
    1. *Reflexivity*: $a ~ a$
    2. *Symmetry*: if $a ~ b$, then $b ~ a$
    3. *Transitivity*: if $a ~ b$ and $b ~ c$, then $a ~ c$
]

#theorem(title: "Definition")[
    Let $~$ be an equivalence relation on a set $A$, and let $a in A$. The *equivalence class* of $a$ (with respect to $~$) is the set 
    $
        [a] = \{x in A: x ~ a\}.
    $
]
That is, $[a]$ is the set of all elements of $A$ that are related to $a$ under $~$. The element $a$ is called a _representative_ of the class. Common alternative notations include $[a]_~$ and $a\/~$.

The key properties below of equivalence class follow directly from the three axioms and characterize why the concept is useful:
    1. *Nonemptiness*: $a in [a]$ (by reflexivity), so every class is nonempty.
    2. *Class equality criterion*: $[a]=[b] <=> a ~ b$
    3. *Disjointness*: For any $a,b in A$, either $[a] = [b]$ or $[a] inter [b] = emptyset$. Two distinct classes never overlap.
    4. *Covering*: $union.big_(a in A)[a] = A$.