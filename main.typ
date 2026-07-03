#import "@preview/ilm:1.4.2": *

#set text(lang: "en")

#show: ilm.with(
    title: [Theory of Probability & Stochastic Process],
    author: "Al-Ahmadgaid B. Asaad",
    date: datetime(year: 2026, month: 07, day: 02),
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

#import "theorems/thm1.typ": theorem

#include "chapters/intro-axioms.typ" 