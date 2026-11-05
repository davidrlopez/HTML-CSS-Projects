#set document(title: [Accesibilidad del formulario de reseñas], author: "David Román López")
#set page(paper: "a4", margin: 2cm, numbering: "1")
#set text(font: "SF Pro", size: 11pt, lang: "es")
#set heading(numbering: "1.")

#let captura(ruta) = block(stroke: 0.5pt + luma(180), image(ruta, width: 100%))

#text(18pt, weight: "bold")[Accesibilidad del formulario de reseñas] \
David Román López, 2º DAW

He probado el formulario `formCom.html` con dos herramientas de accesibilidad.

= axe DevTools

Es una extensión para Chrome y Brave. Abres la página, pulsas F12, vas a la pestaña axe DevTools y le das a «Scan all of my page». Te saca los fallos según las normas WCAG y te marca dónde está cada uno.

En la primera versión del formulario encontró estos fallos (en rojo en la captura):

#captura("capturas/antes.png")

- Cinco campos no tenían `<label>`, así que un lector de pantalla no sabía qué había que escribir en ellos.
- Los `<li>` estaban fuera del `<ol>`.
- El `<title>` estaba vacío.
- No había `<main>`.

#grid(
  columns: (1fr, 45mm),
  column-gutter: 8mm,
  [
    Lo corregí todo y la versión final pasa sin ningún fallo.

    Eso sí, axe no lo ve todo. No avisó de que «Peluquería» tenía `value=""` en un desplegable obligatorio, y con eso no se podía enviar la reseña. Ese fallo solo se ve probando el formulario a mano.

    Las capturas están hechas con axe-core, que es el motor de la extensión.
  ],
  captura("capturas/despues.png"),
)

= Emulador de deficiencias visuales

Viene en las DevTools: F12, los tres puntos, More tools > Rendering y en «Emulate vision deficiencies» eliges una. La página se ve como la vería alguien con ese problema de vista. Probé tres:

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 5mm,
  row-gutter: 3mm,
  captura("capturas/vision-deuteranopia.png"),
  captura("capturas/vision-achromatopsia.png"),
  captura("capturas/vision-blurredVision.png"),
  text(9pt)[Deuteranopia (no distingue rojo y verde): el asterisco cambia de color, pero se sigue viendo.],
  text(9pt)[Sin color: «Publicar reseña» sigue destacando porque está relleno, y «Cancelar» es solo texto.],
  text(9pt)[Visión borrosa: lo que peor se lee es «(opcional)» y la ayuda del precio, porque son pequeños y grises.],
)

Para mejorarlo pondría esos dos textos al mismo tamaño que el resto.
