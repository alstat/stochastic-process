#let accent = rgb("#1f4e79")
#let warn = rgb("#8c2f0d")

#let theorem(title: "Theorem", body) = {
  counter("theorem").step()
  context block(
    width: 100%,
    stroke: blue,
    inset: 8pt,
    radius: 4pt,
    fill: rgb("eef6ff"),
  )[
    *#title #context {
      let section = counter(heading).get()
      let thm = counter("theorem").get().first()
      if section.len() > 0 {
        section.map(str).join(".") + "." + str(thm)
      } else {
        str(thm)
      }
    }*
    #body
  ]
}

#let callout(title, body, tone: accent) = block(
  width: 100%,
  fill: tone.lighten(90%),
  stroke: (left: 3pt + tone),
  inset: (x: 12pt, y: 11pt),
  radius: 2pt,
  above: 1.1em,
  below: 1.1em,
)[
  #text(weight: "bold", fill: tone.darken(10%), size: 10pt)[#title]
  #parbreak()
  #body
]