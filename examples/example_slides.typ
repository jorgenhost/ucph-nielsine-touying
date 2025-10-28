#import "@preview/ucph-nielsine-touying:0.1.2" as uc
#import "@preview/theorion:0.4.1" as th
#import th.cosmos.clouds as thc
#import "@preview/touying:0.6.1" as ty
#import "@preview/pinit:0.2.2" as pi
#import "funcs.typ" as f

// Font settings
#set text(font: "Fira Sans", weight: "light")
#show math.equation: set text(font: "Fira Math")

// Settings for theorion package
#show: th.show-theorion
#th.set-inherited-levels(0)

#show: uc.ucph-metropolis-theme.with(
  language: "en",
  ty.config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [University of Copenhagen],
    logo: uc.logos.seal,
  ),
  ty.config-common(frozen-counters: (
    th.theorem-counter,
  )), // If you are using "animations", add this config option to stop touying from counting the same theorem multiple times
  ty.config-colors(
    primary: uc.colors.ucph-dark.red,
    secondary: uc.colors.ucph-medium.grey,
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

= Examples

== Example: `pinit` (1)
The music experience has been #pi.pin(1)cancelled#pi.pin(2).

#pi.pinit-highlight(1, 2)

#pi.pinit-point-from(2)[This quote is from the Severance TV-show]

== Example: `pinit` (2)
Equation written out directly (for comparison):

$ (q_t^* p_t)/(1+r)^t >= C_0 + sum_(i=1)^T (c_i)/(1+r)^i $

Laid out with pinit:

#v(3.5em)

$
  (#pi.pin(1)q_t^* p_t#pi.pin(2))/(#pi.pin(3) (1 + r)^t #pi.pin(4)) >= C_0 + #pi.pin(5)sum_(i=1)^T (c_i)/(1+r)^i#pi.pin(6)
$

#v(5em)

#f.pinit-highlight-equation-from((1, 2), (1, 2), height: 3.5em, pos: top + left, fill: rgb(0, 180, 255))[
  Optimal quantity of goods produced
]

#f.pinit-highlight-equation-from((3, 4), (3, 4), height: 2.5em, pos: bottom, fill: rgb("#c36f02"))[
  Discount factor for time $t$
]

#f.pinit-highlight-equation-from(
  (5, 6),
  (5, 6),
  dy: -1.7em,
  height: 2em,
  extended-height: 3em,
  pos: right,
  fill: rgb(
    "#5d00ff",
  ),
)[
  Present value of future operating costs
]

Paragraph after the equation.

== Example: `theorion`

#thc.definition()[
  The OLS estimator
  $
    hat(bold(beta)) = (bold(X)^T bold(X))^(-1) bold(X)^T bold(y)
  $
]
#th.important-box(fill: uc.colors.ucph-dark.red)[
  - Remember this!
]
#thc.theorem()[
  #lorem(5)
]
#thc.proposition()[
  #lorem(5)
]

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
    bold(X)^T bold(y) + bold(beta)^T bold(X)^T bold(X) bold(beta)) & = 0 arrow.l.r \
                                    2 bold(X)^T bold(X) bold(beta) & = 2bold(X)^T bold(y) arrow.l.r \
                                       bold(X)^T bold(X)bold(beta) & = bold(X)^T bold(y) arrow.l.r
$
Multiply both sides with $(bold(X)^T bold(X))^(-1)$:

$
  underbrace((bold(X)^T bold(X))^(-1) bold(X)^T bold(X), = bold(I))) bold(beta) &= (bold(X)^T bold(X))^(-1) bold(X)^T bold(y) arrow.l.r
  \
  hat(bold(beta)) &= (bold(X)^T bold(X))^(-1) bold(X)^T bold(y)
$

#pagebreak()


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

== Handout mode
If you have "animations" in your presentation, you can set "handout" to "true" in the config and only include the last subslide.
```typ
#import "@preview/ucph-nielsine-touying:0.1.2" as uc
#import "@preview/touying:0.6.1" as ty
show: uc.ucph-metropolis-theme.with(
  // ...
  ,
ty.config-common(handout: true)
)
```

== Slide with columns #cite(<schelling1971dynamic>, form: "prose")
#uc.slide(align: center + horizon, composer: (1fr, 1fr))[
  First column.
][
  Second column. #cite(<schelling1971dynamic>, form: "prose")#footnote("a footnote")
]

= Colors
== Color scheme
Colors of the University of Copenhagen can be retrieved by specifying:
```typ
#import "@preview/ucph-nielsine-touying:0.1.2" as uc
// Darks
uc.colors.ucph-dark.red // the default dark red color of UCPH
// Medium
uc.colors.ucph-medium // ...
// Light
uc.colors.ucph-light // ...

```
#pagebreak()

#align(center, uc.show-color-pallette())

#uc.focus-slide()[
  Wake up!
]


#let my-gradient = gradient.linear(uc.colors.ucph-dark.red, uc.colors.ucph-dark.blue, angle: 45deg)

#uc.focus-slide(fill: my-gradient)[
  Wake up with a gradient!
]

= References
== References
#set text(size: 14pt)
#bibliography("bibliography.bib", style: "harvard-cite-them-right", title: none)

#show: ty.appendix
= Appendix
== Appendix
- If you look at the bottom right, the page counter starts with "A-" as this is an appendix.
= Page anatomy
==
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
