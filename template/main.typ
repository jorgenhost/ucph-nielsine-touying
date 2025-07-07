#import "@preview/ucph-nielsine-touying:0.1.0" as uc
#import "@preview/touying:0.6.1" as ty

#show: uc.ucph-metropolis-theme.with(
  ty.config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Authors],
    date: datetime.today(),
    institution: [University of Copenhagen],
    logo: image("assets/ucph-1-seal.svg"),
  ),
  // This is the default colors
  // ty.config-colors(
  //   primary: uc.colors.ucph-dark.red,
  //   secondary: uc.colors.ucph-dark.petroleum,
  // ),
  // Uncomment this if you have animations in your slides and only want to keep the last subslide
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
wqewqe

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
  // logo: place(right, image("assets/ucph-1-negative-dk.svg"), dx: -15pt, dy: -8pt),
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


