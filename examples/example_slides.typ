// #import "@preview/ucph-nielsine-touying:0.1.0" as uc
#import "@preview/theorion:0.3.3" as th
#import th.cosmos.clouds as thc
#import "../src/lib.typ" as uc
#import "@preview/touying:0.6.1" as ty
#import "@preview/pinit:0.2.2" as pi
#set text(font: "Fira Sans", weight: "light")
#show math.equation: set text(font: "Fira Math")
#show: th.show-theorion
#th.set-inherited-levels(1)
#set heading(numbering: "1.1")
#show heading.where(level: 1): set heading(numbering: none)
#show heading.where(level: 2): set heading(numbering: none)
#counter(heading).step(level: 1)

#show: uc.ucph-metropolis-theme.with(
  ty.config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [University of Copenhagen],
    logo: uc.logos.seal,
  ),
  ty.config-common(frozen-counters: (th.theorem-counter,)),
  ty.config-colors(
    primary: uc.colors.ucph-dark.red,
    secondary: uc.colors.ucph-medium.grey,
    bold-color: uc.colors.ucph-dark.grey,
  ),
  // Uncomment this if you have animations in your slides and only want to keep the last subslide
  // ty.config-common(
  //   handout: true,
  // ),
)

#uc.title-slide()

// If you want a table of contents
// #uc.components.adaptive-columns(outline(indent: 1em))

= First section

== First slide
Wow, this is a slide.

== Second slide
The music experience has been #pi.pin(1)cancelled#pi.pin(2).

#pi.pinit-highlight(1, 2)

#pi.pinit-point-from(2)[This quote is from the Severance TV-show]

== Animations
#uc.slide[
  Touying equation with pause:

  $
    f(x) & = #ty.pause x^2 + 2x + 1 & = #ty.pause (x + 1)^2
  $

  #ty.meanwhile

  Touying equation is very simple.
]

== Complex Animations
#uc.slide(
  repeat: 3,
  self => [
    #let (uncover, only, alternatives) = ty.utils.methods(self)

    At subslide #self.subslide, we can

    use #uncover("2-")[`#uncover` function] for reserving space,

    use #only("2-")[`#only` function] for not reserving space,

    #alternatives[call `#only` multiple times \u{717}][use `#alternatives` function #sym.checkmark] for choosing one of the alternatives.
  ],
)

== Intermezzo
If you have "animations" in your presentation, you can set "handout" to "true" in the config and only include the last subslide.
```typ
#import "@preview/ucph-nielsine-touying" as uc
#import "@preview/touying:0.6.1" as ty
show: uc.ucph-metropolis-theme.with(
  // ...
  ,
ty.config-common(handout: true)
)
```

== Slide with columns
#uc.slide(align: center + horizon, composer: (1fr, 1fr))[
  First column.
][
  Second column. #cite(<schelling1971dynamic>, form: "prose")#footnote("a footnote")
]

= The OLS estimator
== Derivation of the OLS estimator
For a multiple linear regression model, the equation can be written in matrix form as:

$
  bold(y)=bold(X) bold(beta) + bold(epsilon)
$

where:
- $bold(y)$ is an $n times 1$ vector of observed dependent variables.
- $bold(X)$ is an $k times (k+ 1)$ matrix of independent variables (including a column of ones for the intercept).
- $bold(beta)$ is a vector of unknown coefficients.
- $bold(epsilon)$ is an $n times 1$ vector of error terms.

#pagebreak()


Implying we have a vector of residuals given by:

$
  bold(epsilon) = bold(y)-bold(X) bold(beta)
$

Our objective is to minimize the sum of squared residuals:

$
  min_(beta) bold(epsilon)^T bold(epsilon)&=(bold(y)-bold(X) bold(beta))^T (bold(y)-bold(X) bold(beta)) #sym.arrow.l.r
  \
  &= underbrace(bold(y)^T bold(y), perp bold(beta)) - bold(y)^T bold(X) bold(beta)-bold(beta)^T bold(X)^T bold(y)+ bold(beta)^T bold(X)^T bold(X) bold(beta) arrow.l.r
  \
  &= -2bold(beta)^T
  bold(X)^T bold(y) + bold(beta)^T bold(X)^T bold(X) bold(beta)
