#import "@preview/ilm:1.4.2": *

#set text(lang: "en")

#show: ilm.with(
    title: [Theory of Measure, Probability, & Stochastic Process _(Draft)_],
    author: "Al-Ahmadgaid B. Asaad",
    date: datetime.today(), // changed to current date dynamically
    abstract: [],
    preface: [
        #align(center + horizon)[
            _for the #text(lang: "ar", font: "Noto Naskh Arabic")[عمّ]_
        ]
    ],
    bibliography: bibliography("references.bib"), // added bibliography file so citations can use reference.bib
    figure-index: (enabled: true),
    table-index: (enabled: true),
    listing-index: (enabled: true),
)

#show heading: it => {
  counter("theorem").update(0)  // reset theorem numbering at each new section
  it
}

#import "theorems/thm1.typ": theorem

#include "chapters/intro.typ" 
#include "chapters/set-theory.typ" 
#include "chapters/measure-theory.typ" 
#include "chapters/probability-theory.typ" 
#include "chapters/stochastic-process.typ" 