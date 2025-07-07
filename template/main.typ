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
  ty.config-colors(
    primary: uc.colors.ucph-dark.red,
    secondary: uc.colors.ucph-dark.petroleum,
  ),
  /// Uncomment this if you have animations in your slides and only want to keep the last subslide
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


= Colors

== Let me show you the colors

#uc.show-color-pallette()

== References
#set text(size: 14pt)
#bibliography("bibliography.bib", style: "harvard-cite-them-right", title: none)


