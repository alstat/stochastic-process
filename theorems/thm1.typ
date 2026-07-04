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