distinct-values(
  /gym_ruperto/socios_gym/fila_socios[
    cod = /gym_ruperto/uso_gimnasio/fila_uso[
      codactiv = /gym_ruperto/actividades_gym/fila_actividades[nombre = 'Padel']/@cod
    ]/codsocio
  ]/nombre/text()
)
