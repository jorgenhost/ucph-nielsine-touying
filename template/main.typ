// #import "@preview/ucph-nielsine-touying:0.1.0" as uc
#import "../src/lib.typ" as uc
#import "@preview/touying:0.6.1" as ty
#set text(font: "Fira Sans", weight: "light")
#show math.equation: set text(font: "Fira Math")

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
wqewqe *123*


== Third slide
#uc.slide(align: center + horizon, composer: (1fr, 1fr))[
  First column.
][
  Second column. #cite(<schelling1971dynamic>, form: "prose")#footnote("a footnote")
]

// A "focus" slide that is colored according to the primary color
#uc.focus-slide(
  [
    Wake up!
  ],
  // Uncomment if you want to change the standard logo. Place with args: dx: -15pt, dy: -8pt
  //
  // logo: place(right, uc.logos.standard-dk-negative, dx: -15pt, dy: -8pt),
)

// You can change the coloring to be gradient of UCPH colors instead

#let my-gradient = gradient.linear(uc.colors.ucph-dark.red, uc.colors.ucph-dark.blue, angle: 45deg)
#uc.focus-slide(
  [
    Wake up with a gradient!
  ],
  fill: my-gradient,
)


= Colors

== Let me show you the colors

#uc.show-color-pallette()

== References
#set text(size: 14pt)
#bibliography("bibliography.bib", style: "harvard-cite-them-right", title: none)


