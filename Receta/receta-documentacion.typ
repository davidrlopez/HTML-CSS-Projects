#set document(title: "Receta responsive", author: "David Román López")
#set page(paper: "a4", margin: 2cm, numbering: "1")
#set text(lang: "es", size: 11pt)
#set heading(numbering: "1.")
#show figure.caption: set text(size: 9pt)

#align(center)[
  #text(size: 18pt, weight: "bold")[Receta responsive: tortilla de patatas]

  David Román López · #datetime.today().display("[day]/[month]/[year]")
]

= Live Server en el móvil

Abrí la página con Live Server desde Visual Studio Code y la cargué en el móvil con la IP del ordenador y el puerto 5500, los dos en la misma wifi.

#figure(
  image("receta-capturas/movil-live-server.jpg", height: 9cm),
  caption: [La receta en el móvil junto a la pantalla del ordenador.],
)

= Fallos detectados y solución

- La descripción larga de la foto estaba enlazada con `aria-describedby` a un texto dentro de un `details` cerrado, y NVDA no la leía. Ahora va en un `details` justo después de la imagen y se lee al abrirlo con Intro.
- En la lista de enlaces de NVDA, los de Mercadona salían solo como «Patatas», «Huevos»… sin decir adónde llevan. Les puse un `aria-label` que empieza por el texto visible, por ejemplo «Patatas en la tienda online de Mercadona».
- Al abrir la descripción, la trama amarilla del fondo se estiraba. La culpa era de `background-repeat: round`, que recalcula el tamaño de los cuadros cuando la página crece. Con `round repeat` solo se ajusta a lo ancho y a lo alto se repite.

= Criterio 1.4.8 de WCAG 2.1

Subí el tamaño de letra del navegador de 16 a 32 px, que es el 200 %, y miré los valores calculados. No usé el zoom normal (Cmd +) porque con él los valores calculados se quedan en 16px: ese zoom no cambia los px de CSS.

#table(
  columns: (40%, 1fr),
  [*Requisito*], [*Cómo lo cumple*],
  [Colores elegibles por el usuario], [No fuerzo colores con `!important`, así que el modo lector o el alto contraste del navegador pueden cambiarlos.],
  [Máximo 80 caracteres por línea], [`max-width: 60ch` en listas y párrafos.],
  [Texto sin justificar], [`text-align: left`.],
  [Interlineado de al menos 1,5], [`line-height: 1.5`.],
  [Espacio entre párrafos de al menos 1,5 veces el interlineado], [`2.25rem` entre pasos (1,5 × 1,5).],
  [Texto al 200 % sin scroll horizontal], [Tipografía, márgenes y gaps en rem. Ver @valores y @pagina.],
)

#figure(
  image("receta-capturas/1-valores-calculados-200.png", width: 100%),
  caption: [Letra del navegador a 32 px: los pasos a 32px con interlineado de 48px, el h1 a 85,7px y la página de 1440 px en una ventana de 1440 px.],
) <valores>

#figure(
  image("receta-capturas/2-pagina-texto-200.png", height: 20cm),
  caption: [Página completa al 200 %, sin scroll horizontal.],
) <pagina>

= Contraste con WAVE

WAVE da 0 errores y 0 errores de contraste. El único aviso es el vídeo de YouTube, que ya carga con subtítulos (`cc_load_policy=1`).

WAVE no mide el texto que está sobre una imagen de fondo, y el título está sobre la trama amarilla. Lo comprobé en su comprobador de contraste con el color del título (`#222222`) sobre el amarillo más oscuro de la trama (`#ddb639`): da 8,2:1 y pasa AA y AAA.

#figure(
  image("receta-capturas/3a-wave-resumen.png", width: 100%),
  caption: [Resumen de WAVE: 0 errores y 0 errores de contraste.],
)

#figure(
  image("receta-capturas/3c-wave-h1-sobre-amarillo.png", width: 100%),
  caption: [Título sobre el amarillo más oscuro de la trama: 8,2:1.],
)
