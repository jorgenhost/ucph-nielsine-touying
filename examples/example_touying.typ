#import "@preview/mitex:0.2.4": mitex
#import "../src/lib.typ" as uc
// #import "@preview/ucph-nielsine-touying" as uc
#import "@preview/touying:0.6.1" as ty
#import "@preview/numbly:0.1.0": numbly
#import "@preview/pinit:0.2.2" as pi

#show: uc.ucph-metropolis-theme.with(
  header-right: align(right, image("../assets/ucph_1_seal.svg", height: 1.1cm)),
  ty.config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [University of Copenhagen],
    logo: image("../assets/ucph_1_seal.svg"),
  ),
  // ty.config-common(
  //   handout: true
  // )
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
    f(x) & = #ty.pause x^2 + 2x + 1 \
         & = #ty.pause (x + 1)^2    \
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

== Third slide
#uc.slide(align: center + horizon, composer: (1fr, 1fr))[
  First column.
][
  Second column. #cite(<schelling1971dynamic>, form: "prose")#footnote("a footnote")
]


== Fourth slide

#uc.framed([123], title: "123")

= Colors

== Let me show you the colors

#uc.show_color_pallette()

== 123

#uc.focus-slide()[
  Wake up!
]


#let my_gradient = gradient.linear(uc.colors.ucph_dark.red, uc.colors.ucph_dark.blue, angle: 45deg)
#uc.focus-slide(fill: my_gradient)[
  Wake up with a gradient!
]

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