$

_Note_: By multiple a vector with itself transposed with just a scalar, or in this case $bold(epsilon)^T bold(epsilon)$ which is the sum of squared error terms.

#pagebreak()

$
  diff/(diff bold(beta))(-2bold(beta)^T
    bold(X)^T bold(y) + bold(beta)^T bold(X)^T bold(X) bold(beta)) & = 0 arrow.l.r                  \
                                    2 bold(X)^T bold(X) bold(beta) & = 2bold(X)^T bold(y) arrow.l.r \
                                       bold(X)^T bold(X)bold(beta) & = bold(X)^T bold(y) arrow.l.r
$
Multiply both sides with $(bold(X)^T bold(X))^(-1)$:

$
  underbrace((bold(X)^T bold(X))^(-1) bold(X)^T bold(X), = bold(I))) bold(beta) &= (bold(X)^T bold(X))^(-1) bold(X)^T bold(y) arrow.l.r
  \
  hat(bold(beta)) &= (bold(X)^T bold(X))^(-1) bold(X)^T bold(y)
$

#uc.slide(align: left)[
  #align(center + top)[
    #uc.framed(title: "The OLS estimator", block-width: 60%)[
      $
        hat(bold(beta)) = (bold(X)^T bold(X))^(-1) bold(X)^T bold(y)
      $
    ]]

  - This is very important.
  - Remember this.
]

= Colors

== Let me show you the colors

#uc.show-color-pallette()

#uc.focus-slide()[
  Wake up!
]


#let my-gradient = gradient.linear(uc.colors.ucph-dark.red, uc.colors.ucph-dark.blue, angle: 45deg)

#uc.focus-slide(fill: my-gradient)[
  Wake up with a gradient!
]


#let pinit-highlight-equation-from(
  height: 2em,
  pos: bottom,
  fill: rgb(0, 180, 255),
  highlight-pins,
  point-pin,
  body,
) = {
  pi.pinit-highlight(..highlight-pins, dy: -0.9em, fill: rgb(..fill.components().slice(0, -1), 40))
  pi.pinit-point-from(
    fill: fill,
    pin-dx: 0em,
    pin-dy: if pos == bottom { 0.5em } else { -0.9em },
    body-dx: 0pt,
    body-dy: if pos == bottom { -1.7em } else { -1.6em },
    offset-dx: 0em,
    offset-dy: if pos == bottom { 0.8em + height } else { -0.6em - height },
    point-pin,
    rect(inset: 0.5em, stroke: (bottom: 0.12em + fill), {
      set text(fill: fill)
      body
    }),
  )
}

Equation written out directly (for comparison):

$ (q_T^* p_T)/p_E p_E^* >= (c + q_T^* p_T^*)(1+r^*)^(2N) $

Laid out with pinit:

#v(3.5em)

$ (#pi.pin(1)q_T^* p_T#pi.pin(2))/(#pi.pin(3)p_E#pi.pin(4))#pi.pin(5)p_E^*#pi.pin(6) >= (c + q_T^* p_T^*)(1+r^*)^(2N) $

#v(5em)

#pinit-highlight-equation-from((1, 2, 3, 4), (3, 4), height: 3.5em, pos: bottom, fill: rgb(0, 180, 255))[
  quantity of Terran goods
]

#pinit-highlight-equation-from((5, 6), (5, 6), height: 2.5em, pos: top, fill: rgb(150, 90, 170))[
  price of Terran goods, on Trantor
]

Paragraph after the equation.

== References
#set text(size: 14pt)
#bibliography("bibliography.bib", style: "harvard-cite-them-right", title: none)

#show: ty.appendix
= Appendix
== Appendix
123

= Page layout
== Page layout
#let container = rect.with(height: 100%, width: 100%, inset: 0pt)
#let innerbox = rect.with(stroke: (dash: "dashed"))

#set text(size: 30pt)
#set page(
  paper: "presentation-16-9",
  header: container[#innerbox[Header]],
  header-ascent: 30%,
  footer: container[#innerbox[Footer]],
  footer-descent: 30%,
)

#place(top + right)[Margin→]
#container[
  #container[
    #innerbox[Content]
  ]
]
