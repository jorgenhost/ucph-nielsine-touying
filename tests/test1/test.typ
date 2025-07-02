#import "../../src/lib.typ" as uc
#import "@preview/touying:0.6.1" as ty

#show: uc.ucph-metropolis-theme.with(ty.config-info(
  title: [Title],
  subtitle: [Subtitle],
  author: [Authors],
  date: datetime.today(),
  institution: [University of Copenhagen],
  logo: image("../../assets/ucph_1_seal.svg"),
))

#uc.title-slide()

= First section

== First slide
Wow, this is a slide.
