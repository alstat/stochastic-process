#let theorem(title: "Theorem", body) = context block(
    width: 100%,
    stroke: blue,
    inset: 8pt,
    radius: 4pt,
    fill: rgb("eef6ff"),
)[
    *#title #context {
      let nums = counter(heading).get() // use heading counter so theorem follows section numbering
      if nums.len() > 0 {
        nums.map(str).join(".") // convert integers to strings before joining
      } else {
        "0" // fallback when no heading exists yet
      }
    }*
    #body
]