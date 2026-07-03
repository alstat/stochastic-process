#let theorem(title: "Theorem", body) = context block(
    width: 100%,
    stroke: blue,
    inset: 8pt,
    radius: 4pt,
    fill: rgb("eef6ff"),
)[
    *#title #(counter(heading).get().first() + 1)*
    #body 
] 